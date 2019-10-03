__CPROVER_bool complexFn(__CPROVER_bool x, __CPROVER_bool y, __CPROVER_bool z)
{
  return x&z^x&y^y&z;
}

__CPROVER_bool shift_regA(__CPROVER_bool* regA)
{
	__CPROVER_bool x = regA[51];
	__CPROVER_bool y = regA[48]^regA[51];
	for(int j = 51; j > 0; j=j-1)
	{
		regA[j] = regA[j-1];
	}
	regA[0] = y;
	return x;
}

__CPROVER_bool shift_regB(__CPROVER_bool* regB)
{
	__CPROVER_bool x = regB[52];
	__CPROVER_bool y = regB[36]^regB[37]^regB[51]^regB[52];
	for(int j = 52; j > 0; j=j-1)
	{
		regB[j] = regB[j-1];
	}
	regB[0] = y;
	return x;
}

__CPROVER_bool shift_regC(__CPROVER_bool* regC)
{
	__CPROVER_bool x = regC[54];
	__CPROVER_bool y = regC[30]^regC[54];
	for(int j = 54; j > 0; j=j-1)
	{
		regC[j] = regC[j-1];
	}
	regC[0] = y;
	return x;
}

void main()
{
	int len = 250;

	__CPROVER_bool reg_A[52];
	__CPROVER_bool reg_B[53];
	__CPROVER_bool reg_C[55];
	__CPROVER_bool result[len];

	for(int i = 0; i < len; i++)
	{
		result[i] = complexFn(shift_regA(reg_A),shift_regB(reg_B),shift_regC(reg_C)); 
	}
	assert(0);
}
