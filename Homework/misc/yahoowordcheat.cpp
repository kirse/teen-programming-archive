#include <iostream.h>
#include <fstream.h>
#include <apstring.h>

int checkword(const apstring word, const apstring letterset);

int main()
{
	apstring letterset;
	apstring word;
	INT x = 0;

	char letter;
	ifstream file;

	cout << "=== Enter your six letters ===" << endl;
	cout << " Letter #1: ";
	cin >> letter;
	letterset += letter;
	cout << " Letter #2: ";
	cin >> letter;
	letterset += letter;
	cout << " Letter #3: ";
	cin >> letter;
	letterset += letter;
	cout << " Letter #4: ";
	cin >> letter;
	letterset += letter;
	cout << " Letter #5: ";
	cin >> letter;
	letterset += letter;
	cout << " Letter #6: ";
	cin >> letter;
	letterset += letter;

	file.open("C:/Programming/C++/web2.txt");

	while (!(file.eof()))
	{
		file >> word;

		if (checkword(word,letterset))
		{
			cout << word << endl;
		}
	}

	file.close();

	return 0;
}

int checkword(const apstring word, apstring letterset)
{
	int len = word.length();
	int i = 0;
	int t = 0;
	bool chgMade = true;
	int numcm = 0;

	if (len > 6 || len < 4)
	{
		return 0;
	}

	while (i < len) // each character
	{
		chgMade = false;

		while ((t < 6) || chgMade) //find match in set
		{
			if (word[i] == letterset[t]) // match found
			{
				chgMade = true;
				letterset[t] = '@';
				t = 0;
				break;
			}
			t++;
		}

		if (chgMade == false)
		{
			return 0;
		}

		i++;
	}

	return 1;
}