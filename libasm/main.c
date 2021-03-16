#include <stdio.h>
#include <errno.h>

size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
ssize_t	ft_write(int fd, const void *buf, size_t count); // ssize_t means that we could have error

int main()
{
	char *str = "Hello";
	////////////////////////STR_LEN/////////////////////////
	printf("Size of str must be 5%ld\n", ft_strlen(str));
	
	///////////////////////MAIN
	ft_write(1, "hel", 3);
	return(0);
}
