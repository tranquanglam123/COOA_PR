#include <at89x52.h>
unsigned char chuc, dvi, rdata, nhietdo;
void setup()
{
	TMOD=0x20;//;enabletimer1,mode 2(autoreload)
	TH1=-3;//9600Baudrate
	SCON=0x50;//;8bituart,1stop bit,RENenabled,timer1
	TR1=1;
	IE=0x90;
}
void serint(void)interrupt 4 using 1
{
			if(RI){rdata=SBUF;
						RI=0;
						switch(rdata){
case('0'):{P0_7=0;break;}
case('1'):{P0_7=1;break;}
case('a'):{TH1=-24;break;}
case('b'):{TH1=-12;break;}
case('c'):{TH1=-6;break;}
case('d'):{TH1=-3;break;}
}
}
}
void main()
{
unsigned char trans_data;
setup();
while(1)
{//laydudieu
nhietdo=P1;
// chuyendoihienthi
chuc=(nhietdo/10)<<4;
dvi=nhietdo%10;
P2=chuc|dvi;
//truyendulieu
trans_data=P2;
SBUF=trans_data;
while(TI==0);
TI=0;
}
}