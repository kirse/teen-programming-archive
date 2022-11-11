#include <apvector.h>
#include <time.h>
bool works(apvector<int> &temp);
void disp(apvector<int> &temp, double &it);

int main()
{
	apvector<int> av(10,0);
	int x = 0;
	int y = 0;
	double iter = 0;

	//while (!(works(av)))
	for (y = 0; y < 2147483600; y++)
	{
		for (x = 0; x < 10; x++)
		{
			av[x] = rand()%10;
		}
		//iter = 2147483647;
		//cout << "Vector #" << iter << endl;
		//iter++;

		if (works(av)) { break; }
		cout << y << endl;
	}

/*	cout << "Took " << iter << " times before evolution worked." << endl;
	cout << "It would take: " << endl;
	cout << "               " << (iter * 5) / 60 << " minutes for a human to do this experiment." << endl;
	cout << "               " << ((iter * 5) / 60) / 60 << " hours." << endl;
	cout << "               " << (((iter * 5) / 60) / 60) / 24 << " days." << endl;
	cout << "               " << ((((iter * 5) / 60) / 60) / 24) / 365 << " years." << endl;
*/
	cout << "Took " << y << " times before evolution worked." << endl;
	cout << "It would take: " << endl;
	cout << "               " << (y * 5) / 60 << " minutes for a human to do this experiment." << endl;
	cout << "               " << ((y * 5) / 60) / 60 << " hours." << endl;
	cout << "               " << (((y * 5) / 60) / 60) / 24 << " days." << endl;
	cout << "               " << ((((y * 5) / 60) / 60) / 24) / 365 << " years." << endl;

	return 0;
}

bool works(apvector<int> &temp)
{
	int x = 0;
	int t = 0;

	t = temp[0] + 1;

	for (x = 1; x < 10; x++)
	{
		if (t != temp[x]) { return false;}
		t = temp[x] + 1;
	}

	return true;
}

void disp(apvector<int> &temp, double &it)
{
	int x = 0;

	cout << "Testing Vector #" << it << " ";

	for (x = 0; x < 10; x++)
	{
		cout << temp[x] << "|";
	}

	cout << endl;
}
