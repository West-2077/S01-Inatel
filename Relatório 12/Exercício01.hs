
data Bebida = Bebida {
    nome  :: String,
    tipo  :: String,
    preco :: Float
} deriving (Show)


data Status = Aberto | Entregue | Cancelado
    deriving (Show, Eq)


data Pedido = Pedido {
    bebidas :: [Bebida],
    status  :: Status
} deriving (Show)


valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido bs _) =
    let somaPrecos = sum [preco b | b <- bs]
    in somaPrecos + 5.0  


primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "Nenhuma bebida no pedido."
primeiraBebida (Pedido (b:_) _) = nome b


main :: IO ()
main = do
    let b1 = Bebida "Café Expresso" "Café" 7.5
    let b2 = Bebida "Chá Verde" "Chá" 6.0
    let b3 = Bebida "Suco de Laranja" "Suco" 8.0

    let pedido1 = Pedido [b1, b2, b3] Aberto
    let pedido2 = Pedido [b1] Cancelado
    let pedido3 = Pedido [] Entregue

    putStrLn $ "Valor total do pedido 1: R$" ++ show (valorTotalPedido pedido1)
    putStrLn $ "Valor total do pedido 2: R$" ++ show (valorTotalPedido pedido2)
    putStrLn $ "Primeira bebida do pedido 1: " ++ primeiraBebida pedido1
    putStrLn $ "Primeira bebida do pedido 3: " ++ primeiraBebida pedido3
