
%{
#include <stdio.h>
#include <string.h>

%}

digito [0-9]
entero {digito}+
entero_neg \-{entero}
mi_nombre [dD][aA][nN][iI][lL][sS][aA]
letra [a-zA-Z]
palabra {letra}+
identificador [a-zA-Z][a-zA-Z0-9]*

%%
[ ]             {printf("Espacio en blanco\n");}
if              { printf("Palabra clave IF\n"); }
else            { printf("Palabra clave ELSE\n"); }
while           { printf("Palabra clave WHERE\n"); }
for             { printf("Palabra clave FOR\n"); }
[+]             { printf("Es el operador de SUMA\n"); }
[-]             { printf("Es el operador de RESTA\n"); }
[*]             { printf("Es el operador de MULTIPLICACION\n"); }
[/]             { printf("Es el operador de DIVISION\n"); }
[>]             { printf("Es el operador MAYOR QUE\n"); }
[<]             { printf("Es el operador MENOR QUE\n"); }
[==]            { printf("Es el operador IGUAL\n"); }
[=]             { printf("Es el signo de ASIGNACION\n"); }
[>][=]          { printf("Es el operador de MAYOR O IGUAL QUE\n"); }
[<][=]          { printf("Es el operador de MENOR O IGUAL QUE\n"); }
[<][3]          { printf("Este es un corazon\n"); }            
{mi_nombre}     { printf("Ese es mi nombre <3 : %s\n", yytext); }
{digito}        { printf("Es un digito: %s\n", yytext); }
{entero}        { printf("Es un entero: %s\n", yytext); }
{entero_neg}    { printf("Es un entero negativo: %s\n", yytext); }
{letra}         { printf("Es una letra: %s\n", yytext); }
{palabra}       { printf("Es una palabra: %s\n", yytext); }
{identificador} { printf("Es un identificador: %s\n", yytext); }
[ \t\n]         { /* Ignorar espacios en blanco y saltos de línea */ }
.         { printf("No reconozco esta expresion\n"); } //El . indica que se deben copiar los demás caracteres como están
%%

int main() {
    yylex(); // Comenzar el análisis léxico
    return 0;
}

//indicar el final del programa
int yywrap() {
    return 1; 
}