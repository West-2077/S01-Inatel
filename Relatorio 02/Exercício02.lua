function encontrarMaiorValor(tabela)

    if #tabela == 0 then
        return nil 
    end

    local maior = tabela[1]

    for i = 2, #tabela do
        if tabela[i] > maior then
            maior = tabela[i]
        end
    end

    return maior
end

-- Programa principal
local numeros = {-5, -2, -10, -1}


local maiorNumero = encontrarMaiorValor(numeros)


if maiorNumero then
    print("O maior valor na tabela é: " .. maiorNumero)
else
    print("A tabela está vazia!")
end
