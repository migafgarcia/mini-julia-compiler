{
module AlexTokens where
}

%wrapper "basic"


tokens :-
--Ints
[0-9]+				{ \s -> TokenInt (read s :: Int64)} 
\-[0-9]+                 { \s -> TokenInt (read (drop 1 s) :: Int64)} 

-- Floats
[0-9]+\.[0-9]+			{ \s -> TokenFloat (read s :: Double) }
[0-9]+\.[0-9]+			{ \s -> TokenFloat (read (drop 1 s) :: Double) }
\.[0-9]+				{ \s -> TokenFloat (read ("0" ++ s) :: Double) }
\.[0-9]+				{ \s -> TokenFloat (read ("0" ++ (drop 1 s)) :: Double) }

-- Booleans
true					{ \s -> TokenBool True }
false				{ \s -> TokenBool False }

-- If While PrintLine
if					{ \s -> TokenIf }
elseif				{ \s -> TokenElseIf }
else					{ \s -> TokenElse }
while				{ \s -> TokenWhile }
end					{ \s -> TokenEnd }
println				{ \s -> TokenPrintLine }

-- Symbols
\+					{ \s -> TokenAdd }
\-					{ \s -> TokenSub }
\*					{ \s -> TokenMult }
\/					{ \s -> TokenDiv }
\\					{ \s -> TokenReverseDiv }
\^					{ \s -> TokenPower }
\%					{ \s -> TokenMod }
\(					{ \s -> TokenLPar }
\)					{ \s -> TokenRPar }
\!					{ \s -> TokenNot }
"=="					{ \s -> TokenEquals }
"!="					{ \s -> TokenNotEquals }
\<					{ \s -> TokenLessThan }
\>					{ \s -> TokenGreaterThan }
"<="					{ \s -> TokenLessEqual }
">="					{ \s -> TokenGreatEqual }
\=					{ \s -> TokenAtrib }
\"					{ \s -> TokenQuotes }
\,					{ \s -> TokenComma }
\n+					{ \s -> TokenNewLine }

-- Others
[a-zA-Z\_]+			{ \s -> TokenString s }
\" [^\"]+ \"			{ \s -> TokenString (drop 1 (take ((length s)-1) s)) }
$white+				;


{
data Token = TokenInt Int64
     | TokenFloat Double
     | TokenBool Bool
     | TokenIf
     | TokenElse
     | TokenElseIf
     | TokenWhile
     | TokenEnd
     | TokenAdd
     | TokenSub
     | TokenMult
     | TokenDiv
     | TokenReverseDiv
     | TokenPower
     | TokenMod
     | TokenLPar
     | TokenRPar
     | TokenNot
     | TokenEquals
     | TokenNotEquals
     | TokenLessThan
     | TokenGreaterThan
     | TokenLessEqual
     | TokenGreatEqual
     | TokenAtrib
     | TokenQuotes
     | TokenComma
     | TokenPrintLine
     | TokenString String
     | TokenNewLine
     deriving (Eq, Show)
}
