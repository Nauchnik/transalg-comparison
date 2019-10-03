void update(__CPROVER_bool* reg, __CPROVER_bool* buff)
{
	__CPROVER_bool left;
	__CPROVER_bool right;
	
	int i;
	int reg_len = 128;
	
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
	int reg_len = 128;
	__CPROVER_bool reg[reg_len];
	__CPROVER_bool buff[reg_len];
	__CPROVER_bool result[reg_len];

	for(int i = 0; i < reg_len; i++)
	{
		__CPROVER_assume(reg[i] == 0);
	}

	int i;

	for(i = 0; i < reg_len; i++)
	{
		update(reg, buff);
		result[i] = reg[0];
	}

	for(int i = 0; i < reg_len; i++)
	{
		__CPROVER_assume(result[i] == 0);
	}
	assert(0);

}
