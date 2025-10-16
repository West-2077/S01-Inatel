# Classe de composição
class ArmaCorpoACorpo:
    def __init__(self, nome: str, dano: int):
        self.nome = nome
        self.dano = dano

    def __str__(self):
        return f"{self.nome} (Dano: {self.dano})"


# Classe agregada
class PhantomThieves:
    def __init__(self, nome: str, arma: str):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"{self.nome} usa {self.arma}"


# Classe principal com composição e agregação
class Joker:
    def __init__(self, equipe: list[PhantomThieves]):
        # Composição → Joker cria e gerencia sua própria arma
        self.arma = ArmaCorpoACorpo("Faca", 50)

        # Agregação → Recebe lista de PhantomThieves
        self.equipe = equipe

    def mostrar_equipe(self):
        print(f"Joker empunha {self.arma}")
        print("Equipe dos Phantom Thieves:")
        for membro in self.equipe:
            print(f" - {membro}")


# ---------- Exemplo de uso ----------
if __name__ == "__main__":
    # Criando membros agregados
    membro1 = PhantomThieves("Skull", "Canos de Ferro")
    membro2 = PhantomThieves("Panther", "Chicote")
    membro3 = PhantomThieves("Mona", "Estilingue")

    # Criando Joker com a lista de membros
    equipe = [membro1, membro2, membro3]
    joker = Joker(equipe)

    # Mostrando equipe
    joker.mostrar_equipe()
