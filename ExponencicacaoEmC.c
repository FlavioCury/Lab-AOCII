#include <stdio.h>

int powerBase2(int exp, int x){

    if(exp == 0) return x;
    if(exp == 1) return x * 2;
    exp -= 1;
    return x *(2 << exp);
}

int main() {

    int x, exp;

    printf("Insira um numero: ");
    scanf("%d", &x);

    printf("Insira o valor do expoente: ");
    scanf("%d", &exp);

    printf("O resultado é: %d", powerBase2(exp, x));

    return 0;
}