#include <iostream.h>
#include <apstring.h>
#include <apvector.h>
#include <stdlib.h>

int main()
{
	int userMenuChoice = 0;

	int palNum = 0;
	int digitPos = 0;
	apvector <int> digit(4,0);

	int palLen = 0;
	apstring palString = "";

	while (userMenuChoice != 3)
	{
		cout << "+------------------------------+" << endl;
		cout << "| 1) Numeric Palindrome Test   |" << endl;
		cout << "| 2) String Palindrome Test    |" << endl;
		cout << "| 3) Exit                      |" << endl;
		cout << "+------------------------------+" << endl;
		cout << "Please enter a menu choice: ";

		cin >> userMenuChoice;
	// need a while loop here...
		switch (userMenuChoice)
		{
		case 1:
			cout << "Enter a 4-digit integer: ";

			cin >> palNum;

			do
			{
				digit[digitPos] = palNum % 10;
				palNum = palNum / 10;
				digitPos++;
			}while (palNum > 0);
		
			if (((digit[0] == digit[3]) && (digit[1] == digit[2])))
			{
				cout << "The integer inputted is a palindrome!" << endl << endl;
			}
			else
			{
				cout << "The integer inputted is not a palindrome." << endl << endl;
			}

			break;

		case 2:
			cout << "Please enter a string: ";

			cin >> palString;

			palLen = palString.length();

			if (palString[0] == palString[19] //....etc.
			{
				cout << "The string is a palindrome!" << endl << endl;
			}
			else
			{
				cout << "The string is not a palindrome." << endl << endl;
			}

			break;
		}
	}

	return 0;
}




