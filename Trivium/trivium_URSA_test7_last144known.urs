
nkeylen = 288;
nstreamlen = 300;
nlenA = 93;
nlenB = 84;
nlenC = 111;

for(ni = 0; ni < nkeylen; ni++)
{
	breg[ni] = breg_init[ni];
}

for(ni = 0; ni < nstreamlen; ni++)
{
	bt1 = breg[65] ^^ breg[92] ^^ breg[161];
	bt2 = breg[176] ^^ breg[242] ^^ breg[287];

	bstream[ni] = bt1 ^^ bt2;

	bt1 = breg[65] ^^ (breg[90] && breg[91]) ^^ breg[92] ^^ breg[170];
	bt2 = breg[161] ^^ (breg[174] && breg[175]) ^^ breg[176] ^^ breg[263];
	bt3 = breg[242] ^^ (breg[285] && breg[286]) ^^ breg[287] ^^ breg[68];

	for(nj = nlenA - 1; nj > 0; nj = nj - 1)
	{
		breg[nj] = breg[nj - 1];
	}
	breg[0] = bt3;

	for(nj = nlenA + nlenB - 1; nj > nlenA; nj = nj - 1)
	{
		breg[nj] = breg[nj - 1];
	}
	breg[nlenA] = bt1;

	for(nj = nlenA + nlenB + nlenC - 1; nj > nlenA + nlenB; nj = nj - 1)
	{
		breg[nj] = breg[nj - 1];
	}
	breg[nlenA + nlenB] = bt2;
}


bout = breg_init[144] && breg_init[145] && breg_init[146] && breg_init[147] && breg_init[148];
bout &&= breg_init[149] && breg_init[150] && !breg_init[151] && breg_init[152] && !breg_init[153];
bout &&= breg_init[154] && breg_init[155] && breg_init[156] && breg_init[157] && breg_init[158];
bout &&= !breg_init[159] && !breg_init[160] && breg_init[161] && breg_init[162] && !breg_init[163];
bout &&= !breg_init[164] && breg_init[165] && !breg_init[166] && !breg_init[167] && !breg_init[168];
bout &&= breg_init[169] && !breg_init[170] && !breg_init[171] && !breg_init[172] && !breg_init[173];
bout &&= !breg_init[174] && !breg_init[175] && !breg_init[176] && breg_init[177] && breg_init[178];
bout &&= breg_init[179] && breg_init[180] && !breg_init[181] && !breg_init[182] && breg_init[183];
bout &&= breg_init[184] && breg_init[185] && !breg_init[186] && !breg_init[187] && breg_init[188];
bout &&= breg_init[189] && breg_init[190] && !breg_init[191] && breg_init[192] && breg_init[193];
bout &&= !breg_init[194] && breg_init[195] && !breg_init[196] && breg_init[197] && breg_init[198];
bout &&= !breg_init[199] && !breg_init[200] && !breg_init[201] && breg_init[202] && !breg_init[203];
bout &&= breg_init[204] && breg_init[205] && breg_init[206] && breg_init[207] && !breg_init[208];
bout &&= !breg_init[209] && breg_init[210] && breg_init[211] && breg_init[212] && breg_init[213];
bout &&= !breg_init[214] && !breg_init[215] && !breg_init[216] && breg_init[217] && !breg_init[218];
bout &&= breg_init[219] && breg_init[220] && breg_init[221] && !breg_init[222] && !breg_init[223];
bout &&= breg_init[224] && !breg_init[225] && breg_init[226] && !breg_init[227] && !breg_init[228];
bout &&= breg_init[229] && breg_init[230] && !breg_init[231] && !breg_init[232] && breg_init[233];
bout &&= breg_init[234] && breg_init[235] && !breg_init[236] && !breg_init[237] && !breg_init[238];
bout &&= !breg_init[239] && !breg_init[240] && !breg_init[241] && !breg_init[242] && !breg_init[243];
bout &&= !breg_init[244] && breg_init[245] && !breg_init[246] && breg_init[247] && !breg_init[248];
bout &&= breg_init[249] && !breg_init[250] && breg_init[251] && breg_init[252] && !breg_init[253];
bout &&= breg_init[254] && !breg_init[255] && !breg_init[256] && breg_init[257] && !breg_init[258];
bout &&= !breg_init[259] && !breg_init[260] && !breg_init[261] && !breg_init[262] && !breg_init[263];
bout &&= breg_init[264] && breg_init[265] && breg_init[266] && breg_init[267] && !breg_init[268];
bout &&= !breg_init[269] && breg_init[270] && !breg_init[271] && !breg_init[272] && breg_init[273];
bout &&= !breg_init[274] && breg_init[275] && !breg_init[276] && breg_init[277] && !breg_init[278];
bout &&= !breg_init[279] && !breg_init[280] && !breg_init[281] && breg_init[282] && !breg_init[283];
bout &&= breg_init[284] && !breg_init[285] && !breg_init[286] && !breg_init[287];

