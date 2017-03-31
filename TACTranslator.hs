{-
  In here the parsed code is converted to Three Address Code (TAC)
-}

module TACTranslator where

import Data.Int

-- Data declarations for parsed commands

data Cmd = Atrib String Expr
         | AtribBool String ExprBool
         | While ExprBool Cmd
         | If ExprBool IfSeq
         | PrintLine String
         | NextCmd Cmd Cmd
         | Expression Expr
         | BoolExpression ExprBool
         deriving (Show)

data IfSeq = Com Cmd
          | ElseIf Cmd ExprBool IfSeq
          | Else Cmd Cmd
          deriving (Show)

data Expr = Int Int64
     	    | Float Double
          | Var String
          | Add Expr Expr
          | Sub Expr Expr
          | Div Expr Expr
          | Mult Expr Expr
          | Mod Expr Expr
          | Power Expr Expr
          deriving (Show)


data ExprBool = GreaterThan Expr Expr
            | LessThan Expr Expr
            | GreatEqual Expr Expr
            | LessEqual Expr Expr
            | Equals Expr Expr
            | NotEquals Expr Expr
            | Not ExprBool
            | Bool Bool
            deriving (Show)


-- Data declarations for TAC commands

data TAC = TAC_Temp String TAC_Op
         | TAC_Bool_Temp String TAC_Bool_Op
         | TAC_Label String
         | TAC_Print String
         | TAC_Goto String
         | TAC_If TAC_Bool_Op String
         deriving (Show)

data TAC_Op = TAC_Add TAC_Op TAC_Op
            | TAC_Sub TAC_Op TAC_Op
            | TAC_Mult TAC_Op TAC_Op
            | TAC_Div TAC_Op TAC_Op
            | TAC_Mod TAC_Op TAC_Op
            | TAC_Power TAC_Op TAC_Op
            | TAC_Int Int64
            | TAC_Float Double
            | TAC_Var String
            deriving (Show)

data TAC_Bool_Op = TAC_GreaterThan TAC_Op TAC_Op
            | TAC_LessThan TAC_Op TAC_Op
            | TAC_GreatEqual TAC_Op TAC_Op
            | TAC_LessEqual TAC_Op TAC_Op
            | TAC_Equals TAC_Op TAC_Op
            | TAC_NotEquals TAC_Op TAC_Op
            | TAC_Not TAC_Bool_Op
            | TAC_Bool Bool
            | TAC_Bool_Var String
            deriving (Show)


-- Aux functions

-- Generates label string from number
labelToString :: Int -> String
labelToString label = "L" ++ (show label)

-- Generates temp string from number
tempToString :: Int -> String
tempToString temp = "t" ++ (show temp)

getTempName :: TAC_Op -> String
getTempName (TAC_Var str) = str
getBoolTempName (TAC_Bool_Var str) = str

changeTemp :: [TAC] -> String -> [TAC]
changeTemp ((TAC_Temp str op):[]) var = [TAC_Temp var op]
changeTemp (cmd:cmdList) var = cmd:(changeTemp cmdList var)


searchVar :: String -> [(String,String)] -> String
searchVar _ [] = error "Undeclared variable"
searchVar var (first:varList) | var == fst (first) = snd (first)
                              | otherwise = searchVar var varList

addVar :: String -> String -> [(String,String)] -> [(String,String)]
addVar var str [] = [(var, str)]
addVar var str ((x,y):varList) | var == x = (x,y):varList
                                | otherwise = (x,y):(addVar var str varList)


-- Functions for translating to TAC

translateCmd :: Cmd -> Int -> Int -> [(String, String)]-> ([TAC], Int, Int, [(String, String)])
translateCmd (Expression exp) temp label varList = let (cmd, _, temp1) = translateExpr exp temp varList
                                                  in (cmd, temp1, label, varList)

translateCmd (BoolExpression exp) temp label varList = let (cmd, _, temp1) = translateExprBool exp temp varList
                                                  in (cmd, temp1, label, varList)

translateCmd (NextCmd cmd1 cmd2) temp label varList = let 
                                                      (cmdList, temp1, label1, varList1) = translateCmd cmd1 temp label varList
                                                      (cmdList2, temp2, label2, varList2) = translateCmd cmd2 temp1 label1 varList1
                                                      in (cmdList ++ cmdList2, temp2, label2, varList2)

translateCmd (If exp ifseq) temp label varList = let
                                                      lastLabel = label
                                                      (cmdList0, trans0, temp0) = translateExprBool (Not exp) temp varList
                                                      (cmdList1, temp1, label1, varList1) = translateIfSeq ifseq lastLabel temp0 (label+1) varList
                                                      lbl1 = labelToString (label+1)
                                                      lbl2 = labelToString lastLabel
                                                      in (cmdList0 ++ [TAC_If trans0 lbl1] ++ cmdList1 ++ [TAC_Label lbl2] , temp1, label1, varList1 )  

