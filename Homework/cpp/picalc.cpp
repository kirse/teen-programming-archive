#include <iostream.h>
#include <math.h>
#include <iomanip.h>

int main()
{
	double sum = 0.0;
	double i = 0.0;
	
	cout.setf(ios::fixed);

	for (i = 1.0; i < 2147000000.0; i+= 1.0)
	{
		sum = sum + pow(-1,i+1) * pow(1,(2*i)-1) / ((2*i)-1);
		cout << "I is: " << setprecision(0) << i << "    ";
		cout << "PI is: " << setprecision(50) << (sum * 4) << endl;
	}

	return 0;
}



