// Classe Criatura
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

// Classe Diário
class Diario {
  #autorSecreto;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
    console.log(`Enigma ${num} adicionado ao diário.`);
  }

  adicionarCriatura(criatura) {
    if (criatura instanceof Criatura) {
      this.criaturasAvistadas.push(criatura);
      console.log(`Criatura registrada: ${criatura.nome}`);
    } else {
      console.log("Erro: apenas objetos da classe Criatura podem ser adicionados.");
    }
  }

  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "Acesso negado! Chave incorreta.";
    }

    if (!this.enigmas.has(num)) {
      return "Enigma inexistente nesse índice.";
    }

    return `Enigma ${num} decodificado: ${this.enigmas.get(num)}`;
  }
}

// Classe Personagem
class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

// Classe Protagonista (herda de Personagem)
class Protagonista extends Personagem {
  constructor(nome, idade, autorSecreto) {
    super(nome, idade);
    this.diario = new Diario(autorSecreto);
  }
}

// Classe CabanaMistério
class CabanaMisterio {
  constructor(funcionariosIniciais = []) {
    this.funcionarios = funcionariosIniciais; // agregação
  }

  adicionarFuncionario(p) {
    if (p instanceof Personagem) {
      this.funcionarios.push(p);
    } else {
      console.log("Erro: apenas personagens podem ser adicionados como funcionários.");
    }
  }

  listarFuncionarios() {
    console.log("Funcionários da Cabana Mistério:");
    return this.funcionarios.map(f => `${f.nome} (${f.idade} anos)`);
  }
}

// Demonstração do funcionamento

// Criando protagonista e diário
const dipper = new Protagonista("Dipper", 12, "StanleyPines");

// Adicionando enigmas
dipper.diario.adicionarEnigma(1, "O Olho que tudo vê.");
dipper.diario.adicionarEnigma(2, "O Triângulo desperta.");

// Tentando decodificar com chave errada
console.log(dipper.diario.decodificar("Errado", 1));

// Decodificação correta
console.log(dipper.diario.decodificar("StanleyPines", 2));

// Criaturas avistadas
dipper.diario.adicionarCriatura(new Criatura("Gnomo", false));
dipper.diario.adicionarCriatura(new Criatura("Bill Cipher", true));

// Criando Cabana Mistério com personagens
const mabel = new Personagem("Mabel", 12);
const stan = new Personagem("Tio Stan", 58);
const cabana = new CabanaMisterio([stan, mabel, dipper]);

console.log("\n--- Funcionários da Cabana Mistério ---");
console.log(cabana.listarFuncionarios());
