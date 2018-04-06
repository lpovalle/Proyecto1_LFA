%{

#include <stdio.h>
#include "miniPHP.h"

%}

%start db
binario                                 0b[01]+
decimal                                 ([1-9][0-9]*|0)
octal                                   0[0-7]+
hexa                                    0[xX][0-9a-fA-F]+
id                                      [a-zA-Z_][a-zA-Z0-9_]*
variable                                "$"{id}
booleano                                ([Tt][Rr][Uu][Ee]|[Ff][Aa][Ll][Ss][Ee])
lnum                                    [0-9]+
dnum                                    ([0-9]*[\.]{lnum})|({lnum}[\.][0-9]*)
exponent_dnum                           [+-]?(({lnum}|{dnum})[eE][+-]?{lnum})

a [aA]
b [bB]
c [cC]
d [dD]
e [eE]
f [fF]
g [gG]
h [hH]
i [iI]
j [jJ]
k [kK]
l [lL]
m [mM]
n [nN]
o [oO]
p [pP]
q [qQ]
r [rR]
s [sS]
t [tT]
u [uU]
v [vV]
w [wW]
x [xX]
y [yY]
z [zZ]

%%

"$"{r}{e}{c}{o}{r}{d}{s}{e}{t}          { BEGIN db; return basedatos;}
<db>{id}                                return campo_db;
<db>"]"                                 {BEGIN 0; return corchete;}

[<][?]{p}{h}{p}	                        |
[?][>]		                            return php_etiqueta;

{a}{b}{s}{t}{r}{a}{c}{t}                |
{a}{r}{r}{a}{y}                         |
{a}{s}                                  |
{c}{a}{l}{l}{a}{b}{l}{e}                |
{c}{a}{t}{c}{h}                         |
{c}{l}{a}{s}{s}                         |
{c}{l}{o}{n}{e}                         |
{d}{e}{c}{l}{a}{r}{e}                   |
{d}{e}{f}{a}{u}{l}{t}                   |
{d}{i}{e}                               |
{e}{c}{h}{o}                            |
{e}{m}{p}{t}{y}                         |
{e}{n}{d}{d}{e}{c}{l}{a}{r}{e}          |
{e}{n}{d}{f}{o}{r}                      |
{e}{n}{d}{f}{o}{r}{e}{a}{c}{h}          |
{e}{n}{d}{i}{f}                         |
{e}{n}{d}{s}{w}{i}{t}{c}{h}             |
{e}{n}{d}{w}{h}{i}{l}{e}                |
{e}{v}{a}{l}                            |
{e}{x}{i}{t}                            |
{e}{x}{t}{e}{n}{d}{s}                   |
{f}{i}{n}{a}{l}                         |
{f}{i}{n}{a}{l}{l}{y}                   |
{g}{l}{o}{b}{a}{l}                      |
{g}{o}{t}{o}                            |
{i}{m}{p}{l}{e}{m}{e}{n}{t}{s}          |
{i}{n}{c}{l}{u}{d}{e}[_]{o}{n}{c}{e}    |
{i}{n}{s}{t}{a}{n}{c}{e}{o}{f}          |
{i}{n}{s}{t}{e}{a}{d}{o}{f}             |
{i}{n}{t}{e}{r}{f}{a}{c}{e}             |
{i}{s}{s}{e}{t}                         |
{l}{i}{s}{t}                            |
{n}{a}{m}{e}{s}{p}{a}{c}{e}             |
{n}{e}{w}                               |
{p}{r}{i}{n}{t}                         |
{p}{r}{i}{v}{a}{t}{e}                   |
{p}{r}{o}{t}{e}{c}{t}{e}{d}             |
{p}{u}{b}{l}{i}{c}                      |
{r}{e}{q}{u}{i}{e}{r}{e}                |
{r}{e}{q}{u}{i}{e}{r}{e}[_]{o}{n}{c}{e} |
{s}{t}{a}{t}{i}{c}                      |
{t}{h}{r}{o}{w}                         |
{t}{r}{a}{i}{t}                         |
{t}{r}{y}                               |
{u}{n}{s}{e}{t}                         |
{u}{s}{e}                               |
{v}{a}{r}                               |
{y}{i}{e}{l}{d}                         return p_reservada;

"="                                     return igual;
"=="                                    return igualdad;
[{|}]                                   return llave;
[(|)]                                   return parentesis;
[[|]]                                   return corchete;
[<|>]                                   return comparacion;

[/][/].+                                |
[/][*](.|\r)+[*][/]                     return comentario; 

";"                                     return f_instruccion;
","                                     return coma;
"."                                     return punto; 
":"                                     return dospuntos;

"+"                                     |
"-"                                     |
"*"                                     |
"/"                                     |
"**"                                    |
"%"                                     return o_aritmetico;

{a}{n}{d}                               |
{o}{r}                                  |
{x}{o}{r}                               |
"&&"                                    |
"||"                                    |
"!"                                     return o_logico;

{booleano}                              return t_logico;

[+-]?{decimal}                          |
[+-]?{binario}                          |
[+-]?{octal}                            |
[+-]?{hexa}                             return t_entero; 

[+-]?{dnum}                             | 
[+-]?{exponent_dnum}                    return t_real; 

"'"(.|\r)*"'"                           |
"\"".*"\""                              return t_cadena;


"$GLOBALS"                              |
"$_SERVER"                              | 
"$_GET"                                 |
"$_POST"                                |
"$_FILES"                               |
"$_REQUEST"                             |
"$_SESSION"                             |
"$_ENV"                                 |
"$_COOKIE"                              |
"$php_errormsg"                         |
"$HTTP_RAW_POST_DATA"                   |
"$http_response_header"                 |
"$argc"                                 |
"$argv"                                 return v_definida;

{i}{f}                                  |
{e}{l}{s}{e}                            |
{e}{l}{s}{e}{i}{f}                      |
{w}{h}{i}{l}{e}                         |
{d}{o}                                  |
{f}{o}{r}                               |
{f}{o}{r}{e}{a}{c}{h}                   |
{b}{r}{e}{a}{k}                         |
{s}{w}{i}{t}{c}{h}                      |
{c}{a}{s}{e}                            |
{i}{n}{c}{l}{u}{d}{e}                   |
{c}{o}{n}{t}{i}{n}{u}{e}                |
{r}{e}{t}{u}{r}{n}                      return e_control;

{f}{u}{n}{c}{t}{i}{o}{n}                return funcion;

{variable}                              return variable;
{id}                                    return constante;

[ \t\n]                                 ;
.                                       return NO_RECONOCIDO;


%%

int yywrap()
{
    return 1;
}
int main(void)
{
    yylex();
    return 0;
}
