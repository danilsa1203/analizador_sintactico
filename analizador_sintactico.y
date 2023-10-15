%{
#include <stdio.h>
%}

%token PalabraClaveIF
%token PalabraClaveELSE
%token PalabraClaveWHILE
%token PalabraClaveFOR
%token Identificador
%token Entero
%token OperadorSuma
%token OperadorResta
%token OperadorMultiplicacion
%token OperadorDivision
%token OperadorMayorQue
%token OperadorMenorQue
%token OperadorIgual
%token OperadorAsignacion

%%

programa: sentencias
       ;

sentencias: sentencia
          | sentencias sentencia
          ;

sentencia: sentencia_if
         | sentencia_while
         | sentencia_for
         | sentencia_asignacion
         | expresion
         ;

sentencia_if: PalabraClaveIF '(' expresion ')' sentencia
           | PalabraClaveIF '(' expresion ')' sentencia PalabraClaveELSE sentencia
           ;

sentencia_while: PalabraClaveWHILE '(' expresion ')' sentencia
              ;

sentencia_for: PalabraClaveFOR '(' sentencia_asignacion ';' expresion ';' sentencia_asignacion ')' sentencia
             ;

sentencia_asignacion: Identificador OperadorAsignacion expresion
                   ;

expresion: expresion OperadorSuma expresion
         | expresion OperadorResta expresion
         | expresion OperadorMultiplicacion expresion
         | expresion OperadorDivision expresion
         | expresion OperadorMayorQue expresion
         | expresion OperadorMenorQue expresion
         | expresion OperadorIgual expresion
         | '(' expresion ')'
         | Identificador
         | Entero
         ;

%%



int main() {
    yyparse(); // Comenzar el análisis sintáctico
    return 0;
}
//indicar el final del programa
int yywrap() {
    return 1; 
}
