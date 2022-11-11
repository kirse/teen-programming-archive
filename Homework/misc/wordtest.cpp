#include <iostream.h>
#include <fstream.h>
#include <apstring.h>
int hash(const apstring &word);

int main()
{
	ifstream file;
	int best = 200000000;
	int wordnum = 0;
	apstring cword = " ";
	apstring test;
	int finalv = 0;
	int target = 0;
	int numtoget = 0;

	/*for (i = 0; i < 10; i++)
	{
		cin >> test;
		cout << test << " " << hash(test) << " " << (90000000 - hash(test)) << endl;
	}*/

	cout << "Enter your target number: ";
	cin >> numtoget;

	cout << "Enter the desired maximum distance from " << numtoget << ": ";
	cin >> target;

	cout << endl << "----------------------------------------------------------------" << endl;
	cout << " Warning: >> Some extremely long words may create false values." << endl;
	cout << "          >> Words beginning with capital letters are no good! " << endl;
	cout << "----------------------------------------------------------------" << endl << endl;

	file.open("C:/Programming/C++/web2.txt");

	while (!file.eof())
	{
		file >> test;
		wordnum = hash(test);
		finalv = numtoget - wordnum;

		if ((finalv > 0) && finalv <= target)
		{
			best = finalv;
			cword = test;
			cout << cword << " -> " << best << endl;
		}

		//cout << cword << " " << finalv << endl;
	}

	/*while (!file.eof())
	{
		file >> test;
		cout << test << " " << hash(test) << endl;
	}*/

	file.close();

	return 0;
}

int hash(const apstring &word)
{
	int t = 0;
	int i = 0;
	int cv = 1;

	for (i = 0; i < word.length(); i++)
	{
		t = int(word[i]) - 96;

		if (int(word[i]) > 96 && int(word[i]) < 123)
		{
			cv *= t;
		}
	}

	return cv;
}