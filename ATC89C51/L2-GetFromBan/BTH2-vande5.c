#include "REG51.H"

#define CLK_H P2 |= 0x01
#define CLK_L P2 &= 0xFE
#define DAT_H P2 |= 0x02
#define DAT_L P2 &= 0xFD
#define LAT_H P2 |= 0x04
#define LAT_L P2 &= 0xFB

void delay_ms(unsigned char ms);

void shiftOut(unsigned char dt);
void show_led(unsigned int num);
unsigned int count = 0;

unsigned char stt = 0;

unsigned char led_buf[10] = {
	0xC0,
	0xF9,
	0xA4,
	0xB0,
	0x99,
	0x92,
	0x82,
	0xF8,
	0x80,
	0x90
};

int main(void){
	TMOD |= (1<<4);
	TCON |= (1<<6);
	P3 = 0x01;
	P1 = 0;
	while(1){
			unsigned char i = 0;
			for(i=0; i<2; i++){
				show_led(count);
			}
			if(stt == 0) {
					count++;
					if(count/10 == 0) P1 = 0;
					else P1 |= (1<<(count/10 - 1));
			}
			else {
					count--;
//					  if(count/10 != 8)
						P1 &=~ (1<<(count/10));
			}
			if(count == 90 || count == 0) stt = !stt;
	}
	return 0;
}

void delay_ms(unsigned char ms){
	int i = 0;
	for(i = 0; i < ms; i++){
		TL1 = 0x30;
		TH1 = 0xFC;
		while(!(TCON & (1<<7)));
		TCON &=~ (1<<7);
	}
}

void shiftOut(unsigned char dt){
    unsigned char i=0;
    for(i=0; i<8; i++){
        CLK_L;
       if(dt & (0x80 >> i)) DAT_H;
       else DAT_L;
        // P2 = P2&0xFD | ((dt >> (7-i)) << 1);
        CLK_H;
    }
}

void show_led(unsigned int num){
	unsigned int tmp = num;
	unsigned char i = 0;
	for(i = 0; i < 4; i++){
		P3 = (0x08 >> i);
		LAT_L;
		shiftOut(led_buf[tmp%10]);
		LAT_H;
		delay_ms(7);
		tmp = tmp/10;
	}
}







