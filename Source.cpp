#include <iostream>
#include <stdlib.h>

#include "parser.tab.h"

using namespace std;

// this function is called syntax parser
// just the parser, the parse
extern int yyparse();
extern int yylineno; // Line number for errors

extern FILE* yyin;

bool status = true;

void main(int argc, char* argv[])
{
    FILE* fp;
    errno_t err;

    err = fopen_s(&fp, "myfile.txt", "r");
    if (err == 0) {
        yyin = fp;

        cout << "\n------- Analizador lexico y sintactico ------- " << endl << endl;

        yyparse();

        if (status) {
            cout << endl << "\n------- Analizador Sintactico ------- " << endl << endl;
            cout << "\tEl analisis fue exitoso" << endl;
        }
        else {
            cout << endl << "\n------- Analizador Sintactico ------- " << endl << endl;
            cout << "\tEl analizador detecto un error" << endl;
        }
    }
    else
        cout << "\nNo se pudo abrir el archivo" << endl;
   
    cout << endl;
    system("pause");

}

// we have to code this function
void yyerror(const char* msg)
{
	cout << endl <<"\n\t* Error: " << msg << " in line " << yylineno << " *" << endl;
    status = false;
}