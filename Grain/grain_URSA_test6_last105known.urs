
nstream_len = 160;
nreg_len = 80;

for(ni = 0; ni < nreg_len; ni++)
{
	bNFSR[ni] = breg_init[ni];
}

for(ni = 0; ni < nreg_len; ni++)
{
	bLFSR[ni] = breg_init[nreg_len + ni];
}

for(ni = 0; ni < nstream_len; ni++)
{
	/* Генерация бита выхода */
	bh = bNFSR[1] ^^ bNFSR[2] ^^ bNFSR[4] ^^ bNFSR[10] ^^ bNFSR[31] ^^ bNFSR[43] ^^ bNFSR[56];
	bh ^^= bLFSR[25] ^^ bNFSR[63] ^^ (bLFSR[3] && bLFSR[64]) ^^ (bLFSR[46] && bLFSR[64]);
	bh ^^= (bLFSR[64] && bNFSR[63]) ^^ (bLFSR[3] && bLFSR[25] && bLFSR[46]);
	bh ^^= (bLFSR[3] && bLFSR[46] && bLFSR[64]) ^^ (bLFSR[3] && bLFSR[46] && bNFSR[63]);
	bh ^^= (bLFSR[25] && bLFSR[46] && bNFSR[63]) ^^ (bLFSR[46] && bLFSR[64] && bNFSR[63]);

	bstream[ni] = bh;

	/* Обновление нелинейного регистра */
	by1 = (bNFSR[52] && bNFSR[45] && bNFSR[37] && bNFSR[33] && bNFSR[28] && bNFSR[21]) ^^ 
		(bNFSR[33] && bNFSR[28] && bNFSR[21]) ^^ (bNFSR[37] && bNFSR[33]) ^^ bNFSR[52] ^^ bNFSR[45] ^^ bNFSR[37] ^^ 
		bNFSR[33] ^^ bNFSR[28] ^^ bNFSR[21];

	by2 = (bNFSR[33] && bNFSR[28] && bNFSR[21] && bNFSR[15] && bNFSR[9]) ^^ (bNFSR[15] && bNFSR[9]) ^^ bNFSR[14] ^^ bNFSR[9];
	by3 = (bNFSR[63] && bNFSR[60] && bNFSR[52] && bNFSR[45] && bNFSR[37]) ^^ (bNFSR[60] && bNFSR[52] && bNFSR[45]) ^^ (bNFSR[60] && bNFSR[52] && bNFSR[37] && bNFSR[33]);
	by4 = (bNFSR[63] && bNFSR[60] && bNFSR[21] && bNFSR[15]) ^^ (bNFSR[63] && bNFSR[60]) ^^ bNFSR[62] ^^ bNFSR[60];
	by5 = bNFSR[0] ^^ (bNFSR[63] && bNFSR[45] && bNFSR[28] && bNFSR[9]);

	for(nj = 0; nj < 79; nj++)
	{
		bNFSR[nj] = bNFSR[nj + 1];
	}

	bNFSR[79] = by1 ^^ by2 ^^ by3 ^^ by4 ^^ by5 ^^ bLFSR[0];

	/* Обновление линейного регистра */
	by = bLFSR[0] ^^ bLFSR[13] ^^ bLFSR[23] ^^ bLFSR[38] ^^ bLFSR[51] ^^ bLFSR[62];
	for(nj = 0; nj < 79; nj++)
	{
		bLFSR[nj] = bLFSR[nj + 1];
	}
	bLFSR[79] = by;

}


