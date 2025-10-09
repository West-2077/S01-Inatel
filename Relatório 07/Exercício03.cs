using System;
using System.Collections.Generic;

public class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        this.Nome = nome;
    }
}

public class Grimorio
{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico feitico)
    {
        feiticos.Add(feitico);
    }

    public List<Feitico> ObterFeiticos()
    {
        return feiticos;
    }
}

public class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        this.Nome = nome;
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; set; }
    public List<Ferramenta> Ferramentas { get; set; }

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio();
        this.Ferramentas = ferramentas;
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<Ferramenta> ferramentas = new List<Ferramenta>
        {
            new Ferramenta("Varinha"),
            new Ferramenta("Poção de cura"),
            new Ferramenta("Poção de força")
        };

        Maga frieren = new Maga("Frieren", ferramentas);

        frieren.Grimorio.AdicionarFeitico(new Feitico("Bola de fogo"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Cura"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Raio"));

        Console.WriteLine($"Ferramentas de {frieren.Nome}:");
        foreach (var ferramenta in frieren.Ferramentas)
        {
            Console.WriteLine($"- {ferramenta.Nome}");
        }

        Console.WriteLine($"\nFeitiços de {frieren.Nome}:");
        foreach (var feitico in frieren.Grimorio.ObterFeiticos())
        {
            Console.WriteLine($"- {feitico.Nome}");
        }
    }
}
