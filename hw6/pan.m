#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 90 - crit.pml:239 - [D_STEP239]
		IfNotBlocked

		reached[5][90] = 1;
		reached[5][t->st] = 1;
		reached[5][tt] = 1;

		if (TstOnly) return 1;

		sv_save();
		S_178_0: /* 2 */
		now.areas[0].north = 0;
#ifdef VAR_RANGES
		logval("areas[0].north", ((int)now.areas[0].north));
#endif
		;
S_179_0: /* 2 */
		now.areas[0].east = 1;
#ifdef VAR_RANGES
		logval("areas[0].east", ((int)now.areas[0].east));
#endif
		;
S_180_0: /* 2 */
		now.areas[0].south = 1;
#ifdef VAR_RANGES
		logval("areas[0].south", ((int)now.areas[0].south));
#endif
		;
S_181_0: /* 2 */
		now.areas[0].west = 0;
#ifdef VAR_RANGES
		logval("areas[0].west", ((int)now.areas[0].west));
#endif
		;
S_182_0: /* 2 */
		now.areas[1].north = 1;
#ifdef VAR_RANGES
		logval("areas[1].north", ((int)now.areas[1].north));
#endif
		;
S_183_0: /* 2 */
		now.areas[1].east = 0;
#ifdef VAR_RANGES
		logval("areas[1].east", ((int)now.areas[1].east));
#endif
		;
S_184_0: /* 2 */
		now.areas[1].south = 0;
#ifdef VAR_RANGES
		logval("areas[1].south", ((int)now.areas[1].south));
#endif
		;
S_185_0: /* 2 */
		now.areas[1].west = 1;
#ifdef VAR_RANGES
		logval("areas[1].west", ((int)now.areas[1].west));
#endif
		;
S_186_0: /* 2 */
		now.areas[2].north = 1;
#ifdef VAR_RANGES
		logval("areas[2].north", ((int)now.areas[2].north));
#endif
		;
S_187_0: /* 2 */
		now.areas[2].east = 0;
#ifdef VAR_RANGES
		logval("areas[2].east", ((int)now.areas[2].east));
#endif
		;
S_188_0: /* 2 */
		now.areas[2].south = 1;
#ifdef VAR_RANGES
		logval("areas[2].south", ((int)now.areas[2].south));
#endif
		;
S_189_0: /* 2 */
		now.areas[2].west = 1;
#ifdef VAR_RANGES
		logval("areas[2].west", ((int)now.areas[2].west));
#endif
		;
S_190_0: /* 2 */
		now.areas[3].north = 1;
#ifdef VAR_RANGES
		logval("areas[3].north", ((int)now.areas[3].north));
#endif
		;
S_191_0: /* 2 */
		now.areas[3].east = 0;
#ifdef VAR_RANGES
		logval("areas[3].east", ((int)now.areas[3].east));
#endif
		;
S_192_0: /* 2 */
		now.areas[3].south = 1;
#ifdef VAR_RANGES
		logval("areas[3].south", ((int)now.areas[3].south));
#endif
		;
S_193_0: /* 2 */
		now.areas[3].west = 0;
#ifdef VAR_RANGES
		logval("areas[3].west", ((int)now.areas[3].west));
#endif
		;
S_194_0: /* 2 */
		now.areas[4].north = 0;
#ifdef VAR_RANGES
		logval("areas[4].north", ((int)now.areas[4].north));
#endif
		;
S_195_0: /* 2 */
		now.areas[4].east = 1;
#ifdef VAR_RANGES
		logval("areas[4].east", ((int)now.areas[4].east));
#endif
		;
S_196_0: /* 2 */
		now.areas[4].south = 1;
#ifdef VAR_RANGES
		logval("areas[4].south", ((int)now.areas[4].south));
#endif
		;
S_197_0: /* 2 */
		now.areas[4].west = 1;
#ifdef VAR_RANGES
		logval("areas[4].west", ((int)now.areas[4].west));
#endif
		;
S_198_0: /* 2 */
		now.areas[5].north = 1;
#ifdef VAR_RANGES
		logval("areas[5].north", ((int)now.areas[5].north));
#endif
		;
S_199_0: /* 2 */
		now.areas[5].east = 0;
#ifdef VAR_RANGES
		logval("areas[5].east", ((int)now.areas[5].east));
#endif
		;
S_200_0: /* 2 */
		now.areas[5].south = 0;
#ifdef VAR_RANGES
		logval("areas[5].south", ((int)now.areas[5].south));
#endif
		;
S_201_0: /* 2 */
		now.areas[5].west = 1;
#ifdef VAR_RANGES
		logval("areas[5].west", ((int)now.areas[5].west));
#endif
		;
S_202_0: /* 2 */
		now.areas[6].north = 0;
#ifdef VAR_RANGES
		logval("areas[6].north", ((int)now.areas[6].north));
#endif
		;
S_203_0: /* 2 */
		now.areas[6].east = 1;
#ifdef VAR_RANGES
		logval("areas[6].east", ((int)now.areas[6].east));
#endif
		;
S_204_0: /* 2 */
		now.areas[6].south = 1;
#ifdef VAR_RANGES
		logval("areas[6].south", ((int)now.areas[6].south));
#endif
		;
S_205_0: /* 2 */
		now.areas[6].west = 1;
#ifdef VAR_RANGES
		logval("areas[6].west", ((int)now.areas[6].west));
#endif
		;
S_206_0: /* 2 */
		now.areas[7].north = 1;
#ifdef VAR_RANGES
		logval("areas[7].north", ((int)now.areas[7].north));
#endif
		;
S_207_0: /* 2 */
		now.areas[7].east = 0;
#ifdef VAR_RANGES
		logval("areas[7].east", ((int)now.areas[7].east));
#endif
		;
S_208_0: /* 2 */
		now.areas[7].south = 0;
#ifdef VAR_RANGES
		logval("areas[7].south", ((int)now.areas[7].south));
#endif
		;
S_209_0: /* 2 */
		now.areas[7].west = 1;
#ifdef VAR_RANGES
		logval("areas[7].west", ((int)now.areas[7].west));
