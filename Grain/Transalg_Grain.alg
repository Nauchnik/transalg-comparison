
// keystream length 
define stream_len 160;

__in bit NFSR[80];
__in bit LFSR[80];

__out bit stream[stream_len];

void LFSR_shift()
{
	bit y = LFSR[0]^LFSR[13]^LFSR[23]^LFSR[38]^LFSR[51]^LFSR[62];
	for(int j = 0; j < 79; j = j + 1)
	{
		LFSR[j] = LFSR[j + 1];
	}
	LFSR[79] = y;
}

void NFSR_shift()
{
	__mem bit y1 = NFSR[52]&NFSR[45]&NFSR[37]&NFSR[33]&NFSR[28]&NFSR[21] ^ 
		NFSR[33]&NFSR[28]&NFSR[21] ^ NFSR[37]&NFSR[33] ^ NFSR[52] ^ NFSR[45] ^ NFSR[37] ^ 
		NFSR[33] ^ NFSR[28] ^ NFSR[21];

	__mem bit y2 = NFSR[33]&NFSR[28]&NFSR[21]&NFSR[15]&NFSR[9] ^ NFSR[15]&NFSR[9] ^ NFSR[14] ^ NFSR[9];
	__mem bit y3 = NFSR[63]&NFSR[60]&NFSR[52]&NFSR[45]&NFSR[37] ^ NFSR[60]&NFSR[52]&NFSR[45] ^ NFSR[60]&NFSR[52]&NFSR[37]&NFSR[33];
	__mem bit y4 = NFSR[63]&NFSR[60]&NFSR[21]&NFSR[15] ^ NFSR[63]&NFSR[60] ^ NFSR[62] ^ NFSR[60];
	__mem bit y5 =  NFSR[0] ^ NFSR[63]&NFSR[45]&NFSR[28]&NFSR[9];
	__mem bit y = y1 ^ y2 ^ y3 ^ y4 ^ y5;

	for(int j = 0; j < 79; j = j + 1)
	{
		NFSR[j] = NFSR[j + 1];
	}

	NFSR[79] = y ^ LFSR[0];
}

bit H(bit x0, bit x1, bit x2, bit x3, bit x4)
{
	return x1 ^ x4 ^ x0&x3 ^ x2&x3 ^ x3&x4 ^ x0&x1&x2 ^ x0&x2&x3 ^ x0&x2&x4 ^ x1&x2&x4 ^ x2&x3&x4;
}

void main()
{
	for(int i = 0; i < stream_len; i = i + 1)
	{
		__mem bit t1 = NFSR[1] ^ NFSR[2] ^ NFSR[4];
		__mem bit t2 = NFSR[10] ^ NFSR[31] ^ NFSR[43];
		__mem bit t3 = t1 ^ t2 ^ NFSR[56];
		bit out = t3 ^ H(LFSR[3], LFSR[25], LFSR[46], LFSR[64], NFSR[63]);


		// Порядок сдвига регистров важен
		NFSR_shift();
		LFSR_shift();
		
		
		stream[i] = out;
	}
}
