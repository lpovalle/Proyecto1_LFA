@ECHO OFF

flex miniPHP.l
gcc miniPHP.c lex.yy.c -o miniPHP
ECHO miniPHP compilado con exito
miniPHP
PAUSE