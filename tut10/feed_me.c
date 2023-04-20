#include <stdio.h>

#include <pthread.h>
#include <stdbool.h>
#include <libc.h>

void *thread_fn(void *data) {
    while (true) {
        printf("feed me input!\n");
        sleep(1);
    }

    return NULL;
}


int main() {
    pthread_t thread;
    pthread_create(&thread, NULL, thread_fn, NULL);

    char buf[512];
    while (fgets(buf, 512, stdin) != NULL) {
        printf("you entered: %s", buf);
    }

    pthread_cancel(thread);
    return 0;
}