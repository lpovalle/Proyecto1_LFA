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

{a}{b}{s}{t}{r}{a}{c}{t}                |
{a}{n}{d}                               |
{a}{r}{r}{a}{y}                         |
{a}{s}                                  |
{b}{r}{e}{a}{k}                         |
{c}{a}{l}{l}{a}{b}{l}{e}                |
{c}{a}{s}{e}                            |
{c}{a}{t}{c}{h}                         |
{c}{l}{a}{s}{s}                         |
{c}{l}{o}{n}{e}                         |
{c}{o}{n}{s}{t}                         |
{c}{o}{n}{t}{i}{n}{u}{e}                |
{d}{e}{c}{l}{a}{r}{e}                   |
{d}{e}{f}{a}{u}{l}{t}                   |
{d}{i}{e}                               |
{d}{o}                                  |
{e}{c}{h}{o}                            |
{e}{l}{s}{e}                            |
{e}{l}{s}{e}{i}{f}                      |
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
{f}{o}{r}                               |
{f}{o}{r}{e}{a}{c}{h}                   |
{f}{u}{n}{c}{t}{i}{o}{n}                |
{g}{l}{o}{b}{a}{l}                      |
{g}{o}{t}{o}                            |
{i}{f}                                  |
{i}{m}{p}{l}{e}{m}{e}{n}{t}{s}          |
{i}{n}{c}{l}{u}{d}{e}                   |
{i}{n}{c}{l}{u}{d}{e}[_]{o}{n}{c}{e}    |
{i}{n}{s}{t}{a}{n}{c}{e}{o}{f}          |
{i}{n}{s}{t}{e}{a}{d}{o}{f}             |
{i}{n}{t}{e}{r}{f}{a}{c}{e}             |
{i}{s}{s}{e}{t}                         |
{l}{i}{s}{t}                            |
{n}{a}{m}{e}{s}{p}{a}{c}{e}             |
{n}{e}{w}                               |
{o}{r}                                  |
{p}{r}{i}{n}{t}                         |
{p}{r}{i}{v}{a}{t}{e}                   |
{p}{r}{o}{t}{e}{c}{t}{e}{d}             |
{p}{u}{b}{l}{i}{c}                      |
{r}{e}{q}{u}{i}{e}{r}{e}                |
{r}{e}{q}{u}{i}{e}{r}{e}[_]{o}{n}{c}{e} |
{r}{e}{t}{u}{r}{n}                      |
{s}{t}{a}{t}{i}{c}                      |
{s}{w}{i}{t}{c}{h}                      |
{t}{h}{r}{o}{w}                         |
{t}{r}{a}{i}{t}                         |
{t}{r}{y}                               |
{u}{n}{s}{e}{t}                         |
{u}{s}{e}                               |
{v}{a}{r}                               |
{w}{h}{i}{l}{e}                         |
{x}{o}{r}                               |
{y}{i}{e}{l}{d}                         {printf("Reservada\n"); }

"="                                     {printf("igual\n"); }
[{|}]                                   {printf("llave\n"); }
[(|)]                                   {printf("parentesis\n"); }
[[|]]                                   {printf("corchete\n"); }


"+"                                     |
"-"                                     |
"*"                                     |
"/"                                     |
"**"                                    |
"%"                                     {printf("Op aritmetico\t\n"); }

"&&"                    {printf("op logica\t\n"); }
"!"                     {printf("op logica\t\n"); }

";"                     {printf("fin_instruccion\t\n"); }

{booleano}              {printf("booleano\t\n"); }

[+-]?{decimal}          {printf("entero\t\n"); } 
[+-]?{binario}          {printf("entero\t\n"); } 
[+-]?{octal}            {printf("entero\t\n"); } 
[+-]?{hexa}             {printf("entero\t\n"); } 

[+-]?{dnum}             {printf("decimal\t\n"); } 
[+-]?{exponent_dnum}    {printf("decimal\t\n"); } 

"'".+"'"                {printf("cadena\t\n"); } 
"\"".+"\""              {printf("cadena\t\n"); }

{variable}              {printf("variable\t\n"); }

{id}{vector}?                   {printf("constante\t\n"); }
"define("("'"{id}"'"|"\""{id}"\""),[ ]*("'"[^\n]+"'"|"\""[^\n]+"\"")")"   {printf("constante\t\n"); }







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
