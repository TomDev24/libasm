#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>

size_t	ft_write(int fd, const void *buf, size_t count);
char	*ft_strcpy(char *dest, const char *src); 
size_t	ft_strlen(const char *s);
int 	ft_strcmp(const char *s1, const char *s2);
size_t	ft_read(int fd, void *buf, size_t count);
char	*ft_strdup(const char *s);

int main()
{
	//extern _user_in();
	//_user_in();
	size_t res;
	
	char buf[100];	// when it was *buf; it didnt work
	void *addr; // = get_address_of_instruction_pointer();
	int  length = 4096;   /* size of a page */

	
	////////////////////////////////////////////FT_WRITE
	char *h = "works"; // this string cannot be changed, it breaks code
	// more https://stackoverflow.com/questions/18388833/segmentation-fault-with-strcpy 
	char *src ="ge";
	char here[100];

	res = ft_write(1, h, 9);
	printf("  printed %ld",res);
	printf("\n");
	res = write(1, h, 9);
	printf("  printed %ld",res);
	printf("\n");
	
	//////////////////////////////////////////////ft_strlen
	printf("ft_strlen  %ld\n", ft_strlen(h));
	printf("strlen  %ld\n", strlen(h));
	
	////////////////////////////////////////////////////ft_strcpy
	printf("Src is %s, and dest is (%s) \n", src, here);
	addr = &ft_strcpy;
	if (mprotect(addr, length,PROT_WRITE)) {
		//doesnt work
	}

	ft_strcpy(here, src);
	printf("After ft_strcpy Src is// %s, and dest is// %s \n", src, here);
	strcpy(here, src);
	printf("After strcpy Src is// %s, and dest is// %s \n", src, here);
	
	//////////////////////////////////////////////////////////ft_strcmp
	printf("Comparing ---  %s, and -- %s \n", h, src);
	res = ft_strcmp(h, src); 	// actually both should return size_t	
	printf("ft_strcmp %ld\n", res);
	res = strcmp(h, src);
	printf("strcmp %ld\n", res);
	//////////////////////////////////////////////////////ft_read
	res = ft_read(0, buf, 4);		
	printf("(ft_read)Reader: %s    //bytes return %ld\n", buf, res);
	res = read(0, buf, 4);	
	printf("(read) Reader: %s    //bytes return %ld\n", buf, res);

	/////////////////////////////////////////////////////////ft_strdup
	char *re; //unitialized be careful, may SIGFAULT	
	re = ft_strdup("Hellofdsjk");
	//ft_strdup("Hello");
	printf("Duplicated string (%s)\n", re);
	return (0);
}
