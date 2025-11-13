
data Banda = Banda {
    nomeBanda  :: String,
    genero     :: String,
    cache      :: Double
} deriving (Show)


data Status = Ativo | Encerrado | Cancelado
    deriving (Show, Eq)


data Evento = Evento {
    nomeEvento :: String,
    bandas     :: [Banda],
    status     :: Status
} deriving (Show)


custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ _ Cancelado) = 0.0
custoTotalEvento (Evento _ bs _) =
    let total = sum [cache b | b <- bs]
    in total + (total * 0.20)  


bandaAbertura :: Evento -> String
bandaAbertura (Evento _ [] _) = "Nenhuma banda cadastrada para abertura."
bandaAbertura (Evento _ (b:_) _) = "Banda de abertura: " ++ nomeBanda b


bandaEncerramento :: Evento -> String
bandaEncerramento (Evento _ [] _) = "Nenhuma banda cadastrada para encerramento."
bandaEncerramento (Evento _ bs _) =
    "Banda de encerramento: " ++ nomeBanda (last bs)


mostrarBandas :: [Banda] -> String
mostrarBandas [] = "Nenhuma banda."
mostrarBandas bs = unlines [ "- " ++ nomeBanda b ++ " (" ++ genero b ++ ") - Cachê: R$" ++ show (cache b) | b <- bs ]


main :: IO ()
main = do
    
    let banda1 = Banda "The Kokiris" "Rock" 8000.0
    let banda2 = Banda "Gerudo Groove" "Funk" 5000.0
    let banda3 = Banda "Zora Wave" "Pop" 6000.0
    let banda4 = Banda "Goron Metal" "Heavy Metal" 9000.0
    let banda5 = Banda "Sheikah Synth" "Eletrônico" 7000.0

   
    let evento1 = Evento "Festival de Hyrule" [banda1, banda2, banda3] Ativo
    let evento2 = Evento "Noite Tribal" [banda4, banda5] Encerrado
    let evento3 = Evento "Baile do Castelo" [banda2, banda5] Cancelado

   
    putStrLn "=== EVENTO 1 ==="
    putStrLn $ "Nome: " ++ nomeEvento evento1
    putStrLn $ mostrarBandas (bandas evento1)
    putStrLn $ bandaAbertura evento1
    putStrLn $ bandaEncerramento evento1
    putStrLn $ "Custo total: R$" ++ show (custoTotalEvento evento1)
    putStrLn ""

    putStrLn "=== EVENTO 2 ==="
    putStrLn $ "Nome: " ++ nomeEvento evento2
    putStrLn $ mostrarBandas (bandas evento2)
    putStrLn $ bandaAbertura evento2
    putStrLn $ bandaEncerramento evento2
    putStrLn $ "Custo total: R$" ++ show (custoTotalEvento evento2)
    putStrLn ""

    putStrLn "=== EVENTO 3 ==="
    putStrLn $ "Nome: " ++ nomeEvento evento3
    putStrLn $ mostrarBandas (bandas evento3)
    putStrLn $ bandaAbertura evento3
    putStrLn $ bandaEncerramento evento3
    putStrLn $ "Custo total: R$" ++ show (custoTotalEvento evento3)
