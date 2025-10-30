// Interface IRastreavel
class IRastreavel {
  rastrearLocal(latitude, longitude) {
    throw new Error("Método rastrearLocal() deve ser implementado pela subclasse.");
  }
}

// Classe base Hunter
class Hunter extends IRastreavel {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    super();
    this.#nome = nome;
    this.#idade = idade;
    this.#localizacao = local;
  }

  get nome() {
    return this.#nome;
  }

  get idade() {
    return this.#idade;
  }

  get localizacao() {
    return this.#localizacao;
  }

  set localizacao(local) {
    this.#localizacao = local;
  }

  rastrearLocal(latitude, longitude) {
    return `Hunter genérico ${this.#nome} rastreando em (${latitude}, ${longitude})`;
  }
}

// Classe Especialista (extends Hunter)
class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, local, idade, habilidade) {
    super(nome, local, idade);
    this.#habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    return `Especialista ${this.nome} usando ${this.#habilidadeNen} para rastrear em (${lat}, ${long}).`;
  }
}

// Classe Manipulador (extends Hunter)
class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome, local, idade, alvo = null) {
    super(nome, local, idade);
    this.#alvoAtual = alvo;
  }

  rastrearLocal(lat, long) {
    const alvoInfo = this.#alvoAtual ? ` o alvo ${this.#alvoAtual.nome}` : " um alvo desconhecido";
    return `Manipulador ${this.nome} rastreando${alvoInfo} na posição (${lat}, ${long}).`;
  }
}

// Classe Batalhao
class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    // Garante que não haja duplicatas pelo nome
    for (let h of this.#hunters) {
      if (h.nome === hunter.nome) {
        console.log(`Hunter "${hunter.nome}" já está no batalhão.`);
        return;
      }
    }
    this.#hunters.add(hunter);
    console.log(`Hunter "${hunter.nome}" adicionado ao batalhão.`);
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    console.log("\n--- Rastreamento iniciado ---");
    const resultados = [];
    for (let hunter of this.#hunters) {
      resultados.push(hunter.rastrearLocal(lat, long));
    }
    return resultados;
  }
}

// Demonstração de funcionamento

const gon = new Especialista("Gon", "Montanha", 14, "Jajanken");
const kurapika = new Especialista("Kurapika", "Cidade", 17, "Correntes do Julgamento");
const illumi = new Manipulador("Illumi", "Deserto", 25, gon);

const batalhao = new Batalhao();
batalhao.adicionarHunter(gon);
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(illumi);
batalhao.adicionarHunter(gon); // tentativa duplicada

console.log(`\nTotal de Hunters no batalhão: ${batalhao.getNumHunters()}`);

const logs = batalhao.iniciarRastreamento("45.3N", "22.8W");
console.log(logs.join("\n"));
