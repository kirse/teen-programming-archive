#include <apstring.h>
#include <apvector.h>
#include <apmatrix.h>

int const MAX_LIST_SIZE = 100;

int digit(int number, int k);

void initializeCounters(apvector<int> &binCounters);

template <class element>
void addToBin(apmatrix<element> &bins, apvector<int> &binCounters, int number, int place);

template <class element>
void collectBins(apvector<element> &list, apmatrix<element> &bins, apvector<int> &binCounters);

template <class element>
void radixSort(apvector<element> &list, int n);

void initializeCounters(apvector<int> &binCounters)
{
	int x = 0;

	for (x = 0; x < 10; x++)
	{
		binCounters[x] = 0;
	}
}// end of InitializeCounters

template <class element>
void collectBins(apvector<element> &list, apmatrix<element> &bins, apvector<int> &binCounters)
{
	int x = 0;
	int y = 0;
	int lpos = 0;

	for (x = 0; x < 10; x++)
	{
		for (y = 0; y <= (binCounters[x] - 1); y++)
		{
			list[lpos] = bins[x][y];
			lpos++;
		}
	}

}// end of collectBins


template <class element>
void addToBin(apmatrix<element> &bins, apvector<int> &binCounters, int number, int place)
{
	bins[place][binCounters[place]] = number;
	binCounters[place] += 1;
}// end of addToBin

int digit(int number, int k)
{
	int rval = 0;

	switch (k)
	{
	case 1:
		rval = number % 10;
		break;
	case 2:
		rval = (number / 10) % 10;
		break;
	case 3:
		rval = (number / 100) % 10;
		break;
	case 4:
		rval = number / 1000;
		break;
	}

	return rval;
}// end of digit

template <class element>
void radixSort(apvector<element> &list, int n)
{
	int j, k;
	apmatrix<element> bins(10,MAX_LIST_SIZE);
	apvector<int> binCounters(10);

	initializeCounters(binCounters);

	for (k = 1; k <= 4; ++k)
	{
		for (j = 0; j < n; ++j)
		{
			addToBin (bins, binCounters, list[j], digit(list[j],k));
			collectBins (list, bins, binCounters);
		}
		initializeCounters(binCounters);
	}
}// end of radixSort