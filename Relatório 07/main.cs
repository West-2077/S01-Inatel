using System;
using System.Collections.Generic;


public class Pokemon
{
    public string nome { get; set; }

    public Pokemon(string nome)
    {
        this.nome = nome;
    }

    public virtual void ataque()
    {
        Console.WriteLine($"{nome} preparando seu ataque...");
        Console.WriteLine("______________________");
    }


}

public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome){}

    public override void ataque()
    {
        base.ataque();
        Console.WriteLine($"{nome} usa o  ataque Fire Blast...\n Foi pouco efetivo");
        Console.WriteLine("______________________");
    }
}

public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome){}
    public override void ataque()
    {
        base.ataque();
        Console.WriteLine($"{nome} usa o ataque Hydro Pump...\n Foi super efetivo");
        Console.WriteLine("______________________");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        PokemonDeFogo charlizard = new PokemonDeFogo("Charizard");
        PokemonDeAgua blastoize = new PokemonDeAgua("Blastoise");

        List<Pokemon> ataques = new List<Pokemon>();
        ataques.Add(charlizard);
        ataques.Add(blastoize);

        foreach (Pokemon poke in ataques)
        {
            poke.ataque();
        }
        Console.WriteLine("\n=== Fim da batalha! ===");
    }
}