// Eric Kirse
// Ch10Proj1
// Period 5
// January 20th, 2002
// Purpose - Allow a user to input car specs
//           and store them into nested structs.

#include <iostream.h>
#include <apstring.h>
#include <stdlib.h>

struct engine				// engine specs.
{
	int horsepower;			// horsepower of engine
	int torque;				// torque of engine
};

struct car					// car specs.
{
	apstring model;			// model of car
	int cost;				// price of car
	engine engInfo;			// nested struct - engine specs.
};

void displayData(car struc1, car struc2, car struc3);

int main()
{
	car userCar;			// the user's three possible
	car userCar2;			//  car specifications
	car userCar3;
							// prompt them to input data,
							//   store into structs.

	cout << "Please enter information for three cars!" << endl;
	cout << "============= Car #1 =============" << endl;
	cout << "Model: ";
	cin >> userCar.model;
	cout << "Cost: ";
	cin >> userCar.cost;
	cout << "Horsepower: ";
	cin >> userCar.engInfo.horsepower;
	cout << "Torque: ";
	cin >> userCar.engInfo.torque;


	cout << endl << "============= Car #2 =============" << endl;
	cout << "Model: ";
	cin >> userCar2.model;
	cout << "Cost: ";
	cin >> userCar2.cost;
	cout << "Horsepower: ";
	cin >> userCar2.engInfo.horsepower;
	cout << "Torque: ";
	cin >> userCar2.engInfo.torque;

	cout << endl << "============= Car #3 =============" << endl;
	cout << "Model: ";
	cin >> userCar3.model;
	cout << "Cost: ";
	cin >> userCar3.cost;
	cout << "Horsepower: ";
	cin >> userCar3.engInfo.horsepower;
	cout << "Torque: ";
	cin >> userCar3.engInfo.torque;

	system("CLS");			// clear screen before output
							//   call display function...

	displayData(userCar,userCar2,userCar3);
	
	return 0;
} // end of main

void displayData(car struc1, car struc2, car struc3)
{
							// output info to user
	cout << "----------------------------------" << endl;
	cout << ">>> Information Report: Car #1" << " <<<" << endl;
	cout << "----------------------------------" << endl;
	cout << "Model is " << struc1.model << "." << endl;
	cout << "Cost is $" << struc1.cost << "." << endl;
	cout << "Horsepower is " << struc1.engInfo.horsepower << "." << endl;
	cout << "Torque is " << struc1.engInfo.torque << "." << endl << endl;

	cout << "----------------------------------" << endl;
	cout << ">>> Information Report: Car #2" << " <<<" << endl;
	cout << "----------------------------------" << endl;
	cout << "Model is " << struc2.model << "." << endl;
	cout << "Cost is $" << struc2.cost << "." << endl;
	cout << "Horsepower is " << struc2.engInfo.horsepower << "." << endl;
	cout << "Torque is " << struc2.engInfo.torque << "." << endl << endl;

	cout << "----------------------------------" << endl;
	cout << ">>> Information Report: Car #3" << " <<<" << endl;
	cout << "----------------------------------" << endl;
	cout << "Model is " << struc3.model << "." << endl;
	cout << "Cost is $" << struc3.cost << "." << endl;
	cout << "Horsepower is " << struc3.engInfo.horsepower << "." << endl;
	cout << "Torque is " << struc3.engInfo.torque << "." << endl << endl;
} // end of displayData
