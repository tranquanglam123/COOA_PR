#include <at89x51.h>
//tao do tre chinh xac su dung Timer
void delay_hardware_50ms(){
	TMOD=TMOD	&	0xF0;//Xoa thiet lap Timer0
	TMOD=TMOD	/	0x01;
ET0=0;//Khong phat sinh ngat
TH0=0x3C;//Thiet lap gia tri khoi dau la 3CB0		
TL0=0xB0;//Tuong duong 15536 he 10
TF0=0; //Xoa co tran timer	
TR0=1; //Khoi dong timer	
while(TF0==0);//Cho den khi tran
TR0=0; //Dung timer	0
}
//Chuong trinh tao tre chinh xac	
void delay_hardware_1s(){
int i;
for(i=0;i<20;i++){delay_hardware_50ms();}
}
void main()
{
while(1)
{
P1=0xAA;
delay_hardware_1s();
P1=0x55;
delay_hardware_1s();
}
}