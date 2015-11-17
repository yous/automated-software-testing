#include <stdio.h>

/* The size of x[] is 8 */
#define MAX 8
#define parent(i) (i / 2)
#define left(i) (2 * i)
#define right(i) (2 * i + 1)

/* Ignore the first 0, since max heap contents start at index 1 */
int a[MAX] = {0, };

void max_heapify(int x[], int i, int h_size) {
  int largest, tmp;
  int l = left(i);
  int r = right(i);

  if (l <= h_size && x[l] > x[i]) {
    largest = l;
  } else {
    largest = i;
  }
  if (r <= h_size && x[r] > x[largest]) {
    largest = r;
  }
  if (largest != i) {
    tmp = x[i];
    x[i] = x[largest];
    x[largest] = tmp;
    max_heapify(x, largest, h_size);
  }
}

void max_heap_assume(int x[], int i, int h_size) {
  int l = left(i);
  int r = right(i);

  if (l <= h_size) {
    __CPROVER_assume(x[i] >= x[l]);
    max_heap_assume(x, l, h_size);
  }
  if (r <= h_size) {
    __CPROVER_assume(x[i] >= x[r]);
    max_heap_assume(x, r, h_size);
  }
}

void max_heap_verify(int x[], int i, int h_size) {
  int l = left(i);
  int r = right(i);

  if (l <= h_size) {
    /* The shape property */
    assert(x[l] > 0);
    /* The max-heap property */
    assert(x[i] >= x[l]);

    max_heap_verify(x, l, h_size);
  }
  if (r <= h_size) {
    /* The shape property */
    assert(x[r] > 0);
    /* The max-heap property */
    assert(x[i] >= x[r]);

    max_heap_verify(x, r, h_size);
  }
}

void max_heapify_verify(int x[], int i, int h_size) {
  int l = left(i);
  int r = right(i);

  /* The right and left sub-trees of node i are max heaps, but that x[i] may be
     smaller than its children */
  max_heap_assume(x, left(i), h_size);
  max_heap_assume(x, right(i), h_size);

  max_heapify(x, i, h_size);

  /* Verify two constraints of max heap */
  max_heap_verify(x, 1, h_size);
}

int main() {
  int i, j;
  int h_size;

  i = nondet_int();
  __CPROVER_assume(1 <= i && i < MAX);

  h_size = nondet_int();
  __CPROVER_assume(1 <= h_size && h_size < MAX);

  for (j = 1; j <= h_size; j++) {
    a[j] = nondet_int();
    __CPROVER_assume(a[j] > 0);
  }

  max_heapify_verify(a, i, h_size);

  return 0;
}
