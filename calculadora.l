%{
#include "calculadora.tab.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

%}

A 10
B 11
C 12
D 13
E 14
F 15
a 10
b 11
c 12
d 13
e 14
f 15


OCTAL          0[0-7]+
DIGITO        [0-9]
NUMEROE       [-+]?{DIGITO}+
NUMEROD       [-+]?({DIGITO}+\.?{DIGITO}+|{DIGITO}+\.)
HEXADECIMAL 0[xX][0-9a-fA-F]+


%%





{OCTAL}        {yylval.f = octal(atoi(yytext)); return NUM;}
{NUMEROD}      {yylval.f = atof(yytext); return NUM;}
{NUMEROE}      {yylval.f = atof (yytext); return NUM;}
{HEXADECIMAL}  {yylval.f = hexadecimal(yytext); return NUM;}


"+"     {return '+';}
"-"     {return '-';}
"/"     {return '/';}
"*"     {return '*';}
"^"     {return '^';}
"\n"    {return '\n';}
"("     {return '(';}
")"     {return ')';}
%%


//----------CONVERTIDOR DECIMAL A REAL
int decimalAReal(int numeroEntero)
{
    float j = (float) numeroEntero;

    //printf("%f\n",j);
    return j;
}

//----------CONVERTIDOR HEXADECIMAL A DECIMAL
int hexadecimal(char hex[17])
{
 //char hex[17];
 long long decimal, place;
 int i = 0, val, len;

 decimal = 0;
 place = 1;

 //printf("Enter any hexadecimal number: ");
 //gets(hex);

 len = strlen(hex);
 len--;//----------CONVERTIDOR DECIMAL A REAL
int decimalAReal(int numeroEntero)
{
    float j = (float) numeroEntero;


    // printf("%f\n",j);
    return j;
}

 for(i=0; hex[i]!='\0'; i++)
 {

 if(hex[i]>='0' && hex[i]<='9')
 {
 val = hex[i] - 48;
 }
 else if(hex[i]>='a' && hex[i]<='f')
 {
 val = hex[i] - 97 + 10;
 }
 else if(hex[i]>='A' && hex[i]<='F')
 {
 val = hex[i] - 65 + 10;
 }

 decimal += val * pow(16, len);
 len--;
 }

 return decimalAReal(decimal);
}

//----------CONVERTIDOR OCTAL A DECIMAL
long long convertOctalToDecimal(int octalNumber);

int octal(int octalNumber)
{
    // printf("%d in octal = %lld in decimal", octalNumber, convertOctalToDecimal(octalNumber));

    return convertOctalToDecimal(octalNumber);
}

long long convertOctalToDecimal(int octalNumber)
{
    int decimalNumber = 0, i = 0;

    while(octalNumber != 0)
    {
        decimalNumber += (octalNumber%10) * pow(8,i);
        ++i;
        octalNumber/=10;
    }

    i = 1;

    return decimalAReal(decimalNumber);
}


