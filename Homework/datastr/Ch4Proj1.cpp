#include <iostream.h>
#include <fstream.h>
#include <apstack.h>
#include <apstring.h>

bool balancedParens(ifstream &myStream);
char closingVersion(char theChar);

int main()
{
	ifstream file;
	bool isBal;

	file.open("C:/winuser.h");

	if(isBal = balancedParens(file))
	{
		cout << "Characters are balanced." << endl;
	}
	else
	{
		cout << "Characters are not balanced." << endl;
	}

	return 0;
}

bool balancedParens(ifstream &myStream)
{
	apstack<char> tempStack;
	char tempChr;
	char topChr;

	while (!(myStream.eof()))
	{
		myStream >> tempChr;

		if (!(tempStack.isEmpty()))
		{
			topChr = tempStack.top();
		}

		if (tempChr == '(' || tempChr == '{' || tempChr == '[') 
		{
			tempStack.push(tempChr);
		}
		else if (tempChr == closingVersion(topChr)) 
		{
			if (!(tempStack.isEmpty())) 
			{
				tempStack.pop();
			}
		}
		else if (tempChr != closingVersion(topChr) && (tempChr == ')' || tempChr == '}' || tempChr == ']'))
		{
			return false;
		}
	}

	return tempStack.isEmpty();
}

char closingVersion(char theChar)
{
	if (theChar == '(')
	{
		return ')';
	}
	else
	{
		return char(int(theChar) + 2);
	}
	
	return '0';
}