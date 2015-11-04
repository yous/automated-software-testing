//example.c
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
	if( a == 1) {
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

	switch(a) {
		case 150:
			a+=20;
			break;
		case 250:
			a+=30;
			break;
	}
}

/* Branch coverage for one execution:
   --------
7.0 -> 0, 0
18.0 -> 0, 1
20.0 -> 0, 1
27.0 -> 10, 1
32.0 -> 2, 1
38.0 -> 0
38.1 -> 0
38.2 -> 1 
49.0 -> 0, 1
51.0 -> 0
51.1 -> 0
51.2 -> 1
Total: 18, Covered: 9
*/
