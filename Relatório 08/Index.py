from abc import ABC, abstractmethod

# Classe base abstrata
class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


# Classe filha: Tanque
class Tanque(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) ativa o escudo gigante para proteger o time!")


# Classe filha: Dano
class Dano(Heroi):
    def usar_ultimate(self):
        print(f"{self.nome} (Dano) dispara uma sequência devastadora de ataques!")


# Programa principal
if __name__ == "__main__":
    # Criando lista de heróis
    herois = [
        Tanque("Reinhardt", "Tanque"),
        Dano("Soldado 76", "Dano")
    ]

    # Percorrendo e usando ultimate de cada herói
    for heroi in herois:
        heroi.usar_ultimate()
