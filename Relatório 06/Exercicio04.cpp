#include <iostream>
#include <string>
#include <list>
using namespace std;

class SerVivo {
protected:
string Nome;

public:

    SerVivo(string n)
    {
        Nome = n;
    }

   virtual void apresentar()
    {
        cout << "Mas que diabos e voce !?" << endl;
    }

};

class Humano : public SerVivo {
public:
    Humano(string n) : SerVivo(n){}

    void apresentar () override {
        cout << "Eai mano beleza... Partiu um foot?" << endl;
    }

};

class Elfo : public SerVivo {
    public:
    Elfo(string n) : SerVivo(n){}

    void apresentar () override {
        cout << "Saudacoes meu nobre senhor" << endl;
    }
};

class Fada : public SerVivo {
    public:
    Fada(string n) : SerVivo(n){}

    void apresentar () override {
        cout << "Saudacoes pequeno ser da floresta" << endl;
    }
};

int main() 
{
    list<SerVivo*> seres;

    seres.push_back(new Humano("Arthur"));
    seres.push_back(new Elfo("Legolas"));
    seres.push_back(new Fada("Tinkerbell"));
    seres.push_back(new SerVivo("Coisa"));

    for (SerVivo* v : seres) {
        v->apresentar();
    }

    for (SerVivo* v : seres) {
        delete v;
    }

    return 0;
}
