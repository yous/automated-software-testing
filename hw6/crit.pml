#define AREA_SIZE 11

typedef area {
  bit north;
  bit east;
  bit south;
  bit west;
};
typedef near_area {
  int north;
  int east;
  int south;
  int west;
};
area areas[AREA_SIZE];
near_area near_areas[AREA_SIZE];
bool init_lock = true;
bool area_lock;

proctype handle1() {
  bit tmp;

  d_step {
    tmp = areas[0].north;
    areas[0].north = areas[0].west;
    areas[0].west = areas[0].south;
    areas[0].south = areas[0].east;
    areas[0].east = tmp;

    tmp = areas[1].north;
    areas[1].north = areas[1].west;
    areas[1].west = areas[1].south;
    areas[1].south = areas[1].east;
    areas[1].east = tmp;

    tmp = areas[4].north;
    areas[4].north = areas[4].west;
    areas[4].west = areas[4].south;
    areas[4].south = areas[4].east;
    areas[4].east = tmp;

    tmp = areas[5].north;
    areas[5].north = areas[5].west;
    areas[5].west = areas[5].south;
    areas[5].south = areas[5].east;
    areas[5].east = tmp;
  }
}

proctype handle2() {
  bit tmp;

  d_step {
    tmp = areas[1].north;
    areas[1].north = areas[1].west;
    areas[1].west = areas[1].south;
    areas[1].south = areas[1].east;
    areas[1].east = tmp;

    tmp = areas[2].north;
    areas[2].north = areas[2].west;
    areas[2].west = areas[2].south;
    areas[2].south = areas[2].east;
    areas[2].east = tmp;

    tmp = areas[3].north;
    areas[3].north = areas[3].west;
    areas[3].west = areas[3].south;
    areas[3].south = areas[3].east;
    areas[3].east = tmp;

    tmp = areas[5].north;
    areas[5].north = areas[5].west;
    areas[5].west = areas[5].south;
    areas[5].south = areas[5].east;
    areas[5].east = tmp;

    tmp = areas[6].north;
    areas[6].north = areas[6].west;
    areas[6].west = areas[6].south;
    areas[6].south = areas[6].east;
    areas[6].east = tmp;
  }
}

proctype handle3() {
  bit tmp;

  d_step {
    tmp = areas[4].north;
    areas[4].north = areas[4].west;
    areas[4].west = areas[4].south;
    areas[4].south = areas[4].east;
    areas[4].east = tmp;

    tmp = areas[5].north;
    areas[5].north = areas[5].west;
    areas[5].west = areas[5].south;
    areas[5].south = areas[5].east;
    areas[5].east = tmp;

    tmp = areas[7].north;
    areas[7].north = areas[7].west;
    areas[7].west = areas[7].south;
    areas[7].south = areas[7].east;
    areas[7].east = tmp;

    tmp = areas[8].north;
    areas[8].north = areas[8].west;
    areas[8].west = areas[8].south;
    areas[8].south = areas[8].east;
    areas[8].east = tmp;

    tmp = areas[9].north;
    areas[9].north = areas[9].west;
    areas[9].west = areas[9].south;
    areas[9].south = areas[9].east;
    areas[9].east = tmp;
  }
}

proctype handle4() {
  bit tmp;

  d_step {
    tmp = areas[5].north;
    areas[5].north = areas[5].east;
    areas[5].east = areas[5].south;
    areas[5].south = areas[5].west;
    areas[5].west = tmp;

    tmp = areas[6].north;
    areas[6].north = areas[6].west;
    areas[6].west = areas[6].south;
    areas[6].south = areas[6].east;
    areas[6].east = tmp;

    tmp = areas[9].north;
    areas[9].north = areas[9].east;
    areas[9].east = areas[9].south;
    areas[9].south = areas[9].west;
    areas[9].west = tmp;

    tmp = areas[10].north;
    areas[10].north = areas[10].west;
    areas[10].west = areas[10].south;
    areas[10].south = areas[10].east;
    areas[10].east = tmp;
  }
}

