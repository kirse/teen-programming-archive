// Eric Kirse
// Ch11Proj1
// Period 5
// February 7th, 2002
// Purpose - Allow a user to manage bowling team records.

#include <iostream.h>
#include <fstream.h>
#include "apstring.h"

void displayMenu();
void transferData(ofstream & fileOut, ifstream & tempIn);
void addPlayer(ifstream & fileIn, ofstream & tempOut);
void getAverage(ifstream &fileIn);
void getScore(apstring player, ifstream &fileIn);


int main()
{	
	int userNum = 0;		// user's menu choice
	apstring team;			// user's team choice
	apstring player;		// user's player choice
	ifstream strikeIn;		// strikers read data
	ofstream strikeOut;		// strikers write data
	ifstream gutIn;			// gutters read data
	ofstream gutOut;		// gutters write data
	ifstream tempIn;		// temp file reading
	ofstream tempOut;		// temp file writing

	do						// menu choice displayer
	{
		switch (userNum)
		{
		case 1:				// change player
			cout << endl << "> Strikers" << endl << "> Gutters" << endl;
			cout << "Enter the team name: ";
			cin >> team;

			if (team == "Strikers")
			{
				strikeIn.open("strikers.txt");
				tempOut.open("temp.txt");
				addPlayer(strikeIn,tempOut);
				
				strikeOut.open("strikers.txt");
				tempIn.open("temp.txt");
				transferData(strikeOut,tempIn);
			}
			else if (team == "Gutters")
			{
				gutIn.open("gutters.txt");
				tempOut.open("temp.txt");
				addPlayer(gutIn,tempOut);

				gutOut.open("gutters.txt");
				tempIn.open("temp.txt");
				transferData(gutOut,tempIn);
			}

			break;
		case 2:				// get average
			cout << endl << "> Strikers" << endl << "> Gutters" << endl;
			cout << "Enter the team name: ";
			cin >> team;

			if (team == "Strikers")
			{
				strikeIn.open("strikers.txt");
				getAverage(strikeIn);
			}
			else if (team == "Gutters")
			{
				gutIn.open("gutters.txt");
				getAverage(gutIn);
			}

			break;
		case 3:				// get indiv. score
			cout << endl << "> Strikers" << endl << "> Gutters" << endl;
			cout << "Enter the team name: ";
			cin >> team;

			cin.ignore(80,'\n');
			cout << "Enter the player name: ";
			getline(cin,player);

			if (team == "Strikers")
			{
				strikeIn.open("strikers.txt");
				getScore(player,strikeIn);
			}
			else if (team == "Gutters")
			{
				gutIn.open("gutters.txt");
				getScore(player,gutIn);
			}

		}

		displayMenu();
		cin >> userNum;
	} while (userNum != 4);

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

void transferData(ofstream &fileOut, ifstream &tempIn)
{
	int i = 0;
	apstring tempStr;		// takes data from temp file
							//  and moves to other file

	for (i = 0; i != 6; i++)
	{
		getline(tempIn,tempStr);

		if (i == 6)
		{
			fileOut << tempStr;
		}
		else
		{
			fileOut << tempStr << endl;
		}

	}

	fileOut.close();
	tempIn.close();
} // end of transferData

void addPlayer(ifstream &fileIn, ofstream &tempOut)
{
	apstring player;		// the player to replace
	apstring newPlayer;		// new player inserted
	apstring tempStr;		// temp string holding data
	int newAvg = 0;			// new player's score
	int i = 0;				// loop variable

	cin.ignore(80,'\n');
	cout << endl << "Bowler to replace: ";
	getline(cin,player);
	cout << "Replace with player: ";
	getline(cin,newPlayer);
	cout << "New player's average: ";
	cin >> newAvg;
	cout << endl;
							// loop through each item in file
							//  check for matches / replace
	for (i = 0; i != 6; i++)
	{
		getline(fileIn,tempStr);

		if (player == tempStr)
		{
			tempOut << newPlayer << endl;
			tempOut << newAvg << endl;
			getline(fileIn,tempStr);
		}
		else
		{
			tempOut << tempStr << endl;
		}

	}

	fileIn.close();
	tempOut.close();
} // end of addPlayer

void getAverage(ifstream &fileIn)
{
	int i = 0;				// loop variable
	int tempScore = 0;		// holds inputted score
	int totalScore = 0;		// stores total
	apstring tempStr;		// temp junk string

							// loop through and get the averages
							//   add them up for later computing
	for (i = 0; i != 6; i+=2)
	{
		getline(fileIn,tempStr);
		fileIn >> tempScore;
		getline(fileIn,tempStr);
		totalScore += tempScore;
	}

	cout << "Team Average is: " << int((totalScore / 3.0) + .5)
		<< endl << endl;

	fileIn.close();
}

void getScore(apstring player, ifstream &fileIn)
{
	apstring tempStr;		// temporary string holding data
	int i = 0;				// loop variable
	bool isMem = false;		// is the person a member??

							// loop through till we find the person
							//   if he is, then get average, otherwise
							//   isMem stays false...
	for (i = 0; i != 6; i++)
	{
		getline(fileIn,tempStr);

		if ((player == tempStr) && (isMem == false))
		{
			getline(fileIn,tempStr);
			cout << player << "'s average is " << tempStr << "."
				<< endl << endl;
			isMem = true;
		}

	}

	if (!isMem)
	{
		cout << player << " is not a member." << endl;
	}

} // end of getScore
