package main

import (
	"fmt"
)

// Função para classificar número
func classificar_numero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num < 0 {
		return "Negativo" // estrutura de decisão para sever como ela e classificada
	} else {
		return "Zero"
	}
}

func main() {
	var numero int
	fmt.Print("Digite um número: ") // Declarando a variavel numero e inserindo ela
	fmt.Scan(&numero)

	// Chama a função e exibe o resultado
	resultado := classificar_numero(numero)
	fmt.Println("Classificação:", resultado)
}
