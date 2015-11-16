/* Example code */
#include <stdio.h>

#define MAX 16
#define H_SIZE 10
#define parent(i) (i / 2)
#define left(i) (2 * i)
#define right(i) (2 * i + 1)

/* Ignore the first 0, since max heap contents start at index 1 */
int a[MAX] = {0, 16, 4, 10, 14, 7, 9, 3, 2, 8, 1, };

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

int main() {
  int i;
  max_heapify(a, 2, H_SIZE);
  for (i = 1; i <= H_SIZE; i++) {
    printf("%d ", a[i]);
  }
  return 0;
} /* Output: 16 14 10 8 7 9 3 2 4 1 */
