-- Função calculadora
function calculadora(num1, num2, operador)

    if operador == "+" then
        return num1 + num2
    elseif operador == "-" then
        return num1 - num2
    elseif operador == "*" then
        return num1 * num2
    elseif operador == "/" then
        return num1 / num2
    else
        return "Erro: Operador inválido. Use: +, -, * ou /"
    end
end

io.write("Digite o primeiro número: ")
local n1 = tonumber(io.read())

io.write("Digite o segundo número: ")
local n2 = tonumber(io.read())

io.write("Digite a operação (+, -, *, /): ")
local op = io.read()

local resultado = calculadora(n1, n2, op)
print("Resultado: " .. resultado)
