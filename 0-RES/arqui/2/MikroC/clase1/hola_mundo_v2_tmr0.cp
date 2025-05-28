#line 1 "C:/Users/danib/OneDrive - Universidad Rafael Landivar/Documentos/Obsidian/url-notas/docs/0-RES/arqui/2/MikroC/clase1/hola_mundo_v2_tmr0.c"
void configurar()
{

 T0CON = 0x68;
 TMR0L = 0xED;
 TMR0H = 0x00;


 ADCON1 = 0xFF;
 TRISA = 0x10;
 PORTA = 0x00;
 TRISD = 0x00;
 PORTD = 0x00;


 INTCON = 0x84;
 INTCON2 = 0x84;
 T0IE_bit = 1;

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
