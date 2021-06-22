#include <iostream>
#include <boost/random.hpp>

int main()
{
    boost::random::mt19937 rng;                                        
    boost::random::uniform_real_distribution<double> gen(0.0, 1.0);
    for (int i = 0; i < 10; ++i)
    {
        std::cout << gen(rng) << "\n";
    }
    std::cin.ignore( std::numeric_limits <std::streamsize> ::max(), '\n' );
    return 0;
}
