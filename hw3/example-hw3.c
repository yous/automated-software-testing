//example-hw3.c

#include <stdio.h>
#include "example-hw3.h"

#define FOO(X)					\
  do {						\
	if (X > 100)				\
		printf("foo\n");		\
	else					\
		printf("bar\n");		\
  } while (0)

int static_var = 1;

int f1(int a) {
	static_var++;
	//if-else
	if( a == 1) {
		return 2;
	} else {
		return 4;
	}
}

int main() {
	int a = 0;		
	
	//if-else if-else
	if( a==1 || a==3) {
		a =  2;
	} else if ( a == 2){
		a = 1;
	} else {
		a = 4;
	}	
	
	//for	
	for( int i = 0 ; i < 10 ; i++ ) {
		a += i;
	}
	
	//while
	while( a < 100 ) {
		a += a;
	}
	
	//do-while
	do {
		switch(a) {
			case 100: 
				a += 10;
				break;
			case 200: 
				a = a == 3 ? 1 : 2;// ?: operator 
				a += 20;
				break;
			default:
				a += 1;
		}
	} while( a == 0 );

	if ( a>1 ? a-1 :a ) {
		a=150;
	}

	switch(a) {
		case 150:
			a+=20;
			break;
		case 250:
			a+=30;
			break;
	}

	FOO(a);
	f2(a);
}

/*
$ ./PrintBranches example-hw3.c
function: f2
        If      ID: 0   Line: 4         Col: 2          Filename: ./example-hw3.h
function: f1
        If      ID: 1   Line: 19                Col: 2          Filename: example-hw3.c
function: main
        If      ID: 2   Line: 30                Col: 2          Filename: example-hw3.c
        If      ID: 3   Line: 32                Col: 9          Filename: example-hw3.c
        For     ID: 4   Line: 39                Col: 2          Filename: example-hw3.c
        While   ID: 5   Line: 44                Col: 2          Filename: example-hw3.c
        Do      ID: 6   Line: 49                Col: 2          Filename: example-hw3.c
        Case    ID: 7   Line: 51                Col: 4          Filename: example-hw3.c
        Case    ID: 8   Line: 54                Col: 4          Filename: example-hw3.c
        ?:      ID: 9   Line: 55                Col: 9          Filename: example-hw3.c
        Default ID: 10  Line: 58                Col: 4          Filename: example-hw3.c
        If      ID: 11  Line: 63                Col: 2          Filename: example-hw3.c
        ?:      ID: 12  Line: 63                Col: 7          Filename: example-hw3.c
        ImpDef. ID: 13  Line: 67                Col: 2          Filename: example-hw3.c
        Case    ID: 14  Line: 68                Col: 3          Filename: example-hw3.c
        Case    ID: 15  Line: 71                Col: 3          Filename: example-hw3.c
        Do      ID: 16  Line: 76                Col: 2          Filename: example-hw3.c
        If      ID: 17  Line: 76                Col: 2          Filename: example-hw3.c
Total number of branches: 30
*/
