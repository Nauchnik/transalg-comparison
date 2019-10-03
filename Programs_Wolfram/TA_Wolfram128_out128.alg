define reg_len 128;
define stream_len 128;

__in bit reg[reg_len];

__out bit result[stream_len];

bit buff[reg_len];

// one update step 
void update()
{
	bit left;
	bit right;
	
	int i;
	
	for(i = 0; i < reg_len; i = i + 1)
	{
		if (i == 0)
			left = reg[reg_len - 1];
		else
			left = reg[i - 1];

		if (i + 1 == reg_len)
			right = reg[0];
		else
			right = reg[i + 1];

		buff[i] = left ^ (reg[i] | right);
	}

	for(i = 0; i < reg_len; i = i + 1)
	{
		reg[i] = buff[i];
	}
}

void main()
{
	int i;
	// generate output bits
	for(i = 0; i < stream_len; i = i + 1)
	{
		update();
		result[i] = reg[0];
	}
}
