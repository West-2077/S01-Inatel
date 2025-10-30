// Classe base
class Pokemon {
  #vida; // atributo privado

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  // Método protegido (chamado apenas internamente)
  #setVida(novaVida) {
    this.#vida = Math.max(0, novaVida);
  }

  receberDano(dano) {
    this.#setVida(this.#vida - dano);
    console.log(`${this.nome} recebeu ${dano} de dano! Vida atual: ${this.#vida}`);
  }

  // Método que subclasses podem chamar
  recuperarVida(valor) {
    this.#setVida(this.#vida + valor);
    console.log(`${this.nome} recuperou ${valor} de vida! Vida atual: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} usa um ataque genérico em ${alvo.nome}!`);
    alvo.receberDano(10);
  }
}

// Subclasse Pokémon de Fogo
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonusAtaque;
  }

  atacar(alvo) {
    const dano = 40 + this.bonusAtaque;
    console.log(`${this.nome} lança Ember em ${alvo.nome}! Dano: ${dano}`);
    alvo.receberDano(dano);
  }
}

// Subclasse Pokémon de Água
class PokemonAgua extends Pokemon {
  #curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.#curaBase = curaBase;
  }

  atacar(alvo) {
    console.log(`${this.nome} lança o ataque Tackle em ${alvo.nome}! Dano: 35`);
    alvo.receberDano(35);
    this.curar();
  }

  curar() {
    console.log(`${this.nome} recupera ${this.#curaBase} de vida com a umidade!`);
    this.recuperarVida(this.#curaBase);
  }
}

// Demonstração de polimorfismo
const charmander = new PokemonFogo("Charmander", 100, 10);
const squirtle = new PokemonAgua("Squirtle", 100, 20);

console.log("\n--- Início da Batalha ---\n");
charmander.atacar(squirtle); // Ataque de fogo
squirtle.atacar(charmander); // Ataque de água + cura

console.log(`\nVida final:
${charmander.nome}: ${charmander.getVida()}
${squirtle.nome}: ${squirtle.getVida()}`);
