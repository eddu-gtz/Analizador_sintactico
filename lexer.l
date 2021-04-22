

%top{ 
	
	#pragma warning (disable: 4005)

	#include <iostream>
	#include <cmath>

	using namespace std;

	#include "parser.tab.h"

}

%option noyywrap
%option yylineno

ignore [\n\t\r\f" "]+


boolean (true|false)

num [0-9]+
real ([0-9]+)|([0-9]*\.[0-9]+)
identificador [a-z]([a-zA-Z]|[0-9]|_)*

%%


{ignore}            { }
"."                 {printf("\n\tToken: .");		return ('.');}
"{"                 {printf("\n\tToken: {");		return ('{');}
"}"                 {printf("\n\tToken: }");		return ('}');}
";"                 {printf("\n\tToken: ;");		return (';');}
","                 {printf("\n\tToken: ,");		return (',');}
"("                 {printf("\n\tToken: (");		return ('(');}
")"                 {printf("\n\tToken: )");		return (')');}
"if"                {printf("\n\tToken: if");		return IF;}
"elseif"            {printf("\n\tToken: elseif");	return IFELSE;}
"else"              {printf("\n\tToken: else");		return ELSE;}
"main"              {printf("\n\tToken: Main");		return MAIN;}
"int"               {printf("\n\tToken: int");		return INTGR;}
"double"            {printf("\n\tToken: double");	return DOU;}
"bool"              {printf("\n\tToken: bool");		return TF;}
"string"            {printf("\n\tToken: string");	return STR;}
"char"				{printf("\n\tToken: char");		return CHR;}
"void"				{printf("\n\tToken: void");		return VOID;}
"for"               {printf("\n\tToken: for");		return FOR;}
"while"             {printf("\n\tToken: While");	return WHILE;}
"+"                 {printf("\n\tToken: +");		return SUMA;}
"-"                 {printf("\n\tToken: -");		return RESTA;}
"*"                 {printf("\n\tToken: *");		return MULTIPLICACION;}
"/"                 {printf("\n\tToken: /");		return DIVISION;}
"++"                {printf("\n\tToken: ++");		return AUMENTAR;}
"--"                {printf("\n\tToken: --");		return DISMINUIR;}
"="                 {printf("\n\tToken: =");		return ASIGNADOR;}
">"                 {printf("\n\tToken: >");		return MAYOR;}
"<"                 {printf("\n\tToken: <");		return MENOR;}
"=="                {printf("\n\tToken: ==");		return IGUAL;}
">="                {printf("\n\tToken: >=");		return MAYORIGUAL;}
"!="                {printf("\n\tToken: !=");		return DIFERENTE;}
"<="                {printf("\n\tToken: <=");		return MENORIGUAL;}
"&&"                {printf("\n\tToken: &&");		return AND;}
"||"                {printf("\n\tToken: ||");		return OR;}
{num}               {printf("\n\tToken: Entero:  ");	ECHO;	return ENTERO;}
{real}              {printf("\n\tToken: Real:  ");		ECHO;	return DECIMAL;}
{boolean}           {printf("\n\tToken: Boolean:  ");	ECHO;	return BOOLEANO;}
{identificador}     {printf("\n\tToken: Identificador:  ");	ECHO;	return NOMBRECAMPO;}

.                   {printf("\n\tError lexico: Caracter '"); ECHO; printf("' en la linea: %d", yylineno);}
