#include <stdio.h>
#include <pthread.h>
#include <stdatomic.h>

int total1 = 0;
int total2 = 0;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;


void *add_5000_to_counter1(void *data) {
    for (int i = 0; i < 500000; i++) {
        // sleep for 1 nanosecond
        //nanosleep (&(struct timespec){.tv_nsec = 1}, NULL);

        // increment the global total by 1
        pthread_mutex_lock(&mutex1);

        pthread_mutex_lock(&mutex2);
        total1++;
        total2++;
        pthread_mutex_unlock(&mutex2);
        pthread_mutex_unlock(&mutex1);
    }

    return NULL;
}

void *add_5000_to_counter2(void *data) {
    for (int i = 0; i < 500000; i++) {
        // sleep for 1 nanosecond
        //nanosleep (&(struct timespec){.tv_nsec = 1}, NULL);

        // increment the global total by 1
        pthread_mutex_lock(&mutex1);

        pthread_mutex_lock(&mutex2);
        total2++;
        total1++;
        pthread_mutex_unlock(&mutex1);
        pthread_mutex_unlock(&mutex2);
    }

    return NULL;
}

int main(void) {
    pthread_t thread1;
    //pthread_mutex_init(&mutex1, NULL);
    //pthread_mutex_init(&mutex2, NULL);
    pthread_create(&thread1, NULL, add_5000_to_counter1, NULL);

    pthread_t thread2;
    pthread_create(&thread2, NULL, add_5000_to_counter2, NULL);

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    // if program works correctly, should print 10000
    printf("Final total: %d\n", total1);
    printf("Final total: %d\n", total2);

    return 0;
}