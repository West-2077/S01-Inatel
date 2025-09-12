package main

import (
	"fmt"
)

func main() {
	var numero int

	fmt.Print("Digite um número: ") // declarando variável e lendo o valor digitado pelo usuário
	fmt.Scan(&numero)

	switch numero % 2 { // usando um switch para verificar se o número é par ou ímpar
	case 0:
		fmt.Println("O número é par")
	default: 
		fmt.Println("O número é ímpar")
	}
}
