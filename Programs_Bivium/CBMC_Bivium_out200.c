void shift_regs(__CPROVER_bool* reg)
{

	int lenA = 93;
	int lenB = 84;
	__CPROVER_bool t1 = reg[65]^reg[90]&reg[91]^reg[92]^reg[170];
	__CPROVER_bool t2 = reg[161]^reg[174]&reg[175]^reg[176]^reg[68];

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

	int reg_len = 177;
	int stream_len = 200;

	__CPROVER_bool reg[reg_len];
	__CPROVER_bool stream[stream_len];
	
	for(int i = 0; i < reg_len; i++)
	{
		__CPROVER_assume(reg[i] == 0);
	}

	for(int i = 0; i < stream_len; i = i + 1)
	{
		__CPROVER_bool t1 = reg[65] ^ reg[92];
		__CPROVER_bool t2 = reg[161] ^ reg[176];

		stream[i] = t1 ^ t2;
		shift_regs(reg);
	}

	for(int i = 0; i < stream_len; i++)
	{
		__CPROVER_assume(stream[i] == 0);
	}
	assert(0);
}
