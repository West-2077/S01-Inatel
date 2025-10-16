from abc import ABC, abstractmethod

class Personagem(ABC):
    def __init__(self, vida: int, resistencia: int):
        self._vida = vida
        self._resistencia = resistencia

    @property
    def vida(self):
        return self._vida

    @vida.setter
    def vida(self, nova_vida):
        self._vida = max(0, nova_vida)  # Evita valores negativos

    # Método abstrato: obriga subclasses a implementar
    @abstractmethod
    def __str__(self):
        pass


class Cavaleiro(Personagem):
    def __init__(self, vida: int, resistencia: int, armadura_pesada: bool):
        super().__init__(vida, resistencia)
        self.armadura_pesada = armadura_pesada

    def __str__(self):
        tipo_armadura = "sim" if self.armadura_pesada else "não"
        return (f"Cavaleiro com {self._vida} de vida, "
                f"{self._resistencia} de resistência "
                f"e armadura pesada: {tipo_armadura}")


# Exemplo de uso:
# p = Personagem(100, 50)  # ❌ Isso daria erro, porque é uma classe abstrata
c = Cavaleiro(120, 70, True)
print(c)
