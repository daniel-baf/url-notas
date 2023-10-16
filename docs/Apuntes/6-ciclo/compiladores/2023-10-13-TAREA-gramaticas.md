# Gramáticas independientes del contexto

## WHILE

### Go

**EJEMPLOS DE POSIBLES FOR**

No existe una sintaxis `while ()...` para go, únicamente loops for, así que la sintaxis de esta, esta en la sección del for.

**PROPUESTA DE GRAMÁTICA**

No existe una sintaxis `while ()...` para go, únicamente loops for, así que la sintaxis de esta, esta en la sección del for.
### Java

```Java
while (myId) {
	// ...
}

while (i < 10) {

}

int j = 0;
do {

} while(j < 5);
```

PROPUESTA DE GRAMÁTICA

```flex
e         : epsilon


while_stmt         -> "while" "(" while_bool ")" "{" statements "}"
					| "do" "{" statements "}" "while" "(" while_bool ")"
while_bool         -> vals
					| vals cmp_sgn vals
vals               -> id
					| "true"
					| "false"
					| <number> // cualquier digito posible
cmp_sgn            -> "<"
					| "<="
					| ">"
					| ">="
					| "=="
statements         -> statements statement
					| statement

statement          -> // cualquier sentencia de un bloque de codigo
					  // incluido el mismo while_stmt
					| e
```

### Python

```Python
while True:
	# code
	

while my_condition:
	# code
	

while i < 21:
	# code
	
else:
	# code
	
```

PROPUESTA DE GRAMÁTICA

```flex
e         : epsilon
JL        : salto de linea

while_stmt         -> "while" while_bool ":" JL statements JL
					| "while" while_bool ":" JL 
						statements JL "else" ":" JL statements JL
while_bool         -> vals
					| vals cmp_sgn vals
vals               -> id
					| "True"
					| "False"
					| <number> // cualquier digito posible
cmp_sgn            -> "<"
					| "<="
					| ">"
					| ">="
					| "=="
statements         -> statements statement
					| statement

statement          -> // cualquier sentencia de un bloque de codigo
					  // incluido el mismo while_stmt
					| e
```

## FOR

### Go

EJEMPLOS DE POSIBLES FOR

```Go
// EJEMPLO FOR EN GO
for i < 5 {
	// ...
}

for {
	// ...
}

for i, v := range items {
	// ...
}

for k, v := range m {
	// ...
}

for i := 0; i < 2; i++ {
	// ...
}
```

PROPUESTA DE GRAMÁTICA

```flex
I  : initialization
C  : condition
P  : postcondition
CB : code block 
W  : while
e  : epsilon

nota: CB puede generar cualquier otra sentencia, incluso un mismo for, pero para mantener el ejercicio pequeño, supondré que CB produce 2 unicas cosas.

W           -> "for" for_expr "{" statements "}"
for_expr    -> for_condit
			 | for_iterator
			 | for_range
for_cond    -> expression
for_iter    -> id
			 | id assign_oper expression
			 | id assign_oper expression "," id assign_oper expression
for_range   -> id "," id ":=" "range" expression
statements  -> statement
			 | statements statement
statement   -> id
			 | literal
			 | e
expression  -> simple_expr
			 | expression operator statement
operator    -> "+" 
			 | "-"
			 | "*"
			 | "/"
			 | "<"
			 | ">"
			 | "<="
			 | ">="
			 | "=="
			 | ":="
literal     -> number
			 | string
			 | boolean
number      ->  // cualquier numero, algun regex para numeros
NOTA: statement puede ser cualquier sentencia de codigo, if, while... el mismo for
```

### Java

EJEMPLOS DE POSIBLES FOR

```java
// EJEMPLOS
for (int i = 0; i < 5; i++) {
	// ...
}

String[] data = []{"hola", "pato", "adios"};
for (String a : myArray) {
	// ...
}

```

PROPUESTA DE GRAMÁTICA

```flex
id    : identifier
digit : cualquier tipo de numero
e     : epsilon

for              -> "for" "(" conditional ")" "{" statements "}"
conditional      ->   typeO id "=" <digit> ";" id cmp_sgn <digit> ";" id icdc_sgn
					| typeO id ":" "id"
typeO            ->   "int"
					| "float"
					| "double"
cmp_sgn          ->   "<"
					| "<="
					| ">"
					| ">="
					| "=="
icdc_sgn         ->   "--"
					| "++"
statements       ->   statement
					| statements statement
statement        ->   if_statement
					| while_statement
					| ... cualquier otra sentencia de codigo
					| for   <- statement haria recursiva la gramatica
					| e
```

### Python

EJEMPLOS DE POSIBLES FOR

```python

for my_var in my_secuence:
	# block code

for _key, _value in dictionary.items():
	# block code

for i in range(_start, _end, _steps):
	# block code

for i in range(_start, _end):
	# block code

```

PROPUESTA DE GRAMÁTICA

```flex
JL        : salto de linea

for_stmt       -> "for" iter_val "in" vct_trough ":" JL statements JL
iter_val       -> id
				| id "," id
vct_trough     -> id
				| "range" "(" rng_cmp ")"
rng_cmp        -> itm_val
				| itm_val "," itm_val
				| itm_val "," itm_val "," itm_val
itm_val        -> numero
				| id
statements     -> statements statement
				| statement
statement      -> ... cualquier sentencia incluido el mismo for

```

## IF

### Go

```Go
if condition

{

 // statements...

}
```

PROPUESTA DE GRAMÁTICA

```flex
id    : identifier
digit : cualquier tipo de número
e     : epsilon
 

if           -> if condition "{" statements "}"
condition    -> exp cmp_operator exp
cmp_operator ->   "=="
                | "!="
                | ">"
                | "<"
                | ">="
                | "<="
exp          ->   id
                | digit
statements   ->   if_tatement
                | while_statement
                | ... cualquier otra sentencia de código
                | e
```

### Java

```Java

if (condition) {
    // statements...
}
```

PROPUESTA DE GRAMÁTICA

```flex
id    : identifier
digit : cualquier tipo de número
e     : epsilon

if           -> if "(" condition ")" "{" statements "}"
condition    -> exp cmp_operator exp
cmp_operator ->   "=="
                | "!="
                | ">"
                | "<"
                | ">="
                | "<="
exp          ->   id
                | digit
statements   ->   if_tatement
                | while_statement
                | ... cualquier otra sentencia de código
                | e
```

### Python


```Python
if condition:

    # statements...
```

PROPUESTA DE GRAMÁTICA

```flex

id    : identifier
digit : cualquier tipo de número
e     : epsilon
  
if           -> if condition: statements
condition    -> exp cmp_operator exp
cmp_operator ->   "=="
                | "!="
                | ">"
                | "<"
                | ">="
                | "<="
exp          ->   id
                | digit
statements   ->   if_tatement
                | while_statement
                | ... cualquier otra sentencia de código
                | e
```