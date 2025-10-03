#include <iostream>
#include <string>
using namespace std;

class Pessoa {
private:

    int idade;
    string nome;
public:

    Pessoa(string n, int i)
    {
        nome = n;
        idade = i;
    }
    
    
    string vnome () {return nome;}
    int vidade () {return idade;}
};

class Protagonista: public Pessoa
{
private:

    int nivel;
public:
    
    Protagonista(string n,int i,int nv) : Pessoa(n,i)
    {
        nivel = nv;
    }

    int vnivel(){return nivel;}

};

class Personagem : public Pessoa
{
private:
    int rank;
public:

    Personagem(string n, int i, int r) : Pessoa(n,i)
    {
        rank = r;
    }

    int vrack() {return rank;}

};


int main() {

    Protagonista p1("Ren Amamiya",16,20);

    Personagem a1("Morgana",17,10);


    cout << "===PROTAGONISTA===" << endl;
    cout << "Nome: " << p1.vnome() << endl;
    cout << "Idade: "<< p1.vidade() << endl;
    cout << "Nivel: "<< p1.vnivel() << endl; 

    cout << endl;

    cout <<"===ALIADO===" << endl;
    cout << "Nome: " << a1.vnome() << endl;
    cout << "Idade: " << a1.vidade() << endl;
    cout << "Rank: " << a1.vrack() << endl;


    return 0;
}
