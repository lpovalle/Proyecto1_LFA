#include <stdio.h>
#include <string.h>
#include "miniPHP.h"

extern int yylex();
extern int yylineno;
extern char* yytext;
extern FILE* yyin;

char* token_name(int ntoken)
{
	switch(ntoken)
	{
		case 1:
			return "Palabra Reservada";
		case 2:
			return "Operador Logico";
		case 3:
			return "Operador Aritmetica";
		case 4:
			return "Tipo Logico";
		case 5:
			return "Tipo Entero";
		case 6:
			return "Tipo Real";
		case 7:
			return "Tipo Cadena";
		case 8:
			return "Identificador";
		case 9:
			return "Variable";
		case 10:
			return "Constante";
		case 11:
			return "Estructura de Control";
		case 12:
			return "Variable Definida";
		case 13:
			return "Funcion";
		case 14:
			return "Comentario";
		case 15:
			return "Simbolo Igual";
		case 16:
			return "Simbolo de Llave";
		case 17:
			return "Simbolo de Parentesis";
		case 18:
			return "Simbolo de Corchete";
		case 19:
			return "Final de Instruccion";
		case 20:
			return "Simbolo de Punto";
		case 21:
			return "Simbolo de Doble Punto";
		case 22:
			return "Etiqueta PHP";
		case 23:
			return "Simbolo de Igualdad";
		case 24:
			return "Simbolo de mayor/menor que";
		case 25:
			return "Simbolo de Coma";
		case 26:
			return "Variable Base de Datos";
		case 27:
			return "Campo Base de Datos";

		default:
			return "";
	}
}
int main(void) 
{
	printf("Porfavor ingrese el nombre del archivo que desea analizar \r\n");

	char inputFile[100];
	char* outputFile;
	FILE* inFile;
	FILE* outFile;

	scanf("%s", inputFile);

	//Definir archivo de entrada
	if (!(inFile = fopen(inputFile, "r")))
	{
		printf("Error al intentar abrir el archivo especificado");
		getchar();
		return (0);
	}
	//Definir archivo de salida
	outputFile = strcat(strtok(inputFile,"."), ".out");
	if (!(outFile = fopen(outputFile, "w")))
	{
		printf("Error al intentar crear el archivo de salida");
		getchar();
		return (0);
	}

	//Establecer archivo de entrada para yylex()
	yyin = inFile;

	int ntoken;

	ntoken = yylex();
	while(ntoken) {

		if(ntoken >= 0) 
		{
			printf("%s => %s\n", yytext, token_name(ntoken));
		}
		switch (ntoken)
		{
			case -1: //Error
				printf("--------------------Token '%s' no reconocido en linea %d --------------------\n", yytext, yylineno);
			break;
			case 1:	//Palabra reservada
			case 11: //Estructura de control
				fprintf(outFile, "%s\n", strlwr(yytext));
			break;
			case 27: //Campo de base de datos
				fprintf(outFile, "%s", strupr(yytext));
			break;
			default: //Cualquier otro token válido
				fprintf(outFile, "%s\n", yytext);
		}
		
		ntoken = yylex();
	}

	fclose(inFile);
	fclose(outFile);
	getchar();
	return 0;
}
