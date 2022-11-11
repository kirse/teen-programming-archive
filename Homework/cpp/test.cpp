#include <iostream.h>
#include <iomanip.h>

int main()
{
	double exact = 0.0;  // the price of a car 		
	cout << "Enter the price of the car: ";
	cin >> exact;

	cout << "Roughly, the car will cost $" << setprecision(2) << exact << "." << endl;
	// setprecision forces C++ to round or truncate future values to a certain number 
	// of significant digits	// sometimes causing values to be printed in scientific notation
	
	cout.setf(ios::fixed);
	// This causes all future cout's to print normal rather than in scientific notation.
	// Also, it causes the setprecision to apply to the number of digits
	// to the right of the decimal place rather than the number of digits
	// in the whole value.

	cout << "The price $" << exact << " probably looks better." << endl;

	cout << "More space is provided for the price here: $" << setw(10) << exact << endl;
	// setw allocates more space for a value to be printed 

	return 0;
}// end of main
