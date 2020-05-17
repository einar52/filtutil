/* Filtutil, filter utilities useful for detection */
/*
© Copyright 1998, 2020 Einar Kjartansson

This file is part of Filtutil

    Filtutil is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Filtutil is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with Filtutil.  If not, see <https://www.gnu.org/licenses/>.
*/
#include <unistd.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <f2c.h>
#include "detfil.h"
#include <string.h>
int logFlag ;
float xS, yS ;
/*typedef  struct { double re,im ; } complex ; */
double *filter ;
double qfreq ;
float para[30] ;
char cap[2000],*xs,*ys ;
double dt = 0.01 ;
int plotFlag ;
void listFilter( double *filter )
{
	int n,m,i ;
	double *a,*b ;
	n = *filter ;
	m = filter[1] ;
	a = filter + 2 ;
	b = a + n + 1 ;
	printf("n=%d  m=%d\n",n,m) ;
	for( i = 0 ; i <= n ; i++ ) printf("a[%d] = %12.4g\n",i,a[i]) ;
	for( i = 0 ; i < m ; i++ ) printf("b[%d] = %12.4g\n",i,b[i]) ;
}
void plotImpulse( double *f, double len ) 
{
	float *x,*y ;
	double yy,xx ;
	int i,n ;
	n = len/dt ;
	x = calloc(n,4) ; y = calloc(n,4) ;
	xx = 1.0 ;
	for( i = 0 ; i < n ; i++ ) {
		yy = gFilt(f,xx ) ;	
		x[i] = i*dt ;
		y[i] = yy ;
		xx = 0.0 ;
	}
	if( NULL == xs ) xs = "Time (s )" ;
	if( NULL == ys ) ys = "Impulse responce" ;
/*	para[1] = xS ; para[2] = yS ; */
	fprintf(stderr,"splotc n=%d\n",n) ;
	splotc(n,x,y,xs,ys,cap,para) ;
	plotFlag = 1 ;
	free(x) ; free(y) ;
}
double *mkfir( double *filter, int n ) 
{
	double *f,xx ;
	int j ;
	f = ( double *) calloc(n*2+10,sizeof(*f)) ;
	*f = n-1 ;
	f[1] = 0 ;
	xx = 1.0 ;
	for(j = 0 ; j < n ; j++ ) {
		f[j+2] = gFilt(filter,xx) ;
		xx = 0 ;
	}
	return(f) ;
}
double *aCorr( double *filter ) 
{
	double *f,sum  ;
	int i,n,j ;
	n = *filter ;
	f = ( double *) calloc(n*4+10,sizeof(*f)) ;
	*f = n+n ;
	f[1] = 0 ;
	for( i = 0 ; i <= n ; i++) {
		sum = 0 ;
		for( j = i ; j <= n ; j++ ) sum += filter[2+j]*filter[2+j-i] ;
		f[2+n+i] = sum ;
		f[2+n-i] = sum ;
	}
	return(f) ;
}
void speedTest( double *f ,  int n  ) 
{
	double *x,*y ,*xp,*yp ;
	int i,j ;
	x = calloc(n,8 ) ; y = calloc(n,8) ;
	
	for( i = 0 ; i < n; i++ ) x[i] = rand() ;
	for( j = 0 ; j < n ; j++ ) {
		xp = x ; yp = y ;
		for( i = 0 ; i < n ; i++ ) 
			*yp++ = gFilt(f,*xp++ ) ;
			
	}
	free(y) ; free(x) ;
}
void plotASpec( double *filter, double maxf, int nf, int log )
{
	complex *cx ;
	double xx,yy,r,m,df ;
	float *x,*y ;
	int i,j,ns ;
	cx = (complex *) calloc(2*nf,sizeof(complex)) ;
	xx = 1.0 ;
	for( i = 0 ; i < nf ; i++ ) {
		yy = gFilt(filter,xx) ;
		cx[i].r = yy ;
		cx[i].i = 0.0 ;
		xx = 0 ;
	}
	j = 1 ;
	fftd_(&nf,cx,&j) ;
	df = 1.0/(dt*nf) ;
	ns = maxf/df ;
	if(ns > nf/2) ns = nf/2 ; 
	x = (float *)calloc(ns,sizeof(*x)) ; 
	y = (float *)calloc(ns,sizeof(*y)) ;
	for( i = 0 ; i < ns ; i++ ) {
		x[i] = df*i ;
		r = cx[i].r ; m = cx[i].i ;
		y[i] = sqrt(r*r + m*m ) ;
	}
	if( qfreq ) {
		for( i = 0 ; i < ns ; i++) {
			y[i] *= sqrt( x[i]/qfreq ) ;
		}
	}
	if( logFlag ) {
		x+=logFlag ; y+=logFlag ; ns-=logFlag ;
		for( i = 0 ; i < ns ; i++ ) {
			x[i] = log10(x[i]) ;
			y[i] = log10(y[i]) ;
		}
	} else if( log ) {
		for( i = 0 ; i < ns ; i++ ) y[i] = 20.0*log10(fabs(y[i])+1.e-4) ; 
	}
	if( NULL == xs ) xs = "Frequency (Hz)" ;
	if( NULL == ys ) {
		if (log) ys = "db" ;
		else ys = "Amplitude" ;
	}
/*
	para[1] = xS ; para[2] = yS ;
*/
	splotc(ns,x,y,xs,ys,cap,para) ;
	plotFlag = 1 ;
/*	free(x) ; free(y) ; free(cx) ; */
	free(cx) ;
}
void help()
{
fprintf(stderr,"%s","\
filtutil [ options ]\n\
\n\
A program to aid in design of realtime filters.\n\
Operations are performed in order.\n\
Options include:\n\
-d	dt	Set sample inderval, default is 0.01\n\
-i	scale	Initialize filter and set scale. Must be specified before\n\
		-p and -z commands.\n\
-p	f0 df	Add a pole filter at frequency f0 and width df.\n\
-z	f0	Add a zero on unit circle at frequency f0.\n\
-l		List filter on standard output.\n\
-c	cap	Text to put on top of plot\n\
-I	len	Plot inpulse response, for time len. \n\
-q	f0	Scale spectrum by sqrt(f/f0) in -A or -D plots\n\
-A	freq	Plot amplitude spectrum for filter, up to freq.\n\
-D	freq	Plot spectrum in db, for filter, up to freq.\n\
-S	xs ys	Specify size for plots (-I -A) \n\
-L	skip	make amplitude plot log-log, skip lowest frequencies\n\
-w	file	Save filter to file.\n\
-r	file	Read filter from file.\n\
-R	n	Convert filter to a fir of length n\n\
-P	n val	Set  para[n] = val \n\
-x	str	Label for x axes \n\
-y	str	Label for y axes \n\
-h		Print this message.\n\
\n\
Einar Kjartansson, 18/10 1996.\n\
\n") ;
}
int main(int ac, char **av)
{
     extern char *optarg;
     extern int optind, opterr, optopt;
	double val,val2, *f1 ;
	int cc,i ;
	if( ac < 2 ) help() ;
	for( i = 0 ; i < ac ; i++ ) { strcat(cap,av[i]) ; strcat(cap," ") ; } 
	while( EOF != ( cc = getopt(ac,av,
		"d:i:b:p:z:lI:L:D:A:w:r:hH?s:c:P:q:x:y:S:R:a") )) {
		switch(cc) {
		case 'd': dt = atof(optarg) ; break ;
		case 'i':  val = atof(optarg) ;
				filter = tGFilt(val,200) ; break ;
		case 'b':  val = atof(optarg) ;
				filter= diffFilter(val,200) ; break ;
		case 'p':  
			val = atof(optarg) ;
			val2 = atof(av[optind++]) ;
			f1 = mkPFilt(dt,val,val2) ;
			addPole(filter,f1) ; free(f1) ;
			break ;
		case 'z': 
			val = atof(optarg) ;
			f1 = mkZFilt(dt,val) ;
			addZero(filter,f1) ; free(f1) ;
			break ;
		case 'l': listFilter(filter) ; break ;
		case 'I': plotImpulse(filter,atof(optarg)) ; break ;
		case 'L' : logFlag = atoi(optarg) ; break ;
		case 'q' : qfreq = atof(optarg) ; break ;
		case 'A' : plotASpec(filter,atof(optarg),16384,0) ; break ;
		case 'D' : plotASpec(filter,atof(optarg),16384,1) ; break ;
		case 'w' : saveFilter(filter,optarg) ; break ;
		case 'r' : filter = readFilter(optarg) ; break ;
		case 's' : speedTest(filter,atoi(optarg)) ; break ;
		case 'c' : strcpy(cap,optarg) ; break ; 
		case 'R' : f1  = mkfir(filter,atoi(optarg)) ; /*free(filter) ;*/
				filter=f1 ;   break ;
		case 'a' : f1 = aCorr(filter) ; filter=f1 ; break ;
		case 'P' : para[atoi(optarg)] = atof(av[optind++]) ; break ;
		case 'x' : xs = optarg ; break ;
		case 'y' : ys = optarg ; break ;
		case 'S' : para[1] = atof(optarg) ; 
				para[2] = atof(av[optind++]) ;break;
		default : help() ; break ;
		}
	}
	if( plotFlag ) plotclose()  ;
	return(0) ;
}