active proctype invariant() {
  bool filled[AREA_SIZE];
  bool filled_copy[AREA_SIZE];
  byte i, j;
  bool changed = false;
  int next_area;

  !init_lock ->

  atomic { !area_lock -> area_lock = true; };

  atomic {
    if
    :: areas[3].east == 1 ->
      filled[3] = true;
      changed = true;
    :: else;
    fi
    i = 0;
    do
    :: i < AREA_SIZE ->
      filled_copy[i] = filled[i];
      i++;
    :: else -> break;
    od

    do
    :: changed ->
      i = 0;
      do
      :: i < AREA_SIZE ->
        if
        :: filled[i] ->
          next_area = near_areas[i].north;
          if
          :: next_area >= 0 && !filled[next_area] ->
            filled[next_area] = areas[i].north == 1 && areas[next_area].south == 1;
          :: else;
          fi

          next_area = near_areas[i].east;
          if
          :: next_area >= 0 && !filled[next_area] ->
            filled[next_area] = areas[i].east == 1 && areas[next_area].west == 1;
          :: else;
          fi

          next_area = near_areas[i].south;
          if
          :: next_area >= 0 && !filled[next_area] ->
            filled[next_area] = areas[i].south == 1 && areas[next_area].north == 1;
          :: else;
          fi

          next_area = near_areas[i].west;
          if
          :: next_area >= 0 && !filled[next_area] ->
            filled[next_area] = areas[i].west == 1 && areas[next_area].east == 1;
          :: else;
          fi
        :: else;
        fi
        i++;
      :: else -> break;
      od

      changed = false;
      i = 0;
      do
      :: i < AREA_SIZE ->
        if
        :: filled_copy[i] != filled[i] -> changed = true;
        :: else;
        fi
        filled_copy[i] = filled[i];
        i++;
      :: else -> break;
      od
    :: else -> break;
    od

    assert(!filled[7] || areas[7].south == 0);
  }
  area_lock = false;
}

init {
  d_step {
    areas[0].north = 0; areas[0].east = 1; areas[0].south = 1; areas[0].west = 0;
    areas[1].north = 1; areas[1].east = 0; areas[1].south = 0; areas[1].west = 1;
    areas[2].north = 1; areas[2].east = 0; areas[2].south = 1; areas[2].west = 1;
    areas[3].north = 1; areas[3].east = 0; areas[3].south = 1; areas[3].west = 0;
    areas[4].north = 0; areas[4].east = 1; areas[4].south = 1; areas[4].west = 1;
    areas[5].north = 1; areas[5].east = 0; areas[5].south = 0; areas[5].west = 1;
    areas[6].north = 0; areas[6].east = 1; areas[6].south = 1; areas[6].west = 1;
    areas[7].north = 1; areas[7].east = 0; areas[7].south = 0; areas[7].west = 1;
    areas[8].north = 0; areas[8].east = 1; areas[8].south = 0; areas[8].west = 1;
    areas[9].north = 1; areas[9].east = 0; areas[9].south = 1; areas[9].west = 0;
    areas[10].north = 1; areas[10].east = 1; areas[10].south = 0; areas[10].west = 0;

    near_areas[0].north = -1; near_areas[0].east = 1; near_areas[0].south = 4; near_areas[0].west = -1;
    near_areas[1].north = -1; near_areas[1].east = 2; near_areas[1].south = 5; near_areas[1].west = 0;
    near_areas[2].north = -1; near_areas[2].east = 3; near_areas[2].south = 6; near_areas[2].west = 1;
    near_areas[3].north = -1; near_areas[3].east = -1; near_areas[3].south = -1; near_areas[3].west = 2;
    near_areas[4].north = 0; near_areas[4].east = 5; near_areas[4].south = 8; near_areas[4].west = -1;
    near_areas[5].north = 1; near_areas[5].east = 6; near_areas[5].south = 9; near_areas[5].west = 4;
    near_areas[6].north = 2; near_areas[6].east = -1; near_areas[6].south = 10; near_areas[6].west = 5;
    near_areas[7].north = -1; near_areas[7].east = 8; near_areas[7].south = -1; near_areas[7].west = -1;
    near_areas[8].north = 4; near_areas[8].east = 9; near_areas[8].south = -1; near_areas[8].west = 7;
    near_areas[9].north = 5; near_areas[9].east = 10; near_areas[9].south = -1; near_areas[9].west = 8;
    near_areas[10].north = 6; near_areas[10].east = -1; near_areas[10].south = -1; near_areas[10].west = 9;

    init_lock = false;
  }

  run handle1();
  run handle1();
  run handle1();
  run handle2();
  run handle2();
  run handle2();
  run handle3();
  run handle3();
  run handle3();
  run handle4();
  run handle4();
  run handle4();
}
