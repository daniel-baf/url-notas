EJEMPLOS DE ANÁLISIS LÉXICO

```fortran
DO 5 I = 1,25
```

Fortran tiene las siguiente reglas
- Los espacios en blanco son insignificantes

```fortran
DO 5 I = 1,25
! DO 5 //I=1,25
! 5

DO 5 I = 1.25

! 
```

Los objetivos del análisis léxico tienen como objetivo particionar la cadena, esto es implementado en un programa scanner que lee de izquierda a derecha reconociendo un token a la vez.

Algunas veces será necesaria hacer un **LOOKAHEAD** para cambiar de contexto.

# LEX

```lex
%%
	[a-zA-Z]+                                         return (id);
	[0-9]+(\.[0-9]+)?([eE][0-9]+(\.[0-9]+)?)?         return(num);
	"*"                                               return(mul);
	"+"                                               return(sum);
	\n                                                return(intro);
	.                                                 ;
%%
```

# EJERCICIOS

1. El lenguaje C de todas las cadenas que contienen la cadena ba

LAN = {a,b}

` (a|b)* ab (a|b)* `

2. Expresión regular para números enteros

```
[0-9]+
[0-9][1-9]*
([1-9][0-9]*)|0
```

3. EJERCICIOS

```
# El lenguaje A de todas las cadenas que comienzan con b sobre {a,b}

b(a|b)*

# El lenguaje B de todas las cadenas que contienen la cadena ba sobre {a,b}

(a|b)*ba(a|b)*

# El lenguaje C de todas las cadenas que comienzan con b y terminan con a sobre {a,b}

b(a|b)*a

# El lenguaje D de todas las cadenas que contienen un número par de símbolos sobre {a,b}

((a|b)(a|b))*

# El lenguaje E sobre todas las cadenas que contiene un número par de 0 sobre {1,0}

x`(1*01*0)*1*
```