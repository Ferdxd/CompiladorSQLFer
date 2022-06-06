package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%


/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "--"(.)* ) {/*Ignore*/}


/*Delimitador*/
(",") {return new Symbol(sym.Delimitador, yychar, yyline, yytext());}

/*Punto y Coma*/
(";") {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/*Igual*/
("=") {return new Symbol(sym.Igual, yychar, yyline, yytext());}


/*Palabra clave*/
(AND|DO|AS|INTO|USE|GO) {return new Symbol(sym.Palabra_clave, yychar, yyline, yytext());}

("SELECT") {return new Symbol(sym.Select, yychar, yyline, yytext());}

("DELETE") {return new Symbol(sym.Delete, yychar, yyline, yytext());}

("INSERT") {return new Symbol(sym.Insert, yychar, yyline, yytext());}

("UPDATE") {return new Symbol(sym.Update, yychar, yyline, yytext());}

/*FROM*/
("FROM") {return new Symbol(sym.From, yychar, yyline, yytext());}

("SET") {return new Symbol(sym.Set, yychar, yyline, yytext());}

/*WHERE*/
("WHERE") {return new Symbol(sym.Where, yychar, yyline, yytext());}

/*Asterisco*/
("*") {return new Symbol(sym.Asterisco, yychar, yyline, yytext());}


/*VALUES*/
("VALUES") {return new Symbol(sym.Values, yychar, yyline, yytext());}

/*parentesis*/
("("|")") {return new Symbol(sym.Parentesis, yychar, yyline, yytext());}


/*cadena*/
('({L}|{D})') {return new Symbol(sym.Cadena, yychar, yyline, yytext());}


/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.Error, yychar, yyline, yytext());}