#endif
		;
S_210_0: /* 2 */
		now.areas[8].north = 0;
#ifdef VAR_RANGES
		logval("areas[8].north", ((int)now.areas[8].north));
#endif
		;
S_211_0: /* 2 */
		now.areas[8].east = 1;
#ifdef VAR_RANGES
		logval("areas[8].east", ((int)now.areas[8].east));
#endif
		;
S_212_0: /* 2 */
		now.areas[8].south = 0;
#ifdef VAR_RANGES
		logval("areas[8].south", ((int)now.areas[8].south));
#endif
		;
S_213_0: /* 2 */
		now.areas[8].west = 1;
#ifdef VAR_RANGES
		logval("areas[8].west", ((int)now.areas[8].west));
#endif
		;
S_214_0: /* 2 */
		now.areas[9].north = 1;
#ifdef VAR_RANGES
		logval("areas[9].north", ((int)now.areas[9].north));
#endif
		;
S_215_0: /* 2 */
		now.areas[9].east = 0;
#ifdef VAR_RANGES
		logval("areas[9].east", ((int)now.areas[9].east));
#endif
		;
S_216_0: /* 2 */
		now.areas[9].south = 1;
#ifdef VAR_RANGES
		logval("areas[9].south", ((int)now.areas[9].south));
#endif
		;
S_217_0: /* 2 */
		now.areas[9].west = 0;
#ifdef VAR_RANGES
		logval("areas[9].west", ((int)now.areas[9].west));
#endif
		;
S_218_0: /* 2 */
		now.areas[10].north = 1;
#ifdef VAR_RANGES
		logval("areas[10].north", ((int)now.areas[10].north));
#endif
		;
S_219_0: /* 2 */
		now.areas[10].east = 1;
#ifdef VAR_RANGES
		logval("areas[10].east", ((int)now.areas[10].east));
#endif
		;
S_220_0: /* 2 */
		now.areas[10].south = 0;
#ifdef VAR_RANGES
		logval("areas[10].south", ((int)now.areas[10].south));
#endif
		;
S_221_0: /* 2 */
		now.areas[10].west = 0;
#ifdef VAR_RANGES
		logval("areas[10].west", ((int)now.areas[10].west));
#endif
		;
S_222_0: /* 2 */
		now.near_areas[0].north =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[0].north", now.near_areas[0].north);
#endif
		;
S_223_0: /* 2 */
		now.near_areas[0].east = 1;
#ifdef VAR_RANGES
		logval("near_areas[0].east", now.near_areas[0].east);
#endif
		;
S_224_0: /* 2 */
		now.near_areas[0].south = 4;
#ifdef VAR_RANGES
		logval("near_areas[0].south", now.near_areas[0].south);
#endif
		;
S_225_0: /* 2 */
		now.near_areas[0].west =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[0].west", now.near_areas[0].west);
#endif
		;
S_226_0: /* 2 */
		now.near_areas[1].north =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[1].north", now.near_areas[1].north);
#endif
		;
S_227_0: /* 2 */
		now.near_areas[1].east = 2;
#ifdef VAR_RANGES
		logval("near_areas[1].east", now.near_areas[1].east);
#endif
		;
S_228_0: /* 2 */
		now.near_areas[1].south = 5;
#ifdef VAR_RANGES
		logval("near_areas[1].south", now.near_areas[1].south);
#endif
		;
S_229_0: /* 2 */
		now.near_areas[1].west = 0;
#ifdef VAR_RANGES
		logval("near_areas[1].west", now.near_areas[1].west);
#endif
		;
S_230_0: /* 2 */
		now.near_areas[2].north =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[2].north", now.near_areas[2].north);
#endif
		;
S_231_0: /* 2 */
		now.near_areas[2].east = 3;
#ifdef VAR_RANGES
		logval("near_areas[2].east", now.near_areas[2].east);
#endif
		;
S_232_0: /* 2 */
		now.near_areas[2].south = 6;
#ifdef VAR_RANGES
		logval("near_areas[2].south", now.near_areas[2].south);
#endif
		;
S_233_0: /* 2 */
		now.near_areas[2].west = 1;
#ifdef VAR_RANGES
		logval("near_areas[2].west", now.near_areas[2].west);
#endif
		;
S_234_0: /* 2 */
		now.near_areas[3].north =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[3].north", now.near_areas[3].north);
#endif
		;
S_235_0: /* 2 */
		now.near_areas[3].east =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[3].east", now.near_areas[3].east);
#endif
		;
S_236_0: /* 2 */
		now.near_areas[3].south =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[3].south", now.near_areas[3].south);
#endif
		;
S_237_0: /* 2 */
		now.near_areas[3].west = 2;
#ifdef VAR_RANGES
		logval("near_areas[3].west", now.near_areas[3].west);
#endif
		;
S_238_0: /* 2 */
		now.near_areas[4].north = 0;
#ifdef VAR_RANGES
		logval("near_areas[4].north", now.near_areas[4].north);
#endif
		;
S_239_0: /* 2 */
		now.near_areas[4].east = 5;
#ifdef VAR_RANGES
		logval("near_areas[4].east", now.near_areas[4].east);
#endif
		;
S_240_0: /* 2 */
		now.near_areas[4].south = 8;
#ifdef VAR_RANGES
		logval("near_areas[4].south", now.near_areas[4].south);
#endif
		;
S_241_0: /* 2 */
		now.near_areas[4].west =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[4].west", now.near_areas[4].west);
#endif
		;
S_242_0: /* 2 */
		now.near_areas[5].north = 1;
#ifdef VAR_RANGES
		logval("near_areas[5].north", now.near_areas[5].north);
#endif
		;
S_243_0: /* 2 */
		now.near_areas[5].east = 6;
#ifdef VAR_RANGES
		logval("near_areas[5].east", now.near_areas[5].east);
#endif
		;
S_244_0: /* 2 */
		now.near_areas[5].south = 9;
#ifdef VAR_RANGES
		logval("near_areas[5].south", now.near_areas[5].south);
#endif
		;
