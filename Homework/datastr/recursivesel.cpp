// Eric Kirse
// Ch5Proj1
// Period 4
// January 8, 2003
// Purpose - Illustrate a recursive implementation of a
//			 selection sort.

#include <iostream.h>
#include <apvector.h>

void selectionSort(apvector<int> & array, int startPos);
void outputArray(apvector<int> & array);

int main()
{
	int numToInput = 0;
		// how many items will the vector hold
	int temp = 0;
		// temporary variable for inputting data
	int i = 0;
		// loop to fill up array

	apvector<int> arrayToSort;
		// our user-filled array to be sorted

	cout << "Number of data items to be entered: ";
	cin >> numToInput;

	arrayToSort.resize(numToInput);

	for (i = 0; i < arrayToSort.length(); i++)
	{
		cout << "Data Item #" << (i + 1) << ": ";
		cin >> temp;
		arrayToSort[i] = temp;
	}

	selectionSort(arrayToSort,0);
		// call the function to sort the array
	outputArray(arrayToSort);
		// output the newly sorted array
	return 0;
}// end of main


void selectionSort(apvector<int> & array, int startPos)
{
		// if we've looped through entire array
		//		then begin backtracking
    if (startPos >= array.length() - 1)
	{
        return;
	}

    int minPos = startPos;
		// the position in array with lowest value
    int temp = array[startPos];
		// our item to be switched (if needed)
	int pos = 0;
		// used for looping through array

    for (pos = startPos + 1; pos < array.length(); pos++)
    {
		// loop through array and compare our data value
		//		at minPos (to make sure its the lowest)
        if (array[pos] < array[minPos])
		{
		// if the value at minPos isnt the lowest, then
		//		get the index of the new lowest value
            minPos = pos;
		}
    }
		// swap our originally startingPosition element
		//		with the lowest element found in the array
    array[startPos] = array[minPos];
    array[minPos] = temp;

		// recursive call with progressively shorter array
    selectionSort(array, startPos + 1);
}// end of selectionSort

void outputArray(apvector<int> & array)
{
		// a simple function used to output the contents
		//		of an array
	int pos = 0;

	cout << "[ ";
	for (pos = 0; pos < array.length(); pos++)
	{
		cout << array[pos] << " ";
	}
	cout << "]" << endl;
}// end of outputArray