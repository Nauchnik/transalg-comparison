// 2 shift registers with total length of 177 bits
define len  177;

define lenA 93;
define lenB 84;

define stream_len 200;

__in bit reg[len];

__out bit stream[stream_len];

// function to shift registers
void shift_regs()
{
	__mem bit l1 = reg[65]^reg[92];
	__mem bit l2 = reg[161]^reg[176];
	__mem bit l3 = reg[90]&reg[91];
	__mem bit l4 = reg[174]&reg[175];	
	
	bit t1 = l1 ^ l3 ^ reg[170];
	//reg[65]^reg[90]&reg[91]^reg[92]^reg[170];
	bit t2 = l2 ^ l4 ^ reg[68];
	//reg[161]^reg[174]&reg[175]^reg[176]^reg[68];

	int i;
	for(i = lenA - 1; i > 0; i = i - 1){
		reg[i] = reg[i-1];
	}
	reg[0] = t2;

	for(i = lenA + lenB - 1; i > lenA; i = i - 1){
		reg[i] = reg[i-1];
	}
	reg[lenA] = t1;	
}


void main()
{
	for(int i = 0; i < stream_len; i = i + 1)
	{
		bit t1 = reg[65] ^ reg[92];
		bit t2 = reg[161] ^ reg[176];

		stream[i] = t1 ^ t2;

		shift_regs();
	}
}
