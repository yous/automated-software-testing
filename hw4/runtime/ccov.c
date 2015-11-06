#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct _record_ {
  int line;
  int index;
  int true_count;
  int false_count;
  int is_switch;
};

FILE *fp;
struct _record_ **records;
int record_count;

extern void _final_() {
  int i;
  struct _record_ *record;
  int total = 0;
  int covered = 0;

  // Record coverage.
  fp = fopen("coverage", "w");
  for (i = 0; i < record_count; i++) {
    record = *(records + i);

    if (record->is_switch) {
      fprintf(fp, "%d.%d -> %d\n",
          record->line, record->index, record->true_count);
      total++;
      if (record->true_count > 0) {
        covered++;
      }
    } else {
      fprintf(fp, "%d.%d -> %d, %d\n",
              record->line, record->index,
              record->true_count, record->false_count);
      total += 2;
      if (record->true_count > 0) {
        covered++;
      }
      if (record->false_count > 0) {
        covered++;
      }
    }
  }
  fprintf(fp, "Total: %d, Covered: %d\n", total, covered);
  fclose(fp);

  // Free counter array.
  for (i = 0; i < record_count; i++) {
    free(*(records + i));
  }
  free(records);
}

extern void _init_(int count, int *lines, int *indices, int *switches) {
  int i;
  struct _record_ *record;
  char *buf;
  int assigned;

  // Initialize counter array.
  record_count = count;
  records = (struct _record_ **) malloc(sizeof(struct _record_ *) * count);
  for (i = 0; i < count; i++) {
    record = (struct _record_ *) malloc(sizeof(struct _record_));
    record->line = *(lines + i);
    record->index = *(indices + i);
    record->true_count = 0;
    record->false_count = 0;
    record->is_switch = *(switches + i);
    *(records + i) = record;
  }

  if ((fp = fopen("coverage", "r"))) {
    buf = malloc(1024);
    i = 0;
    while (fgets(buf, 1024, fp)) {
      if (*buf < 0x30 || *buf > 0x39) {
        break;
      }
      record = *(records + i);
      assigned = sscanf(buf, "%d.%d -> %d, %d",
          &record->line, &record->index,
          &record->true_count, &record->false_count);
      if (assigned < 3) {
        record->false_count = 0;
      }
      i++;
    }
    free(buf);
    fclose(fp);
  }
  atexit(_final_);
}

extern void _probe_(int index, int check) {
  struct _record_ *record;
  record = *(records + index);
  if (check) {
    record->true_count++;
  } else {
    record->false_count++;
  }
}
