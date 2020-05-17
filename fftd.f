      subroutine fftd(lx,cx,forward)
c
c  Time for 1024 point double complex fft on ultraSparc170 is about 1.35 ms
c  Time for 1024 point double complex fft on sparc 4 (110 MHz) is about 6.3 ms
c
        implicit none
        integer lx
        double complex cx(lx)
        logical forward
        integer i,ii,j,l,istep,m
        double complex cw,cdel,cdel1,ctemp
        real scale
C
        if ( forward) then
          cdel1 = ( 0.0 , -1.0)
        else
          cdel1 = (0.0,1.0)
          scale = 1.0/lx
          do i = 1 ,lx
            cx(i) = scale*cx(i)
          enddo
        endif
        j = 1
        do i = 1,lx
          if ( i .lt. j) then
            ctemp = cx(i)
            cx(i) = cx(j)
            cx(j) = ctemp
          endif
          m = lx / 2
          do while ( (j .gt. m ) .and. ( m .ge. 1 ) )
            j = j - m
            m = m / 2
          enddo
          j = j + m
        enddo
        l = 1
        cdel = (-1.0,0.0)
        do while ( l .lt. lx )
         istep = l + l
         cw = ( 1.0 , 0.0)
         do m = 1 , l
           i = m
           do while ( i .le. lx )
             ii = i + l
             ctemp = cw * cx(ii)
             cx(ii) = cx(i) - ctemp
             cx(i)  = cx(i) + ctemp
             i = i + istep
           enddo
           cw = cdel * cw
         enddo
         l = istep
         cdel = cdel1
         cdel1 = cdsqrt(cdel1)
       enddo
       end
