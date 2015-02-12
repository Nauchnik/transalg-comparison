
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
