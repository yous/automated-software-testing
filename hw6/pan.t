#ifdef PEG
struct T_SRC {
	char *fl; int ln;
} T_SRC[NTRANS];

void
tr_2_src(int m, char *file, int ln)
{	T_SRC[m].fl = file;
	T_SRC[m].ln = ln;
}

void
putpeg(int n, int m)
{	printf("%5d	trans %4d ", m, n);
	printf("%s:%d\n",
		T_SRC[n].fl, T_SRC[n].ln);
}
#endif

void
settable(void)
{	Trans *T;
	Trans *settr(int, int, int, int, int, char *, int, int, int);

	trans = (Trans ***) emalloc(7*sizeof(Trans **));

	/* proctype 5: :init: */

	trans[5] = (Trans **) emalloc(104*sizeof(Trans *));

/*->*/	trans[5][90]	= settr(267,32,91,3,3,"D_STEP239", 1, 2, 0);
	trans[5][91]	= settr(268,0,92,4,4,"(run handle1())", 0, 2, 0);
	trans[5][92]	= settr(269,0,93,5,5,"(run handle1())", 0, 2, 0);
	trans[5][93]	= settr(270,0,94,6,6,"(run handle1())", 0, 2, 0);
	trans[5][94]	= settr(271,0,95,7,7,"(run handle2())", 0, 2, 0);
	trans[5][95]	= settr(272,0,96,8,8,"(run handle2())", 0, 2, 0);
	trans[5][96]	= settr(273,0,97,9,9,"(run handle2())", 0, 2, 0);
	trans[5][97]	= settr(274,0,98,10,10,"(run handle3())", 0, 2, 0);
	trans[5][98]	= settr(275,0,99,11,11,"(run handle3())", 0, 2, 0);
	trans[5][99]	= settr(276,0,100,12,12,"(run handle3())", 0, 2, 0);
	trans[5][100]	= settr(277,0,101,13,13,"(run handle4())", 0, 2, 0);
	trans[5][101]	= settr(278,0,102,14,14,"(run handle4())", 0, 2, 0);
	trans[5][102]	= settr(279,0,103,15,15,"(run handle4())", 0, 2, 0);
	trans[5][103]	= settr(280,0,0,16,16,"-end-", 0, 3500, 0);

	/* proctype 4: invariant */

	trans[4] = (Trans **) emalloc(81*sizeof(Trans *));

	trans[4][1]	= settr(98,0,4,17,0,"(!(init_lock))", 1, 2, 0);
	T = trans[ 4][4] = settr(101,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(101,2,2,0,0,"ATOMIC", 1, 2, 0);
	trans[4][2]	= settr(99,4,78,18,18,"(!(area_lock))", 1, 2, 0); /* m: 3 -> 78,0 */
	reached4[3] = 1;
	trans[4][3]	= settr(0,0,0,0,0,"area_lock = 1",0,0,0);
	T = trans[ 4][78] = settr(175,2,0,0,0,"ATOMIC", 1, 2, 0);
	T->nxt	= settr(175,2,9,0,0,"ATOMIC", 1, 2, 0);
	T = trans[4][9] = settr(106,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(106,2,5,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(106,2,8,0,0,"IF", 1, 2, 0);
	trans[4][5]	= settr(102,2,17,19,19,"((areas[3].east==1))", 1, 2, 0); /* m: 6 -> 17,0 */
	reached4[6] = 1;
	trans[4][6]	= settr(0,0,0,0,0,"filled[3] = 1",0,0,0);
	trans[4][7]	= settr(0,0,0,0,0,"changed = 1",0,0,0);
	trans[4][10]	= settr(107,2,11,1,0,".(goto)", 1, 2, 0); /* m: 11 -> 0,17 */
	reached4[11] = 1;
	trans[4][8]	= settr(105,2,11,2,0,"else", 1, 2, 0);
	trans[4][11]	= settr(108,2,17,20,20,"i = 0", 1, 2, 0);
	trans[4][18]	= settr(115,2,17,1,0,".(goto)", 1, 2, 0);
	T = trans[4][17] = settr(114,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(114,2,12,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(114,2,15,0,0,"DO", 1, 2, 0);
	trans[4][12]	= settr(109,2,17,21,21,"((i<11))", 1, 2, 0); /* m: 13 -> 17,0 */
	reached4[13] = 1;
	trans[4][13]	= settr(0,0,0,0,0,"filled_copy[i] = filled[i]",0,0,0);
	trans[4][14]	= settr(0,0,0,0,0,"i = (i+1)",0,0,0);
	trans[4][15]	= settr(112,2,74,2,0,"else", 1, 2, 0);
	trans[4][16]	= settr(113,2,74,1,0,"goto :b0", 1, 2, 0);
	trans[4][19]	= settr(116,2,74,1,0,"break", 1, 2, 0);
	trans[4][75]	= settr(172,2,74,1,0,".(goto)", 1, 2, 0);
	T = trans[4][74] = settr(171,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(171,2,20,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(171,2,72,0,0,"DO", 1, 2, 0);
	trans[4][20]	= settr(117,2,54,22,22,"(changed)", 1, 2, 0); /* m: 21 -> 54,0 */
	reached4[21] = 1;
	trans[4][21]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[4][55]	= settr(152,2,54,1,0,".(goto)", 1, 2, 0);
	T = trans[4][54] = settr(151,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(151,2,22,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(151,2,52,0,0,"DO", 1, 2, 0);
	trans[4][22]	= settr(119,2,49,23,0,"((i<11))", 1, 2, 0);
	T = trans[4][49] = settr(146,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(146,2,23,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(146,2,48,0,0,"IF", 1, 2, 0);
	trans[4][23]	= settr(120,2,28,24,24,"(filled[i])", 1, 2, 0); /* m: 24 -> 28,0 */
	reached4[24] = 1;
	trans[4][24]	= settr(0,0,0,0,0,"next_area = near_areas[i].north",0,0,0);
	T = trans[4][28] = settr(125,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(125,2,25,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(125,2,27,0,0,"IF", 1, 2, 0);
	trans[4][25]	= settr(122,2,34,25,25,"(((next_area>=0)&&!(filled[next_area])))", 1, 2, 0); /* m: 26 -> 34,0 */
	reached4[26] = 1;
	trans[4][26]	= settr(0,0,0,0,0,"filled[next_area] = ((areas[i].north==1)&&(areas[next_area].south==1))",0,0,0);
	trans[4][29]	= settr(126,2,30,1,0,".(goto)", 1, 2, 0); /* m: 30 -> 0,34 */
	reached4[30] = 1;
	trans[4][27]	= settr(124,2,30,2,0,"else", 1, 2, 0);
	trans[4][30]	= settr(127,2,34,26,26,"next_area = near_areas[i].east", 1, 2, 0);
	T = trans[4][34] = settr(131,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(131,2,31,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(131,2,33,0,0,"IF", 1, 2, 0);
	trans[4][31]	= settr(128,2,40,27,27,"(((next_area>=0)&&!(filled[next_area])))", 1, 2, 0); /* m: 32 -> 40,0 */
	reached4[32] = 1;
	trans[4][32]	= settr(0,0,0,0,0,"filled[next_area] = ((areas[i].east==1)&&(areas[next_area].west==1))",0,0,0);
	trans[4][35]	= settr(132,2,36,1,0,".(goto)", 1, 2, 0); /* m: 36 -> 0,40 */
	reached4[36] = 1;
	trans[4][33]	= settr(130,2,36,2,0,"else", 1, 2, 0);
	trans[4][36]	= settr(133,2,40,28,28,"next_area = near_areas[i].south", 1, 2, 0);
	T = trans[4][40] = settr(137,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(137,2,37,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(137,2,39,0,0,"IF", 1, 2, 0);
	trans[4][37]	= settr(134,2,46,29,29,"(((next_area>=0)&&!(filled[next_area])))", 1, 2, 0); /* m: 38 -> 46,0 */
	reached4[38] = 1;
	trans[4][38]	= settr(0,0,0,0,0,"filled[next_area] = ((areas[i].south==1)&&(areas[next_area].north==1))",0,0,0);
	trans[4][41]	= settr(138,2,42,1,0,".(goto)", 1, 2, 0); /* m: 42 -> 0,46 */
	reached4[42] = 1;
	trans[4][39]	= settr(136,2,42,2,0,"else", 1, 2, 0);
	trans[4][42]	= settr(139,2,46,30,30,"next_area = near_areas[i].west", 1, 2, 0);
	T = trans[4][46] = settr(143,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(143,2,43,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(143,2,45,0,0,"IF", 1, 2, 0);
	trans[4][43]	= settr(140,2,54,31,31,"(((next_area>=0)&&!(filled[next_area])))", 1, 2, 0); /* m: 44 -> 54,0 */
	reached4[44] = 1;
	trans[4][44]	= settr(0,0,0,0,0,"filled[next_area] = ((areas[i].west==1)&&(areas[next_area].east==1))",0,0,0);
	trans[4][47]	= settr(144,2,51,1,0,".(goto)", 1, 2, 0); /* m: 51 -> 0,54 */
	reached4[51] = 1;
	trans[4][45]	= settr(142,2,51,2,0,"else", 1, 2, 0);
	trans[4][50]	= settr(147,2,51,1,0,".(goto)", 1, 2, 0); /* m: 51 -> 0,54 */
	reached4[51] = 1;
	trans[4][48]	= settr(145,2,51,2,0,"else", 1, 2, 0);
	trans[4][51]	= settr(148,2,54,32,32,"i = (i+1)", 1, 2, 0);
	trans[4][52]	= settr(149,2,57,2,0,"else", 1, 2, 0);
	trans[4][53]	= settr(150,2,57,1,0,"goto :b2", 1, 2, 0); /* m: 57 -> 0,69 */
	reached4[57] = 1;
	trans[4][56]	= settr(153,2,57,1,0,"break", 1, 2, 0);
	trans[4][57]	= settr(154,2,69,33,33,"changed = 0", 1, 2, 0); /* m: 58 -> 0,69 */
	reached4[58] = 1;
	trans[4][58]	= settr(0,0,0,0,0,"i = 0",0,0,0);
	trans[4][70]	= settr(167,2,69,1,0,".(goto)", 1, 2, 0);
	T = trans[4][69] = settr(166,2,0,0,0,"DO", 1, 2, 0);
	T = T->nxt	= settr(166,2,59,0,0,"DO", 1, 2, 0);
	    T->nxt	= settr(166,2,67,0,0,"DO", 1, 2, 0);
	trans[4][59]	= settr(156,2,63,34,0,"((i<11))", 1, 2, 0);
	T = trans[4][63] = settr(160,2,0,0,0,"IF", 1, 2, 0);
	T = T->nxt	= settr(160,2,60,0,0,"IF", 1, 2, 0);
	    T->nxt	= settr(160,2,62,0,0,"IF", 1, 2, 0);
	trans[4][60]	= settr(157,2,69,35,35,"((filled_copy[i]!=filled[i]))", 1, 2, 0); /* m: 61 -> 69,0 */
	reached4[61] = 1;
	trans[4][61]	= settr(0,0,0,0,0,"changed = 1",0,0,0);
	trans[4][64]	= settr(161,2,65,1,0,".(goto)", 1, 2, 0); /* m: 65 -> 0,69 */
	reached4[65] = 1;
	trans[4][62]	= settr(159,2,65,2,0,"else", 1, 2, 0);
	trans[4][65]	= settr(162,2,69,36,36,"filled_copy[i] = filled[i]", 1, 2, 0); /* m: 66 -> 0,69 */
	reached4[66] = 1;
	trans[4][66]	= settr(0,0,0,0,0,"i = (i+1)",0,0,0);
	trans[4][67]	= settr(164,2,74,2,0,"else", 1, 2, 0);
	trans[4][68]	= settr(165,2,74,1,0,"goto :b3", 1, 2, 0);
	trans[4][71]	= settr(168,2,74,1,0,"break", 1, 2, 0);
	trans[4][72]	= settr(169,2,76,2,0,"else", 1, 2, 0);
	trans[4][73]	= settr(170,2,76,1,0,"goto :b1", 1, 2, 0);
	trans[4][76]	= settr(173,2,77,1,0,"break", 1, 2, 0);
	trans[4][77]	= settr(174,0,79,37,0,"assert((!(filled[7])||(areas[7].south==0)))", 1, 2, 0);
	trans[4][79]	= settr(176,0,80,38,38,"area_lock = 0", 1, 2, 0);
	trans[4][80]	= settr(177,0,0,39,39,"-end-", 0, 3500, 0);

	/* proctype 3: handle4 */

	trans[3] = (Trans **) emalloc(23*sizeof(Trans *));

/*->*/	trans[3][21]	= settr(96,32,22,40,40,"D_STEP125", 1, 2, 0);
	trans[3][22]	= settr(97,0,0,41,41,"-end-", 0, 3500, 0);

	/* proctype 2: handle3 */

	trans[2] = (Trans **) emalloc(28*sizeof(Trans *));

/*->*/	trans[2][26]	= settr(74,32,27,42,42,"D_STEP89", 1, 2, 0);
	trans[2][27]	= settr(75,0,0,43,43,"-end-", 0, 3500, 0);

	/* proctype 1: handle2 */

	trans[1] = (Trans **) emalloc(28*sizeof(Trans *));

/*->*/	trans[1][26]	= settr(47,32,27,44,44,"D_STEP53", 1, 2, 0);
	trans[1][27]	= settr(48,0,0,45,45,"-end-", 0, 3500, 0);

	/* proctype 0: handle1 */

	trans[0] = (Trans **) emalloc(23*sizeof(Trans *));

/*->*/	trans[0][21]	= settr(20,32,22,46,46,"D_STEP23", 1, 2, 0);
	trans[0][22]	= settr(21,0,0,47,47,"-end-", 0, 3500, 0);
	/* np_ demon: */
	trans[_NP_] = (Trans **) emalloc(2*sizeof(Trans *));
	T = trans[_NP_][0] = settr(9997,0,1,_T5,0,"(np_)", 1,2,0);
	    T->nxt	  = settr(9998,0,0,_T2,0,"(1)",   0,2,0);
	T = trans[_NP_][1] = settr(9999,0,1,_T5,0,"(np_)", 1,2,0);
}

Trans *
settr(	int t_id, int a, int b, int c, int d,
	char *t, int g, int tpe0, int tpe1)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	tmp->atom  = a&(6|32);	/* only (2|8|32) have meaning */
	if (!g) tmp->atom |= 8;	/* no global references */
	tmp->st    = b;
	tmp->tpe[0] = tpe0;
	tmp->tpe[1] = tpe1;
	tmp->tp    = t;
	tmp->t_id  = t_id;
	tmp->forw  = c;
	tmp->back  = d;
	return tmp;
}

Trans *
cpytr(Trans *a)
{	Trans *tmp = (Trans *) emalloc(sizeof(Trans));

	int i;
	tmp->atom  = a->atom;
	tmp->st    = a->st;
#ifdef HAS_UNLESS
	tmp->e_trans = a->e_trans;
	for (i = 0; i < HAS_UNLESS; i++)
		tmp->escp[i] = a->escp[i];
#endif
	tmp->tpe[0] = a->tpe[0];
	tmp->tpe[1] = a->tpe[1];
	for (i = 0; i < 6; i++)
	{	tmp->qu[i] = a->qu[i];
		tmp->ty[i] = a->ty[i];
	}
	tmp->tp    = (char *) emalloc(strlen(a->tp)+1);
	strcpy(tmp->tp, a->tp);
	tmp->t_id  = a->t_id;
	tmp->forw  = a->forw;
	tmp->back  = a->back;
	return tmp;
}

#ifndef NOREDUCE
int
srinc_set(int n)
{	if (n <= 2) return LOCAL;
	if (n <= 2+  DELTA) return Q_FULL_F; /* 's' or nfull  */
	if (n <= 2+2*DELTA) return Q_EMPT_F; /* 'r' or nempty */
	if (n <= 2+3*DELTA) return Q_EMPT_T; /* empty */
	if (n <= 2+4*DELTA) return Q_FULL_T; /* full  */
	if (n ==   5*DELTA) return GLOBAL;
	if (n ==   6*DELTA) return TIMEOUT_F;
	if (n ==   7*DELTA) return ALPHA_F;
	Uerror("cannot happen srinc_class");
	return BAD;
}
int
srunc(int n, int m)
{	switch(m) {
	case Q_FULL_F: return n-2;
	case Q_EMPT_F: return n-2-DELTA;
	case Q_EMPT_T: return n-2-2*DELTA;
	case Q_FULL_T: return n-2-3*DELTA;
	case ALPHA_F:
	case TIMEOUT_F: return 257; /* non-zero, and > MAXQ */
	}
	Uerror("cannot happen srunc");
	return 0;
}
#endif
int cnt;
#ifdef HAS_UNLESS
int
isthere(Trans *a, int b)
{	Trans *t;
	for (t = a; t; t = t->nxt)
		if (t->t_id == b)
			return 1;
	return 0;
}
#endif
#ifndef NOREDUCE
int
mark_safety(Trans *t) /* for conditional safety */
{	int g = 0, i, j, k;

	if (!t) return 0;
	if (t->qu[0])
		return (t->qu[1])?2:1;	/* marked */

	for (i = 0; i < 2; i++)
	{	j = srinc_set(t->tpe[i]);
		if (j >= GLOBAL && j != ALPHA_F)
			return -1;
		if (j != LOCAL)
		{	k = srunc(t->tpe[i], j);
			if (g == 0
			||  t->qu[0] != k
			||  t->ty[0] != j)
			{	t->qu[g] = k;
				t->ty[g] = j;
				g++;
	}	}	}
	return g;
}
#endif
void
retrans(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
	/* process n, with m states, is=initial state */
{	Trans *T0, *T1, *T2, *T3;
	Trans *T4, *T5; /* t_reverse or has_unless */
	int i;
#if defined(HAS_UNLESS) || !defined(NOREDUCE)
	int k;
#endif
#ifndef NOREDUCE
	int g, h, j, aa;
#endif
#ifdef HAS_UNLESS
	int p;
#endif
	if (state_tables >= 4)
	{	printf("STEP 1 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	do {
		for (i = 1, cnt = 0; i < m; i++)
		{	T2 = trans[n][i];
			T1 = T2?T2->nxt:(Trans *)0;
/* prescan: */		for (T0 = T1; T0; T0 = T0->nxt)
/* choice in choice */	{	if (T0->st && trans[n][T0->st]
				&&  trans[n][T0->st]->nxt)
					break;
			}
#if 0
		if (T0)
		printf("\tstate %d / %d: choice in choice\n",
		i, T0->st);
#endif
			if (T0)
			for (T0 = T1; T0; T0 = T0->nxt)
			{	T3 = trans[n][T0->st];
				if (!T3->nxt)
				{	T2->nxt = cpytr(T0);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
					continue;
				}
				do {	T3 = T3->nxt;
					T2->nxt = cpytr(T3);
					T2 = T2->nxt;
					imed(T2, T0->st, n, i);
				} while (T3->nxt);
				cnt++;
			}
		}
	} while (cnt);
	if (state_tables >= 3)
	{	printf("STEP 2 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
	for (i = 1; i < m; i++)
	{	if (trans[n][i] && trans[n][i]->nxt) /* optimize */
		{	T1 = trans[n][i]->nxt;
#if 0
			printf("\t\tpull %d (%d) to %d\n",
			T1->st, T1->forw, i);
#endif
			srcln[i] = srcln[T1->st];	/* Oyvind Teig, 5.2.0 */

			if (!trans[n][T1->st]) continue;
			T0 = cpytr(trans[n][T1->st]);
			trans[n][i] = T0;
			reach[T1->st] = 1;
			imed(T0, T1->st, n, i);
			for (T1 = T1->nxt; T1; T1 = T1->nxt)
			{
#if 0
			printf("\t\tpull %d (%d) to %d\n",
				T1->st, T1->forw, i);
#endif
		/*		srcln[i] = srcln[T1->st];  gh: not useful */
				if (!trans[n][T1->st]) continue;
				T0->nxt = cpytr(trans[n][T1->st]);
				T0 = T0->nxt;
				reach[T1->st] = 1;
				imed(T0, T1->st, n, i);
	}	}	}
	if (state_tables >= 2)
	{	printf("STEP 3 %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
		return;
	}
#ifdef HAS_UNLESS
	for (i = 1; i < m; i++)
	{	if (!trans[n][i]) continue;
		/* check for each state i if an
		 * escape to some state p is defined
		 * if so, copy and mark p's transitions
		 * and prepend them to the transition-
		 * list of state i
		 */
	 if (!like_java) /* the default */
	 {	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->e_trans = p;
				T2->nxt = trans[n][i];
				trans[n][i] = T2;
		}	}
	 } else /* outermost unless checked first */
	 {	T4 = T3 = (Trans *) 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		for (k = HAS_UNLESS-1; k >= 0; k--)
		{	if (p = T0->escp[k])
			for (T1 = trans[n][p]; T1; T1 = T1->nxt)
			{	if (isthere(trans[n][i], T1->t_id))
					continue;
				T2 = cpytr(T1);
				T2->nxt = (Trans *) 0;
				T2->e_trans = p;
				if (T3)	T3->nxt = T2;
				else	T4 = T2;
				T3 = T2;
		}	}
		if (T4)
		{	T3->nxt = trans[n][i];
			trans[n][i] = T4;
		}
	 }
	}
#endif
#ifndef NOREDUCE
	for (i = 1; i < m; i++)
	{	if (a_cycles)
		{ /* moves through these states are visible */
	#if PROG_LAB>0 && defined(HAS_NP)
			if (progstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (progstate[n][T1->st])
					goto degrade;
	#endif
			if (accpstate[n][i] || visstate[n][i])
				goto degrade;
			for (T1 = trans[n][i]; T1; T1 = T1->nxt)
				if (accpstate[n][T1->st])
					goto degrade;
		}
		T1 = trans[n][i];
		if (!T1) continue;
		g = mark_safety(T1);	/* V3.3.1 */
		if (g < 0) goto degrade; /* global */
		/* check if mixing of guards preserves reduction */
		if (T1->nxt)
		{	k = 0;
			for (T0 = T1; T0; T0 = T0->nxt)
			{	if (!(T0->atom&8))
					goto degrade;
				for (aa = 0; aa < 2; aa++)
				{	j = srinc_set(T0->tpe[aa]);
					if (j >= GLOBAL && j != ALPHA_F)
						goto degrade;
					if (T0->tpe[aa]
					&&  T0->tpe[aa]
					!=  T1->tpe[0])
						k = 1;
			}	}
			/* g = 0;	V3.3.1 */
			if (k)	/* non-uniform selection */
			for (T0 = T1; T0; T0 = T0->nxt)
			for (aa = 0; aa < 2; aa++)
			{	j = srinc_set(T0->tpe[aa]);
				if (j != LOCAL)
				{	k = srunc(T0->tpe[aa], j);
					for (h = 0; h < 6; h++)
						if (T1->qu[h] == k
						&&  T1->ty[h] == j)
							break;
					if (h >= 6)
					{	T1->qu[g%6] = k;
						T1->ty[g%6] = j;
						g++;
			}	}	}
			if (g > 6)
			{	T1->qu[0] = 0;	/* turn it off */
				printf("pan: warning, line %d, ",
					srcln[i]);
			 	printf("too many stmnt types (%d)",
					g);
			  	printf(" in selection\n");
			  goto degrade;
			}
		}
		/* mark all options global if >=1 is global */
		for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			if (!(T1->atom&8)) break;
		if (T1)
degrade:	for (T1 = trans[n][i]; T1; T1 = T1->nxt)
			T1->atom &= ~8;	/* mark as unsafe */
		/* can only mix 'r's or 's's if on same chan */
		/* and not mixed with other local operations */
		T1 = trans[n][i];
		if (!T1 || T1->qu[0]) continue;
		j = T1->tpe[0];
		if (T1->nxt && T1->atom&8)
		{ if (j == 5*DELTA)
		  {	printf("warning: line %d ", srcln[i]);
			printf("mixed condition ");
			printf("(defeats reduction)\n");
			goto degrade;
		  }
		  for (T0 = T1; T0; T0 = T0->nxt)
		  for (aa = 0; aa < 2; aa++)
		  if  (T0->tpe[aa] && T0->tpe[aa] != j)
		  {	printf("warning: line %d ", srcln[i]);
			printf("[%d-%d] mixed %stion ",
				T0->tpe[aa], j, 
				(j==5*DELTA)?"condi":"selec");
			printf("(defeats reduction)\n");
			printf("	'%s' <-> '%s'\n",
				T1->tp, T0->tp);
			goto degrade;
		} }
	}
#endif
	for (i = 1; i < m; i++)
	{	T2 = trans[n][i];
		if (!T2
		||  T2->nxt
		||  strncmp(T2->tp, ".(goto)", 7)
		||  !stopstate[n][i])
			continue;
		stopstate[n][T2->st] = 1;
	}
	if (state_tables && !verbose)
	{	if (dodot)
		{	char buf[256], *q = buf, *p = procname[n];
			while (*p != '\0')
			{	if (*p != ':')
				{	*q++ = *p;
				}
				p++;
			}
			*q = '\0';
			printf("digraph ");
			switch (Btypes[n]) {
			case I_PROC:  printf("init {\n"); break;
			case N_CLAIM: printf("claim_%s {\n", buf); break;
			case E_TRACE: printf("notrace {\n"); break;
			case N_TRACE: printf("trace {\n"); break;
			default:      printf("p_%s {\n", buf); break;
			}
			printf("size=\"8,10\";\n");
			printf("  GT [shape=box,style=dotted,label=\"%s\"];\n", buf);
			printf("  GT -> S%d;\n", is);
		} else
		{	switch (Btypes[n]) {
			case I_PROC:  printf("init\n"); break;
			case N_CLAIM: printf("claim %s\n", procname[n]); break;
			case E_TRACE: printf("notrace assertion\n"); break;
			case N_TRACE: printf("trace assertion\n"); break;
			default:      printf("proctype %s\n", procname[n]); break;
		}	}
		for (i = 1; i < m; i++)
		{	reach[i] = 1;
		}
		tagtable(n, m, is, srcln, reach);
		if (dodot) printf("}\n");
	} else
	for (i = 1; i < m; i++)
	{	int nrelse;
		if (Btypes[n] != N_CLAIM)
		{	for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			{	if (T0->st == i
				&& strcmp(T0->tp, "(1)") == 0)
				{	printf("error: proctype '%s' ",
						procname[n]);
		  			printf("line %d, state %d: has un",
						srcln[i], i);
					printf("conditional self-loop\n");
					pan_exit(1);
		}	}	}
		nrelse = 0;
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
		{	if (strcmp(T0->tp, "else") == 0)
				nrelse++;
		}
		if (nrelse > 1)
		{	printf("error: proctype '%s' state",
				procname[n]);
		  	printf(" %d, inherits %d", i, nrelse);
		  	printf(" 'else' stmnts\n");
			pan_exit(1);
	}	}
#if !defined(LOOPSTATE) && !defined(BFS_PAR)
	if (state_tables)
#endif
	do_dfs(n, m, is, srcln, reach, lpstate);

	if (!t_reverse)
	{	return;
	}
	/* process n, with m states, is=initial state -- reverse list */
	if (!state_tables && Btypes[n] != N_CLAIM)
	{	for (i = 1; i < m; i++)
		{	Trans *Tx = (Trans *) 0; /* list of escapes */
			Trans *Ty = (Trans *) 0; /* its tail element */
			T1 = (Trans *) 0; /* reversed list */
			T2 = (Trans *) 0; /* its tail */
			T3 = (Trans *) 0; /* remembers possible 'else' */

			/* find unless-escapes, they should go first */
			T4 = T5 = T0 = trans[n][i];
	#ifdef HAS_UNLESS
			while (T4 && T4->e_trans) /* escapes are first in orig list */
			{	T5 = T4;	  /* remember predecessor */
				T4 = T4->nxt;
			}
	#endif
			/* T4 points to first non-escape, T5 to its parent, T0 to original list */
			if (T4 != T0)		 /* there was at least one escape */
			{	T3 = T5->nxt;		 /* start of non-escapes */
				T5->nxt = (Trans *) 0;	 /* separate */
				Tx = T0;		 /* start of the escapes */
				Ty = T5;		 /* its tail */
				T0 = T3;		 /* the rest, to be reversed */
			}
			/* T0 points to first non-escape, Tx to the list of escapes, Ty to its tail */

			/* first tail-add non-escape transitions, reversed */
			T3 = (Trans *) 0;
			for (T5 = T0; T5; T5 = T4)
			{	T4 = T5->nxt;
	#ifdef HAS_UNLESS
				if (T5->e_trans)
				{	printf("error: cannot happen!\n");
					continue;
				}
	#endif
				if (strcmp(T5->tp, "else") == 0)
				{	T3 = T5;
					T5->nxt = (Trans *) 0;
				} else
				{	T5->nxt = T1;
					if (!T1) { T2 = T5; }
					T1 = T5;
			}	}
			/* T3 points to a possible else, which is removed from the list */
			/* T1 points to the reversed list so far (without escapes) */
			/* T2 points to the tail element -- where the else should go */
			if (T2 && T3)
			{	T2->nxt = T3;	/* add else */
			} else
			{	if (T3) /* there was an else, but there's no tail */
				{	if (!T1)	/* and no reversed list */
					{	T1 = T3; /* odd, but possible */
					} else		/* even stranger */
					{	T1->nxt = T3;
			}	}	}

			/* add in the escapes, to that they appear at the front */
			if (Tx && Ty) { Ty->nxt = T1; T1 = Tx; }

			trans[n][i] = T1;
			/* reversed, with escapes first and else last */
	}	}
	if (state_tables && verbose)
	{	printf("FINAL proctype %s\n", 
			procname[n]);
		for (i = 1; i < m; i++)
		for (T0 = trans[n][i]; T0; T0 = T0->nxt)
			crack(n, i, T0, srcln);
	}
}
void
imed(Trans *T, int v, int n, int j)	/* set intermediate state */
{	progstate[n][T->st] |= progstate[n][v];
	accpstate[n][T->st] |= accpstate[n][v];
	stopstate[n][T->st] |= stopstate[n][v];
	mapstate[n][j] = T->st;
}
void
tagtable(int n, int m, int is, short srcln[], uchar reach[])
{	Trans *z;

	if (is >= m || !trans[n][is]
	||  is <= 0 || reach[is] == 0)
		return;
	reach[is] = 0;
	if (state_tables)
	for (z = trans[n][is]; z; z = z->nxt)
	{	if (dodot)
			dot_crack(n, is, z);
		else
			crack(n, is, z, srcln);
	}

	for (z = trans[n][is]; z; z = z->nxt)
	{
#ifdef HAS_UNLESS
		int i, j;
#endif
		tagtable(n, m, z->st, srcln, reach);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			tagtable(n, m, j, srcln, reach);
		}
#endif
	}
}

extern Trans *t_id_lkup[];

void
dfs_table(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	Trans *z;

	if (is >= m || is <= 0 || !trans[n][is])
		return;
	if ((reach[is] & (4|8|16)) != 0)
	{	if ((reach[is] & (8|16)) == 16)	/* on stack, not yet recorded */
		{	lpstate[is] = 1;
			reach[is] |= 8; /* recorded */
			if (state_tables && verbose)
			{	printf("state %d line %d is a loopstate\n", is, srcln[is]);
		}	}
		return;
	}
	reach[is] |= (4|16);	/* visited | onstack */
	for (z = trans[n][is]; z; z = z->nxt)
	{	t_id_lkup[z->t_id] = z;
#ifdef HAS_UNLESS
		int i, j;
#endif
		dfs_table(n, m, z->st, srcln, reach, lpstate);
#ifdef HAS_UNLESS
		for (i = 0; i < HAS_UNLESS; i++)
		{	j = trans[n][is]->escp[i];
			if (!j) break;
			dfs_table(n, m, j, srcln, reach, lpstate);
		}
#endif
	}
	reach[is] &= ~16; /* no longer on stack */
}
void
do_dfs(int n, int m, int is, short srcln[], uchar reach[], uchar lpstate[])
{	int i;
	dfs_table(n, m, is, srcln, reach, lpstate);
	for (i = 0; i < m; i++)
		reach[i] &= ~(4|8|16);
}
void
crack(int n, int j, Trans *z, short srcln[])
{	int i;

	if (!z) return;
	printf("	state %3d -(tr %3d)-> state %3d  ",
		j, z->forw, z->st);
	printf("[id %3d tp %3d", z->t_id, z->tpe[0]);
	if (z->tpe[1]) printf(",%d", z->tpe[1]);
#ifdef HAS_UNLESS
	if (z->e_trans)
		printf(" org %3d", z->e_trans);
	else if (state_tables >= 2)
	for (i = 0; i < HAS_UNLESS; i++)
	{	if (!z->escp[i]) break;
		printf(" esc %d", z->escp[i]);
	}
#endif
	printf("]");
	printf(" [%s%s%s%s%s] %s:%d => ",
		z->atom&6?"A":z->atom&32?"D":"-",
		accpstate[n][j]?"a" :"-",
		stopstate[n][j]?"e" : "-",
		progstate[n][j]?"p" : "-",
		z->atom & 8 ?"L":"G",
		PanSource, srcln[j]);
	for (i = 0; z->tp[i]; i++)
		if (z->tp[i] == '\n')
			printf("\\n");
		else
			putchar(z->tp[i]);
	if (verbose && z->qu[0])
	{	printf("\t[");
		for (i = 0; i < 6; i++)
			if (z->qu[i])
				printf("(%d,%d)",
				z->qu[i], z->ty[i]);
		printf("]");
	}
	printf("\n");
	fflush(stdout);
}
/* spin -a m.pml; cc -o pan pan.c; ./pan -D | dot -Tps > foo.ps; ps2pdf foo.ps */
void
dot_crack(int n, int j, Trans *z)
{	int i;

	if (!z) return;
	printf("	S%d -> S%d  [color=black", j, z->st);

	if (z->atom&6) printf(",style=dashed");
	else if (z->atom&32) printf(",style=dotted");
	else if (z->atom&8) printf(",style=solid");
	else printf(",style=bold");

	printf(",label=\"");
	for (i = 0; z->tp[i]; i++)
	{	if (z->tp[i] == '\\'
		&&  z->tp[i+1] == 'n')
		{	i++; printf(" ");
		} else
		{	putchar(z->tp[i]);
	}	}
	printf("\"];\n");
	if (accpstate[n][j]) printf("  S%d [color=red,style=bold];\n", j);
	else if (progstate[n][j]) printf("  S%d [color=green,style=bold];\n", j);
	if (stopstate[n][j]) printf("  S%d [color=blue,style=bold,shape=box];\n", j);
}

#ifdef VAR_RANGES
#define BYTESIZE	32	/* 2^8 : 2^3 = 256:8 = 32 */

typedef struct Vr_Ptr {
	char	*nm;
	uchar	vals[BYTESIZE];
	struct Vr_Ptr *nxt;
} Vr_Ptr;
Vr_Ptr *ranges = (Vr_Ptr *) 0;

void
logval(char *s, int v)
{	Vr_Ptr *tmp;

	if (v<0 || v > 255) return;
	for (tmp = ranges; tmp; tmp = tmp->nxt)
		if (!strcmp(tmp->nm, s))
			goto found;
	tmp = (Vr_Ptr *) emalloc(sizeof(Vr_Ptr));
	tmp->nxt = ranges;
	ranges = tmp;
	tmp->nm = s;
found:
	tmp->vals[(v)/8] |= 1<<((v)%8);
}

void
dumpval(uchar X[], int range)
{	int w, x, i, j = -1;

	for (w = i = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
from:		if ((X[w] & (1<<x)))
		{	printf("%d", i);
			j = i;
			goto upto;
	}	}
	return;
	for (w = 0; w < range; w++)
	for (x = 0; x < 8; x++, i++)
	{
upto:		if (!(X[w] & (1<<x)))
		{	if (i-1 == j)
				printf(", ");
			else
				printf("-%d, ", i-1);
			goto from;
	}	}
	if (j >= 0 && j != 255)
		printf("-255");
}

void
dumpranges(void)
{	Vr_Ptr *tmp;
	printf("\nValues assigned within ");
	printf("interval [0..255]:\n");
	for (tmp = ranges; tmp; tmp = tmp->nxt)
	{	printf("\t%s\t: ", tmp->nm);
		dumpval(tmp->vals, BYTESIZE);
		printf("\n");
	}
}
#endif
