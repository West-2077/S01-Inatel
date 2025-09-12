package main

import (
	"fmt"
)

// Função que gera a sequência de Fibonacci
func fibonacci(n int) {
	var a int = 0 // Variavel que aparecerá na tela e recebe o valor de b
	var b int = 1
	var c int = 0 // Variavel que reveserva o valor de a e soma com b

	for i := 0; i < n; i++ {
		fmt.Print(a, " ")
		a = b
		b = c + b
		c = a
	}
	fmt.Println()
}

func main() {
	var n int
	fmt.Print("Quantos números da sequência de Fibonacci você deseja? ")
	fmt.Scan(&n)

	fmt.Println("Sequência de Fibonacci:")
	fibonacci(n)
}
