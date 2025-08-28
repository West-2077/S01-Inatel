io.write("Digite o início do intervalo (M): ")
local M = tonumber(io.read())

io.write("Digite o final do intervalo (N): ")
local N = tonumber(io.read())

io.write("Digite o número para encontrar múltiplos (X): ")
local X = tonumber(io.read())

print("\nMúltiplos de " ..X..  " no intervalo [" .. M .. ", " .. N .. "]:")

local encontrouMultiplos = false

for i = M, N do
    if i % X == 0 then
        print(i)
        encontrouMultiplos = true
    end
end

if not encontrouMultiplos then
    print("Não há múltiplos de " .. X .. " no intervalo [" .. M .. ", " .. N .. "]")
end