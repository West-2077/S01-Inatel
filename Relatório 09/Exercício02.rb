
module Rastreavel
  def obter_localizacao(hora)
    puts "📍 Localização de #{@nome} às #{hora}: #{@localizacao}"
  end
end


module Perigoso
  def calcular_risco
    rand(1..10) 
  end
end


class Participante
  attr_accessor :nome, :localizacao

  def initialize(nome)
    @nome = nome
    @localizacao = "Desconhecida"
  end

  def to_s
    "#{@nome} está em #{@localizacao}"
  end
end


class Detetive < Participante
  include Rastreavel

  def initialize(nome)
    super(nome)
  end
end


class MestreDoCrime < Participante
  include Rastreavel
  include Perigoso

  def initialize(nome)
    super(nome)
  end
end


class Cenario
  def initialize
    @participantes = []
  end

  def adicionar(participante)
    @participantes << participante
  end

  
  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end
end


sherlock = Detetive.new("Sherlock Holmes")
moriarty = MestreDoCrime.new("Professor Moriarty")


puts "Digite a localização atual de Sherlock:"
sherlock.localizacao = gets.chomp

puts "Digite a localização atual de Moriarty:"
moriarty.localizacao = gets.chomp


cenario = Cenario.new
cenario.adicionar(sherlock)
cenario.adicionar(moriarty)


puts "\n🔍 Rastreamento de participantes:"
[sherlock, moriarty].each { |p| p.obter_localizacao("14:00") }


ameacas = cenario.identificar_ameacas

puts "\n⚠️ Lista de ameaças detectadas:"
if ameacas.empty?
  puts "Nenhum criminoso detectado."
else
  ameacas.each do |a|
    puts "#{a.nome} é perigoso! Nível de risco: #{a.calcular_risco}"
  end
end
