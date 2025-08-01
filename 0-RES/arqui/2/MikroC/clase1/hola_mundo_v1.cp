#line 1 "C:/Users/danib/OneDrive - Universidad Rafael Landivar/Documentos/Obsidian/url-notas/docs/0-RES/arqui/2/MikroC/clase1/hola_mundo_v1.c"
void configurar()
{

 TRISD = 0;
 PORTD = 0;
}

void main()
{
 int contador = 0;

 configurar();

 while (1)
 {
 PORTD ++;

 delay_ms(200);
 }
}
