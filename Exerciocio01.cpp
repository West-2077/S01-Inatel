#include <iostream>
#include <string>
using namespace std;

class Personagem {
public:
    string Nome;
    int Nivel;
    int Dano;
    int Vida;

    Personagem(string n, int nv,int d, int v)
    {
        Nome = n;
        Nivel = nv;
        Dano = d;
        Vida = v;
    }

    void atacar(Personagem &alvo)
    {
        cout << Nome << " atacou " << alvo.Nome << " causando " << Dano << " de dano!" << endl;
        cout << endl;
        alvo.Vida -= Dano;
        if (alvo.Vida < 0) alvo.Vida = 0;
    }

    void status()
    {
        cout << "Nome: " << Nome << endl;
        cout << "Nivel: " << Nivel << endl;
        cout << "Idade: " << Dano << endl;
        cout << "Vida: " << Vida << endl;
        cout << endl;
    }
};



int main() {

    Personagem p1("Basilisco",4,12,126);

    Personagem p2(" Wyvern",5,17,144);
    
    p1.status();
    p2.status();

    p1.atacar(p2);

    p1.status();
    p2.status();

    return 0;
}
