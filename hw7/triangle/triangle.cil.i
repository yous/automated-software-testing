# 1 "./triangle.cil.c"
# 1 "/CS453/cs453_20110615/automated-software-testing/hw7//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "./triangle.cil.c"



void __globinit_triangle(void) ;
extern void __CrestInit(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestHandleReturn(int id , int type , long long val , double fp_val ) __attribute__((__crest_skip__)) ;
extern void __CrestReturn(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestCall(int id , unsigned int fid ) __attribute__((__crest_skip__)) ;
extern void __CrestBranch(int id , int bid , unsigned char b ) __attribute__((__crest_skip__)) ;
extern void __CrestApply2(int id , int op , int type , long long val , double fp_val ) __attribute__((__crest_skip__)) ;
extern void __CrestApply1(int id , int op , int type , long long val , double fp_val ) __attribute__((__crest_skip__)) ;
extern void __CrestClearStack(int id ) __attribute__((__crest_skip__)) ;
extern void __CrestStore(int id , unsigned long addr ) __attribute__((__crest_skip__)) ;
extern void __CrestLoad(int id , unsigned long addr , int type , long long val , double fp_val ) __attribute__((__crest_skip__)) ;
extern __attribute__((__nothrow__, __noreturn__)) void exit(int __status ) ;
extern void __CrestInt(int *x ) __attribute__((__crest_skip__)) ;
extern int ( printf)() ;
int main(void)
{
  int a ;
  int b ;
  int c ;
  int match ;
  int result ;
  int __retres6 ;

  {
  __globinit_triangle();
  __CrestCall(1, 1);
  __CrestLoad(2, (unsigned long )0, 5, (long long )0, (double )0);
  __CrestStore(3, (unsigned long )(& match));
  match = 0;
  __CrestInt(& a);
  __CrestInt(& b);
  __CrestInt(& c);
  __CrestLoad(6, (unsigned long )(& a), 5, (long long )a, (double )a);
  __CrestLoad(5, (unsigned long )0, 5, (long long )0, (double )0);
  __CrestApply2(4, 18, 5, (long long )(a <= 0), (double )(a <= 0));
  if (a <= 0) {
    __CrestBranch(7, 3, 1);
    __CrestLoad(9, (unsigned long )0, 5, (long long )1, (double )1);
    exit(1);
    __CrestClearStack(10);
  } else {
    __CrestBranch(8, 4, 0);
    {
    __CrestLoad(13, (unsigned long )(& b), 5, (long long )b, (double )b);
    __CrestLoad(12, (unsigned long )0, 5, (long long )0, (double )0);
    __CrestApply2(11, 18, 5, (long long )(b <= 0), (double )(b <= 0));
    if (b <= 0) {
      __CrestBranch(14, 5, 1);
      __CrestLoad(16, (unsigned long )0, 5, (long long )1, (double )1);
      exit(1);
      __CrestClearStack(17);
    } else {
      __CrestBranch(15, 6, 0);
      {
      __CrestLoad(20, (unsigned long )(& c), 5, (long long )c, (double )c);
      __CrestLoad(19, (unsigned long )0, 5, (long long )0, (double )0);
      __CrestApply2(18, 18, 5, (long long )(c <= 0), (double )(c <= 0));
      if (c <= 0) {
        __CrestBranch(21, 7, 1);
        __CrestLoad(23, (unsigned long )0, 5, (long long )1, (double )1);
        exit(1);
        __CrestClearStack(24);
      } else {
        __CrestBranch(22, 8, 0);

      }
      }
    }
    }
  }
  __CrestLoad(25, (unsigned long )0, 6, (long long )"a, b, c = %d, %d, %d: ", 4);
  __CrestLoad(26, (unsigned long )(& a), 5, (long long )a, (double )a);
  __CrestLoad(27, (unsigned long )(& b), 5, (long long )b, (double )b);
  __CrestLoad(28, (unsigned long )(& c), 5, (long long )c, (double )c);
  printf("a, b, c = %d, %d, %d: ", a, b, c);
  __CrestClearStack(29);
  __CrestLoad(30, (unsigned long )0, 5, (long long )-1, (double )-1);
  __CrestStore(31, (unsigned long )(& result));
  result = -1;
  __CrestLoad(34, (unsigned long )(& a), 5, (long long )a, (double )a);
  __CrestLoad(33, (unsigned long )(& b), 5, (long long )b, (double )b);
  __CrestApply2(32, 13, 5, (long long )(a == b), (double )(a == b));
  if (a == b) {
    __CrestBranch(35, 11, 1);
    __CrestLoad(39, (unsigned long )(& match), 5, (long long )match, (double )match);
    __CrestLoad(38, (unsigned long )0, 5, (long long )1, (double )1);
    __CrestApply2(37, 0, 5, (long long )(match + 1), (double )(match + 1));
    __CrestStore(40, (unsigned long )(& match));
    match ++;
  } else {
    __CrestBranch(36, 12, 0);

  }
  __CrestLoad(43, (unsigned long )(& a), 5, (long long )a, (double )a);
  __CrestLoad(42, (unsigned long )(& c), 5, (long long )c, (double )c);
  __CrestApply2(41, 13, 5, (long long )(a == c), (double )(a == c));
  if (a == c) {
    __CrestBranch(44, 14, 1);
    __CrestLoad(48, (unsigned long )(& match), 5, (long long )match, (double )match);
    __CrestLoad(47, (unsigned long )0, 5, (long long )2, (double )2);
    __CrestApply2(46, 0, 5, (long long )(match + 2), (double )(match + 2));
    __CrestStore(49, (unsigned long )(& match));
    match += 2;
  } else {
    __CrestBranch(45, 15, 0);

  }
  __CrestLoad(52, (unsigned long )(& b), 5, (long long )b, (double )b);
  __CrestLoad(51, (unsigned long )(& c), 5, (long long )c, (double )c);
  __CrestApply2(50, 13, 5, (long long )(b == c), (double )(b == c));
  if (b == c) {
    __CrestBranch(53, 17, 1);
    __CrestLoad(57, (unsigned long )(& match), 5, (long long )match, (double )match);
    __CrestLoad(56, (unsigned long )0, 5, (long long )3, (double )3);
    __CrestApply2(55, 0, 5, (long long )(match + 3), (double )(match + 3));
    __CrestStore(58, (unsigned long )(& match));
    match += 3;
  } else {
    __CrestBranch(54, 18, 0);

  }
  __CrestLoad(61, (unsigned long )(& match), 5, (long long )match, (double )match);
  __CrestLoad(60, (unsigned long )0, 5, (long long )0, (double )0);
  __CrestApply2(59, 13, 5, (long long )(match == 0), (double )(match == 0));
  if (match == 0) {
    __CrestBranch(62, 20, 1);
    {
    __CrestLoad(68, (unsigned long )(& a), 5, (long long )a, (double )a);
    __CrestLoad(67, (unsigned long )(& b), 5, (long long )b, (double )b);
    __CrestApply2(66, 0, 5, (long long )(a + b), (double )(a + b));
    __CrestLoad(65, (unsigned long )(& c), 5, (long long )c, (double )c);
    __CrestApply2(64, 18, 5, (long long )(a + b <= c), (double )(a + b <= c));
    if (a + b <= c) {
      __CrestBranch(69, 21, 1);
      __CrestLoad(71, (unsigned long )0, 5, (long long )2, (double )2);
      __CrestStore(72, (unsigned long )(& result));
      result = 2;
    } else {
      __CrestBranch(70, 22, 0);
      {
      __CrestLoad(77, (unsigned long )(& b), 5, (long long )b, (double )b);
      __CrestLoad(76, (unsigned long )(& c), 5, (long long )c, (double )c);
      __CrestApply2(75, 0, 5, (long long )(b + c), (double )(b + c));
      __CrestLoad(74, (unsigned long )(& a), 5, (long long )a, (double )a);
      __CrestApply2(73, 18, 5, (long long )(b + c <= a), (double )(b + c <= a));
      if (b + c <= a) {
        __CrestBranch(78, 23, 1);
        __CrestLoad(80, (unsigned long )0, 5, (long long )2, (double )2);
        __CrestStore(81, (unsigned long )(& result));
        result = 2;
      } else {
        __CrestBranch(79, 24, 0);
        __CrestLoad(82, (unsigned long )0, 5, (long long )3, (double )3);
        __CrestStore(83, (unsigned long )(& result));
        result = 3;
      }
      }
    }
    }
  } else {
    __CrestBranch(63, 25, 0);
    {
    __CrestLoad(86, (unsigned long )(& match), 5, (long long )match, (double )match);
    __CrestLoad(85, (unsigned long )0, 5, (long long )1, (double )1);
    __CrestApply2(84, 13, 5, (long long )(match == 1), (double )(match == 1));
    if (match == 1) {
      __CrestBranch(87, 26, 1);
      {
      __CrestLoad(93, (unsigned long )(& a), 5, (long long )a, (double )a);
      __CrestLoad(92, (unsigned long )(& b), 5, (long long )b, (double )b);
      __CrestApply2(91, 0, 5, (long long )(a + b), (double )(a + b));
      __CrestLoad(90, (unsigned long )(& c), 5, (long long )c, (double )c);
      __CrestApply2(89, 18, 5, (long long )(a + b <= c), (double )(a + b <= c));
      if (a + b <= c) {
        __CrestBranch(94, 27, 1);
        __CrestLoad(96, (unsigned long )0, 5, (long long )2, (double )2);
        __CrestStore(97, (unsigned long )(& result));
        result = 2;
      } else {
        __CrestBranch(95, 28, 0);
        __CrestLoad(98, (unsigned long )0, 5, (long long )1, (double )1);
        __CrestStore(99, (unsigned long )(& result));
        result = 1;
      }
      }
    } else {
      __CrestBranch(88, 29, 0);
      {
      __CrestLoad(102, (unsigned long )(& match), 5, (long long )match, (double )match);
      __CrestLoad(101, (unsigned long )0, 5, (long long )2, (double )2);
      __CrestApply2(100, 13, 5, (long long )(match == 2), (double )(match == 2));
      if (match == 2) {
        __CrestBranch(103, 30, 1);
        {
        __CrestLoad(109, (unsigned long )(& a), 5, (long long )a, (double )a);
        __CrestLoad(108, (unsigned long )(& c), 5, (long long )c, (double )c);
        __CrestApply2(107, 0, 5, (long long )(a + c), (double )(a + c));
        __CrestLoad(106, (unsigned long )(& b), 5, (long long )b, (double )b);
        __CrestApply2(105, 18, 5, (long long )(a + c <= b), (double )(a + c <= b));
        if (a + c <= b) {
          __CrestBranch(110, 31, 1);
          __CrestLoad(112, (unsigned long )0, 5, (long long )2, (double )2);
          __CrestStore(113, (unsigned long )(& result));
          result = 2;
        } else {
          __CrestBranch(111, 32, 0);
          __CrestLoad(114, (unsigned long )0, 5, (long long )1, (double )1);
          __CrestStore(115, (unsigned long )(& result));
          result = 1;
        }
        }
      } else {
        __CrestBranch(104, 33, 0);
        {
        __CrestLoad(118, (unsigned long )(& match), 5, (long long )match, (double )match);
        __CrestLoad(117, (unsigned long )0, 5, (long long )3, (double )3);
        __CrestApply2(116, 13, 5, (long long )(match == 3), (double )(match == 3));
        if (match == 3) {
          __CrestBranch(119, 34, 1);
          {
          __CrestLoad(125, (unsigned long )(& b), 5, (long long )b, (double )b);
          __CrestLoad(124, (unsigned long )(& c), 5, (long long )c, (double )c);
          __CrestApply2(123, 0, 5, (long long )(b + c), (double )(b + c));
          __CrestLoad(122, (unsigned long )(& a), 5, (long long )a, (double )a);
          __CrestApply2(121, 18, 5, (long long )(b + c <= a), (double )(b + c <= a));
          if (b + c <= a) {
            __CrestBranch(126, 35, 1);
            __CrestLoad(128, (unsigned long )0, 5, (long long )2, (double )2);
            __CrestStore(129, (unsigned long )(& result));
            result = 2;
          } else {
            __CrestBranch(127, 36, 0);
            __CrestLoad(130, (unsigned long )0, 5, (long long )1, (double )1);
            __CrestStore(131, (unsigned long )(& result));
            result = 1;
          }
          }
        } else {
          __CrestBranch(120, 37, 0);
          __CrestLoad(132, (unsigned long )0, 5, (long long )0, (double )0);
          __CrestStore(133, (unsigned long )(& result));
          result = 0;
        }
        }
      }
      }
    }
    }
  }
  __CrestLoad(134, (unsigned long )0, 6, (long long )"result = %d\n", 4);
  __CrestLoad(135, (unsigned long )(& result), 5, (long long )result, (double )result);
  printf("result = %d\n", result);
  __CrestClearStack(136);
  __CrestLoad(137, (unsigned long )0, 5, (long long )0, (double )0);
  __CrestStore(138, (unsigned long )(& __retres6));
  __retres6 = 0;
  __CrestLoad(139, (unsigned long )(& __retres6), 5, (long long )__retres6, (double )__retres6);
  __CrestReturn(140);
  return (__retres6);
}
}
void __globinit_triangle(void)
{


  {
  __CrestInit(141);
}
}
