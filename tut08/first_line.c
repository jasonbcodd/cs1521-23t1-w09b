#include <stdio.h>
#include <stdlib.h>
#include <errno.h>


int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "%s\n", "Invalid command line arguments");
        return 1;
    }

    char *fileName = argv[1];

    FILE *f = fopen(fileName, "r");
    if (f == NULL) {
        perror("");
        return 1;
    }

    int c;

    while ((c = fgetc(f)) != EOF) {
        fputc(c, stdout);

        if (c == '\n') {
            break;
        }
    }

    fclose(f);
    return 0;
}