S_245_0: /* 2 */
		now.near_areas[5].west = 4;
#ifdef VAR_RANGES
		logval("near_areas[5].west", now.near_areas[5].west);
#endif
		;
S_246_0: /* 2 */
		now.near_areas[6].north = 2;
#ifdef VAR_RANGES
		logval("near_areas[6].north", now.near_areas[6].north);
#endif
		;
S_247_0: /* 2 */
		now.near_areas[6].east =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[6].east", now.near_areas[6].east);
#endif
		;
S_248_0: /* 2 */
		now.near_areas[6].south = 10;
#ifdef VAR_RANGES
		logval("near_areas[6].south", now.near_areas[6].south);
#endif
		;
S_249_0: /* 2 */
		now.near_areas[6].west = 5;
#ifdef VAR_RANGES
		logval("near_areas[6].west", now.near_areas[6].west);
#endif
		;
S_250_0: /* 2 */
		now.near_areas[7].north =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[7].north", now.near_areas[7].north);
#endif
		;
S_251_0: /* 2 */
		now.near_areas[7].east = 8;
#ifdef VAR_RANGES
		logval("near_areas[7].east", now.near_areas[7].east);
#endif
		;
S_252_0: /* 2 */
		now.near_areas[7].south =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[7].south", now.near_areas[7].south);
#endif
		;
S_253_0: /* 2 */
		now.near_areas[7].west =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[7].west", now.near_areas[7].west);
#endif
		;
S_254_0: /* 2 */
		now.near_areas[8].north = 4;
#ifdef VAR_RANGES
		logval("near_areas[8].north", now.near_areas[8].north);
#endif
		;
S_255_0: /* 2 */
		now.near_areas[8].east = 9;
#ifdef VAR_RANGES
		logval("near_areas[8].east", now.near_areas[8].east);
#endif
		;
S_256_0: /* 2 */
		now.near_areas[8].south =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[8].south", now.near_areas[8].south);
#endif
		;
S_257_0: /* 2 */
		now.near_areas[8].west = 7;
#ifdef VAR_RANGES
		logval("near_areas[8].west", now.near_areas[8].west);
#endif
		;
S_258_0: /* 2 */
		now.near_areas[9].north = 5;
#ifdef VAR_RANGES
		logval("near_areas[9].north", now.near_areas[9].north);
#endif
		;
S_259_0: /* 2 */
		now.near_areas[9].east = 10;
#ifdef VAR_RANGES
		logval("near_areas[9].east", now.near_areas[9].east);
#endif
		;
S_260_0: /* 2 */
		now.near_areas[9].south =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[9].south", now.near_areas[9].south);
#endif
		;
S_261_0: /* 2 */
		now.near_areas[9].west = 8;
#ifdef VAR_RANGES
		logval("near_areas[9].west", now.near_areas[9].west);
#endif
		;
S_262_0: /* 2 */
		now.near_areas[10].north = 6;
#ifdef VAR_RANGES
		logval("near_areas[10].north", now.near_areas[10].north);
#endif
		;
S_263_0: /* 2 */
		now.near_areas[10].east =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[10].east", now.near_areas[10].east);
#endif
		;
S_264_0: /* 2 */
		now.near_areas[10].south =  -(1);
#ifdef VAR_RANGES
		logval("near_areas[10].south", now.near_areas[10].south);
#endif
		;
S_265_0: /* 2 */
		now.near_areas[10].west = 9;
#ifdef VAR_RANGES
		logval("near_areas[10].west", now.near_areas[10].west);
#endif
		;
S_266_0: /* 2 */
		now.init_lock = 0;
#ifdef VAR_RANGES
		logval("init_lock", ((int)now.init_lock));
#endif
		;
		goto S_268_0;
