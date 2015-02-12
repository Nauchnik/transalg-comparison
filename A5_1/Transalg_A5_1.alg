define len 128;
__in bit regA[19];
__in bit regB[22];
__in bit regC[23];
__out bit result[len];

bit shift_rslosA()
{
	bit x = regA[18];
	bit y = regA[18]^regA[17]^regA[16]^regA[13];
	for(int j = 18; j > 0; j=j-1)
	{
		regA[j] = regA[j-1];
	}
	regA[0] = y;
	return x;
}

bit shift_rslosB()
{
	bit x = regB[21];
	bit y = regB[21]^regB[20];
	for(int j = 21; j > 0; j=j-1)
	{
		regB[j] = regB[j-1];
	}
	regB[0] = y;
	return x;
}

bit shift_rslosC()
{
	bit x = regC[22];
	bit y = regC[22]^regC[21]^regC[20]^regC[7];
	for(int j = 22; j > 0; j=j-1)
	{
		regC[j] = regC[j-1];
	}
	regC[0] = y;
	return x;
}

bit majority(bit A, bit B, bit C)
{
    return A&B|A&C|B&C;
}

void main()
{
	int midA = 8;
	int midB = 10;
	int midC = 10;
	bit maj;
	for(int i = 0; i < len; i= i + 1)
	{
		maj = majority(regA[midA],regB[midB],regC[midC]);
		if(!(maj^regA[midA])) shift_rslosA();
		if(!(maj^regB[midB])) shift_rslosB();
		if(!(maj^regC[midC])) shift_rslosC();				
		result[i] = regA[18]^regB[21]^regC[22];
	}
}
