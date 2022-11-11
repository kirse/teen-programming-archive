#include <iostream.h>
#include <apstring.h>

struct LettersLine1
{
	apstring A;
	apstring B;
	apstring C;
	apstring D;
	apstring E;
	apstring F;
	apstring G;
	apstring H;
	apstring I;
	apstring J;
	apstring K;
	apstring L;
	apstring M;
	apstring N;
	apstring O;
	apstring P;
	apstring Q;
	apstring R;
	apstring S;
	apstring T;
	apstring U;
	apstring V;
	apstring W;
	apstring X;
	apstring Y;
	apstring Z;
	LettersLine1();
};

struct LettersLine2
{
	apstring A;
	apstring B;
	apstring C;
	apstring D;
	apstring E;
	apstring F;
	apstring G;
	apstring H;
	apstring I;
	apstring J;
	apstring K;
	apstring L;
	apstring M;
	apstring N;
	apstring O;
	apstring P;
	apstring Q;
	apstring R;
	apstring S;
	apstring T;
	apstring U;
	apstring V;
	apstring W;
	apstring X;
	apstring Y;
	apstring Z;
	LettersLine2();
};

struct LettersLine3
{
	apstring A;
	apstring B;
	apstring C;
	apstring D;
	apstring E;
	apstring F;
	apstring G;
	apstring H;
	apstring I;
	apstring J;
	apstring K;
	apstring L;
	apstring M;
	apstring N;
	apstring O;
	apstring P;
	apstring Q;
	apstring R;
	apstring S;
	apstring T;
	apstring U;
	apstring V;
	apstring W;
	apstring X;
	apstring Y;
	apstring Z;
	LettersLine3();
};

struct LettersLine4
{
	apstring A;
	apstring B;
	apstring C;
	apstring D;
	apstring E;
	apstring F;
	apstring G;
	apstring H;
	apstring I;
	apstring J;
	apstring K;
	apstring L;
	apstring M;
	apstring N;
	apstring O;
	apstring P;
	apstring Q;
	apstring R;
	apstring S;
	apstring T;
	apstring U;
	apstring V;
	apstring W;
	apstring X;
	apstring Y;
	apstring Z;
	LettersLine4();
};

struct LettersLine5
{
	apstring A;
	apstring B;
	apstring C;
	apstring D;
	apstring E;
	apstring F;
	apstring G;
	apstring H;
	apstring I;
	apstring J;
	apstring K;
	apstring L;
	apstring M;
	apstring N;
	apstring O;
	apstring P;
	apstring Q;
	apstring R;
	apstring S;
	apstring T;
	apstring U;
	apstring V;
	apstring W;
	apstring X;
	apstring Y;
	apstring Z;
	LettersLine5();
};

class BubbleLetters
{
private:
	apstring text;
	LettersLine1 txtLine1;
	LettersLine2 txtLine2;
	LettersLine3 txtLine3;
	LettersLine4 txtLine4;
	LettersLine5 txtLine5;
public:
	BubbleLetters();
	void setText(apstring);
	apstring getText();
	void printText();
};

LettersLine1::LettersLine1()
{
	A = "    _     ";
	B = " ____   ";
	C = "  ____  ";
	D = " ____   ";
	E = " _____  ";
	F = " _____  ";
	G = "  ____  ";
	H = " _   _  ";
	I = " ___  ";
	J = "     _  ";
	K = " _  __ ";
	L = " _      ";
	M = " __  __  ";
	N = " _   _  ";
	O = "  ___   ";
	P = " ____   ";
	Q = "  ___   ";
	R = " ____   ";
	S = " ____   ";
	T = " _____  ";
	U = " _   _  ";
	V = "__     __ ";
	W = "__        __ ";
	X = "__  __ ";
	Y = "__   __ ";
	Z = " _____ ";
}

