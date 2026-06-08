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
listCmd: cmd | cmd listCmd;
cmd: cmdIf | cmdWhile | cmdRead | cmdWrite | cmdAtrib | cmdComp;
cmdIf: IF ABPAR expr FPAR THEN ABCHAV listCmd FCHAV (ELSE ABCHAV listCmd FCHAV)?;
cmdWhile: WHILE ABPAR expr FPAR DO ABCHAV listCmd FCHAV ;
cmdRead: READ ABPAR listId FPAR PVIG;
cmdWrite: WRITE ABPAR listW FPAR PVIG;
listW: elemW | elemW VIG listW;
elemW: expr| CADEIA;
cmdAtrib: IDENTIFIER ATRIB expr PVIG;
expr: expr OPLOG expr | expr OPREL expr | expr OPAD expr | expr OPMULT expr | ABPAR expr FPAR |valor ;
valor: IDENTIFIER | CTE | TRUE | FALSE | OPNEG valor;