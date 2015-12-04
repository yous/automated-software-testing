	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */
	case 3: // STATE 90
		sv_restor();
		goto R999;

	case 4: // STATE 91
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 92
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 6: // STATE 93
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 7: // STATE 94
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 8: // STATE 95
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 9: // STATE 96
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 10: // STATE 97
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 11: // STATE 98
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 12: // STATE 99
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 13: // STATE 100
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 14: // STATE 101
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 15: // STATE 102
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 16: // STATE 103
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC invariant */
;
		;
		
	case 18: // STATE 3
		;
		now.area_lock = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 11
		;
		((P4 *)this)->i = trpt->bup.ovals[2];
		((P4 *)this)->changed = trpt->bup.ovals[1];
		((P4 *)this)->filled[3] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 20: // STATE 11
		;
		((P4 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 21: // STATE 14
		;
		((P4 *)this)->i = trpt->bup.ovals[1];
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 22: // STATE 21
		;
		((P4 *)this)->i = trpt->bup.ovals[1];
	/* 0 */	((P4 *)this)->changed = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 24: // STATE 24
		;
		((P4 *)this)->next_area = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 30
		;
		((P4 *)this)->next_area = trpt->bup.ovals[1];
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 26: // STATE 30
		;
		((P4 *)this)->next_area = trpt->bup.oval;
		;
		goto R999;

	case 27: // STATE 36
		;
		((P4 *)this)->next_area = trpt->bup.ovals[1];
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 28: // STATE 36
		;
		((P4 *)this)->next_area = trpt->bup.oval;
		;
		goto R999;

	case 29: // STATE 42
		;
		((P4 *)this)->next_area = trpt->bup.ovals[1];
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 30: // STATE 42
		;
		((P4 *)this)->next_area = trpt->bup.oval;
		;
		goto R999;

	case 31: // STATE 51
		;
		((P4 *)this)->i = trpt->bup.ovals[1];
		((P4 *)this)->filled[ Index(((P4 *)this)->next_area, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 32: // STATE 51
		;
		((P4 *)this)->i = trpt->bup.oval;
		;
		goto R999;

	case 33: // STATE 58
		;
		((P4 *)this)->i = trpt->bup.ovals[1];
		((P4 *)this)->changed = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 35: // STATE 66
		;
		((P4 *)this)->i = trpt->bup.ovals[2];
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = trpt->bup.ovals[1];
		((P4 *)this)->changed = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;

	case 36: // STATE 66
		;
		((P4 *)this)->i = trpt->bup.ovals[1];
		((P4 *)this)->filled_copy[ Index(((P4 *)this)->i, 11) ] = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;
;
		;
		
	case 38: // STATE 79
		;
		now.area_lock = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 80
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC handle4 */
	case 40: // STATE 21
		sv_restor();
		goto R999;

	case 41: // STATE 22
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC handle3 */
	case 42: // STATE 26
		sv_restor();
		goto R999;

	case 43: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC handle2 */
	case 44: // STATE 26
		sv_restor();
		goto R999;

	case 45: // STATE 27
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC handle1 */
	case 46: // STATE 21
		sv_restor();
		goto R999;

	case 47: // STATE 22
		;
		p_restor(II);
		;
		;
		goto R999;
	}

