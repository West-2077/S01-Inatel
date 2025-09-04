use std::io;

// Função que imprime a tabuada
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        println!("{} x {} = {}", numero, i, numero * i);
    }
}

fn main() {
    // Pede os valores ao usuário
    println!("Digite o número da tabuada:");
    let mut entrada = String::new();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler número");
    let numero: i32 = entrada.trim().parse().expect("Digite um número válido!");

    println!("Digite o limite inferior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler número");
    let limite_inferior: i32 = entrada.trim().parse().expect("Digite um número válido!");

    println!("Digite o limite superior:");
    entrada.clear();
    io::stdin().read_line(&mut entrada).expect("Erro ao ler número");
    let limite_superior: i32 = entrada.trim().parse().expect("Digite um número válido!");

    // Chama a função
    println!("\nTabuada do {} de {} até {}:", numero, limite_inferior, limite_superior);
    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
