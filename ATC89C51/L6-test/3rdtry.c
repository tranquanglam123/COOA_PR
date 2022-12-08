#include <regx51.h>


#define uchar unsigned char
#define uint unsigned int
#define ale P2_2
#define b P2_3
#define a P2_4
#define clock P2_5
#define eoc P2_6
#define start P2_7


unsigned char chuc, donvi, rdata, temp;


void delay(int x){
	int i;
	for(i =0; i<x;i++);
}

void setup(){
	TMOD = 0x20;	//timer mod 0
	TH1= -3; //break
  SCON = 0x50; 
	TR1 = 1;
	IE = 0x90;
}
void serint(void) interrupt 4 using 1 {
	if(RI){
			rdata = SBUF;
			RI = 0;
			switch(rdata){
				case('0'): {
				//tam dung khong cho adc chay, dieu khien chon input
				start = 0; ale = 0; eoc = 1;
				//dia chi 74ls247 = 0, hien thi led = 0, address a,b = 0 lay cong input 0
				P2_0 = 0;P2_1 = 0; a = 0; b= 0;
				//cho phep adc chay
				start = 1, ale = 1;
				delay(500);
				//sau khi chay xong cho dung adc
				start = 0; ale = 0;
				while(eoc ==0);
				eoc = 1;
				break;}
				case('1'): {
				// tam dung khong cho adc chay, dieu khien chon input
				start = 0; ale = 0; eoc = 1;
				// dia chi 74ls247 =01, led hien thi = 1, address a,b =01, lay cong input 1
				P2_0 = 1;P2_1 = 0; a= 1; b= 0;
				start = 1, ale = 1;
				delay(500);
				start = 0; ale = 0;
				while(eoc ==0);
				eoc = 1;
				break;}
				case('2'): {
				start = 0; ale = 0; eoc = 1;
				P2_0 = 0;P2_1 = 1; a =0; b = 1;
				start = 1, ale = 1;
				delay(500);
				start = 0; ale = 0;
				while(eoc ==0);
				eoc = 1;
				break;}
				case('3'): {
				start = 0; ale = 0; eoc = 1;
				P2_0 = 1;P2_1 = 1; a = 1; b=1;
				start = 1, ale = 1;
				delay(500);
				start = 0; ale = 0;
				while(eoc ==0);
				eoc = 1;
				break;
				}
	}
}
}
	void main(){
	unsigned char trans_data;
	P2_0 = 0; P2_1 = 0;
	a =0; b = 0;
	setup();
	while(1){
	delay(1000);
			start=0;
			ale=0;
			eoc=1;
			delay(100);
			start=1;ale=1;
			delay(500);
			start=0;ale=0;
			while(eoc==0);
			delay(100);
			eoc=1;
		temp = P1;
		// chuyen doi hien thi
		chuc = (temp/10)<<4;
		donvi = temp%10;
		P0 = chuc|donvi;
		//truyen du lieu
		trans_data = P1;
		if(a==0 && b==0)
			SBUF=0;
		else if (a==1&&b== 0)
			SBUF=1;
		else if (a==0&&b== 1)
			SBUF=2;
		else if (a==1&&b== 1)
			SBUF=3;
		while(TI ==0);
		TI=0;
		SBUF = trans_data;
		while(TI ==0);
		TI = 0;
	}
}