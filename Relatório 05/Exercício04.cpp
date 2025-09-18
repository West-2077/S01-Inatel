#include<iostream>
using namespace std;

// Funcao que converte Celsius para Fahrenheit
double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32.0;
}

// Funcao que converte Celsius para Kelvin
double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}


int main()
{
    int opcao;
    double celsius;

    do
    {
    	// menu para mostrar as opoes que podem acessar
         cout << "===== Conversor de Temperatura ====="<< endl;
        cout << "1. Converter Celsius para Fahrenheit" << endl;
        cout << "2. Converter Celsius para Kelvin" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        switch (opcao)
        {
        case 1: // caso queira transformar Celsius para Fahrenheit
            cout << "Digite a temperatura em Celsius: ";
            cin >> celsius;
            cout << celsiusParaFahrenheit(celsius) << endl;
            break;

        case 2: // caso queira transformar Celsius para Kelvin
            cout << "Digite a temperatura em Celsius: ";
            cin >> celsius;
            cout << celsiusParaKelvin(celsius) << endl;
        break;

        case 3: //caso queira sair do programa
             cout << "saindo" << endl;
            break; 
        
    
        default: // caso tente usar um numero fora do menu
            cout << "opcao invalida" << endl;
        }



    }while(opcao != 3);
    

    return 0;
}
