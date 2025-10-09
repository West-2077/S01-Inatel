using System;

public abstract class MonstroSombrio
{
    public string Nome { get; set; }

    public MonstroSombrio(string nome)
    {
        Nome = nome;
    }

    public virtual void Mover()
    {
        Console.WriteLine($"{Nome} se move silenciosamente...");
    }
}

public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} anda lentamente em sua direção...");
    }
}

public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome) { }

    public override void Mover()
    {
        Console.WriteLine($"{Nome} flutua rapidamente através das sombras!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        MonstroSombrio[] horda = new MonstroSombrio[]
        {
            new Zumbi("Zumbi Lento"),
            new Espectro("Espectro Veloz")
        };

        foreach (var monstro in horda)
        {
            monstro.Mover();
        }
    }
}
