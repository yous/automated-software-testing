#include <stdio.h>

#define AREA_SIZE 11
#define ATTEMPT_COUNT 10

struct area {
  unsigned char north;
  unsigned char east;
  unsigned char south;
  unsigned char west;
};

struct area areas[AREA_SIZE] = {
  {0, 1, 1, 0}, // R1
  {1, 0, 0, 1}, // R2
  {1, 0, 1, 1}, // R3
  {1, 0, 1, 0}, // R4
  {0, 1, 1, 1}, // R5
  {1, 0, 0, 1}, // R6
  {0, 1, 1, 1}, // R7
  {1, 0, 0, 1}, // R8
  {0, 1, 0, 1}, // R9
  {1, 0, 1, 0}, // R10
  {1, 1, 0, 0} // R11
};

int near_areas[AREA_SIZE][4] = {
  // North East South West
  {-1, 1, 4, -1}, // R1
  {-1, 2, 5, 0}, // R2
  {-1, 3, 6, 1}, // R3
  {-1, -1, -1, 2}, // R4
  {0, 5, 8, -1}, // R5
  {1, 6, 9, 4}, // R6
  {2, -1, 10, 5}, // R7
  {-1, 8, -1, -1}, // R8
  {4, 9, -1, 7}, // R9
  {5, 10, -1, 8}, // R10
  {6, -1, -1, 9} // R11
};

void rotate(struct area *area, int clockwise) {
  unsigned char tmp;

  if (clockwise) {
    tmp = area->north;
    area->north = area->west;
    area->west = area->south;
    area->south = area->east;
    area->east = tmp;
  } else {
    tmp = area->north;
    area->north = area->east;
    area->east = area->south;
    area->south = area->west;
    area->west = tmp;
  }
}

void handle1() {
  rotate(&areas[0], 1);
  rotate(&areas[1], 1);
  rotate(&areas[4], 1);
  rotate(&areas[5], 1);
}

void handle2() {
  rotate(&areas[1], 1);
  rotate(&areas[2], 1);
  rotate(&areas[3], 1);
  rotate(&areas[5], 1);
  rotate(&areas[6], 1);
}

void handle3() {
  rotate(&areas[4], 1);
  rotate(&areas[5], 1);
  rotate(&areas[7], 1);
  rotate(&areas[8], 1);
  rotate(&areas[9], 1);
}

void handle4() {
  rotate(&areas[5], 0);
  rotate(&areas[6], 1);
  rotate(&areas[9], 0);
  rotate(&areas[10], 1);
}

void verify() {
  int filled[AREA_SIZE] = {0, };
  int filled_copy[AREA_SIZE] = {0, };
  int i, j;
  int changed = 0;
  int next_area;

  if (areas[3].east) {
    filled[3] = 1;
    changed = 1;
  }
  for (i = 0; i < AREA_SIZE; i++) {
    filled_copy[i] = filled[i];
  }

  while (changed) {
    for (i = 0; i < AREA_SIZE; i++) {
      if (filled[i]) {
        next_area = near_areas[i][0];
        if (next_area >= 0) {
          filled[next_area] |= areas[i].north && areas[next_area].south;
        }
        next_area = near_areas[i][1];
        if (next_area >= 0) {
          filled[next_area] |= areas[i].east && areas[next_area].west;
        }
        next_area = near_areas[i][2];
        if (next_area >= 0) {
          filled[next_area] |= areas[i].south && areas[next_area].north;
        }
        next_area = near_areas[i][3];
        if (next_area >= 0) {
          filled[next_area] |= areas[i].west && areas[next_area].east;
        }
      }
    }

    changed = 0;
    for (i = 0; i < AREA_SIZE; i++) {
      if (filled_copy[i] != filled[i]) {
        changed = 1;
      }
      filled_copy[i] = filled[i];
    }
  }

  assert(!filled[7] || !areas[7].south);
}

int main() {
  int handle;
  int i;

  for (i = 0; i < ATTEMPT_COUNT; i++) {
    handle = nondet_int();
    __CPROVER_assume(1 <= handle && handle <= 4);

    switch (handle) {
      case 1:
        handle1();
        break;
      case 2:
        handle2();
        break;
      case 3:
        handle3();
        break;
      case 4:
        handle4();
        break;
    }
    verify();
  }

  return 0;
}
