#include <at89x51.h>
void delay(int interval){
	int i,j;
	for(i=0;i<255;i++){
		for(j=0;j<interval;j++);}}
void main(){
		while(1){
			P0=0X55;
			delay(100);
			P0=0XAA;
			delay(100);}}
			