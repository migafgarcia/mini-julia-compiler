{
module HappyParser where

import AlexTokens
import TACTranslator
}

%name parse
%tokentype { Token }
%error { parseError }

%token
	INT 														{ TokenInt $$ }
	FLOAT														{ TokenFloat $$ }
	BOOL														{ TokenBool $$ }
	if															{ TokenIf }
	else														{ TokenElse }
	elseif														{ TokenElseIf }
	while														{ TokenWhile }
	end															{ TokenEnd }
	'+'															{ TokenAdd }
	'-'															{ TokenSub }
	'*'															{ TokenMult }
	'/'															{ TokenDiv }
	'^'															{ TokenPower }
	'%'															{ TokenMod }
	'('															{ TokenLPar }
	')'															{ TokenRPar }
	'!'															{ TokenNot }
	'=='														{ TokenEquals }
	'!='														{ TokenNotEquals }
	'<'															{ TokenLessThan }
	'>'															{ TokenGreaterThan }
	'<='														{ TokenLessEqual }
	'>='														{ TokenGreatEqual }
	'='															{ TokenAtrib }
	'\\'														{ TokenReverseDiv }
--	'"'															{ TokenQuotes }
--	','															{ TokenComma }
	println														{ TokenPrintLine }
	STRING														{ TokenString $$ }
	'\n'														{ TokenNewLine }



%left '\n'
%left '+' '-'
%left '*' '/' '\\' '%'
%left '==' '!=' '<' '>' '>=' '<=' '!' '^'
%%

Cmd : STRING '=' Expr 											{ Atrib $1 $3 }
	| STRING '=' ExprBool                                       { AtribBool $1 $3 }
	| while '(' ExprBool ')' Cmd end                            { While $3 $5 }
	| if '(' ExprBool ')' IfSeq end                     		{ If $3 $5}
	| println '(' STRING ')'                                   	{ PrintLine $3 }
	| Expr                               						{ Expression $1 }
	| ExprBool 													{ BoolExpression $1 }
	| Cmd '\n' Cmd 												{ NextCmd $1 $3 }
	| Cmd '\n' 													{$1}


IfSeq : Cmd 													{ Com $1 }
	  | Cmd elseif '(' ExprBool ')' IfSeq						{ ElseIf $1 $4 $6}
	  | Cmd else Cmd 											{ Else $1 $3}

ExprBool : Expr '>' Expr										{ GreaterThan $1 $3 }
		 | Expr '<' Expr                                		{ LessThan $1 $3 }
		 | Expr '>=' Expr                               		{ GreatEqual $1 $3 }
		 | Expr '<=' Expr                              			{ LessEqual $1 $3 }
		 | Expr '==' Expr                               		{ Equals $1 $3 }
		 | Expr '!=' Expr                               		{ NotEquals $1 $3 }
		 | '!' ExprBool                                         { Not $2 }
		 | '(' ExprBool ')'                                     { $2 }
		 | BOOL                                                 { Bool $1 }


Expr : Expr '+' Expr											{ Add $1 $3 }
	 | Expr '-' Expr		       								{ Sub $1 $3 }
	 | Expr '*' Expr                							{ Mult $1 $3 }
	 | Expr '/' Expr                							{ Div $1 $3 }
	 | Expr '\\' Expr               							{ Div $3 $1 }
	 | Expr '%' Expr                							{ Mod $1 $3 }
	 | Expr '^' Expr                							{ Power $1 $3 }
	 | '(' Expr ')'                 							{ $2 }
	 | INT                          							{ Int $1 }
	 | FLOAT                        							{ Float $1 }
	 | STRING 													{ Var $1 }


{

parseError :: [Token] -> a
parseError x = error ("Syntax Error" ++ (show x))

}
