parser grammar Sintatico;

options{
    caseInsensitive = true;
    tokenVocab = Lexico;
}

prog: PROGRAM IDENTIFIER PVIG decls cmdComp PONTO;
decls: | VAR listDecl;
listDecl: declTip | declTip listDecl;
declTip: listId DPONTOS tip PVIG;
listId: IDENTIFIER | IDENTIFIER VIG listId;
tip: INTEGER | BOOLEAN | STRING;
cmdComp: BEGIN listCmd END;
listCmd: cmd | cmd PVIG listCmd;
cmd: cmdIf | cmdWhile | cmdRead | cmdWrite | cmdAtrib | cmdComp;
cmdIf: IF expr THEN cmd| IF expr THEN cmd ELSE cmd;
cmdWhile: WHILE expr DO cmd;
cmdRead: READ ABPAR listId FPAR PVIG;
cmdWrite: WRITE ABPAR listW FPAR PVIG;
listW: elemW | elemW VIG listW;
elemW: expr| CADEIA;
cmdAtrib: IDENTIFIER ATRIB expr;
expr: expr OPREL expr| expr OPAD expr | expr OPMULT expr | valor ;
valor: IDENTIFIER | CTE | ABPAR expr FPAR|  TRUE | FALSE | OPNEG valor| CADEIA;