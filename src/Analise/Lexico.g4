lexer grammar Lexico;

//Palavras reservadas

PROGRAM: 'program';
BEGIN: 'begin';
END: 'end';
WRITE: 'write';

//Booleano
FALSE: 'false';
TRUE: 'true';

//Tipos de Variavéis
VAR: 'var';
INTEGER: 'integer';
BOOLEAN: 'boolean';
STRING: 'string';

//Condicional
IF: 'if';
ELSE: 'else';
THEN: 'then';

//Loop
WHILE: 'while';
DO: 'do';

//Escrita e Leitura
WRITE: 'write';
READ: 'read';

//Operadores Ariméticos

OPAD: '+'|'-';
OPMULT: '*'|'/';

//Operadores relacionais:

OPREL: '<'|'<='|'>'|'>='|'=='|'<>';

//Operadores lógicos

OPLOG: 'OR'|'AND';

//Operador de Negação

OPNEG: '~';

//Símbolos

PVIG: ';';
PONTO: '.';
DPONTOS: ':';
VIG: ',';
ABPAR: '(';
FPAR: ')';
ATRIB: ':=';

//Identificadores

IDENTIFIER: ([a-zA-Z][a-zA-Z0-9]*);

//Constantes;
CTE: [0-9]+;
//Comentários

COMENT: '/' ~('/')* '/';

//Espaços em branco

VAZIO: [\n]-> skip;

//
ERRO:
