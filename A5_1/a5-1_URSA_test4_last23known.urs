
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


bout = !breg_init[41] && !breg_init[42] && !breg_init[43] && !breg_init[44] && !breg_init[45];
bout &&= !breg_init[46] && breg_init[47] && breg_init[48] && !breg_init[49] && breg_init[50];
bout &&= breg_init[51] && !breg_init[52] && !breg_init[53] && breg_init[54] && !breg_init[55];
bout &&= breg_init[56] && breg_init[57] && !breg_init[58] && !breg_init[59] && breg_init[60];
bout &&= breg_init[61] && breg_init[62] && !breg_init[63];

bout &&= !bstream[0] && !bstream[1] && bstream[2] && !bstream[3] && bstream[4];
bout &&= !bstream[5] && bstream[6] && bstream[7] && !bstream[8] && !bstream[9];
bout &&= !bstream[10] && !bstream[11] && !bstream[12] && bstream[13] && bstream[14];
bout &&= !bstream[15] && !bstream[16] && !bstream[17] && !bstream[18] && bstream[19];
bout &&= bstream[20] && !bstream[21] && bstream[22] && !bstream[23] && !bstream[24];
bout &&= bstream[25] && !bstream[26] && bstream[27] && bstream[28] && !bstream[29];
bout &&= !bstream[30] && bstream[31] && bstream[32] && bstream[33] && bstream[34];
bout &&= bstream[35] && !bstream[36] && !bstream[37] && bstream[38] && !bstream[39];
bout &&= !bstream[40] && bstream[41] && bstream[42] && bstream[43] && !bstream[44];
bout &&= bstream[45] && bstream[46] && bstream[47] && !bstream[48] && bstream[49];
bout &&= bstream[50] && bstream[51] && !bstream[52] && !bstream[53] && bstream[54];
bout &&= bstream[55] && !bstream[56] && bstream[57] && bstream[58] && bstream[59];
bout &&= !bstream[60] && bstream[61] && !bstream[62] && !bstream[63] && !bstream[64];
bout &&= !bstream[65] && bstream[66] && !bstream[67] && !bstream[68] && !bstream[69];
bout &&= !bstream[70] && !bstream[71] && bstream[72] && bstream[73] && bstream[74];
bout &&= !bstream[75] && !bstream[76] && bstream[77] && !bstream[78] && !bstream[79];
bout &&= !bstream[80] && !bstream[81] && !bstream[82] && bstream[83] && !bstream[84];
bout &&= !bstream[85] && !bstream[86] && bstream[87] && !bstream[88] && !bstream[89];
bout &&= bstream[90] && !bstream[91] && !bstream[92] && !bstream[93] && !bstream[94];
bout &&= !bstream[95] && !bstream[96] && !bstream[97] && !bstream[98] && bstream[99];
bout &&= !bstream[100] && !bstream[101] && bstream[102] && !bstream[103] && bstream[104];
bout &&= !bstream[105] && !bstream[106] && !bstream[107] && !bstream[108] && !bstream[109];
bout &&= bstream[110] && !bstream[111] && bstream[112] && bstream[113] && !bstream[114];
bout &&= !bstream[115] && bstream[116] && bstream[117] && bstream[118] && bstream[119];
bout &&= bstream[120] && !bstream[121] && !bstream[122] && bstream[123] && bstream[124];
bout &&= !bstream[125] && bstream[126] && !bstream[127];

assert(bout);

