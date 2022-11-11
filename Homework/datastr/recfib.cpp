#include <iostream.h>
int nthFib(int n);
int gcd(int M, int N);

int main()
{
	int n = 0;
	cin >> n;
	cout << nthFib(n);
	return 0;
}

int nthFib(int n)
{
	if (n <= 1)
	{
		return n;
	}
	else
	{
		return nthFib(n - 1) + nthFib(n - 2);
	}
}

int gcd(int M, int N)
{
	int remainder = N % M;

	if (!(remainder))
	{
		return M;
	}
	else
	{
		return gcd(remainder,M);
	}
}