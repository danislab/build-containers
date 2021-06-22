#include <iostream>
#include <limits>

using namespace std;

int main()
{
    std::cout << "Hello World!";
    std::cin.ignore( std::numeric_limits <std::streamsize> ::max(), '\n' );
    return 0;
}