bout &&= bstream[0] && !bstream[1] && bstream[2] && !bstream[3] && !bstream[4];
bout &&= bstream[5] && !bstream[6] && bstream[7] && !bstream[8] && !bstream[9];
bout &&= bstream[10] && !bstream[11] && !bstream[12] && bstream[13] && !bstream[14];
bout &&= bstream[15] && bstream[16] && bstream[17] && bstream[18] && !bstream[19];
bout &&= bstream[20] && !bstream[21] && !bstream[22] && bstream[23] && bstream[24];
bout &&= bstream[25] && bstream[26] && !bstream[27] && bstream[28] && !bstream[29];
bout &&= bstream[30] && !bstream[31] && bstream[32] && !bstream[33] && !bstream[34];
bout &&= bstream[35] && bstream[36] && bstream[37] && !bstream[38] && !bstream[39];
bout &&= bstream[40] && !bstream[41] && bstream[42] && bstream[43] && bstream[44];
bout &&= bstream[45] && bstream[46] && bstream[47] && !bstream[48] && bstream[49];
bout &&= bstream[50] && !bstream[51] && bstream[52] && bstream[53] && !bstream[54];
bout &&= bstream[55] && !bstream[56] && !bstream[57] && !bstream[58] && bstream[59];
bout &&= bstream[60] && !bstream[61] && !bstream[62] && bstream[63] && !bstream[64];
bout &&= bstream[65] && !bstream[66] && bstream[67] && bstream[68] && bstream[69];
bout &&= !bstream[70] && bstream[71] && bstream[72] && !bstream[73] && !bstream[74];
bout &&= !bstream[75] && !bstream[76] && !bstream[77] && !bstream[78] && bstream[79];
bout &&= bstream[80] && !bstream[81] && !bstream[82] && !bstream[83] && !bstream[84];
bout &&= !bstream[85] && !bstream[86] && !bstream[87] && !bstream[88] && !bstream[89];
bout &&= bstream[90] && !bstream[91] && bstream[92] && bstream[93] && bstream[94];
bout &&= !bstream[95] && bstream[96] && !bstream[97] && bstream[98] && !bstream[99];
bout &&= bstream[100] && bstream[101] && !bstream[102] && bstream[103] && !bstream[104];
bout &&= !bstream[105] && bstream[106] && bstream[107] && !bstream[108] && !bstream[109];
bout &&= bstream[110] && bstream[111] && bstream[112] && bstream[113] && bstream[114];
bout &&= bstream[115] && bstream[116] && !bstream[117] && bstream[118] && bstream[119];
bout &&= !bstream[120] && !bstream[121] && bstream[122] && !bstream[123] && !bstream[124];
bout &&= !bstream[125] && bstream[126] && !bstream[127] && bstream[128] && bstream[129];
bout &&= bstream[130] && !bstream[131] && !bstream[132] && !bstream[133] && !bstream[134];
bout &&= bstream[135] && !bstream[136] && bstream[137] && !bstream[138] && !bstream[139];
bout &&= !bstream[140] && !bstream[141] && !bstream[142] && !bstream[143] && !bstream[144];
bout &&= !bstream[145] && bstream[146] && !bstream[147] && !bstream[148] && !bstream[149];
bout &&= !bstream[150] && !bstream[151] && bstream[152] && !bstream[153] && !bstream[154];
bout &&= bstream[155] && !bstream[156] && !bstream[157] && bstream[158] && bstream[159];
bout &&= bstream[160] && !bstream[161] && !bstream[162] && !bstream[163] && bstream[164];
bout &&= bstream[165] && !bstream[166] && bstream[167] && bstream[168] && !bstream[169];
bout &&= !bstream[170] && bstream[171] && bstream[172] && bstream[173] && bstream[174];
bout &&= !bstream[175] && !bstream[176] && bstream[177] && !bstream[178] && !bstream[179];
bout &&= bstream[180] && bstream[181] && !bstream[182] && !bstream[183] && !bstream[184];
bout &&= !bstream[185] && !bstream[186] && bstream[187] && !bstream[188] && bstream[189];
bout &&= bstream[190] && bstream[191] && bstream[192] && !bstream[193] && !bstream[194];
bout &&= !bstream[195] && bstream[196] && bstream[197] && bstream[198] && !bstream[199];
bout &&= !bstream[200] && bstream[201] && bstream[202] && bstream[203] && bstream[204];
bout &&= !bstream[205] && bstream[206] && bstream[207] && !bstream[208] && !bstream[209];
bout &&= bstream[210] && bstream[211] && !bstream[212] && bstream[213] && !bstream[214];
bout &&= bstream[215] && bstream[216] && bstream[217] && bstream[218] && bstream[219];
bout &&= !bstream[220] && !bstream[221] && bstream[222] && !bstream[223] && !bstream[224];
bout &&= bstream[225] && !bstream[226] && bstream[227] && !bstream[228] && bstream[229];
bout &&= bstream[230] && bstream[231] && bstream[232] && bstream[233] && !bstream[234];
bout &&= !bstream[235] && !bstream[236] && bstream[237] && !bstream[238] && bstream[239];
bout &&= bstream[240] && bstream[241] && bstream[242] && bstream[243] && bstream[244];
bout &&= !bstream[245] && !bstream[246] && bstream[247] && bstream[248] && !bstream[249];
bout &&= !bstream[250] && bstream[251] && bstream[252] && bstream[253] && !bstream[254];
bout &&= !bstream[255] && !bstream[256] && bstream[257] && bstream[258] && bstream[259];
bout &&= !bstream[260] && !bstream[261] && !bstream[262] && bstream[263] && !bstream[264];
bout &&= bstream[265] && !bstream[266] && bstream[267] && bstream[268] && !bstream[269];
bout &&= !bstream[270] && bstream[271] && bstream[272] && bstream[273] && bstream[274];
bout &&= bstream[275] && !bstream[276] && !bstream[277] && !bstream[278] && bstream[279];
bout &&= bstream[280] && !bstream[281] && bstream[282] && bstream[283] && !bstream[284];
bout &&= bstream[285] && !bstream[286] && bstream[287] && bstream[288] && bstream[289];
bout &&= bstream[290] && bstream[291] && bstream[292] && bstream[293] && bstream[294];
bout &&= bstream[295] && bstream[296] && bstream[297] && !bstream[298] && !bstream[299];

assert(bout);

