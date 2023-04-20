#include <stdlib.h>
#include <stdio.h>
#include <sys/stat.h>

int main(int argc, char **argv) {
    if (argc < 2) {
        fprintf(stderr, "%s\n", "please provide at least one file name");
        return 1;
    }

    for (int i = 1; i < argc; i++) {
        char *file_name = argv[i];

        struct stat s;

        if (stat(file_name, &s) < 0) {
            perror(file_name);
            return 1;
        }

        if ((s.st_mode & S_IWOTH) != 0) {

            mode_t new_mode = s.st_mode;
            new_mode &= ~S_IWOTH;

            if (chmod(file_name, new_mode) < 0) {
                perror(file_name);
                return 1;
            }
        }
    }

    return 0;
}