void configurar()
{
 // timer config
 T0CON = 0x68;
 TMR0L = 0xED;
 TMR0H = 0x00;

 // port config
 ADCON1 = 0xFF;
 TRISA = 0x10; // encendido para que sea de entrada
 PORTA = 0x00;
 TRISD = 0x00;
 PORTD = 0x00;

 // interrupciones
 INTCON  = 0xC0;
 INTCON2 = 0x84;
 T0IE_bit = 1; // TIMER0 = 1
 T0CON(7) = 1; // puerto 7
}

void main()
{
 int contador = 0;

     configurar();

     while (1) // while true
     {
      PORTD = T0CON +
     }
}