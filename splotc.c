/* 
routines to simplify use of splot and plois from C 
	Einar Kjartansson, Sept 1994
	Note, para should have 21 elements when called using splotc
	May 2020: stub for use with flitool with out plois -eik
*/
void splotc(int n, float *x, float *y, 
	char *xst, char *yst, char *cap , float *para ) 
{
/*
	splot_(&n,x,y,xst,yst,cap,para+1,strlen(xst),strlen(yst),strlen(cap),
		para+1) ;
*/
}
void plotclose()
{
	int n999 ;
	float f0 ;
	n999 = 999 ;
	f0 = 0.0 ;
/*	plot_(&f0,&f0,&n999) ; */
}
/*
void MAIN__()
{}
*/
