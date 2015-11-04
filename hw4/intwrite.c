#include <stdio.h>
#include <stdlib.h>

FILE * fp ;

extern void _final_() {
	fclose(fp) ;
}

extern void _init_() {
	fp = fopen("log", "w") ;
	atexit(_final_) ;
}

extern void _probe_(int line, char *var, int val) {
	fprintf(fp, "Line %d: Variable %s <- %d\n", line, var, val) ;
}