S_268_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 4: // STATE 91 - crit.pml:267 - [(run handle1())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][91] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 92 - crit.pml:268 - [(run handle1())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][92] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 6: // STATE 93 - crit.pml:269 - [(run handle1())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][93] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 94 - crit.pml:270 - [(run handle2())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][94] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 95 - crit.pml:271 - [(run handle2())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][95] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 9: // STATE 96 - crit.pml:272 - [(run handle2())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][96] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 10: // STATE 97 - crit.pml:273 - [(run handle3())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][97] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 11: // STATE 98 - crit.pml:274 - [(run handle3())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][98] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 99 - crit.pml:275 - [(run handle3())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][99] = 1;
		if (!(addproc(II, 1, 2)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 13: // STATE 100 - crit.pml:276 - [(run handle4())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][100] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 14: // STATE 101 - crit.pml:277 - [(run handle4())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][101] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 102 - crit.pml:278 - [(run handle4())] (0:0:0 - 1)
		IfNotBlocked
		reached[5][102] = 1;
		if (!(addproc(II, 1, 3)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 103 - crit.pml:279 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[5][103] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC invariant */
	case 17: // STATE 1 - crit.pml:159 - [(!(init_lock))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][1] = 1;
		if (!( !(((int)now.init_lock))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 2 - crit.pml:161 - [(!(area_lock))] (78:0:1 - 1)
		IfNotBlocked
		reached[4][2] = 1;
		if (!( !(((int)now.area_lock))))
			continue;
		/* merge: area_lock = 1(0, 3, 78) */
		reached[4][3] = 1;
		(trpt+1)->bup.oval = ((int)now.area_lock);
		now.area_lock = 1;
#ifdef VAR_RANGES
		logval("area_lock", ((int)now.area_lock));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 19: // STATE 5 - crit.pml:165 - [((areas[3].east==1))] (17:0:3 - 1)
		IfNotBlocked
		reached[4][5] = 1;
		if (!((((int)now.areas[3].east)==1)))
			continue;
		/* merge: filled[3] = 1(17, 6, 17) */
		reached[4][6] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled[3]);
		((P4 *)this)->filled[3] = 1;
#ifdef VAR_RANGES
		logval("invariant:filled[3]", ((int)((P4 *)this)->filled[3]));
#endif
		;
		/* merge: changed = 1(17, 7, 17) */
		reached[4][7] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->changed);
		((P4 *)this)->changed = 1;
#ifdef VAR_RANGES
		logval("invariant:changed", ((int)((P4 *)this)->changed));
#endif
		;
		/* merge: .(goto)(17, 10, 17) */
		reached[4][10] = 1;
		;
		/* merge: i = 0(17, 11, 17) */
		reached[4][11] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[4][18] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 20: // STATE 11 - crit.pml:170 - [i = 0] (0:17:1 - 3)
		IfNotBlocked
		reached[4][11] = 1;
		(trpt+1)->bup.oval = ((int)((P4 *)this)->i);
		((P4 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[4][18] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 21: // STATE 12 - crit.pml:172 - [((i<11))] (17:0:2 - 1)
		IfNotBlocked
		reached[4][12] = 1;
		if (!((((int)((P4 *)this)->i)<11)))
			continue;
		/* merge: filled_copy[i] = filled[i](17, 13, 17) */
		reached[4][13] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]);
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = ((int)((P4 *)this)->filled[ Index(((int)((P4 *)this)->i), 11) ]);
#ifdef VAR_RANGES
		logval("invariant:filled_copy[invariant:i]", ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]));
#endif
		;
		/* merge: i = (i+1)(17, 14, 17) */
		reached[4][14] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = (((int)((P4 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 18, 17) */
		reached[4][18] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 22: // STATE 20 - crit.pml:179 - [(changed)] (54:0:2 - 1)
		IfNotBlocked
		reached[4][20] = 1;
		if (!(((int)((P4 *)this)->changed)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: changed */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P4 *)this)->changed;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P4 *)this)->changed = 0;
		/* merge: i = 0(0, 21, 54) */
		reached[4][21] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[4][55] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 22 - crit.pml:182 - [((i<11))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][22] = 1;
		if (!((((int)((P4 *)this)->i)<11)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 24: // STATE 23 - crit.pml:184 - [(filled[i])] (28:0:1 - 1)
		IfNotBlocked
		reached[4][23] = 1;
		if (!(((int)((P4 *)this)->filled[ Index(((int)((P4 *)this)->i), 11) ])))
			continue;
		/* merge: next_area = near_areas[i].north(0, 24, 28) */
		reached[4][24] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].north;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 25: // STATE 25 - crit.pml:187 - [(((next_area>=0)&&!(filled[next_area])))] (34:0:2 - 1)
		IfNotBlocked
		reached[4][25] = 1;
		if (!(((((P4 *)this)->next_area>=0)&& !(((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ])))))
			continue;
		/* merge: filled[next_area] = ((areas[i].north==1)&&(areas[next_area].south==1))(34, 26, 34) */
		reached[4][26] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]);
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = ((((int)now.areas[ Index(((int)((P4 *)this)->i), 11) ].north)==1)&&(((int)now.areas[ Index(((P4 *)this)->next_area, 11) ].south)==1));
#ifdef VAR_RANGES
		logval("invariant:filled[invariant:next_area]", ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]));
#endif
		;
		/* merge: .(goto)(34, 29, 34) */
		reached[4][29] = 1;
		;
		/* merge: next_area = near_areas[i].east(34, 30, 34) */
		reached[4][30] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].east;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 26: // STATE 30 - crit.pml:192 - [next_area = near_areas[i].east] (0:34:1 - 3)
		IfNotBlocked
		reached[4][30] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].east;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 31 - crit.pml:194 - [(((next_area>=0)&&!(filled[next_area])))] (40:0:2 - 1)
		IfNotBlocked
		reached[4][31] = 1;
		if (!(((((P4 *)this)->next_area>=0)&& !(((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ])))))
			continue;
		/* merge: filled[next_area] = ((areas[i].east==1)&&(areas[next_area].west==1))(40, 32, 40) */
		reached[4][32] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]);
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = ((((int)now.areas[ Index(((int)((P4 *)this)->i), 11) ].east)==1)&&(((int)now.areas[ Index(((P4 *)this)->next_area, 11) ].west)==1));
#ifdef VAR_RANGES
		logval("invariant:filled[invariant:next_area]", ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]));
#endif
		;
		/* merge: .(goto)(40, 35, 40) */
		reached[4][35] = 1;
		;
		/* merge: next_area = near_areas[i].south(40, 36, 40) */
		reached[4][36] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].south;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 28: // STATE 36 - crit.pml:199 - [next_area = near_areas[i].south] (0:40:1 - 3)
		IfNotBlocked
		reached[4][36] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].south;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 29: // STATE 37 - crit.pml:201 - [(((next_area>=0)&&!(filled[next_area])))] (46:0:2 - 1)
		IfNotBlocked
		reached[4][37] = 1;
		if (!(((((P4 *)this)->next_area>=0)&& !(((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ])))))
			continue;
		/* merge: filled[next_area] = ((areas[i].south==1)&&(areas[next_area].north==1))(46, 38, 46) */
		reached[4][38] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]);
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = ((((int)now.areas[ Index(((int)((P4 *)this)->i), 11) ].south)==1)&&(((int)now.areas[ Index(((P4 *)this)->next_area, 11) ].north)==1));
#ifdef VAR_RANGES
		logval("invariant:filled[invariant:next_area]", ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]));
#endif
		;
		/* merge: .(goto)(46, 41, 46) */
		reached[4][41] = 1;
		;
		/* merge: next_area = near_areas[i].west(46, 42, 46) */
		reached[4][42] = 1;
		(trpt+1)->bup.ovals[1] = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].west;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 3 */
	case 30: // STATE 42 - crit.pml:206 - [next_area = near_areas[i].west] (0:46:1 - 3)
		IfNotBlocked
		reached[4][42] = 1;
		(trpt+1)->bup.oval = ((P4 *)this)->next_area;
		((P4 *)this)->next_area = now.near_areas[ Index(((int)((P4 *)this)->i), 11) ].west;
