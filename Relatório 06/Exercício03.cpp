#include <iostream>
#include <string>
using namespace std;

class Pessoa {
protected:
string Nome;

public:

    Pessoa(string n)
    {
        Nome = n;
    }

   virtual void apresentar()
    {
        cout << "Ola, meu nome e" << Nome << "e eu sou uma pessoa" << endl;
    }

};

class Professor : public Pessoa
{
private:
string Disciplina;

public:

    Professor(string n, string d): Pessoa(n)
    {
        Disciplina = d;
    }

    void apresentar() override
    {
        cout << "Ola,meu nome e " << Nome << " e eu sou professor de " << Disciplina << endl;
    }

};

class Aluno : public Pessoa
{
private:
    string Curso;
    int Matricula;

public:

    Aluno(string n, string c, int m): Pessoa(n)
    {
        Curso = c;
        Matricula = m;
    }

    void apresentar() override
    {
        cout << "Ola, meu nome e " << Nome << " e eu sou o aluno do curso " << Curso << endl;
    }

};



int main() 
{
    // Criando objetos
    Professor prof("Marcelo", "Paradigmas da Programaçao");
    Aluno aluno("Sebastian", "Engenharia de Software",628);

    // Ponteiros da classe base (Pessoa)
    Pessoa* p1 = &prof;
    Pessoa* p2 = &aluno;

    // Chamando o método polimórfico
    p1->apresentar();
    p2->apresentar();
    return 0;
}
