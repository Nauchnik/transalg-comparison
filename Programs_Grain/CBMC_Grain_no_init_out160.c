void LFSR_shift(__CPROVER_bool* LFSR)
{
	__CPROVER_bool y = LFSR[0]^LFSR[13]^LFSR[23]^LFSR[38]^LFSR[51]^LFSR[62];
	for(int j = 0; j < 79; j = j + 1)
	{
		LFSR[j] = LFSR[j + 1];
	}
	LFSR[79] = y;
}

void NFSR_shift(__CPROVER_bool* NFSR, __CPROVER_bool* LFSR)
{
	__CPROVER_bool y1 = NFSR[52]&NFSR[45]&NFSR[37]&NFSR[33]&NFSR[28]&NFSR[21] ^ 
		NFSR[33]&NFSR[28]&NFSR[21] ^ NFSR[37]&NFSR[33] ^ NFSR[52] ^ NFSR[45] ^ NFSR[37] ^ 
		NFSR[33] ^ NFSR[28] ^ NFSR[21];

	__CPROVER_bool y2 = NFSR[33]&NFSR[28]&NFSR[21]&NFSR[15]&NFSR[9] ^ NFSR[15]&NFSR[9] ^ NFSR[14] ^ NFSR[9];
	__CPROVER_bool y3 = NFSR[63]&NFSR[60]&NFSR[52]&NFSR[45]&NFSR[37] ^ NFSR[60]&NFSR[52]&NFSR[45] ^ NFSR[60]&NFSR[52]&NFSR[37]&NFSR[33];
	__CPROVER_bool y4 = NFSR[63]&NFSR[60]&NFSR[21]&NFSR[15] ^ NFSR[63]&NFSR[60] ^ NFSR[62] ^ NFSR[60];
	__CPROVER_bool y5 =  NFSR[0] ^ NFSR[63]&NFSR[45]&NFSR[28]&NFSR[9];
	__CPROVER_bool y = y1 ^ y2 ^ y3 ^ y4 ^ y5;

	for(int j = 0; j < 79; j = j + 1)
	{
		NFSR[j] = NFSR[j + 1];
	}

	NFSR[79] = y ^ LFSR[0];
}

__CPROVER_bool H(__CPROVER_bool x0, __CPROVER_bool x1, __CPROVER_bool x2, __CPROVER_bool x3, __CPROVER_bool x4)
{
	return x1 ^ x4 ^ x0&x3 ^ x2&x3 ^ x3&x4 ^ x0&x1&x2 ^ x0&x2&x3 ^ x0&x2&x4 ^ x1&x2&x4 ^ x2&x3&x4;
}

void main()
{

	int stream_len = 160;

	__CPROVER_bool NFSR[80];
	__CPROVER_bool LFSR[80];
	__CPROVER_bool result[stream_len];

	for(int i = 0; i < stream_len; i = i + 1)
	{
		__CPROVER_bool t1 = NFSR[1] ^ NFSR[2] ^ NFSR[4];
		__CPROVER_bool t2 = NFSR[10] ^ NFSR[31] ^ NFSR[43];
		__CPROVER_bool t3 = t1 ^ t2 ^ NFSR[56];
		__CPROVER_bool out = t3 ^ H(LFSR[3], LFSR[25], LFSR[46], LFSR[64], NFSR[63]);

		NFSR_shift(NFSR, LFSR);
		LFSR_shift(LFSR);		
		
		result[i] = out;
	}
	assert(0);
}
