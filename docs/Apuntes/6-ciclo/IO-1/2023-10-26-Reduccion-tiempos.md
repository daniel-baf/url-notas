![[Pasted image 20231026130620.png]]

Podemos enlazar las actividades con el sector normal con las siguientes operaciones.

```
REDUCIR EL TIEMPO DE 12 DIAS A 10 Y CALCULAR EL COSTO

nota: y es la nueva variable que usaremos

MIN Z = 100ya +150yb + 200yc + 150yd + 250ye

S.A.

ecc1. ya <= 3
ecc2. yb <= 1
ecc3. yc <= 2
ecc4. yd <= 2
ecc5. ye <= 1

xa >= <tiempo nodo anterior> + (tiempo actividad a - reduccion en tiempo a)
xa >= 0 + (7 - ya)
ecc6. xa + ya = 7

xc >= 0 + (6 - yc)
ecc7. xc + yc = 6

xb >= xa + (3 - yb)
ecc8. xb - xa + yb >= 3

xd >= xc + (3 - yd)
ecc9. xd - xc + yd >= 3

xe >= (xb) + (2 - ye)
xe >= (xd) + (2 - ye)

ecc10. xe - xb + ye >= 2
ecc11. xe - xd + ye >= 2

ecc12. xe <= 10

ecc13. xi >= 0, i = a, b, c, d, e
ecc14. 
```