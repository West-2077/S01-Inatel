from abc import ABC, abstractmethod

# 1. Classe Interface base
class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self):
        pass


# 3. Classe de composição
class Implante:
    def __init__(self, custo: int, funcao: str):
        self.custo = custo
        self.funcao = funcao

    def __str__(self):
        return f"Implante de {self.funcao} (Custo: {self.custo} créditos)"


# 4. Classe NetRunner que herda de Cibernetico
class NetRunner(Cibernetico):
    def __init__(self, nome: str, custo_implante: int, funcao_implante: str):
        self.nome = nome
        # Composição: o NetRunner cria e gerencia seu próprio implante
        self.implante = Implante(custo_implante, funcao_implante)

    def realizar_hack(self):
        print(f"{self.nome} está usando {self.implante.funcao} para invadir sistemas!")


# 5. Classe Faccao (Agregação)
class Faccao:
    def __init__(self, nome: str, membros: list[Cibernetico]):
        self.nome = nome
        self.membros = membros  # Agrega objetos do tipo Cibernetico

    def comando_hack(self):
        print(f"\nFacção {self.nome} iniciou uma operação de hack!\n")
        for membro in self.membros:
            membro.realizar_hack()


# 6. Demonstração (main)
if __name__ == "__main__":
    # Criando alguns NetRunners (composição)
    runner1 = NetRunner("V", 5000, "Quickhack Neural")
    runner2 = NetRunner("Lucy", 7000, "Controle Mental")
    runner3 = NetRunner("Kiroshi", 3000, "Scanner Avançado")

    # Criando facção (agregação)
    netrunners = [runner1, runner2, runner3]
    faccao = Faccao("Afterlife Hackers", netrunners)

    # Fazendo todos os membros executarem o hack
    faccao.comando_hack()
