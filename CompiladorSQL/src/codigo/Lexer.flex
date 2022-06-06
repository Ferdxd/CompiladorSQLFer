package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "--"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/*Delimitador*/
(",") {lexeme=yytext(); return Delimitador;}

/*Punto y Coma*/
(";") {lexeme=yytext(); return P_coma;}

/*Igual*/
("=") {lexeme=yytext(); return Igual;}

/*Palabra clave*/
(AND|DO|AS|INTO|USE|GO) {lexeme=yytext(); return Palabra_clave;}

/*VALUES*/
("VALUES") {lexeme=yytext(); return Values;}

/*CRUD*/
("SELECT") {lexeme=yytext(); return Select;}

("DELETE") {lexeme=yytext(); return Delete;}

("INSERT") {lexeme=yytext(); return Insert;}

("UPDATE") {lexeme=yytext(); return Update;}


/*FROM*/
("FROM") {lexeme=yytext(); return From;}

/*FROM*/
("SET") {lexeme=yytext(); return Set;}

/*WHERE*/
("WHERE") {lexeme=yytext(); return Where;}

/*Asterisco*/
("*") {lexeme=yytext(); return Asterisco;}

/*parentesis*/
("("|")") {lexeme=yytext(); return Parentesis;}

/*cadena*/
('({L}|{D})') {lexeme=yytext(); return Cadena;}

/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/* Error de analisis */
 . {return Error;}


