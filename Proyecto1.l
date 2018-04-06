%{

#include <stdio.h>


%}

binario     0b[01]+
decimal     ([1-9][0-9]*|0)
octal       0[0-7]+
hexa        0[xX][0-9a-fA-F]+
id          [a-zA-Z_\x7f-\xff][a-zA-Z0-9_\x7f-\xff]*
variable    "$"{id}
booleano    ([Tt][Rr][Uu][Ee]|[Ff][Aa][Ll][Ss][Ee])
lnum        [0-9]+
dnum        ([0-9]*[\.]{lnum})|({lnum}[\.][0-9]*)
exponent_dnum [+-]?(({lnum}|{dnum})[eE][+-]?{lnum})
vector      "["(0|[1-9][0-9]*)"]"

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

[<][?]{p}{h}{p}	                        |
[?][>]		                            {printf("Etiqueta php\n"); }

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
{y}{i}{e}{l}{d}                         {printf("Reservada\n"); }

"="                                     {printf("igual\n"); }
"=="                                    {printf("igualdad\n"); }
[{|}]                                   {printf("llave\n"); }
[(|)]                                   {printf("parentesis\n"); }
[[|]]                                   {printf("corchete\n"); }
[<|>]                                   {printf("comparacion\n"); }

";"                                     {printf("fin_instruccion\n"); }
","                                     {printf("coma\n"); }
"."                                     {printf("punto\n"); } 
":"                                     {printf("dos puntos\n"); }

"+"                                     |
"-"                                     |
"*"                                     |
"/"                                     |
"**"                                    |
"%"                                     {printf("Op aritmetico\n"); }

{a}{n}{d}                               |
{o}{r}                                  |
{x}{o}{r}                               |
"&&"                                    |
"||"                                    |
"!"                                     {printf("op logica\n"); }

{booleano}                              {printf("t bool\n"); }

[+-]?{decimal}                          |
[+-]?{binario}                          |
[+-]?{octal}                            |
[+-]?{hexa}                             {printf("t entero\n"); } 

[+-]?{dnum}                             | 
[+-]?{exponent_dnum}                    {printf("t decimal\n"); } 

"'"(.|r)+"'"                                |
"\"".+"\""                              {printf("cadena\n"); }


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
"$argv"                                 {printf("variable definida\n"); }

{i}{f}                                  {printf("estruct if\n"); }
{e}{l}{s}{e}                            {printf("estruct else\n"); }
{e}{l}{s}{e}{i}{f}                      {printf("estruct elseif\n"); }
{w}{h}{i}{l}{e}                         {printf("estruct while\n"); }
{d}{o}                                  {printf("estruct do\n"); }
{f}{o}{r}                               {printf("estruct for\n"); }
{f}{o}{r}{e}{a}{c}{h}                   {printf("estruct foreach\n"); }
{b}{r}{e}{a}{k}                         {printf("estruct break\n"); }
{s}{w}{i}{t}{c}{h}                      {printf("estruct switch\n"); }
{c}{a}{s}{e}                            {printf("estruct case\n"); }
{i}{n}{c}{l}{u}{d}{e}                   {printf("estruct include\n"); }
{c}{o}{n}{t}{i}{n}{u}{e}                {printf("estruct continue\n"); }
{r}{e}{t}{u}{r}{n}                      {printf("estruct return\n"); }
{f}{u}{n}{c}{t}{i}{o}{n}                {printf("funcion\n"); }

[/][/].+                                |
[/][*](.|\r)+[*][/]                     {printf("comentario\n");} 

{variable}                              {printf("variable\n"); }
{id}{vector}?                           {printf("constante\n"); }


[ \t\n]                 ;
.                       {printf("No reconocido\t\n"); }


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
