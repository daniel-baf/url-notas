void configurar() 
{
 // ADCON1 = 0xFF
 TRISD = 0;
 PORTD = 0;
}

void main() 
{
 int contador = 0;

     configurar();
     
     while (1) // while true
     {
      PORTD ++; // esto para hacerlo contador
//      RD0_bit = !RD0_bit; // ENCENDER UN LED
      delay_ms(200);
     }
}