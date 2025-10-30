#include <stdio.h>

int factorial(int n);   // Declaration of assembly function

int main() {
    int n;
    printf("Enter a number: ");
    scanf("%d", &n);

    if (n < 0)
        printf("Factorial not defined for negative numbers.\n");
    else
        printf("Factorial of %d = %d\n", n, factorial(n));

    return 0;
}
