#include <stdio.h>

void run_function(int x) {
    // conditional - for test coverage
    if (x > 5) {
        printf("gt 5");
    }
    else {
        printf("lteq 5");
    }
}


int main() {
    run_function(3);
    printf("ok.");
    return 0;
}
