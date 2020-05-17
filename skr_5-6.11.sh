#!/bin/ksh
export PDRIVER=laser
export PFILE=junk
awk ' { print $1 " " $3 } ' <<EOF  | tp -H "Skrokkalda  0.5-1.05 Hz"  -L 1 -p 2 -s 0.2 -S 0.6 -X 20.0 -Y 12.0
1996/nov/05:00:05 skr   64.50  114.44   92.08   13.66   14.62   16.04    6.70    5.76    7.62
1996/nov/05:01:05 skr   61.08   87.18   89.75   12.45   12.32   11.24    7.08    5.33    5.19
1996/nov/05:02:05 skr   75.29   94.92   70.16   23.93   24.39   24.19    9.62    6.52    6.90
1996/nov/05:03:05 skr   74.68  113.98  101.53   23.79   17.00   20.20   14.19    7.49   10.93
1996/nov/05:04:05 skr   65.49   89.49   67.35   14.19   10.51   11.00    8.41    5.20    5.22
1996/nov/05:05:05 skr   67.63   84.89   77.40   13.32   11.04   11.05    8.68    4.72    4.45
1996/nov/05:06:05 skr   68.76   89.37   70.38   20.42   18.11   16.69   16.29    9.64    8.72
1996/nov/05:07:05 skr   91.01  107.15   76.02   22.99   17.60   14.81   15.69    9.48    7.52
1996/nov/05:08:05 skr   74.74   99.48   91.30   40.42   40.91   40.88   44.46   22.40   21.53
1996/nov/05:09:05 skr   66.44  106.82   90.92   19.61   20.33   21.84   21.16   10.04   11.19
1996/nov/05:10:05 skr   82.50   97.54   87.25   22.56   22.32   23.47   17.93    9.86   10.06
1996/nov/05:12:05 skr  109.81  167.88  125.25   59.57   79.37   60.02   42.16   42.73   33.74
1996/nov/05:13:05 skr  108.63  180.65  127.87   57.44   69.47   44.30   36.88   37.94   20.26
1996/nov/05:14:05 skr   98.91  118.29  132.68   44.92   44.55   41.55   37.38   18.59   21.70
1996/nov/05:15:05 skr   86.69  132.69  111.75   35.28   31.40   39.20   31.10   16.66   17.85
1996/nov/05:16:05 skr   75.59  125.49  105.32   41.16   43.44   37.32   33.62   19.49   18.59
1996/nov/05:17:05 skr   69.53  115.05   87.93   33.06   36.59   34.85   32.85   17.16   17.79
1996/nov/05:18:05 skr   76.96  114.78  120.99   33.67   34.51   35.03   26.94   16.56   17.16
1996/nov/05:19:05 skr   74.16  108.24  107.74   36.07   35.87   33.75   34.97   18.25   18.79
1996/nov/05:20:05 skr   92.70  124.74   97.08   37.83   35.75   41.06   37.97   18.32   20.06
1996/nov/05:21:05 skr   74.18  119.36  103.47   27.99   31.05   31.70   32.40   17.58   16.82
1996/nov/05:22:05 skr   76.04  112.31  104.17   26.78   31.41   30.36   28.55   16.58   17.05
1996/nov/05:23:05 skr   84.98   97.81   84.26   27.96   29.27   27.79   29.15   15.32   15.52
1996/nov/06:00:05 skr   86.90   97.86  109.42   29.84   33.91   31.06   29.74   18.20   16.53
1996/nov/06:01:05 skr   70.58  104.58   81.14   22.00   27.51   26.78   26.37   14.49   15.61
1996/nov/06:02:05 skr   79.26  119.52   96.52   26.63   27.16   28.44   25.81   15.31   15.36
1996/nov/06:03:05 skr   66.35  111.96  106.35   24.61   24.98   25.50   29.57   16.32   17.13
1996/nov/06:04:05 skr   77.07   98.94  105.64   22.54   26.48   30.73   21.20   13.34   15.68
1996/nov/06:05:05 skr   78.76  105.70   81.06   30.13   26.28   24.52   24.35   15.08   11.45
1996/nov/06:06:05 skr   89.68  148.89  107.31   25.46   26.17   26.04   20.54   11.49   12.67
1996/nov/06:07:05 skr   75.76  119.17   94.33   23.61   22.10   22.78   17.70   12.60   12.43
1996/nov/06:08:05 skr   68.84  102.67   78.55   18.70   18.43   20.80   15.83    9.98   11.32
1996/nov/06:09:05 skr   81.76  113.03   77.67   24.22   20.58   22.62   20.70   11.92   13.38
1996/nov/06:10:05 skr   80.09  116.25   84.54   20.16   19.91   20.86   15.59    8.76    9.86
1996/nov/06:11:05 skr   75.88  112.41  108.58   20.94   21.91   19.51   12.90    8.69    7.47
1996/nov/06:12:05 skr   76.70  111.11   97.80   19.17   20.63   21.06   16.75   11.16   11.33
1996/nov/06:13:05 skr   78.52   98.94   93.27   35.32   29.65   33.61   26.86   17.91   19.82
1996/nov/06:14:05 skr  163.12  173.00  221.01   86.46   79.59   93.74   52.26   45.60   53.41
1996/nov/06:15:05 skr   79.95  103.89   99.51   20.52   20.81   17.98   15.64   11.12    8.47
1996/nov/06:16:05 skr   85.19  104.03  110.36   26.26   28.36   20.03   16.77   13.39   10.11
1996/nov/06:17:05 skr   65.05   89.32   82.57   17.02   14.06   15.97   12.70    6.68    8.24
1996/nov/06:18:05 skr   64.27   92.42   93.53   14.08   21.95   18.23    9.79   11.54    9.91
1996/nov/06:19:05 skr   60.85   70.37   76.93   12.86   11.12   11.45    9.65    6.31    6.18
1996/nov/06:20:05 skr   78.34   74.53   75.88   26.37   16.45   13.03   17.49    9.26    8.59
1996/nov/06:21:05 skr  117.94  142.30  107.38   59.95   68.93   51.49   33.88   37.95   27.96
1996/nov/06:22:05 skr   54.63   84.52   74.22   14.20   13.80   15.48    7.74    7.75    7.85
1996/nov/06:23:05 skr  132.96  105.72  117.26   62.57   43.60   48.45   34.99   23.11   26.20
EOF
#xv junk.gif &
lp junk