#ifdef VAR_RANGES
		logval("invariant:next_area", ((P4 *)this)->next_area);
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 31: // STATE 43 - crit.pml:208 - [(((next_area>=0)&&!(filled[next_area])))] (54:0:2 - 1)
		IfNotBlocked
		reached[4][43] = 1;
		if (!(((((P4 *)this)->next_area>=0)&& !(((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ])))))
			continue;
		/* merge: filled[next_area] = ((areas[i].west==1)&&(areas[next_area].east==1))(54, 44, 54) */
		reached[4][44] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]);
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = ((((int)now.areas[ Index(((int)((P4 *)this)->i), 11) ].west)==1)&&(((int)now.areas[ Index(((P4 *)this)->next_area, 11) ].east)==1));
#ifdef VAR_RANGES
		logval("invariant:filled[invariant:next_area]", ((int)((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ]));
#endif
		;
		/* merge: .(goto)(54, 47, 54) */
		reached[4][47] = 1;
		;
		/* merge: .(goto)(54, 50, 54) */
		reached[4][50] = 1;
		;
		/* merge: i = (i+1)(54, 51, 54) */
		reached[4][51] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = (((int)((P4 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[4][55] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 32: // STATE 51 - crit.pml:214 - [i = (i+1)] (0:54:1 - 5)
		IfNotBlocked
		reached[4][51] = 1;
		(trpt+1)->bup.oval = ((int)((P4 *)this)->i);
		((P4 *)this)->i = (((int)((P4 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 55, 54) */
		reached[4][55] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 33: // STATE 57 - crit.pml:218 - [changed = 0] (0:69:2 - 3)
		IfNotBlocked
		reached[4][57] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->changed);
		((P4 *)this)->changed = 0;
#ifdef VAR_RANGES
		logval("invariant:changed", ((int)((P4 *)this)->changed));
#endif
		;
		/* merge: i = 0(69, 58, 69) */
		reached[4][58] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = 0;
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 70, 69) */
		reached[4][70] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 34: // STATE 59 - crit.pml:221 - [((i<11))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][59] = 1;
		if (!((((int)((P4 *)this)->i)<11)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 35: // STATE 60 - crit.pml:223 - [((filled_copy[i]!=filled[i]))] (69:0:3 - 1)
		IfNotBlocked
		reached[4][60] = 1;
		if (!((((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ])!=((int)((P4 *)this)->filled[ Index(((int)((P4 *)this)->i), 11) ]))))
			continue;
		/* merge: changed = 1(69, 61, 69) */
		reached[4][61] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->changed);
		((P4 *)this)->changed = 1;
#ifdef VAR_RANGES
		logval("invariant:changed", ((int)((P4 *)this)->changed));
#endif
		;
		/* merge: .(goto)(69, 64, 69) */
		reached[4][64] = 1;
		;
		/* merge: filled_copy[i] = filled[i](69, 65, 69) */
		reached[4][65] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]);
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = ((int)((P4 *)this)->filled[ Index(((int)((P4 *)this)->i), 11) ]);
#ifdef VAR_RANGES
		logval("invariant:filled_copy[invariant:i]", ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]));
#endif
		;
		/* merge: i = (i+1)(69, 66, 69) */
		reached[4][66] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = (((int)((P4 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 70, 69) */
		reached[4][70] = 1;
		;
		_m = 3; goto P999; /* 5 */
	case 36: // STATE 65 - crit.pml:226 - [filled_copy[i] = filled[i]] (0:69:2 - 3)
		IfNotBlocked
		reached[4][65] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]);
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = ((int)((P4 *)this)->filled[ Index(((int)((P4 *)this)->i), 11) ]);
#ifdef VAR_RANGES
		logval("invariant:filled_copy[invariant:i]", ((int)((P4 *)this)->filled_copy[ Index(((int)((P4 *)this)->i), 11) ]));
#endif
		;
		/* merge: i = (i+1)(69, 66, 69) */
		reached[4][66] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P4 *)this)->i);
		((P4 *)this)->i = (((int)((P4 *)this)->i)+1);
#ifdef VAR_RANGES
		logval("invariant:i", ((int)((P4 *)this)->i));
#endif
		;
		/* merge: .(goto)(0, 70, 69) */
		reached[4][70] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 37: // STATE 77 - crit.pml:233 - [assert((!(filled[7])||(areas[7].south==0)))] (0:0:0 - 1)
		IfNotBlocked
		reached[4][77] = 1;
		spin_assert(( !(((int)((P4 *)this)->filled[7]))||(((int)now.areas[7].south)==0)), "( !(filled[7])||(areas[7].south==0))", II, tt, t);
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 79 - crit.pml:235 - [area_lock = 0] (0:0:1 - 1)
		IfNotBlocked
		reached[4][79] = 1;
		(trpt+1)->bup.oval = ((int)now.area_lock);
		now.area_lock = 0;
#ifdef VAR_RANGES
		logval("area_lock", ((int)now.area_lock));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 39: // STATE 80 - crit.pml:236 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[4][80] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC handle4 */
	case 40: // STATE 21 - crit.pml:125 - [D_STEP125]
		IfNotBlocked

		reached[3][21] = 1;
		reached[3][t->st] = 1;
		reached[3][tt] = 1;

		if (TstOnly) return 1;

		sv_save();
		S_076_0: /* 2 */
		((P3 *)this)->tmp = ((int)now.areas[5].north);
#ifdef VAR_RANGES
		logval("handle4:tmp", ((int)((P3 *)this)->tmp));
#endif
		;
S_077_0: /* 2 */
		now.areas[5].north = ((int)now.areas[5].east);
#ifdef VAR_RANGES
		logval("areas[5].north", ((int)now.areas[5].north));
#endif
		;
S_078_0: /* 2 */
		now.areas[5].east = ((int)now.areas[5].south);
#ifdef VAR_RANGES
		logval("areas[5].east", ((int)now.areas[5].east));
#endif
		;
S_079_0: /* 2 */
		now.areas[5].south = ((int)now.areas[5].west);
#ifdef VAR_RANGES
		logval("areas[5].south", ((int)now.areas[5].south));
#endif
		;
S_080_0: /* 2 */
		now.areas[5].west = ((int)((P3 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[5].west", ((int)now.areas[5].west));
#endif
		;
S_081_0: /* 2 */
		((P3 *)this)->tmp = ((int)now.areas[6].north);
#ifdef VAR_RANGES
		logval("handle4:tmp", ((int)((P3 *)this)->tmp));
#endif
		;
S_082_0: /* 2 */
		now.areas[6].north = ((int)now.areas[6].west);
#ifdef VAR_RANGES
		logval("areas[6].north", ((int)now.areas[6].north));
#endif
		;
S_083_0: /* 2 */
		now.areas[6].west = ((int)now.areas[6].south);
#ifdef VAR_RANGES
		logval("areas[6].west", ((int)now.areas[6].west));
#endif
		;
S_084_0: /* 2 */
		now.areas[6].south = ((int)now.areas[6].east);
#ifdef VAR_RANGES
		logval("areas[6].south", ((int)now.areas[6].south));
#endif
		;
S_085_0: /* 2 */
		now.areas[6].east = ((int)((P3 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[6].east", ((int)now.areas[6].east));
#endif
		;
S_086_0: /* 2 */
		((P3 *)this)->tmp = ((int)now.areas[9].north);
#ifdef VAR_RANGES
		logval("handle4:tmp", ((int)((P3 *)this)->tmp));
#endif
		;
S_087_0: /* 2 */
		now.areas[9].north = ((int)now.areas[9].east);
#ifdef VAR_RANGES
		logval("areas[9].north", ((int)now.areas[9].north));
#endif
		;
S_088_0: /* 2 */
		now.areas[9].east = ((int)now.areas[9].south);
#ifdef VAR_RANGES
		logval("areas[9].east", ((int)now.areas[9].east));
#endif
		;
S_089_0: /* 2 */
		now.areas[9].south = ((int)now.areas[9].west);
#ifdef VAR_RANGES
		logval("areas[9].south", ((int)now.areas[9].south));
#endif
		;
S_090_0: /* 2 */
		now.areas[9].west = ((int)((P3 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[9].west", ((int)now.areas[9].west));
#endif
		;
S_091_0: /* 2 */
		((P3 *)this)->tmp = ((int)now.areas[10].north);
#ifdef VAR_RANGES
		logval("handle4:tmp", ((int)((P3 *)this)->tmp));
#endif
		;
S_092_0: /* 2 */
		now.areas[10].north = ((int)now.areas[10].west);
#ifdef VAR_RANGES
		logval("areas[10].north", ((int)now.areas[10].north));
#endif
		;
S_093_0: /* 2 */
		now.areas[10].west = ((int)now.areas[10].south);
#ifdef VAR_RANGES
		logval("areas[10].west", ((int)now.areas[10].west));
#endif
		;
S_094_0: /* 2 */
		now.areas[10].south = ((int)now.areas[10].east);
#ifdef VAR_RANGES
		logval("areas[10].south", ((int)now.areas[10].south));
#endif
		;
S_095_0: /* 2 */
		now.areas[10].east = ((int)((P3 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[10].east", ((int)now.areas[10].east));
#endif
		;
		goto S_097_0;
S_097_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 41: // STATE 22 - crit.pml:150 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[3][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC handle3 */
	case 42: // STATE 26 - crit.pml:89 - [D_STEP89]
		IfNotBlocked

		reached[2][26] = 1;
		reached[2][t->st] = 1;
		reached[2][tt] = 1;

		if (TstOnly) return 1;

		sv_save();
		S_049_0: /* 2 */
		((P2 *)this)->tmp = ((int)now.areas[4].north);
#ifdef VAR_RANGES
		logval("handle3:tmp", ((int)((P2 *)this)->tmp));
#endif
		;
S_050_0: /* 2 */
		now.areas[4].north = ((int)now.areas[4].west);
#ifdef VAR_RANGES
		logval("areas[4].north", ((int)now.areas[4].north));
#endif
		;
S_051_0: /* 2 */
		now.areas[4].west = ((int)now.areas[4].south);
#ifdef VAR_RANGES
		logval("areas[4].west", ((int)now.areas[4].west));
#endif
		;
S_052_0: /* 2 */
		now.areas[4].south = ((int)now.areas[4].east);
#ifdef VAR_RANGES
		logval("areas[4].south", ((int)now.areas[4].south));
#endif
		;
S_053_0: /* 2 */
		now.areas[4].east = ((int)((P2 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[4].east", ((int)now.areas[4].east));
#endif
		;
S_054_0: /* 2 */
		((P2 *)this)->tmp = ((int)now.areas[5].north);
#ifdef VAR_RANGES
		logval("handle3:tmp", ((int)((P2 *)this)->tmp));
#endif
		;
S_055_0: /* 2 */
		now.areas[5].north = ((int)now.areas[5].west);
#ifdef VAR_RANGES
		logval("areas[5].north", ((int)now.areas[5].north));
#endif
		;
S_056_0: /* 2 */
		now.areas[5].west = ((int)now.areas[5].south);
#ifdef VAR_RANGES
		logval("areas[5].west", ((int)now.areas[5].west));
#endif
		;
S_057_0: /* 2 */
		now.areas[5].south = ((int)now.areas[5].east);
#ifdef VAR_RANGES
		logval("areas[5].south", ((int)now.areas[5].south));
#endif
		;
S_058_0: /* 2 */
		now.areas[5].east = ((int)((P2 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[5].east", ((int)now.areas[5].east));
#endif
		;
S_059_0: /* 2 */
		((P2 *)this)->tmp = ((int)now.areas[7].north);
#ifdef VAR_RANGES
		logval("handle3:tmp", ((int)((P2 *)this)->tmp));
#endif
		;
S_060_0: /* 2 */
		now.areas[7].north = ((int)now.areas[7].west);
#ifdef VAR_RANGES
		logval("areas[7].north", ((int)now.areas[7].north));
#endif
		;
S_061_0: /* 2 */
		now.areas[7].west = ((int)now.areas[7].south);
#ifdef VAR_RANGES
		logval("areas[7].west", ((int)now.areas[7].west));
#endif
		;
S_062_0: /* 2 */
		now.areas[7].south = ((int)now.areas[7].east);
#ifdef VAR_RANGES
		logval("areas[7].south", ((int)now.areas[7].south));
#endif
		;
S_063_0: /* 2 */
		now.areas[7].east = ((int)((P2 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[7].east", ((int)now.areas[7].east));
#endif
		;
S_064_0: /* 2 */
		((P2 *)this)->tmp = ((int)now.areas[8].north);
#ifdef VAR_RANGES
		logval("handle3:tmp", ((int)((P2 *)this)->tmp));
#endif
		;
S_065_0: /* 2 */
		now.areas[8].north = ((int)now.areas[8].west);
#ifdef VAR_RANGES
		logval("areas[8].north", ((int)now.areas[8].north));
#endif
		;
S_066_0: /* 2 */
		now.areas[8].west = ((int)now.areas[8].south);
#ifdef VAR_RANGES
		logval("areas[8].west", ((int)now.areas[8].west));
#endif
		;
S_067_0: /* 2 */
		now.areas[8].south = ((int)now.areas[8].east);
#ifdef VAR_RANGES
		logval("areas[8].south", ((int)now.areas[8].south));
#endif
		;
S_068_0: /* 2 */
		now.areas[8].east = ((int)((P2 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[8].east", ((int)now.areas[8].east));
#endif
		;
S_069_0: /* 2 */
		((P2 *)this)->tmp = ((int)now.areas[9].north);
#ifdef VAR_RANGES
		logval("handle3:tmp", ((int)((P2 *)this)->tmp));
#endif
		;
S_070_0: /* 2 */
		now.areas[9].north = ((int)now.areas[9].west);
#ifdef VAR_RANGES
		logval("areas[9].north", ((int)now.areas[9].north));
#endif
		;
S_071_0: /* 2 */
		now.areas[9].west = ((int)now.areas[9].south);
#ifdef VAR_RANGES
		logval("areas[9].west", ((int)now.areas[9].west));
#endif
		;
S_072_0: /* 2 */
		now.areas[9].south = ((int)now.areas[9].east);
#ifdef VAR_RANGES
		logval("areas[9].south", ((int)now.areas[9].south));
#endif
		;
S_073_0: /* 2 */
		now.areas[9].east = ((int)((P2 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[9].east", ((int)now.areas[9].east));
#endif
		;
		goto S_075_0;
S_075_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 43: // STATE 27 - crit.pml:120 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC handle2 */
	case 44: // STATE 26 - crit.pml:53 - [D_STEP53]
		IfNotBlocked

		reached[1][26] = 1;
		reached[1][t->st] = 1;
		reached[1][tt] = 1;

		if (TstOnly) return 1;

		sv_save();
		S_022_0: /* 2 */
		((P1 *)this)->tmp = ((int)now.areas[1].north);
#ifdef VAR_RANGES
		logval("handle2:tmp", ((int)((P1 *)this)->tmp));
#endif
		;
S_023_0: /* 2 */
		now.areas[1].north = ((int)now.areas[1].west);
#ifdef VAR_RANGES
		logval("areas[1].north", ((int)now.areas[1].north));
#endif
		;
S_024_0: /* 2 */
		now.areas[1].west = ((int)now.areas[1].south);
#ifdef VAR_RANGES
		logval("areas[1].west", ((int)now.areas[1].west));
#endif
		;
S_025_0: /* 2 */
		now.areas[1].south = ((int)now.areas[1].east);
#ifdef VAR_RANGES
		logval("areas[1].south", ((int)now.areas[1].south));
#endif
		;
S_026_0: /* 2 */
		now.areas[1].east = ((int)((P1 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[1].east", ((int)now.areas[1].east));
#endif
		;
S_027_0: /* 2 */
		((P1 *)this)->tmp = ((int)now.areas[2].north);
#ifdef VAR_RANGES
		logval("handle2:tmp", ((int)((P1 *)this)->tmp));
#endif
		;
S_028_0: /* 2 */
		now.areas[2].north = ((int)now.areas[2].west);
#ifdef VAR_RANGES
		logval("areas[2].north", ((int)now.areas[2].north));
#endif
		;
S_029_0: /* 2 */
		now.areas[2].west = ((int)now.areas[2].south);
#ifdef VAR_RANGES
		logval("areas[2].west", ((int)now.areas[2].west));
#endif
		;
S_030_0: /* 2 */
		now.areas[2].south = ((int)now.areas[2].east);
#ifdef VAR_RANGES
		logval("areas[2].south", ((int)now.areas[2].south));
#endif
		;
S_031_0: /* 2 */
		now.areas[2].east = ((int)((P1 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[2].east", ((int)now.areas[2].east));
#endif
		;
S_032_0: /* 2 */
		((P1 *)this)->tmp = ((int)now.areas[3].north);
#ifdef VAR_RANGES
		logval("handle2:tmp", ((int)((P1 *)this)->tmp));
#endif
		;
S_033_0: /* 2 */
		now.areas[3].north = ((int)now.areas[3].west);
#ifdef VAR_RANGES
		logval("areas[3].north", ((int)now.areas[3].north));
#endif
		;
S_034_0: /* 2 */
		now.areas[3].west = ((int)now.areas[3].south);
#ifdef VAR_RANGES
		logval("areas[3].west", ((int)now.areas[3].west));
#endif
		;
S_035_0: /* 2 */
		now.areas[3].south = ((int)now.areas[3].east);
#ifdef VAR_RANGES
		logval("areas[3].south", ((int)now.areas[3].south));
#endif
		;
S_036_0: /* 2 */
		now.areas[3].east = ((int)((P1 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[3].east", ((int)now.areas[3].east));
#endif
		;
S_037_0: /* 2 */
		((P1 *)this)->tmp = ((int)now.areas[5].north);
#ifdef VAR_RANGES
		logval("handle2:tmp", ((int)((P1 *)this)->tmp));
#endif
		;
S_038_0: /* 2 */
		now.areas[5].north = ((int)now.areas[5].west);
#ifdef VAR_RANGES
		logval("areas[5].north", ((int)now.areas[5].north));
#endif
		;
S_039_0: /* 2 */
		now.areas[5].west = ((int)now.areas[5].south);
#ifdef VAR_RANGES
		logval("areas[5].west", ((int)now.areas[5].west));
#endif
		;
S_040_0: /* 2 */
		now.areas[5].south = ((int)now.areas[5].east);
#ifdef VAR_RANGES
		logval("areas[5].south", ((int)now.areas[5].south));
#endif
		;
S_041_0: /* 2 */
		now.areas[5].east = ((int)((P1 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[5].east", ((int)now.areas[5].east));
#endif
		;
S_042_0: /* 2 */
		((P1 *)this)->tmp = ((int)now.areas[6].north);
#ifdef VAR_RANGES
		logval("handle2:tmp", ((int)((P1 *)this)->tmp));
#endif
		;
S_043_0: /* 2 */
		now.areas[6].north = ((int)now.areas[6].west);
#ifdef VAR_RANGES
		logval("areas[6].north", ((int)now.areas[6].north));
#endif
		;
S_044_0: /* 2 */
		now.areas[6].west = ((int)now.areas[6].south);
#ifdef VAR_RANGES
		logval("areas[6].west", ((int)now.areas[6].west));
#endif
		;
S_045_0: /* 2 */
		now.areas[6].south = ((int)now.areas[6].east);
#ifdef VAR_RANGES
		logval("areas[6].south", ((int)now.areas[6].south));
#endif
		;
S_046_0: /* 2 */
		now.areas[6].east = ((int)((P1 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[6].east", ((int)now.areas[6].east));
#endif
		;
		goto S_048_0;
S_048_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 45: // STATE 27 - crit.pml:84 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][27] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC handle1 */
	case 46: // STATE 21 - crit.pml:23 - [D_STEP23]
		IfNotBlocked

		reached[0][21] = 1;
		reached[0][t->st] = 1;
		reached[0][tt] = 1;

		if (TstOnly) return 1;

		sv_save();
		S_000_0: /* 2 */
		((P0 *)this)->tmp = ((int)now.areas[0].north);
#ifdef VAR_RANGES
		logval("handle1:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
S_001_0: /* 2 */
		now.areas[0].north = ((int)now.areas[0].west);
#ifdef VAR_RANGES
		logval("areas[0].north", ((int)now.areas[0].north));
#endif
		;
S_002_0: /* 2 */
		now.areas[0].west = ((int)now.areas[0].south);
#ifdef VAR_RANGES
		logval("areas[0].west", ((int)now.areas[0].west));
#endif
		;
S_003_0: /* 2 */
		now.areas[0].south = ((int)now.areas[0].east);
#ifdef VAR_RANGES
		logval("areas[0].south", ((int)now.areas[0].south));
#endif
		;
S_004_0: /* 2 */
		now.areas[0].east = ((int)((P0 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[0].east", ((int)now.areas[0].east));
#endif
		;
S_005_0: /* 2 */
		((P0 *)this)->tmp = ((int)now.areas[1].north);
#ifdef VAR_RANGES
		logval("handle1:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
S_006_0: /* 2 */
		now.areas[1].north = ((int)now.areas[1].west);
#ifdef VAR_RANGES
		logval("areas[1].north", ((int)now.areas[1].north));
#endif
		;
S_007_0: /* 2 */
		now.areas[1].west = ((int)now.areas[1].south);
#ifdef VAR_RANGES
		logval("areas[1].west", ((int)now.areas[1].west));
#endif
		;
S_008_0: /* 2 */
		now.areas[1].south = ((int)now.areas[1].east);
#ifdef VAR_RANGES
		logval("areas[1].south", ((int)now.areas[1].south));
#endif
		;
S_009_0: /* 2 */
		now.areas[1].east = ((int)((P0 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[1].east", ((int)now.areas[1].east));
#endif
		;
S_010_0: /* 2 */
		((P0 *)this)->tmp = ((int)now.areas[4].north);
#ifdef VAR_RANGES
		logval("handle1:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
S_011_0: /* 2 */
		now.areas[4].north = ((int)now.areas[4].west);
#ifdef VAR_RANGES
		logval("areas[4].north", ((int)now.areas[4].north));
#endif
		;
S_012_0: /* 2 */
		now.areas[4].west = ((int)now.areas[4].south);
#ifdef VAR_RANGES
		logval("areas[4].west", ((int)now.areas[4].west));
#endif
		;
S_013_0: /* 2 */
		now.areas[4].south = ((int)now.areas[4].east);
#ifdef VAR_RANGES
		logval("areas[4].south", ((int)now.areas[4].south));
#endif
		;
S_014_0: /* 2 */
		now.areas[4].east = ((int)((P0 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[4].east", ((int)now.areas[4].east));
#endif
		;
S_015_0: /* 2 */
		((P0 *)this)->tmp = ((int)now.areas[5].north);
#ifdef VAR_RANGES
		logval("handle1:tmp", ((int)((P0 *)this)->tmp));
#endif
		;
S_016_0: /* 2 */
		now.areas[5].north = ((int)now.areas[5].west);
#ifdef VAR_RANGES
		logval("areas[5].north", ((int)now.areas[5].north));
#endif
		;
S_017_0: /* 2 */
		now.areas[5].west = ((int)now.areas[5].south);
#ifdef VAR_RANGES
		logval("areas[5].west", ((int)now.areas[5].west));
#endif
		;
S_018_0: /* 2 */
		now.areas[5].south = ((int)now.areas[5].east);
#ifdef VAR_RANGES
		logval("areas[5].south", ((int)now.areas[5].south));
#endif
		;
S_019_0: /* 2 */
		now.areas[5].east = ((int)((P0 *)this)->tmp);
#ifdef VAR_RANGES
		logval("areas[5].east", ((int)now.areas[5].east));
#endif
		;
		goto S_021_0;
S_021_0: /* 1 */

#if defined(C_States) && (HAS_TRACK==1)
		c_update((uchar *) &(now.c_state[0]));
#endif
		_m = 3; goto P999;

	case 47: // STATE 22 - crit.pml:48 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[0][22] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

