/* max() should return a bigger value between a and b if a != b.
   If a == b, max should return the value of b. */
int max(int a, int b) {
  int bigger = 0;
  if (a >= b + 1) {
    bigger = a;
  } else {
    bigger = b;
  }
  return bigger;
}