LettersLine2::LettersLine2()
{
	A = "   / \\    ";
	B = "| __ )  ";
	C = " / ___| ";
	D = "|  _ \\  ";
	E = "| ____| ";
	F = "|  ___| ";
	G = " / ___| ";
	H = "| | | | ";
	I = "|_ _| ";
	J = "    | | ";
	K = "| |/ / ";
	L = "| |     ";
	M = "|  \\/  | ";
	N = "| \\ | | ";
	O = " / _ \\  ";
	P = "|  _ \\  ";
	Q = " / _ \\  ";
	R = "|  _ \\  ";
	S = "/ ___|  ";
	T = "|_   _| ";
	U = "| | | | ";
	V = "\\ \\   / / ";
	W = "\\ \\      / / ";
	X = "\\ \\/ / ";
	Y = "\\ \\ / / ";
	Z = "|__  / ";
}

LettersLine3::LettersLine3()
{
	A = "  / _ \\   ";
	B = "|  _ \\  ";
	C = "| |     ";
	D = "| | | | ";
	E = "|  _|   ";
	F = "| |_    ";
	G = "| |  _  ";
	H = "| |_| | ";
	I = " | |  ";
	J = " _  | | ";
	K = "| ' /  ";
	L = "| |     ";
	M = "| |\\/| | ";
	N = "|  \\| | ";
	O = "| | | | ";
	P = "| |_) | ";
	Q = "| | | | ";
	R = "| |_) | ";
	S = "\\___ \\  ";
	T = "  | |   ";
	U = "| | | | ";
	V = " \\ \\ / /  ";
	W = " \\ \\ /\\ / /  ";
	X = " \\  /  ";
	Y = " \\ V /  ";
	Z = "  / /  ";

}

LettersLine4::LettersLine4()
{
	A = " / ___ \\  ";
	B = "| |_) | ";
	C = "| |___  ";
	D = "| |_| | ";
	E = "| |___  ";
	F = "|  _|   ";
	G = "| |_| | ";
	H = "|  _  | ";
	I = " | |  ";
	J = "| |_| | ";
	K = "| . \\  ";
	L = "| |___  ";
	M = "| |  | | ";
	N = "| |\\  | ";
	O = "| |_| | ";
	P = "|  __/  ";
	Q = "| |_| | ";
	R = "|  _ <  ";
	S = " ___) | ";
	T = "  | |   ";
	U = "| |_| | ";
	V = "  \\ V /   ";
	W = "  \\ V  V /   ";
	X = " /  \\  ";
	Y = "  | |   ";
	Z = " / /_  ";
}

LettersLine5::LettersLine5()
{
	A = "/_/   \\_\\ ";
	B = "|____/  ";
	C = " \\____| ";
	D = "|____/  ";
	E = "|_____| ";
	F = "|_|     ";
	G = " \\____| ";
	H = "|_| |_| ";
	I = "|___| ";
	J = " \\___/  ";
	K = "|_|\\_\\ ";
	L = "|_____| ";
	M = "|_|  |_| ";
	N = "|_| \\_| ";
	O = " \\___/  ";
	P = "|_|     ";
	Q = " \\__\\_\\ ";
	R = "|_| \\_\\ ";
	S = "|____/  ";
	T = "  |_|   ";
	U = " \\___/  ";
	V = "   \\_/    ";
	W = "   \\_/\\_/    ";
	X = "/_/\\_\\ ";
	Y = "  |_|   ";
	Z = "/____| ";
}

BubbleLetters::BubbleLetters()
{
	text = "";
}

void BubbleLetters::setText(apstring tStr)
{
	text = tStr;
}

apstring BubbleLetters::getText()
{
	return text;
}

