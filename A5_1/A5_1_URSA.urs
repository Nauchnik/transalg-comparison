
nstreamlen = 128;
nlenA = 19;
nlenB = 22;
nlenC = 23;
nmidA = 8;
nmidB = 10;
nmidC = 10;

for(ni = 0; ni < nlenA; ni++)
{
	bregA[ni] = breg_init[ni];
}

for(ni = 0; ni < nlenB; ni++)
{
	bregB[ni] = breg_init[nlenA + ni];
}

for(ni = 0; ni < nlenC; ni++)
{
	bregC[ni] = breg_init[nlenA + nlenB + ni];
}

for(ni = 0; ni < nstreamlen; ni++)
{
	/* Функция мажорити */
	bmaj = (bregA[nmidA] && bregB[nmidB]) || (bregA[nmidA] && bregC[nmidC]) || (bregB[nmidB] && bregC[nmidC]);

	/* Сдвиг 1-го регистра */
	b_is_regA_shift = !(bmaj ^^ bregA[nmidA]);
	b_regA_feedback = bregA[18] ^^ bregA[17] ^^ bregA[16] ^^ bregA[13];
	for(nj = nlenA - 1; nj > 0; nj = nj - 1)
	{
		bregA[nj] = ite(b_is_regA_shift, bregA[nj - 1], bregA[nj]);
	}
	bregA[0] = ite(b_is_regA_shift, b_regA_feedback, bregA[0]);

	/* Сдвиг 2-го регистра */
	b_is_regB_shift = !(bmaj ^^ bregB[nmidB]);
	b_regB_feedback = bregB[21] ^^ bregB[20];
	for(nj = nlenB - 1; nj > 0; nj = nj - 1)
	{
		bregB[nj] = ite(b_is_regB_shift, bregB[nj - 1], bregB[nj]);
	}
	bregB[0] = ite(b_is_regB_shift, b_regB_feedback, bregB[0]);

	/* Сдвиг 3-го регистра */
	b_is_regC_shift = !(bmaj ^^ bregC[nmidC]);
	b_regC_feedback = bregC[22] ^^ bregC[21] ^^ bregC[20] ^^ bregC[7];
	for(nj = nlenC - 1; nj > 0; nj = nj - 1)
	{
		bregC[nj] = ite(b_is_regC_shift, bregC[nj - 1], bregC[nj]);
	}
	bregC[0] = ite(b_is_regC_shift, b_regC_feedback, bregC[0]);

	/* Очередной бит выхода */
	bstream[ni] = bregA[18] ^^ bregB[21] ^^ bregC[22];
}