bout = !breg_init[55] && breg_init[56] && !breg_init[57] && !breg_init[58] && !breg_init[59];
bout &&= !breg_init[60] && !breg_init[61] && !breg_init[62] && !breg_init[63] && !breg_init[64];
bout &&= breg_init[65] && breg_init[66] && !breg_init[67] && breg_init[68] && breg_init[69];
bout &&= breg_init[70] && !breg_init[71] && !breg_init[72] && !breg_init[73] && breg_init[74];
bout &&= !breg_init[75] && breg_init[76] && breg_init[77] && !breg_init[78] && !breg_init[79];
bout &&= breg_init[80] && !breg_init[81] && !breg_init[82] && breg_init[83] && breg_init[84];
bout &&= !breg_init[85] && breg_init[86] && !breg_init[87] && !breg_init[88] && breg_init[89];
bout &&= breg_init[90] && breg_init[91] && breg_init[92] && breg_init[93] && breg_init[94];
bout &&= !breg_init[95] && breg_init[96] && breg_init[97] && !breg_init[98] && breg_init[99];
bout &&= breg_init[100] && breg_init[101] && !breg_init[102] && breg_init[103] && !breg_init[104];
bout &&= !breg_init[105] && breg_init[106] && breg_init[107] && !breg_init[108] && breg_init[109];
bout &&= !breg_init[110] && breg_init[111] && breg_init[112] && !breg_init[113] && breg_init[114];
bout &&= breg_init[115] && !breg_init[116] && breg_init[117] && breg_init[118] && !breg_init[119];
bout &&= breg_init[120] && breg_init[121] && breg_init[122] && breg_init[123] && breg_init[124];
bout &&= !breg_init[125] && !breg_init[126] && breg_init[127] && !breg_init[128] && breg_init[129];
bout &&= !breg_init[130] && !breg_init[131] && !breg_init[132] && breg_init[133] && breg_init[134];
bout &&= !breg_init[135] && breg_init[136] && breg_init[137] && !breg_init[138] && breg_init[139];
bout &&= !breg_init[140] && !breg_init[141] && !breg_init[142] && breg_init[143] && breg_init[144];
bout &&= !breg_init[145] && !breg_init[146] && !breg_init[147] && breg_init[148] && !breg_init[149];
bout &&= breg_init[150] && breg_init[151] && breg_init[152] && !breg_init[153] && breg_init[154];
bout &&= breg_init[155] && !breg_init[156] && !breg_init[157] && !breg_init[158] && breg_init[159];

bout &&= bstream[0] && bstream[1] && !bstream[2] && !bstream[3] && !bstream[4];
bout &&= bstream[5] && !bstream[6] && bstream[7] && !bstream[8] && !bstream[9];
bout &&= !bstream[10] && bstream[11] && bstream[12] && bstream[13] && bstream[14];
bout &&= !bstream[15] && bstream[16] && bstream[17] && bstream[18] && !bstream[19];
bout &&= bstream[20] && !bstream[21] && bstream[22] && bstream[23] && !bstream[24];
bout &&= !bstream[25] && bstream[26] && bstream[27] && bstream[28] && bstream[29];
bout &&= !bstream[30] && !bstream[31] && bstream[32] && !bstream[33] && !bstream[34];
bout &&= bstream[35] && bstream[36] && bstream[37] && !bstream[38] && bstream[39];
bout &&= !bstream[40] && bstream[41] && !bstream[42] && bstream[43] && bstream[44];
bout &&= bstream[45] && bstream[46] && !bstream[47] && bstream[48] && !bstream[49];
bout &&= !bstream[50] && !bstream[51] && bstream[52] && bstream[53] && !bstream[54];
bout &&= !bstream[55] && !bstream[56] && bstream[57] && bstream[58] && !bstream[59];
bout &&= bstream[60] && !bstream[61] && !bstream[62] && !bstream[63] && bstream[64];
bout &&= bstream[65] && !bstream[66] && bstream[67] && bstream[68] && bstream[69];
bout &&= !bstream[70] && !bstream[71] && !bstream[72] && !bstream[73] && !bstream[74];
bout &&= bstream[75] && bstream[76] && !bstream[77] && !bstream[78] && !bstream[79];
bout &&= !bstream[80] && bstream[81] && bstream[82] && !bstream[83] && !bstream[84];
bout &&= bstream[85] && !bstream[86] && bstream[87] && bstream[88] && !bstream[89];
bout &&= !bstream[90] && bstream[91] && !bstream[92] && bstream[93] && !bstream[94];
bout &&= bstream[95] && bstream[96] && bstream[97] && !bstream[98] && bstream[99];
bout &&= bstream[100] && bstream[101] && bstream[102] && !bstream[103] && !bstream[104];
bout &&= bstream[105] && bstream[106] && !bstream[107] && !bstream[108] && !bstream[109];
bout &&= bstream[110] && bstream[111] && bstream[112] && bstream[113] && !bstream[114];
bout &&= bstream[115] && bstream[116] && bstream[117] && bstream[118] && bstream[119];
bout &&= !bstream[120] && !bstream[121] && !bstream[122] && bstream[123] && !bstream[124];
bout &&= bstream[125] && bstream[126] && !bstream[127] && bstream[128] && bstream[129];
bout &&= !bstream[130] && !bstream[131] && bstream[132] && !bstream[133] && bstream[134];
bout &&= !bstream[135] && !bstream[136] && !bstream[137] && !bstream[138] && !bstream[139];
bout &&= !bstream[140] && bstream[141] && bstream[142] && bstream[143] && bstream[144];
bout &&= bstream[145] && bstream[146] && !bstream[147] && !bstream[148] && bstream[149];
bout &&= bstream[150] && bstream[151] && bstream[152] && bstream[153] && bstream[154];
bout &&= bstream[155] && !bstream[156] && !bstream[157] && !bstream[158] && bstream[159];

assert(bout);

