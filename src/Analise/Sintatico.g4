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
cmdIf: IF expr THEN cmd (ELSE cmd)?;
cmdWhile: WHILE expr DO cmd;
cmdRead: READ ABPAR listId FPAR;
cmdWrite: WRITE ABPAR listW FPAR;
listW: elemW | elemW VIG listW;
elemW: expr| CADEIA;
cmdAtrib: IDENTIFIER ATRIB expr;
expr: expr OPLOG expr | expr OPREL expr | expr OPAD expr | expr OPMULT expr | ABPAR expr FPAR |valor ;
valor: IDENTIFIER | CTE | ABPAR expr FPAR | TRUE | FALSE | OPNEG valor;