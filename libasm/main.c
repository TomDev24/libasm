#include <stdio.h>

size_t ft_strlen(const char *s);

int main()
{
	char *str = "Hello";
	printf("Size of str %ld\n", ft_strlen(str));	
	return(0);
}
