package main

import (
	"fmt"
)

// Função que verifica login
func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	}
	return false
}

func main() {
	var usuario, senha string

	for {
		// Pede credenciais para acessar o sistema
		fmt.Print("Digite o usuário: ")
		fmt.Scan(&usuario)

		fmt.Print("Digite a senha: ")
		fmt.Scan(&senha)

		// Chama a função para verificar
		if verificarLogin(usuario, senha) { // Caso o login seja bem-sucedido
			fmt.Println("Login bem-sucedido!")
			break // sai do loop
		} else { // Caso o login falhe
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
	}
}
