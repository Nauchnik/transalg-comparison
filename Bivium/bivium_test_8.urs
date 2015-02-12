
nkeylen = 177;
nstreamlen = 200;
nlenA = 93;
nlenB = 84;

for(ni = 0; ni < nkeylen; ni++)
{
	breg[ni] = breg_init[ni];
}

for(ni = 0; ni < nstreamlen; ni++)
{
	bstream[ni] = breg[65] ^^ breg[92] ^^ breg[161] ^^ breg[176];

	bt1 = breg[65] ^^ (breg[90] && breg[91]) ^^ breg[92] ^^ breg[170];
	bt2 = breg[161] ^^ (breg[174] && breg[175]) ^^ breg[176] ^^ breg[68];

	for(nj = nlenA - 1; nj > 0; nj = nj - 1)
	{
		breg[nj] = breg[nj - 1];
	}
	breg[0] = bt2;

	for(nj = nlenA + nlenB - 1; nj > nlenA; nj = nj - 1)
	{
		breg[nj] = breg[nj - 1];
	}
	breg[nlenA] = bt1;
}

bout = breg_init[145] && breg_init[146] && breg_init[147] && !breg_init[148] && breg_init[149];
bout &&= breg_init[150] && breg_init[151] && !breg_init[152] && breg_init[153] && breg_init[154];
bout &&= breg_init[155] && !breg_init[156] && !breg_init[157] && !breg_init[158] && breg_init[159];
bout &&= breg_init[160] && !breg_init[161] && breg_init[162] && !breg_init[163] && !breg_init[164];
bout &&= !breg_init[165] && !breg_init[166] && breg_init[167] && !breg_init[168] && !breg_init[169];
bout &&= breg_init[170] && breg_init[171] && breg_init[172] && breg_init[173] && !breg_init[174];
bout &&= !breg_init[175] && !breg_init[176];

bout &&= !bstream[0] && !bstream[1] && !bstream[2] && !bstream[3] && !bstream[4];
bout &&= bstream[5] && bstream[6] && bstream[7] && !bstream[8] && !bstream[9];
bout &&= !bstream[10] && !bstream[11] && bstream[12] && !bstream[13] && bstream[14];
bout &&= !bstream[15] && !bstream[16] && bstream[17] && bstream[18] && bstream[19];
bout &&= bstream[20] && !bstream[21] && bstream[22] && bstream[23] && !bstream[24];
bout &&= bstream[25] && !bstream[26] && bstream[27] && bstream[28] && !bstream[29];
bout &&= bstream[30] && !bstream[31] && !bstream[32] && bstream[33] && !bstream[34];
bout &&= bstream[35] && !bstream[36] && !bstream[37] && bstream[38] && bstream[39];
bout &&= !bstream[40] && !bstream[41] && bstream[42] && !bstream[43] && !bstream[44];
bout &&= !bstream[45] && bstream[46] && bstream[47] && !bstream[48] && bstream[49];
bout &&= bstream[50] && !bstream[51] && bstream[52] && bstream[53] && bstream[54];
bout &&= !bstream[55] && !bstream[56] && bstream[57] && !bstream[58] && !bstream[59];
bout &&= !bstream[60] && !bstream[61] && bstream[62] && !bstream[63] && !bstream[64];
bout &&= !bstream[65] && !bstream[66] && bstream[67] && bstream[68] && !bstream[69];
bout &&= !bstream[70] && bstream[71] && bstream[72] && bstream[73] && bstream[74];
bout &&= bstream[75] && bstream[76] && bstream[77] && !bstream[78] && !bstream[79];
bout &&= bstream[80] && !bstream[81] && !bstream[82] && !bstream[83] && bstream[84];
bout &&= bstream[85] && !bstream[86] && bstream[87] && bstream[88] && !bstream[89];
bout &&= !bstream[90] && bstream[91] && bstream[92] && !bstream[93] && !bstream[94];
bout &&= !bstream[95] && bstream[96] && !bstream[97] && !bstream[98] && bstream[99];
bout &&= !bstream[100] && bstream[101] && !bstream[102] && !bstream[103] && !bstream[104];
bout &&= !bstream[105] && bstream[106] && !bstream[107] && !bstream[108] && bstream[109];
bout &&= !bstream[110] && bstream[111] && bstream[112] && !bstream[113] && !bstream[114];
bout &&= !bstream[115] && bstream[116] && !bstream[117] && bstream[118] && bstream[119];
bout &&= bstream[120] && !bstream[121] && !bstream[122] && bstream[123] && bstream[124];
bout &&= !bstream[125] && !bstream[126] && bstream[127] && bstream[128] && !bstream[129];
bout &&= bstream[130] && !bstream[131] && bstream[132] && !bstream[133] && !bstream[134];
bout &&= bstream[135] && bstream[136] && !bstream[137] && bstream[138] && !bstream[139];
bout &&= !bstream[140] && bstream[141] && bstream[142] && bstream[143] && bstream[144];
bout &&= !bstream[145] && !bstream[146] && !bstream[147] && !bstream[148] && !bstream[149];
bout &&= !bstream[150] && bstream[151] && bstream[152] && bstream[153] && bstream[154];
bout &&= bstream[155] && bstream[156] && !bstream[157] && !bstream[158] && !bstream[159];
bout &&= !bstream[160] && !bstream[161] && bstream[162] && !bstream[163] && bstream[164];
bout &&= bstream[165] && bstream[166] && bstream[167] && bstream[168] && bstream[169];
bout &&= !bstream[170] && bstream[171] && !bstream[172] && !bstream[173] && bstream[174];
bout &&= bstream[175] && !bstream[176] && bstream[177] && bstream[178] && !bstream[179];
bout &&= bstream[180] && bstream[181] && !bstream[182] && bstream[183] && bstream[184];
bout &&= bstream[185] && !bstream[186] && !bstream[187] && !bstream[188] && bstream[189];
bout &&= bstream[190] && !bstream[191] && !bstream[192] && !bstream[193] && bstream[194];
bout &&= bstream[195] && !bstream[196] && !bstream[197] && !bstream[198] && !bstream[199];

assert(bout);

