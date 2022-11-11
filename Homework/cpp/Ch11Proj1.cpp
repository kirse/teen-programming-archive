// Eric Kirse
// Ch11Proj1
// Period 5
// January 29th, 2002
// Purpose - Allow a user to manage bowling team records.

#include <iostream.h>
#include <fstream.h>
#include "apstring.h"

void displayMenu();
void menuOpt(int choice);

int main()
{	
	int userNum = 0;

	do
	{
		menuOpt(userNum);
		displayMenu();
		cin >> userNum;

	}while (userNum != 4);

	return 0;	
} // end of main

void displayMenu()
{
	cout << "1) Replace Bowler Record" << endl;
	cout << "2) Compute team average" << endl;
	cout << "3) Look up bowler average" << endl;
	cout << "4) Exit" << endl;
	cout << "Enter a menu choice: ";
} // end of displayMenu

void menuOpt(int choice)
{
	apstring team;
	apstring player;
	apstring newPlayer;
	apstring tempStr;
	int newAvg = 0;

	int tempScore = 0;
	int i = 0;
	int totalScore = 0;

	ifstream strikeIn;
	ofstream strikeOut;
	ifstream gutIn;
	ofstream gutOut;
	ifstream tempIn;
	ofstream tempOut;

	bool isRep = false;
	bool isMem = false;

	switch (choice)
	{
	case 1:
		cout << endl << "[ Team Listing ]" << endl;
		cout << "  > Strikers" << endl;
		cout << "  > Gutters" << endl << endl;
		cout << "Type a Team Name: ";
		cin >> team;

		if (team == "Strikers")
		{
			cin.ignore(80,'\n');
			cout << "Bowler to replace: ";
			getline(cin,player);

			cout << "Replace with player: ";
			getline(cin,newPlayer);

			cout << "New player's average: ";
			cin >> newAvg;
			cout << endl;
						
			strikeIn.open("Z:/C++/Ch 11/strikers.txt");
			tempOut.open("Z:/C++/Ch 11/temp.txt");

			for (i = 0; i != 6; i++)
			{
				getline(strikeIn,tempStr);

				if (player == tempStr)
				{
					tempOut << newPlayer << endl;
					tempOut << newAvg << endl;
					getline(strikeIn,tempStr);
				}
				else
				{
					tempOut << tempStr << endl;
				}

			}

			strikeIn.close();
			tempOut.close();

			strikeOut.open("Z:/C++/Ch 11/strikers.txt");
			tempIn.open("Z:/C++/Ch 11/temp.txt");

			for (i = 0; i != 6; i++)
			{
				getline(tempIn,tempStr);

				if (i == 6)
				{
					strikeOut << tempStr;
				}
				else
				{
					strikeOut << tempStr << endl;
				}

			}

			strikeOut.close();
			tempIn.close();		
		}

		if (team == "Gutters")
		{
			cin.ignore(80,'\n');
			cout << "Bowler to replace: ";
			getline(cin,player);

			cout << "Replace with player: ";
			getline(cin,newPlayer);

			cout << "New player's average: ";
			cin >> newAvg;
			cout << endl;
						
			gutIn.open("Z:/C++/Ch 11/Gutters.txt");
			tempOut.open("Z:/C++/Ch 11/temp.txt");

			for (i = 0; i != 6; i++)
			{
				getline(gutIn,tempStr);

				if (player == tempStr)
				{
					tempOut << newPlayer << endl;
					tempOut << newAvg << endl;
					getline(gutIn,tempStr);
				}
				else
				{
					tempOut << tempStr << endl;
				}

			}

			gutIn.close();
			tempOut.close();

			gutOut.open("Z:/C++/Ch 11/Gutters.txt");
			tempIn.open("Z:/C++/Ch 11/temp.txt");

			for (i = 0; i != 6; i++)
			{
				getline(tempIn,tempStr);

				if (i == 6)
				{
					gutOut << tempStr;
				}
				else
				{
					gutOut << tempStr << endl;
				}

			}

			gutOut.close();
			tempIn.close();
		}

		break;
	case 2:
		cout << endl << "[ Team Listing ]" << endl;
		cout << "  > Strikers" << endl;
		cout << "  > Gutters" << endl << endl;
		cout << "Type a Team Name: ";
		cin >> team;
		
		cin.ignore(80,'\n');

		if (team == "Strikers")
		{

			strikeIn.open("Z:/C++/Ch 11/strikers.txt");

			for (i = 0; i != 6; i+=2)
			{
				getline(strikeIn,tempStr);
				strikeIn >> tempScore;
				getline(strikeIn,tempStr);

				totalScore += tempScore;
			}

			cout << "Team Average is: " << int((totalScore / 3.0) + .5)
				<< endl << endl;

			strikeIn.close();
		}

		if (team == "Gutters")
		{
			gutIn.open("Z:/C++/Ch 11/gutters.txt");

			for (i = 0; i != 6; i+=2)
			{
				getline(gutIn,tempStr);
				gutIn >> tempScore;
				getline(gutIn,tempStr);

				totalScore += tempScore;
			}

			cout << "Team Average is: " << int((totalScore / 3.0) + .5)
				<< endl << endl;

			strikeIn.close();
		}


		break;
	case 3:
		cout << endl << "[ Team Listing ]" << endl;
		cout << "  > Strikers" << endl;
		cout << "  > Gutters" << endl << endl;
		cout << "Enter a player name: ";

		cin.ignore(80,'\n');
		getline(cin,player);
		cout << "Enter a team name: ";
		cin >> team;

		if (team == "Strikers")
		{
			strikeIn.open("Z:/C++/Ch 11/strikers.txt");

			for (i = 0; i != 6; i+=2)
			{
				getline(strikeIn,tempStr);

				if ((player == tempStr) && (isMem == false))
				{
					getline(strikeIn,tempStr);
					cout << player << "'s average is " << tempStr << "."
						<< endl << endl;
					isMem = true;
				}

			}

			if (!isMem)
			{
				cout << player << " is not a member." << endl;
			}

			strikeIn.close();
		}

		if (team == "Gutters")
		{
			gutIn.open("Z:/C++/Ch 11/gutters.txt");

			for (i = 0; i != 6; i+=2)
			{
				getline(gutIn,tempStr);

				if ((player == tempStr) && (isMem == false))
				{
					getline(gutIn,tempStr);
					cout << player << "'s average is " << tempStr << "."
						<< endl << endl;
					isMem = true;
				}

			}

			if (!isMem)
			{
				cout << player << " is not a member." << endl;
			}

			gutIn.close();
		}

		break;
	}

} // end of menuOpt