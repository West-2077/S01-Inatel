using System;


public class MembroDaSociedade
{
    private string nome;
    private string raca;
    private string func;

    public MembroDaSociedade(string nome, string raca, string func)
    {
        this.nome = nome;
        this.raca = raca;
        this.func = func;
    }
    
    public void apresentar()
    {
        Console.WriteLine($"Nome: {nome}");
        Console.WriteLine($"Raça: {raca}");
        Console.WriteLine($"função: {func}");
        Console.WriteLine("__________________");
    }

}

class Program
{
    static void Main(string[] args)
    {
        MembroDaSociedade aragon = new MembroDaSociedade("Aragon", "Humano", "Guardião");
        MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

        aragon.apresentar();
        legolas.apresentar();

        Console.WriteLine("\n=== Fim da Demonstração ==="); 
    }

}

