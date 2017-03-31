module Main where

import HappyParser
import AlexTokens
import TACTranslator
import AssemblerGen

compileJulia :: String -> IO ()
compileJulia juliaCode = putStr (compile (translateCmd (parse (alexScanTokens juliaCode)) 0 0 []))

main = do
	   juliaCode <- getContents
	   putStr (compile (translateCmd (parse (alexScanTokens juliaCode)) 0 0 []))