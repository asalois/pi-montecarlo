#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define NUM_POINTS 1000000000

int main() {
    srand(time(NULL)); // seed the random number generator
    int insideCircle = 0;
    for (int i = 0; i < NUM_POINTS; i++) {
        double x = (double)rand() / RAND_MAX;
        double y = (double)rand() / RAND_MAX;
        if (x*x + y*y <= 1.0) {
          insideCircle++;
        }
    }
    double piEstimate = 4.0 * insideCircle / NUM_POINTS;
    printf("Pi is approximately: %.4f\n", piEstimate);
    return 0;
}

