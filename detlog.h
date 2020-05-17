struct msgid {
	unsigned short	seq_no;
	char	type;
	char	network[3];
	char	station[3];
	char	detector[3];
};

struct	time	{
	long	s;
	short	ms;
	short	check;
};

struct	channel	{
	float	signal;
	float	noise;
	float	dclevel;
	short	corner;
	short	hfreq;
	short	quality;
	short	extra;
};

struct	comp	{
	float	coher;
	float	azim;
	float	vel;
	short	azimtol;
	short	veltol;
};

struct	phase	{
	float	dur;
	float	prev;
	float	next;
	char	type[2];
	short	extra;
};

struct	filter	{
	short	lp;
	short	hp;
};

struct	reserv	{
	char	x[8];
};

union	extra	{
	char	ch[4];
	short	s[2];
	long	l;
	float	f;
};

typedef struct	{
	struct	msgid	 msgid;
	struct	time	time;
	struct	channel	Z;
	struct	channel	N;
	struct	channel	E;
	struct	comp	threec;
	struct 	phase	phase;
	struct	filter	filter;
	struct	reserv	reserv;
	union	extra	extra;
}	detlog;
