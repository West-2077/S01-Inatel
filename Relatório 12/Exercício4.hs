{-# LANGUAGE RecordWildCards #-}
import Text.Printf (printf)


data Servico = Servico {
    nomeServico :: String,
    tipoServico :: String,
    precoBase   :: Double
} deriving (Show)


data StatusAtendimento = EmAndamento | Finalizado | Cancelado
    deriving (Show, Eq)


data Atendimento = Atendimento {
    servicos :: [Servico],
    statusAt :: StatusAtendimento
} deriving (Show)


bonusEspiritual :: [Servico] -> Double
bonusEspiritual ss =
    let somaInicial = sum [precoBase s | s <- ss]
        comBonus    = if length ss > 3 then somaInicial * 1.25 else somaInicial
        comDesconto = if comBonus > 500 then comBonus * 0.90 else comBonus
    in comDesconto


valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento _ Cancelado) = 0.0
valorFinalAtendimento (Atendimento ss EmAndamento)
    | totalAdj <= 0 = 0.0  
    | otherwise     = totalAdj
  where totalAdj = bonusEspiritual ss
valorFinalAtendimento (Atendimento ss Finalizado)
    | totalAdj <= 0 = 0.0
    | otherwise     = totalAdj
  where totalAdj = bonusEspiritual ss


descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço cadastrado."
descricaoPrimeiroServico (Atendimento (s:_) _) =
    "Primeiro serviço: " ++ nomeServico s ++ " - " ++ tipoServico s


mostrarServicos :: [Servico] -> String
mostrarServicos [] = "  (Nenhum serviço)"
mostrarServicos ss = unlines [ printf "  - %s (%s): R$ %.2f" (nomeServico s) (tipoServico s) (precoBase s) | s <- ss ]


main :: IO ()
main = do
    
    let banhoSimples   = Servico "Banho Relax"      "Banho"      80.0
    let banhoRoyal     = Servico "Banho Royal"      "Banho"     220.0
    let massagemLeve   = Servico "Massagem Leve"    "Massagem"   120.0
    let massagemProf   = Servico "Massagem Profunda" "Massagem"  200.0
    let banqueiteMini  = Servico "Banqueite Mini"   "Banqueite"   60.0
    let ritualAncestral= Servico "Ritual Ancestral" "Ritual"    300.0

   
    let at1 = Atendimento [banhoSimples, massagemLeve] EmAndamento

    let at2 = Atendimento [banhoSimples, massagemLeve, banqueiteMini, massagemProf] Finalizado

    let at3 = Atendimento [ritualAncestral, banhoRoyal, massagemLeve] Finalizado

   
    let at4 = Atendimento [ritualAncestral, massagemProf] Cancelado

   
    putStrLn "=== ATENDIMENTO 1 ==="
    putStrLn $ mostrarServicos (servicos at1)
    putStrLn $ descricaoPrimeiroServico at1
    putStrLn $ "Status: " ++ show (statusAt at1)
    putStrLn $ "Valor final: R$ " ++ printf "%.2f" (valorFinalAtendimento at1)
    putStrLn ""

    putStrLn "=== ATENDIMENTO 2 ==="
    putStrLn $ mostrarServicos (servicos at2)
    putStrLn $ descricaoPrimeiroServico at2
    putStrLn $ "Status: " ++ show (statusAt at2)
    putStrLn $ "Valor final: R$ " ++ printf "%.2f" (valorFinalAtendimento at2)
    putStrLn ""

    putStrLn "=== ATENDIMENTO 3 ==="
    putStrLn $ mostrarServicos (servicos at3)
    putStrLn $ descricaoPrimeiroServico at3
    putStrLn $ "Status: " ++ show (statusAt at3)
    putStrLn $ "Valor final: R$ " ++ printf "%.2f" (valorFinalAtendimento at3)
    putStrLn ""

    putStrLn "=== ATENDIMENTO 4 ==="
    putStrLn $ mostrarServicos (servicos at4)
    putStrLn $ descricaoPrimeiroServico at4
    putStrLn $ "Status: " ++ show (statusAt at4)
    putStrLn $ "Valor final: R$ " ++ printf "%.2f" (valorFinalAtendimento at4)
    putStrLn ""
