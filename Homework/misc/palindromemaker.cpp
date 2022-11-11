#include <apstack.h>
#include <apvector.h>
#include <apstring.h>
#include <iostream.h>

int revNum(apstring num);
int strTonum(apstring str);
bool isPal(apstring num);
apstring itoapstr(int n);
apstring tostring(int n);
apstring caTostr(char temp[100]);

int main()
{
	int palnum = 1;
	int numsteps = 0;
	int x = 0;
	int y = 0;
	char temp[100];
	apstring num;
	itoa(palnum, temp, 10);

	cout << "Enter a starting number (n > 0): ";
	cin >> palnum;
	cout << "How many steps to calculate palindromes: ";
	cin >> numsteps;
	
	itoa(palnum,temp,10);
	num = caTostr(temp);
	

	for (x = 0; x <= numsteps; x++)
	{
		palnum += revNum(num);
		itoa(palnum,temp,10);
		num = caTostr(temp);
		if (isPal(num)) { cout << palnum << " is a palindrome." << endl; }
		//se { cout << palnum << " is not a palindrome." << endl; }
	}


	//cout << isPal(number);
	return 0;
}

bool isPal(apstring num)
{
	int rside = num.length() - 1;
	int lside = 0;

	while (lside < rside)
	{
		if (num[rside] != num[lside])
		{
			return false;
		}

		lside++;
		rside--;
	}

	return true;
}

int revNum(apstring num)
{
	int rside = num.length() - 1;
	int lside = 0;
	char temp;

	while (lside < rside)
	{
		temp = num[rside];
		num[rside] = num[lside];
		num[lside] = temp;
		lside++;
		rside--;
	}

	return atoi(num.c_str());
}

int strTonum(apstring str)
{
	int x = (str.length() - 1);
	int curBase = 1;
	int rval = 0;

	while (x >= 0)
	{
		rval += (curBase * str[x]);
		curBase *= 10;
		x--;
	}

	return rval;
}

apstring caTostr(char temp[100])
{
	int x = 0;
	apstring str;

	
	while (temp[x] != '\0')
	{
		str += temp[x];
		x++;
	}

	return str;
}
