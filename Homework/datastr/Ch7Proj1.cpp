// Eric Kirse (1337 c0d3rz, Inc.)
// AP Data Structures
// Period 4
// March 5, 2003
// Purpose - Benchmark sorting algorithms.

#include <iostream.h>
#include <limits.h>
#include "H:/classfiles/randgen.h"
#include "H:/classfiles/apvector.h"
#include "H:/classfiles/sorts.h"
#include <time.h>
#include <stdlib.h>

void fillArray(apvector<int> & array, const int length);
void displayArray(const apvector<int> & array);
void displayMenu();
void performSort(const int sortNum);

int main()
{	
	int menuChoice = 1;
	int diffTime = 0;
	/*time_t startTime;
	time_t endTime;
	startTime = time(NULL);*/
	
	while (menuChoice)
	{
		displayMenu();
		cout << "  Please choose a number: ";
		cin >> menuChoice;
		cout << endl;
		performSort(menuChoice);
		system("PAUSE");
		system("CLS");
	}

	return 0;
}

void fillArray(apvector<int> & array, const int length)
{
	int i = 0;
	RandGen rGen;

	array.resize(length);

	for (i = 0; i < array.length(); i++)
	{
		array[i] = rGen.RandInt(0,(INT_MAX) - 1);
	}
}

void displayArray(const apvector<int> & array)
{
	int i = 0;

	for (i = 0; i < (array.length() - 1); i++)
	{
		cout << "[" << i << "] " << array[i] << endl;
	}
}

void displayMenu()
{
	cout << "====== Sorting Algorithm Benchmark ======" << endl;
	cout << " [1] Bubble" << endl;
	cout << " [2] Selection" << endl;
	cout << " [3] Insertion" << endl;
	cout << " [4] Shell" << endl;
	cout << " [5] Quick" << endl;
	cout << " [6] Heap" << endl;
	cout << " [7] Merge" << endl;
	cout << " [8] Run All Sorting Algorithms" << endl;
	cout << " [0] Exit Program" << endl;
	cout << "=========================================" << endl;
}

void performSort(const int sortNum)
{
	time_t startTime;
	time_t endTime;
	apvector<int> array;
	int arraySize = 0;
	int diffTime = 0;

	switch (sortNum)
	{
	case 1:
		cout << ">>> Running Bubble Sort Benchmark" << endl;
		cout << "    Enter a preferred array size: ";
		cin >> arraySize;
		cout << "    Filling Array for Benchmark: ";
		fillArray(array,arraySize);
		cout << "Complete!" << endl;

		cout << "    Sorting Array (Bubble): ";
		startTime = time(NULL);
		bubbleSort(array);
		endTime = time(NULL);
		diffTime = endTime - startTime;
		cout << "Complete!" << endl;

		if (diffTime)
		{
			cout << "    Bubble Sort RunTime: " << diffTime << " second(s)." << endl << endl;
		}
		else
		{
			cout << "    Bubble Sort RunTime: " << "less than 1 second." << endl << endl;
		}

		break;
	case 2:
		cout << ">>> Running Selection Sort Benchmark" << endl;
		cout << "    Enter a preferred array size: ";
		cin >> arraySize;
		cout << "    Filling Array for Benchmark: ";
		fillArray(array,arraySize);
		cout << "Complete!" << endl;

		cout << "    Sorting Array (Selection): ";
		startTime = time(NULL);
		selectionSort(array);
		endTime = time(NULL);
		diffTime = endTime - startTime;
		cout << "Complete!" << endl;

		if (diffTime)
		{
			cout << "    Selection Sort RunTime: " << diffTime << " second(s)." << endl << endl;
		}
		else
		{
			cout << "    Selection Sort RunTime: " << "less than 1 second." << endl << endl;
		}

		break;
	case 3:
		cout << ">>> Running Insertion Sort Benchmark" << endl;
		cout << "    Enter a preferred array size: ";
		cin >> arraySize;
		cout << "    Filling Array for Benchmark: ";
		fillArray(array,arraySize);
		cout << "Complete!" << endl;

		cout << "    Sorting Array (Insertion): ";
		startTime = time(NULL);
		insertionSort(array);
		endTime = time(NULL);
		diffTime = endTime - startTime;
		cout << "Complete!" << endl;

		if (diffTime)
		{
			cout << "    Insertion Sort RunTime: " << diffTime << " second(s)." << endl << endl;
		}
		else
		{
			cout << "    Insertion Sort RunTime: " << "less than 1 second." << endl << endl;
		}

		break;
	case 4:
		cout << ">>> Running Shell Sort Benchmark" << endl;
		cout << "    Enter a preferred array size: ";
		cin >> arraySize;
		cout << "    Filling Array for Benchmark: ";
		fillArray(array,arraySize);
		cout << "Complete!" << endl;

		cout << "    Sorting Array (Shell): ";
		startTime = time(NULL);
		shellSort(array);
		endTime = time(NULL);
		diffTime = endTime - startTime;
		cout << "Complete!" << endl;

		if (diffTime)
		{
			cout << "    Shell Sort RunTime: " << diffTime << " second(s)." << endl << endl;
		}
		else
		{
			cout << "    Shell Sort RunTime: " << "less than 1 second." << endl << endl;
		}

		break;
	case 5:
		cout << ">>> Running Quick Sort Benchmark" << endl;
		cout << "    Enter a preferred array size: ";
		cin >> arraySize;
		cout << "    Filling Array for Benchmark: ";
		fillArray(array,arraySize);
		cout << "Complete!" << endl;

		cout << "    Sorting Array (Quick): ";
		startTime = time(NULL);
		quickSort(array,0,(arraySize - 1));
		endTime = time(NULL);
		diffTime = endTime - startTime;
		cout << "Complete!" << endl;

		if (diffTime)
		{
			cout << "    Quick Sort RunTime: " << diffTime << " second(s)." << endl << endl;
		}
		else
		{
			cout << "    Quick Sort RunTime: " << "less than 1 second." << endl << endl;
		}

		break;
	}
}

