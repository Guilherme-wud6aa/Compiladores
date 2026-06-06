lexer grammar Lexico;

 options {
    caseInsensitive = true;
 }

@lexer::members{
    private void erro(){
        throw new RuntimeException(
            "Erro na linha: " + getLine()
        );
    }
}
//Palavras reservadas

PROGRAM: 'program';
BEGIN: 'begin';
END: 'end';

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


//Identificadores e constantes

IDENTIFIER: ([a-zA-Z][a-zA-Z0-9]*){
    if(getText().length() > 16){
        setText(getText().substring(0,16));
    }
};

CTE: [+-]?[0-9]+
{
 int valor = Integer.parseInt(getText());
 if (valor < -32768 || valor > 32767){
    throw new RuntimeException(
    "Erro na linha: " + getLine()
    );
 }
};

//Comentários e Cadeia

COMENT: '/' ~('/')* '/' -> skip;
CADEIA: '"' ~('"')* '"';

//Espaços em branco

VAZIO: [ \t\r\n]+ -> skip;

//Erro e Sucesso
ERRO: .{erro(); };
