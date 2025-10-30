// Interface simulada (em JS, apenas por convenção)
class IExplorador {
  explorarTerritorio() {
    throw new Error("Método 'explorarTerritorio()' deve ser implementado.");
  }
}

// Classe ODM_Gear
class ODM_Gear {
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100; // valor inicial
  }

  usarGas(quantidade) {
    if (quantidade > this.#gasRestante) {
      console.log("Sem gás suficiente!");
      this.#gasRestante = 0;
    } else {
      this.#gasRestante -= quantidade;
      console.log(`${quantidade} de gás usado. Restante: ${this.#gasRestante}`);
    }
  }

  getGas() {
    return this.#gasRestante;
  }
}

// Classe Soldado implementa IExplorador
class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }

  explorarTerritorio() {
    this.gear.usarGas(10);
    return `Soldado ${this.nome} explora o território usando o ${this.gear.modelo}. Gás restante: ${this.gear.getGas()}`;
  }

  verificarEquipamento() {
    return `Equipamento do ${this.nome}: Modelo ${this.gear.modelo}, Gás ${this.gear.getGas()}`;
  }
}

// Classe Esquadrão implementa IExplorador e agrega Soldados
class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    if (!(soldado instanceof Soldado)) {
      throw new Error("Somente objetos da classe Soldado podem ser adicionados ao esquadrão.");
    }
    this.membros.push(soldado);
  }

  explorarTerritorio() {
    console.log(`Esquadrão liderado por ${this.lider.nome} iniciando exploração...`);
    return this.membros.map(m => m.explorarTerritorio());
  }

  relatarStatus() {
    return this.membros.map(m => m.verificarEquipamento());
  }
}

// Demonstração

const levi = new Soldado("Levi", "ODM-MKII");
const mikasa = new Soldado("Mikasa", "ODM-MKI");
const armin = new Soldado("Armin", "ODM-Protótipo");

const esquadrao = new Esquadrao(levi, [mikasa, armin]);

esquadrao.adicionarMembro(levi);

// Chamada polimórfica
console.log("\n--- EXPLORAÇÃO INICIADA ---");
const relatorios = esquadrao.explorarTerritorio();
relatorios.forEach(r => console.log(r));

console.log("\n--- STATUS FINAL ---");
esquadrao.relatarStatus().forEach(s => console.log(s));