void BubbleLetters::printText()
{
	apstring line1;
	apstring line2;
	apstring line3;
	apstring line4;
	apstring line5;
	int j = 0;
	int strLen = 0;
	char tStr[100];

	strLen = text.length();

	while (j != strLen)
	{
		tStr[j] = text[j];
		
		switch (tStr[j])
		{
		case 'A':
		case 'a':
			line1 = line1 + txtLine1.A;
			line2 = line2 + txtLine2.A;
			line3 = line3 + txtLine3.A;
			line4 = line4 + txtLine4.A;
			line5 = line5 + txtLine5.A;
			break;
		case 'B':
		case 'b':
			line1 = line1 + txtLine1.B;
			line2 = line2 + txtLine2.B;
			line3 = line3 + txtLine3.B;
			line4 = line4 + txtLine4.B;
			line5 = line5 + txtLine5.B;
			break;
		case 'C':
		case 'c':
			line1 = line1 + txtLine1.C;
			line2 = line2 + txtLine2.C;
			line3 = line3 + txtLine3.C;
			line4 = line4 + txtLine4.C;
			line5 = line5 + txtLine5.C;
			break;
		case 'D':
		case 'd':
			line1 = line1 + txtLine1.D;
			line2 = line2 + txtLine2.D;
			line3 = line3 + txtLine3.D;
			line4 = line4 + txtLine4.D;
			line5 = line5 + txtLine5.D;
			break;
		case 'E':
		case 'e':
			line1 = line1 + txtLine1.E;
			line2 = line2 + txtLine2.E;
			line3 = line3 + txtLine3.E;
			line4 = line4 + txtLine4.E;
			line5 = line5 + txtLine5.E;
			break;
		case 'F':
		case 'f':
			line1 = line1 + txtLine1.F;
			line2 = line2 + txtLine2.F;
			line3 = line3 + txtLine3.F;
			line4 = line4 + txtLine4.F;
			line5 = line5 + txtLine5.F;
			break;
		case 'G':
		case 'g':
			line1 = line1 + txtLine1.G;
			line2 = line2 + txtLine2.G;
			line3 = line3 + txtLine3.G;
			line4 = line4 + txtLine4.G;
			line5 = line5 + txtLine5.G;
			break;
		case 'H':
		case 'h':
			line1 = line1 + txtLine1.H;
			line2 = line2 + txtLine2.H;
			line3 = line3 + txtLine3.H;
			line4 = line4 + txtLine4.H;
			line5 = line5 + txtLine5.H;
			break;
		case 'I':
		case 'i':
			line1 = line1 + txtLine1.I;
			line2 = line2 + txtLine2.I;
			line3 = line3 + txtLine3.I;
			line4 = line4 + txtLine4.I;
			line5 = line5 + txtLine5.I;
			break;
		case 'J':
		case 'j':
			line1 = line1 + txtLine1.J;
			line2 = line2 + txtLine2.J;
			line3 = line3 + txtLine3.J;
			line4 = line4 + txtLine4.J;
			line5 = line5 + txtLine5.J;
			break;
		case 'K':
		case 'k':
			line1 = line1 + txtLine1.K;
			line2 = line2 + txtLine2.K;
			line3 = line3 + txtLine3.K;
			line4 = line4 + txtLine4.K;
			line5 = line5 + txtLine5.K;
			break;
		case 'L':
		case 'l':
			line1 = line1 + txtLine1.L;
			line2 = line2 + txtLine2.L;
			line3 = line3 + txtLine3.L;
			line4 = line4 + txtLine4.L;
			line5 = line5 + txtLine5.L;
			break;
		case 'M':
		case 'm':
			line1 = line1 + txtLine1.M;
			line2 = line2 + txtLine2.M;
			line3 = line3 + txtLine3.M;
			line4 = line4 + txtLine4.M;
			line5 = line5 + txtLine5.M;
			break;
		case 'N':
		case 'n':
			line1 = line1 + txtLine1.N;
			line2 = line2 + txtLine2.N;
			line3 = line3 + txtLine3.N;
			line4 = line4 + txtLine4.N;
			line5 = line5 + txtLine5.N;
			break;
		case 'O':
		case 'o':
			line1 = line1 + txtLine1.O;
			line2 = line2 + txtLine2.O;
			line3 = line3 + txtLine3.O;
			line4 = line4 + txtLine4.O;
			line5 = line5 + txtLine5.O;
			break;
		case 'P':
		case 'p':
			line1 = line1 + txtLine1.P;
			line2 = line2 + txtLine2.P;
			line3 = line3 + txtLine3.P;
			line4 = line4 + txtLine4.P;
			line5 = line5 + txtLine5.P;
			break;
		case 'Q':
		case 'q':
			line1 = line1 + txtLine1.Q;
			line2 = line2 + txtLine2.Q;
			line3 = line3 + txtLine3.Q;
			line4 = line4 + txtLine4.Q;
			line5 = line5 + txtLine5.Q;
			break;
		case 'R':
		case 'r':
			line1 = line1 + txtLine1.R;
			line2 = line2 + txtLine2.R;
			line3 = line3 + txtLine3.R;
			line4 = line4 + txtLine4.R;
			line5 = line5 + txtLine5.R;
			break;
		case 'S':
		case 's':
			line1 = line1 + txtLine1.S;
			line2 = line2 + txtLine2.S;
			line3 = line3 + txtLine3.S;
			line4 = line4 + txtLine4.S;
			line5 = line5 + txtLine5.S;
			break;
		case 'T':
		case 't':
			line1 = line1 + txtLine1.T;
			line2 = line2 + txtLine2.T;
			line3 = line3 + txtLine3.T;
			line4 = line4 + txtLine4.T;
			line5 = line5 + txtLine5.T;
			break;
		case 'U':
		case 'u':
			line1 = line1 + txtLine1.U;
			line2 = line2 + txtLine2.U;
			line3 = line3 + txtLine3.U;
			line4 = line4 + txtLine4.U;
			line5 = line5 + txtLine5.U;
			break;
		case 'V':
		case 'v':
			line1 = line1 + txtLine1.V;
			line2 = line2 + txtLine2.V;
			line3 = line3 + txtLine3.V;
			line4 = line4 + txtLine4.V;
			line5 = line5 + txtLine5.V;
			break;
		case 'W':
		case 'w':
			line1 = line1 + txtLine1.W;
			line2 = line2 + txtLine2.W;
			line3 = line3 + txtLine3.W;
			line4 = line4 + txtLine4.W;
			line5 = line5 + txtLine5.W;
			break;
		case 'X':
		case 'x':
			line1 = line1 + txtLine1.X;
			line2 = line2 + txtLine2.X;
			line3 = line3 + txtLine3.X;
			line4 = line4 + txtLine4.X;
			line5 = line5 + txtLine5.X;
			break;
		case 'Y':
		case 'y':
			line1 = line1 + txtLine1.Y;
			line2 = line2 + txtLine2.Y;
			line3 = line3 + txtLine3.Y;
			line4 = line4 + txtLine4.Y;
			line5 = line5 + txtLine5.Y;
			break;
		case 'Z':
		case 'z':
			line1 = line1 + txtLine1.Z;
			line2 = line2 + txtLine2.Z;
			line3 = line3 + txtLine3.Z;
			line4 = line4 + txtLine4.Z;
			line5 = line5 + txtLine5.Z;
			break;
		case ' ':
			line1 = line1 + char('    ');
			line2 = line2 + char('    ');
			line3 = line3 + char('    ');
			line4 = line4 + char('    ');
			line5 = line5 + char('    ');
			break;
		}

		j++;
	}

	cout << line1 << endl;
	cout << line2 << endl;
	cout << line3 << endl;
	cout << line4 << endl;
	cout << line5 << endl;
	
	line1 = "";
	line2 = "";
	line3 = "";
	line4 = "";
	line5 = "";

}

int main()
{
	BubbleLetters bblObject;
	apstring data;
	cout << "Enter some text: ";
	getline(cin,data);

	bblObject.setText(data);
	bblObject.printText();
	
	return 0;
}

