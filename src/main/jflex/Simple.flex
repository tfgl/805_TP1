/* --------------------------Section de Code Utilisateur---------------------*/
package fr.usmb.m1isc.compilation.simple;
import java_cup.runtime.Symbol;

%%

/* -----------------Section des Declarations et Options----------------------*/
// nom de la class a generer
%class SimpleLexer
%unicode
%line   // numerotation des lignes
%column // numerotation caracteres par ligne

// utilisation avec CUP
// nom de la classe generee par CUP qui contient les symboles terminaux
%cupsym SimpleParserSym
// generation analyser lexical pour CUP
%cup

// code a ajouter dans la classe produite
%{

%}

/* definitions regulieres */
chiffre =  [0-9]
neg     =  \-
nombre  =  {neg}?{chiffre}+
add     =  \+
sub     =  \-
div     =  \/
mul     =  \*
mod     =  \%
sep     =  \s
point   =  ";"
lpar    =  "("
rpar    =  ")"
lcom    =  "/*"
rcom    =  "*/"
com     = {lcom}.*{rcom}

%% 
/* ------------------------Section des Regles Lexicales----------------------*/

/* regles */
{sep}+         { /* pas d'action */ }
{com}          {}
{nombre}       { return new Symbol(SimpleParserSym.NOMBRE, yyline, yycolumn, Integer.valueOf( yytext() )); }
{add}          { return new Symbol(SimpleParserSym.ADD, yyline, yycolumn); }
{sub}          { return new Symbol(SimpleParserSym.SUB, yyline, yycolumn); }
{div}          { return new Symbol(SimpleParserSym.DIV, yyline, yycolumn); }
{mul}          { return new Symbol(SimpleParserSym.MUL, yyline, yycolumn); }
{mod}          { return new Symbol(SimpleParserSym.MOD, yyline, yycolumn); }
{lpar}         { return new Symbol(SimpleParserSym.LPAR, yyline, yycolumn); }
{rpar}         { return new Symbol(SimpleParserSym.RPAR, yyline, yycolumn); }
{point}        { return new Symbol(SimpleParserSym.POINT, yyline, yycolumn); }
.              { return new Symbol(SimpleParserSym.ERROR, yyline, yycolumn); }

