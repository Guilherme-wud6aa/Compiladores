lexer grammar Lexico;

@lexer::members{
    private void erro(){
        throw new RuntimeException(
            "Erro na linha: " + getLine()
        )
    }

    private void sucesso(){
    for(n in tokens){
        System.out.println("Token" + getText())
        System.out.println("Tipo" + getType())
        System.out.println("Valor" + getValue())
        }
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
    if(getText().length > 16){
        setText(getText().substring(0,16));
    }
};

CTE: [+-]?[0-9]+
{
 int valor = Integer.parseInt(getText());
 if (valor <-37268 && valor > 32767){
    throw new RunTimeException(
    "Erro na linha: " + getLine()
    )
 }
};

//Comentários e Cadeia

COMENT: '/' ~('/')* '/';
CADEIA: '"' ~('"')* '"';

//Espaços em branco

VAZIO: [ \n]+ -> skip;

//Erro e Sucesso
ERRO: .{erro()} ;

SUCESSO: END {sucesso()};
