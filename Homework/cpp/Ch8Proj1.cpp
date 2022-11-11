#include <iostream.h>
#include "apstring.h"

int main()
{
	char binaryStr[7];
	int decNum = 0;
	int curPowTwo = 1;
	int bitPos = 7;
	int lenBinaryStr = 0;
	
	cin.get(binaryStr,7);
	
	while (bitPos > 0)
	{
		if (binaryStr[bitPos] == '1')
		{
			cout << binaryStr[bitPos] << " " << bitPos << endl;
			decNum += curPowTwo;
		}

		curPowTwo *= 2;
		bitPos--;
	}

	cout << decNum << endl;

	return 0;
}
	


