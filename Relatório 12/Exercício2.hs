
data Item = Item {
    nome      :: String,
    categoria :: String,
    preco     :: Double
} deriving (Show)


data CompraZelda = CompraZelda {
    itens :: [Item]
} deriving (Show)


calculaDesconto :: [Item] -> Double
calculaDesconto itens
    | total > 200 = total * 0.10 
    | otherwise   = 0.0
    where
        total = sum [preco i | i <- itens]


valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda itens)
    | total > 200 = total - desconto           
    | otherwise   = total + 15.0                
    where
        total = sum [preco i | i <- itens]
        desconto = calculaDesconto itens


mostrarItens :: [Item] -> String
mostrarItens [] = "Nenhum item na compra."
mostrarItens itens = unlines [ "- " ++ nome i ++ " (" ++ categoria i ++ "): R$" ++ show (preco i) | i <- itens ]


main :: IO ()
main = do
    let espada = Item "Espada Mestre" "Arma" 150.0
    let escudo = Item "Escudo Hyliano" "Equipamento" 120.0
    let pocao  = Item "Poção de Vida" "Poção" 30.0
    let bota   = Item "Botas de Ferro" "Equipamento" 90.0

    let compra1 = CompraZelda [espada, escudo]   
    let compra2 = CompraZelda [pocao, bota]        
    let compra3 = CompraZelda []                   

    putStrLn "=== Compra 1 ==="
    putStrLn $ mostrarItens (itens compra1)
    putStrLn $ "Valor final: R$" ++ show (valorFinal compra1)
    putStrLn ""

    putStrLn "=== Compra 2 ==="
    putStrLn $ mostrarItens (itens compra2)
    putStrLn $ "Valor final: R$" ++ show (valorFinal compra2)
    putStrLn ""

    putStrLn "=== Compra 3 ==="
    putStrLn $ mostrarItens (itens compra3)
    putStrLn $ "Valor final: R$" ++ show (valorFinal compra3)
