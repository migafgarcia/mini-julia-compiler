module AssemblerGen where

import TACTranslator


compile :: ([TAC], Int, Int, [(String, String)]) -> String
compile (cmdList, _, _, varList) = ".text\n" ++ (mipsify_cmd cmdList) ++ (storeVars varList) ++ ".data\n" ++ (declareVars varList) 

mipsify_cmd :: [TAC] -> String
mipsify_cmd [] = ""
mipsify_cmd ((TAC_Temp str op):xs) = (mipsify_op op str) ++ (mipsify_cmd xs)
mipsify_cmd ((TAC_Bool_Temp str op):xs) = (mipsify_bool_op op str) ++ (mipsify_cmd xs)
mipsify_cmd ((TAC_Label lbl):xs) = lbl ++ ":\n" ++ (mipsify_cmd xs)
mipsify_cmd ((TAC_Goto lbl):xs) = "j " ++ lbl ++ "\n" ++ (mipsify_cmd xs)
mipsify_cmd ((TAC_If bool_op label):xs) = "beq $" ++ (getBoolTempName bool_op) ++ ", $zero, " ++ label ++ "\n" ++ (mipsify_cmd xs)
mipsify_cmd ((TAC_Print str):xs) = error "Print not supported"



mipsify_op :: TAC_Op -> String -> String
mipsify_op (TAC_Int int) tmp = "li $" ++ tmp ++ ", " ++ (show int) ++ "\n"
mipsify_op (TAC_Float float) tmp = "li.d $" ++ tmp ++ ", " ++ (show float) ++ "\n"
mipsify_op (TAC_Add tmp1 tmp2) tmp = "add $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_op (TAC_Sub tmp1 tmp2) tmp = "sub $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_op (TAC_Mult tmp1 tmp2) tmp = "mul $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_op (TAC_Div tmp1 tmp2) tmp = "div $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
                                ++ "mflo $" ++ tmp ++ "\n"
mipsify_op (TAC_Mod tmp1 tmp2) tmp = "div $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
                                ++ "mfhi $" ++ tmp ++ "\n"
mipsify_op (TAC_Power tmp1 tmp2) tmp = "pwr $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"


mipsify_bool_op :: TAC_Bool_Op -> String -> String
mipsify_bool_op (TAC_GreaterThan tmp1 tmp2) tmp = "sgt $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_LessThan tmp1 tmp2) tmp = "slt $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_GreatEqual tmp1 tmp2) tmp = "sge $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_LessEqual tmp1 tmp2) tmp = "sle $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_Equals tmp1 tmp2) tmp = "seq $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_NotEquals tmp1 tmp2) tmp = "sne $" ++ tmp ++ ", $" ++ (getTempName tmp1) ++ ", $" ++ (getTempName tmp2) ++ "\n"
mipsify_bool_op (TAC_Not tmp1) tmp = "neg $" ++ tmp ++ ", $" ++ (getBoolTempName tmp1) ++ "\n"
mipsify_bool_op (TAC_Bool bool) tmp = "li $" ++ tmp ++ ", " ++ (show (boolToInt bool)) ++ "\n"


boolToInt :: Bool -> Int
boolToInt bool | bool == True = 1
               | otherwise = 0

storeVars :: [(String,String)] -> String
storeVars [] = ""
storeVars ((x,y):xs) = "sw $" ++ y ++ ", " ++ x ++ "\n" ++ storeVars xs

declareVars :: [(String,String)] -> String
declareVars [] = ""
declareVars ((var,_):varList) = var ++ ":\t" ++ ".word\t0\n" ++ (declareVars varList)