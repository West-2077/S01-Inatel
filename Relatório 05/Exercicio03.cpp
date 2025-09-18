#include<iostream>
using namespace std;


int main()
{
	float nota;
	int t;
	float soma = 0;
	int i = 0;

	//definir o tamanho 
	cout << "Digite quantas notas deseja inserir: ";
	cin >> t;

	while(i < t) //while que fica em loop pelo tamanho de notas que a pessoa desejou inserir
	{
		cout << "Digite a nota entre 0 a 10: ";
		cin >> nota;
		if(nota > 0 && nota < 10)
		{
			soma += nota; // soma total das notas 
			i++; // ingremento
		}
		else // caso a nota nao fique entre 0 e 10
			cout << "nota invalida" << endl; 
	}

	soma /= t; // media das notas

	if(soma >= 7 ) // caso a media for maior que sete ele e aprovado
		cout << "O aluno(a) foi aprovado" << endl;

	else // caso a media for menor que sete ele e reprovado
		cout << "O aluno(a) foi reprovado" << endl;

	return 0;
}
