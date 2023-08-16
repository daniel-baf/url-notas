
--------------------------------------------------
 
 USUARIO 1
 
--------------------------------------------------


`START TRANSACTION`
`INSERT INTO Cliente (id nombre, saldo, activo) VALUES (6,"Guillermo", 0, 1)


--------------------------------------------------
 
 USUARIO 2
 
--------------------------------------------------

`SELECT * FROM Cliente;`


hasta que el usuario 1 no ejecute un comando `COMMIT`; el usuario 2 no verá reflejados los valores nuevos. 

## Problemas

1. Lecturas sucias
2. Lecturas no comprometidas
3. Lecturas fantasmas

`TAREA: TRAER UNA DEMOSTRACIÓN DE LOS 3 PROBLEMAS PARA LA PROXIMA CLASE, CON IMAGENES Y PREPARAR UNA PRESENTACIÓN `

Son los problemas que pueden surgir al hacer consultas durante transacciones.
