#include <AT89X51.H>
void SetupEx0(void);
void main(void)
{		
	SetupEx0();
	while(1);	
}
void SetupEx0(void)
{ 			EA=0;
				IT0=1;
				EX0=1;
				EA=1;
}		
void Ex0Isr(void)
interrupt 0
{				
        P1_0=!P1_0;
}