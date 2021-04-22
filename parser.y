%defines "parser.tab.h"

%{
	#include <cmath>
	#include <cstdio>
	#include <iostream>

	#pragma warning (disable: 4005)
	#define YYERROR_VERBOSE 1
	
	// this function will be generated
	// by flex
	extern int yylex(); // lexical analyzer
	extern int yylineno; // Line number for errors
	 
	 // we have to code this function
	extern void yyerror(const char*);

	using namespace std;
%}

%token MAIN  NOMBRECAMPO  ENTERO  DECIMAL  BOOLEANO  INTGR  DOU  TF  CHR  STR  VOID  ASIGNADOR  SUMA  RESTA  MULTIPLICACION  DIVISION  AUMENTAR  DISMINUIR  MAYOR  MENOR  IGUAL  MAYORIGUAL  MENORIGUAL  DIFERENTE  AND  OR  IF  ELSE  IFELSE  FOR  WHILE  

%start root

%%


root            :       principal funciones | principal | error ;
principal       :       tipodato MAIN '(' ')' '{' instrucciones '}';
instrucciones   :       instrucciones line | line | error | ;
line            :       callmetodo  ';' | declaracion ';' | cambiarvalor ';' | iteracion ;
callmetodo      :       NOMBRECAMPO '(' parametrosenvio ')';
parametrosenvio :       parenvio | ;
parenvio        :       parenvio ',' penvio | penvio;
penvio          :       valor | NOMBRECAMPO ;
valor           :       ENTERO | DECIMAL | BOOLEANO ;
declaracion     :       tipodato NOMBRECAMPO | tipodato NOMBRECAMPO asignarvalor;
tipodato        :       INTGR | DOU | TF | CHR | STR | VOID;
asignarvalor    :       ASIGNADOR operasignacion | ASIGNADOR valor | ASIGNADOR NOMBRECAMPO;
operasignacion  :       aritmetica | callmetodo | incdisvariable;
aritmetica      :       oprcomun | oprcomun oprcomplemento;
oprcomun        :       valor tipoopr valor | valor tipoopr NOMBRECAMPO | NOMBRECAMPO tipoopr valor | NOMBRECAMPO tipoopr NOMBRECAMPO;
tipoopr         :       SUMA | RESTA | MULTIPLICACION | DIVISION;
oprcomplemento  :       oprcomplemento oprcom | oprcom;
oprcom          :       tipoopr valor | tipoopr NOMBRECAMPO;
incdisvariable  :       NOMBRECAMPO indis;
indis           :       AUMENTAR | DISMINUIR;
cambiarvalor    :       NOMBRECAMPO ASIGNADOR cambvalor;
cambvalor       :       valor | operasignacion | NOMBRECAMPO;
iteracion       :       ifcondicion | ciclofor | ciclowhile;
ifcondicion     :       condicionsi | condicionsi condicionno | condicionsi condicionessino condicionno;
condicionsi     :       IF '(' condicion ')' '{' instrucciones '}';
condicion       :       valor condicional valor | valor condicional NOMBRECAMPO | NOMBRECAMPO condicional valor | NOMBRECAMPO condicional NOMBRECAMPO;
condicional     :       MAYOR | MENOR | IGUAL | MAYORIGUAL | MENORIGUAL| DIFERENTE | AND | OR;
condicionno     :       ELSE '{' instrucciones '}';
condicionessino :       condicionessino condicionsino | condicionsino;
condicionsino   :       IFELSE '(' condicion ')' '{' instrucciones '}';
ciclofor        :       FOR '(' iniciarfor ';' condicion ';' incdisvariable ')' '{' instrucciones '}';
iniciarfor      :       tipodato NOMBRECAMPO asignarvalor;
ciclowhile      :       WHILE '(' condicion ')' '{' instrucciones '}';
funciones       :       funciones funcion | funcion;
funcion         :       tiporetorno NOMBRECAMPO '(' parametrosentrada ')' '{' instrucciones '}';
tiporetorno     :       tipodato;
parametrosentrada:      parametrosentrada ',' parametro | parametro;
parametro       :       tipodato NOMBRECAMPO;


%%
