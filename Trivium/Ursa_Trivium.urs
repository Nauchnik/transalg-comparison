
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
