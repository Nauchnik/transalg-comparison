
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
