#include<iostream>
using namespace std;

//funcao recursiva para mostrar a posição n que foi pedida
int fibonacci(int n)
{
    // caso a posicao desejada for a 0
    if (n == 0)
        return 0;
    // caso a posicao desejada for a 1
    else if (n == 1)
        return 1;
    // caso a posicao desejada for maior que 1
    else
        return fibonacci(n - 1) + fibonacci(n - 2); // chamada recursiva
}


int main()
{
    int n; // variavel para o fibonacci

    cout << "insira ate qual posicao quer ver de Fibonacci: ";
    cin >>  n;
    //chamando a funcao recursiva fibonacci e mostrando o resultado
    cout << "Fibonacci ( "<<n << " ) = " << fibonacci(n) << endl;
    return 0;
}