translateCmd (While exp cmd) temp label varList = let
                                                   (cmdList0, trans0, temp0) = translateExprBool (Not exp) temp varList
                                                   (cmdList1, temp1, label1, varList1) = translateCmd cmd temp0 label varList
                                                   lbl1 = labelToString label1
                                                   lbl2 = labelToString (label1+1)
                                                   in ([TAC_Label lbl1] ++ cmdList0 ++ [TAC_If trans0 lbl2] ++ cmdList1 ++ [TAC_Goto lbl1] ++ [TAC_Label lbl2], temp1, label1+2, varList1)

translateCmd (Atrib var exp) temp label varList = let
                                                   varList0 = addVar var (tempToString temp) varList
                                                   (cmdList0, trans0, temp0) = translateExpr exp temp varList0
                                                   in ((changeTemp cmdList0 (searchVar var varList0)), temp0, label, varList0)

translateCmd (AtribBool var exp) temp label varList = let
                                                   (cmdList0, trans0, temp0) = translateExprBool exp temp varList
                                                   in (cmdList0, temp0, label, addVar var (getBoolTempName trans0) varList)

translateCmd (PrintLine str) temp label varList = ([TAC_Print str], temp, label, varList)



translateIfSeq :: IfSeq -> Int -> Int -> Int -> [(String, String)]-> ([TAC], Int, Int, [(String, String)])
translateIfSeq (Com cmd) lastLabel temp label varList = let 
                                                (cmdList0, temp0, label0, varList0) = translateCmd cmd temp (label+1) varList
                                                lbl1 = labelToString lastLabel
                                                lbl2 = labelToString label
                                                in (cmdList0 ++ [TAC_Goto lbl1] ++ [TAC_Label lbl2],  temp0, label0, varList0)

translateIfSeq (Else cmd1 cmd2) lastLabel temp label varList = let
                                                       (cmdList0, temp0, label0, varList0) = translateIfSeq (Com cmd1) lastLabel temp (label) varList
                                                       (cmdList1, temp1, label1, varList1) = translateCmd cmd2 temp0 (label+1) varList0
                                                       lbl1 = labelToString label
                                                       in (cmdList0 ++ cmdList1, temp1, label1, varList1)


translateIfSeq (ElseIf cmd1 exp ifseq) lastLabel temp label varList = let
                                                       (cmdList0, temp0, label0, varList0) = translateIfSeq (Com cmd1) lastLabel temp label varList
                                                       (cmdList1, trans1, temp1) = translateExprBool (Not exp) temp0 varList0 
                                                       (cmdList2, temp2, label1, varList2) = translateIfSeq ifseq lastLabel temp1 (label+1) varList0
                                                       lbl2 = labelToString (label+1)
                                                       in (cmdList0 ++ cmdList1 ++ [TAC_If trans1 lbl2] ++ cmdList2 , temp2, label1, varList2)





translateExpr :: Expr -> Int -> [(String, String)] -> ([TAC], TAC_Op, Int)

translateExpr (Int number) temp varList = ([TAC_Temp (tempToString temp) (TAC_Int number)], TAC_Var (tempToString temp), temp+1)

translateExpr (Float number) temp varList =([TAC_Temp (tempToString temp) (TAC_Float number)], TAC_Var (tempToString temp), temp+1)

translateExpr (Add exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Add trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Sub exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2 ) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Sub trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Mult exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Mult trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Div exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Div trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Mod exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Mod trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Power exp1 exp2) temp varList = let 
                                      (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                      (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                      tempStr = tempToString temp2
                                      in (cmd1 ++ cmd2 ++ [TAC_Temp tempStr (TAC_Power trans1 trans2)], TAC_Var tempStr, temp2 + 1)

translateExpr (Var str) temp varList = ([], TAC_Var (searchVar str varList), temp)


translateExprBool :: ExprBool -> Int -> [(String, String)] -> ([TAC], TAC_Bool_Op, Int)
translateExprBool (Bool bool) temp varList = ([TAC_Bool_Temp (tempToString temp) (TAC_Bool bool)], TAC_Bool_Var (tempToString temp), temp+1)


translateExprBool (GreaterThan exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_GreaterThan trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (LessThan exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_LessThan trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (GreatEqual exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_GreatEqual trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (LessEqual exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_LessEqual trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (Equals exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_Equals trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (NotEquals exp1 exp2) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExpr exp1 temp varList
                                                   (cmd2, trans2, temp2) = translateExpr exp2 temp1 varList
                                                   tempStr = tempToString temp2
                                                   in (cmd1 ++ cmd2 ++ [TAC_Bool_Temp tempStr (TAC_NotEquals trans1 trans2)], TAC_Bool_Var tempStr, temp2 + 1)

translateExprBool (Not exp1) temp varList = let 
                                                   (cmd1, trans1, temp1) = translateExprBool exp1 temp varList
                                                   tempStr = tempToString temp1
                                                   in (cmd1 ++ [TAC_Bool_Temp tempStr (TAC_Not trans1)], TAC_Bool_Var tempStr, temp1 + 1)




