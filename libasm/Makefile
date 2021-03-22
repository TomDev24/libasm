ASM = nasm
FLAGS = -f macho64
NAME = libasm.a
SRCS = ft_strlen.s \
       ft_strcmp.s \
       ft_strcpy.s \
       ft_read.s   \
       ft_write.s  \
       ft_strdup.s

OBJS = $(SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJS)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

$(OBJS): %.o : %.s
	$(ASM) $(FLAGS) -o $@ $<

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
