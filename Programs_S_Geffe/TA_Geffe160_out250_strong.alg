define len 250;

__in bit regA[52];
__in bit regB[53];
__in bit regC[55];
__out bit result[len];

bit complexFn(bit x, bit y, bit z)
{
	return x&z^x&y^y&z;
}

bit shift_regA()
{
	bit x = regA[51];
	bit y = regA[48]^regA[51];
	for(int j = 51; j > 0; j=j-1)
	{
		regA[j] = regA[j-1];
	}
	regA[0] = y;
	return x;
}

bit shift_regB()
{
	bit x = regB[52];
	bit y = regB[36]^regB[37]^regB[51]^regB[52];
	for(int j = 52; j > 0; j=j-1)
	{
		regB[j] = regB[j-1];
	}
	regB[0] = y;
	return x;
}

bit shift_regC()
{
	bit x = regC[54];
	bit y = regC[30]^regC[54];
	for(int j = 54; j > 0; j=j-1)
	{
		regC[j] = regC[j-1];
	}
	regC[0] = y;
	return x;
}

void main()
{
	for(int i = 0; i < len; i= i + 1)
{
		result[i] = complexFn(shift_regA(), shift_regB(), shift_regC());
	}
}
