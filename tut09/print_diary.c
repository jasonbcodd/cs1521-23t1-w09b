#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

    char *home_path = getenv("HOME");

    if (home_path == NULL) {
        perror("no home");
        return 1;
    }

    int home_path_length = strlen(home_path);

    printf("%d\n", home_path_length);

    char *diary_file_path = malloc(sizeof(char) * (home_path_length + 1 + 6 + 1));

    strncpy(diary_file_path, home_path, home_path_length);
    strncat(diary_file_path, "/.diary", 1 + 6);

    snprintf(diary_file_path, (home_path_length + 1 + 6 + 1), "%s/.diary", home_path);


    FILE *f = fopen(diary_file_path, "r");

    if (f == NULL) {
        perror(diary_file_path);
        return 1;
    }

    int c;

    while ((c = fgetc(f)) != -1) {
        fputc(c, stdout);
    }

    fclose(f);

    return 0;
}