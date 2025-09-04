use std::io;

fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;
    let soma_pesos = peso1 + peso2 + peso3;

    (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / soma_pesos
}

fn main() {
    let mut entrada = String::new();

    // Ler nota1
    println!("Digite a primeira nota:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota");
    let nota1: f64 = entrada.trim().parse().expect("Digite um número válido!");
    entrada.clear();

    // Ler nota2
    println!("Digite a segunda nota:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota");
    let nota2: f64 = entrada.trim().parse().expect("Digite um número válido!");
    entrada.clear();

    // Ler nota3
    println!("Digite a terceira nota:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler nota");
    let nota3: f64 = entrada.trim().parse().expect("Digite um número válido!");

    // Calcula média
    let media = calcular_media(nota1, nota2, nota3);

    println!("\nNotas: {}, {}, {}", nota1, nota2, nota3);
    println!("Média ponderada = {:.2}", media);

    // Verifica aprovação
    if media >= 7.0 {
        println!("Aluno Aprovado ");
    } else {
        println!("Aluno Reprovado ");
    }
}
