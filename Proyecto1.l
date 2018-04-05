%{

    #include<stdio.h>

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

%%

"__halto_compiler()"    {printf("Reservada\t\n"); }
"abstract"              {printf("Reservada\t\n"); }
"and"                   {printf("Reservada\t\n"); }
"array()"               {printf("Reservada\t\n"); }
"as"                    {printf("Reservada\t\n"); }
"break"                 {printf("Reservada\t\n"); }
"callable"              {printf("Reservada\t\n"); }
"case"                  {printf("Reservada\t\n"); }
"catch"                 {printf("Reservada\t\n"); }
"class"                 {printf("Reservada\t\n"); }
"clone"                 {printf("Reservada\t\n"); }
"const"                 {printf("Reservada\t\n"); }
"continue"              {printf("Reservada\t\n"); }
"declare"               {printf("Reservada\t\n"); }
"default"               {printf("Reservada\t\n"); }
"die()"                 {printf("Reservada\t\n"); }
"do"                    {printf("Reservada\t\n"); }
"echo"                  {printf("Reservada\t\n"); }
"else"                  {printf("Reservada\t\n"); }
"elseif"                {printf("Reservada\t\n"); }
"empty()"               {printf("Reservada\t\n"); }
"enddeclare"            {printf("Reservada\t\n"); }
"endfor"                {printf("Reservada\t\n"); }
"endforeach"            {printf("Reservada\t\n"); }
"endif"                 {printf("Reservada\t\n"); }
"endswitch"             {printf("Reservada\t\n"); }
"endwhile"              {printf("Reservada\t\n"); }
"eval()"                {printf("Reservada\t\n"); }
"exit()"                {printf("Reservada\t\n"); }
"extends"               {printf("Reservada\t\n"); }
"final"                 {printf("Reservada\t\n"); }
"finally"               {printf("Reservada\t\n"); }
"for"                   {printf("Reservada\t\n"); }
"foreach"               {printf("Reservada\t\n"); }
"function"              {printf("Reservada\t\n"); }
"global"                {printf("Reservada\t\n"); }
"goto"                  {printf("Reservada\t\n"); }
"if"                    {printf("Reservada\t\n"); }
"implements"            {printf("Reservada\t\n"); }
"include"               {printf("Reservada\t\n"); }
"include_once"          {printf("Reservada\t\n"); }
"instanceof"            {printf("Reservada\t\n"); }
"insteadof"             {printf("Reservada\t\n"); }
"interface"             {printf("Reservada\t\n"); }
"isset()"               {printf("Reservada\t\n"); }
"list()"                {printf("Reservada\t\n"); }
"namespace"             {printf("Reservada\t\n"); }
"new"                   {printf("Reservada\t\n"); }
"or"                    {printf("Reservada\t\n"); }
"print"                 {printf("Reservada\t\n"); }
"private"               {printf("Reservada\t\n"); }
"protected"             {printf("Reservada\t\n"); }
"public"                {printf("Reservada\t\n"); }
"requiere"              {printf("Reservada\t\n"); }
"requiere_once"         {printf("Reservada\t\n"); }
"return"                {printf("Reservada\t\n"); }
"static"                {printf("Reservada\t\n"); }
"switch"                {printf("Reservada\t\n"); }
"throw"                 {printf("Reservada\t\n"); }
"trait"                 {printf("Reservada\t\n"); }
"try"                   {printf("Reservada\t\n"); }
"unset()"               {printf("Reservada\t\n"); }
"use"                   {printf("Reservada\t\n"); }
"var"                   {printf("Reservada\t\n"); }
"while"                 {printf("Reservada\t\n"); }
"xor"                   {printf("Reservada\t\n"); }
"yield"                 {printf("Reservada\t\n"); }
"$this"                 {printf("Variable que no puede ser asignada\t\n");}
"=="                    {printf("igual\t\n"); }
"="                     {printf("igual\t\n"); }

"+"                     {printf("Op aritmetica\t\n"); }
"-"                     {printf("Op aritmetica\t\n"); }
"*"                     {printf("Op aritmetica\t\n"); }
"/"                     {printf("Op aritmetica\t\n"); }
"**"                    {printf("Op aritmetica\t\n"); }
"%"                     {printf("Op aritmetica\t\n"); }

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