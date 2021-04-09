package codigo;
import static codigo.Tokens.*;
%%
%class RegrasLex
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
abstract |
assert |
boolean |
break |
byte |
case |
catch |
char |
class |
const |
continue |
default |
do |
double |
else |
enum |
extends |
final |
finally |
float |
for |
goto |
implements |
import |
instanceof |
interface |
long |
native |
new |
package |
private |
protected |
public |
return |
short |
static |
strictfp |
super |
switch |
synchronized |
this |
throw |
throws |
transient |
try |
void |
volatile |
open |
module |
requires |
transitive |
exports |
opens |
to |
uses |
provides |
with |
while {lexeme=yytext(); return Palavra_Reservada;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"/*".*."*/" {/*Ignore*/}
"=" {return Atribuicao;}
"+" {return Adicao;}
"-" {return Subtracao;}
"*" {return Multiplicacao;}
"/" {return Divisao;}
"==" {return Igual;}
"+=" {return Atribuicao_com_adicao;}
">" {return Maior;}
"<" {return Menor;}
"!" {return NOT_Logico;}
"~" {return Complemento;}
"?" {return Ternario;}
">=" {return Maior_Igual;}
"<=" {return Menor_Igual;}
"!=" {return Diferente;}
"&&" {return AND_Logico;}
"||" {return OR_Logico;}
"++" {return Incremento;}
"--" {return Decremento;}
"&" {return AND;}
"|" {return OR;}
"^" {return XOR;}
"%" {return Resto;}
"<<" {return Deslocamento_a_esquerda;}
">>" {return Deslocamento_a_direita;}
">>>" {return Desloc_a_direita_com_zeros;}
"-=" {return Atribuicao_com_subtracao;}
"*=" {return Atribuicao_com_multiplicacao;}
"/=" {return Atribuicao_com_divisao;}
"&=" {return Atribuicao_com_AND;}
"|=" {return Atribuicao_com_OR;}
"^=" {return Atribuicao_com_XOR;}
"%=" {return Atribuicao_com_Resto;}
"<<=" {return Atribuicao_com_desloc_a_esquerda;}
">>=" {return Atribuicao_com_desloc_a_direita;}
">>>=" {return Atribuicao_com_desloc_a_direita_com_zeros;}
"(" {return A_Parenteses;}
")" {return F_Parenteses;}
"{" {return A_Chaves;}
"}" {return F_Chaves;}
"[" {return A_Parenteses_reto;}
"]" {return F_Parenteses_reto;}
";" {return Ponto_e_virgula;}
"," {return Virgula;}
"." {return Ponto;}
"..." {return Separador_3_pontos;}
"@" {return Separador_arroba;}
"::" {return Separador;}
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero_Inteiro;}
("(-"{D}+.{D}+")")|{D}+.{D}+ {lexeme=yytext(); return Numero_Real;}
 . {return ERRO;}
