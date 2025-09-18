#include<iostream>
using namespace std;

//funcao para somar o vetor
float SomaArray(float arr[], int tamanho)
{
    float soma = 0;
    //for para somar o vetor e inserir o resultado a variavel soma
    for(int i = 0;i < tamanho ; i++ )
    {
        soma += arr[i];
    }
    //retornando o resultado da soma
    return soma;
}




int main()
{
    float array[100];
    int tamanho;

    //definindo o tamanho do vetor
    cout << "defina o tamanho do vetor: ";
    cin >> tamanho;

    //rodando um for para inserir os numeros no vetor ate i chegar ao tamanho do vetor
    for(int i = 0; i < tamanho ; i++ )
    {
        cout << "insira os numeros dentro do vetor: ";
        cin >> array[i];
    }

    //resultado final da soma
    cout << "Soma total: "<<SomaArray(array, tamanho) << endl;


    return 0;
}
