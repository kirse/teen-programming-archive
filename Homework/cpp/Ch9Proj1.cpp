// Eric Kirse
// Ch9Proj1
// Period 5
// December 15, 2001
// Purpose - Allow a user to compute prices for 
//			 various items in a fruit stand.

#include <iostream.h>
#include <iomanip.h>

void menu();
double addCandyCost(int amount, double costPerEach);
double addFruitCost(int amount, double costPerEach);
double computeSalesTax(double price, double taxRate);
double round(double amount, int place);

const double PRICE_APPLES = 0.5;
const double PRICE_GRAPES = 1.25;
const double PRICE_CANDY = 0.85;
const double SALES_TAX = 0.06;

int main()
{
	double total = 0.0;
	int userMenuChoice = 0;

	bool boughtApples = false;
	int numApples = 0;
	double appleCost = 0.0;

	bool boughtGrapes = false;
	int numGrapes = 0;
	double grapeCost = 0.0;

	bool boughtCandy = false;
	int numCandyBars = 0;
	double candyCost = 0.0;

	while (userMenuChoice != 4)
	{

		if (boughtCandy && boughtGrapes && boughtApples)
		{
			userMenuChoice = 4;
		}
		else
		{
			menu();
			cin >> userMenuChoice;
		}

		cout.setf(ios::fixed);

		switch (userMenuChoice)
		{
		case 1:

			if (boughtApples == true)
			{
				cout << "You have already bought apples." << endl << endl;
			}
			else
			{
				cout << "Enter the number of apples to buy: ";
				cin >> numApples;
				cout << endl;

				appleCost = addFruitCost(numApples,PRICE_APPLES);
				total += appleCost;

				if (total > 100)
				{
					total -= appleCost;
					cout << "You cannot spend more than $100." << endl << endl;
				}
				else
				{
					boughtApples = true;
				}

			}

			break;
		case 2:

			if (boughtGrapes == true)
			{
				cout << "You have already bought grapes." << endl << endl;
			}
			else
			{
				cout << "Enter the number of pounds of grapes: ";
				cin >> numGrapes;
				cout << endl;

				grapeCost = addFruitCost(numGrapes,PRICE_GRAPES);
				total += grapeCost;

				if (total > 100)
				{
					total -= grapeCost;
					cout << "You cannot spend more than $100." << endl << endl;
				}
				else
				{
					boughtGrapes = true;
				}

			}

			break;
		case 3:

			if (boughtCandy == true)
			{
				cout << "You have already bought candy!" << endl << endl;
			}
			else
			{
				cout << "Enter the number of candy bars to buy: ";
				cin >> numCandyBars;
				cout << endl;

				candyCost = addCandyCost(numCandyBars,PRICE_CANDY);
				total += candyCost;

				if (total > 100)
				{
					total -= candyCost;
					cout << "You cannot spend more than $100." << endl << endl;
				}
				else
				{
					boughtCandy = true;
				}

			}

			break;
		case 4:
			cout << "The final owed amount is $" << setprecision(2) << total;
			cout << endl << endl;
			break;

		}

	}
	
	return 0;
}



void menu()
{
	cout << "Welcome to Fruity Fruit Stand!" << endl;
	cout << "1. Apples" << endl;
	cout << "2. Grapes" << endl;
	cout << "3. Candy Bars" << endl;
	cout << "4. Checkout" << endl;
	cout << "Enter a menu choice: ";
}

double addCandyCost(int amount, double costPerEach)
{
	double theCost = 0.0;
	double tax = 0.0;

	tax = computeSalesTax((amount * costPerEach),SALES_TAX);
	theCost = tax + (amount * costPerEach);
	theCost = round(theCost,2);

	return theCost;
}

double addFruitCost(int amount, double costPerEach)
{
	double theCost = 0.0;

	theCost = amount * costPerEach;

	return theCost;
}

double computeSalesTax(double price, double taxRate)
{
	double taxAmount = 0.0;

	taxAmount = price * taxRate;

	return taxAmount;
}

double round(double amount, int place)
{
	double finalAmount = 0.0;

		switch (place)
		{
		case 0:
			finalAmount = int(amount + 0.5);
			break;
		case 1:
			finalAmount = int(10 * (amount + 0.05)) / 10.0;
			break;
		case 2:
			finalAmount = int(100 * (amount + 0.005)) / 100.0;
		}

	return finalAmount;
}


