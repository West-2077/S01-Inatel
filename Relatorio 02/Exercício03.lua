-- Função para filtrar números pares
function filtrarPares(tabela)
local pares = {}


for i, numero in ipairs(tabela) do
    if numero % 2 == 0 then
        table.insert(pares, numero)
    end
end

return pares
end

-- Função para exibir uma tabela
function exibirTabela(tabela, nome)
io.write(nome .. " = {")
for i, valor in ipairs(tabela) do
    io.write(valor)
    if i < #tabela then
        io.write(", ")
    end
end
print("}")
end

-- Programa principal
local numeros = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}

local numerosPares = filtrarPares(numeros)

exibirTabela(numerosPares, "Números pares")
