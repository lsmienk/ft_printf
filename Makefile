# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: lsmienk <lsmienk@student.codam.nl>           +#+                      #
#                                                    +#+                       #
#    Created: 2019/06/15 12:17:27 by lsmienk        #+#    #+#                 #
#    Updated: 2019/12/10 13:16:11 by lsmienk       ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
RAW = ft_printf str_part set_character set_number set_unumber set_string \
	set_octal set_float flags width print_width set_hex set_hex_up \
	set_pointer set_percent ret_putchar ret_putstr ret_putnbr ret_putnbr_u \
	set_prec set_floatl check_next check_nextl round_up check_round \
	check_roundl float_width float_behavior float_exceptions float_sign \
	prec_sign
RAWL = ft_atoi ft_intlen ft_itoa_base ft_itoa_base_up ft_putchar ft_putnbr \
	ft_putstr ft_strlen ft_strnew ft_memset ft_strdup ft_strend ft_strrev \
	ft_toupper
LIBFT = libft/includes
SRC = $(RAW:%=srcs/%.c)
SRCL = $(RAWL:%=./libft/%.c)
OBJ = $(RAW:%=%.o)
OBJL = $(RAWL:%=%.o)
FLAG = -Wall -Wextra -Werror

MAKECOLOUR = \033[38;5;208m
CLEANCOLOUR = \033[38;5;229m
FCLEANCOLOUR = \033[38;5;214m
LIBCOLOUR = \033[38;5;220m
RESETCOLOUR = \033[0m

.PHONY: all clean fclean re

all: $(NAME)

$(NAME):
	@echo "$(LIBCOLOUR)Compiling Libraries$(RESETCOLOUR)"
	@make -C libft/
	@echo "$(MAKECOLOUR)Compiling Program$(RESETCOLOUR)"
	@gcc  $(FLAG) -c $(SRC) $(SRCL) -I $(LIBFT)
	@ar -src $(NAME) $(OBJ) $(OBJL)

clean:
	@echo "$(CLEANCOLOUR)Cleaning Libraries$(RESETCOLOUR)"
	@rm -f $(OBJ) $(OBJL)
	@make -C libft/ clean

fclean: clean
	@echo "$(FCLEANCOLOUR)Removing Libraries and $(NAME) $(RESETCOLOUR)"
	@rm -f $(NAME)
	@make -C libft/ fclean

re: fclean all
