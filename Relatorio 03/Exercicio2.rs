use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    // Jogador 1 escolhe "par" ou "ímpar" e seu número
    println!("Jogador 1, escolha 'par' ou 'impar':");
    let mut escolha = String::new();
    io::stdin().read_line(&mut escolha).expect("Erro ao ler escolha");
    let escolha = escolha.trim().to_lowercase();

    println!("Jogador 1, digite seu número (inteiro):");
    let mut num1 = String::new();
    io::stdin().read_line(&mut num1).expect("Erro ao ler número");
    let num1: i32 = num1.trim().parse().expect("Digite um número válido!");

    // Jogador 2 digita seu número
    println!("Jogador 2, digite seu número (inteiro):");
    let mut num2 = String::new();
    io::stdin().read_line(&mut num2).expect("Erro ao ler número");
    let num2: i32 = num2.trim().parse().expect("Digite um número válido!");

    // Soma dos números
    let soma = num1 + num2;
    println!("A soma dos números é: {}", soma);

    // Verifica se a soma é par ou ímpar
    let soma_par = eh_par(soma);

    // Determina vencedor
    if (soma_par && escolha == "par") || (!soma_par && escolha == "impar") {
        println!("Jogador 1 venceu!");
    } else {
        println!("Jogador 2 venceu!");
    }
}
