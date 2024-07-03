# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ajabado <ajabado@student.42beirut.com>     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/06/26 15:38:04 by ajabado           #+#    #+#              #
#    Updated: 2024/06/28 02:11:23 by ajabado          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# color codes
END=\033[0m
BOLD=\033[1m
UNDER=\033[4m
REV=\033[7m
GREY=\033[30m
RED=\033[31m
GREEN=\033[32m
YELLOW=\033[33m
BLUE=\033[34m
PURPLE=\033[35m
CYAN=\033[36m
WHITE=\033[37m
HIDE=\033[?25l
SHOW=\033[?25h

# character
OBJS_CHAR = $(SRC_CHAR:.c=.o)
SRC_CHAR = $(addprefix $(SRC_DIR)/char/, \
ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_isprint.c ft_tolower.c \
ft_toupper.c ft_isspace.c \
)

# linked list
OBJS_LST = $(SRC_LST:.c=.o)
SRC_LST	= $(addprefix $(SRC_DIR)/lst/, \
ft_lstadd_back.c ft_lstadd_front.c ft_lstclear.c ft_lstdelone.c ft_lstiter.c \
ft_lstlast.c ft_lstmap.c ft_lstnew.c ft_lstsize.c \
)

# memory
OBJS_MEM = $(SRC_MEM:.c=.o)
SRC_MEM	= $(addprefix $(SRC_DIR)/mem/, \
ft_bzero.c ft_calloc.c ft_memchr.c ft_memcmp.c ft_memcpy.c ft_memmove.c \
ft_memset.c \
)

# conversion
OBJS_CONV = $(SRC_CONV:.c=.o)
SRC_CONV = $(addprefix $(SRC_DIR)/conv/, \
ft_atoi.c ft_itoa.c ft_atol.c ft_nbrlen.c \
)

# character string
OBJS_STR = $(SRC_STR:.c=.o)
SRC_STR	= $(addprefix $(SRC_DIR)/str/, \
ft_split.c ft_strchr.c ft_strdup.c ft_strndup.c \
ft_striteri.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c \
ft_strlen.c ft_strmapi.c ft_strcmp.c ft_strncmp.c \
ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_in.c \
)

# file descriptor
OBJS_PUT = $(SRC_PUT:.c=.o)
SRC_PUT	= $(addprefix $(SRC_DIR)/put/, \
ft_putchar_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_putstr_fd.c \
ft_puthex_fd.c ft_putunbr_fd.c ft_putptr_fd.c \
)

# printf
OBJS_PRINTF = $(SRC_PRINTF:.c=.o)
SRC_PRINTF = $(addprefix $(SRC_DIR)/printf/, \
ft_printf.c ft_parse.c ft_handle_c.c ft_handle_d.c ft_handle_p.c \
ft_handle_s.c ft_handle_u.c ft_handle_x.c \
)

# get next line
OBJS_GNL = $(SRC_GNL:.c=.o)
SRC_GNL	= $(addprefix $(SRC_DIR)/gnl/, \
get_next_line.c \
)

SRC_DIR	= .
INC_DIR	= ./includes/
CC = gcc
AR = ar
MF = Makefile

FLAGS = -Wall -Wextra -Werror

LIBFT_NAME = libft.a
HEADER	= $(INC_DIR)/libft.h

COUNTER = 0
TOTAL_FILES = $(shell echo $$(($(words $(SRC_CHAR)) + $(words $(SRC_LST)) + $(words $(SRC_MEM)) + $(words $(SRC_CONV)) + $(words $(SRC_STR)) + $(words $(SRC_PUT)) + $(words $(SRC_PRINTF)) + $(words $(SRC_GNL)))))

all : $(LIBFT_NAME)

$(LIBFT_NAME) : $(MF) $(OBJS_CHAR) $(OBJS_LST) $(OBJS_MEM) $(OBJS_CONV) $(OBJS_STR) $(OBJS_PUT) $(OBJS_PRINTF) $(OBJS_GNL)
	@/bin/echo -en "$(HIDE)"
	@$(AR) -rcs $(LIBFT_NAME) $(OBJS_CHAR) $(OBJS_LST) $(OBJS_MEM) $(OBJS_CONV) $(OBJS_STR) $(OBJS_PUT) $(OBJS_PRINTF) $(OBJS_GNL)
	@/bin/echo -e "\n$(BOLD)${GREEN}> Compiled libft successfully$(END)"
	@/bin/echo -en "$(SHOW)"

clean :
	@rm -f $(OBJS_CHAR) $(OBJS_LST) $(OBJS_MEM) $(OBJS_CONV) $(OBJS_STR) $(OBJS_PUT) $(OBJS_PRINTF) $(OBJS_GNL)
	@/bin/echo -e "$(YELLOW)> All objects files of libft have been deleted$(END)"

fclean : clean
	@rm -f $(LIBFT_NAME)
	@/bin/echo -e "$(BOLD)$(GREEN)> Cleaning of libft has been done$(END)"

re : fclean all

%.o : %.c $(HEADER) Makefile
	@/bin/echo -en "$(HIDE)"
	@$(eval COUNTER=$(shell echo $$(($(COUNTER) + 1))))
	@$(CC) $(FLAGS) -c $< -o $@ -I $(INC_DIR)
	@/bin/echo -en "$(BOLD)$(YELLOW)\rCompiling: $(END)["
	@printf "%0.s#" $(shell seq 1 $(COUNTER))
	@if [ $(COUNTER) -lt $(TOTAL_FILES) ]; then \
		printf "%0.s." $(shell seq 1 $$(($(TOTAL_FILES) - $(COUNTER)))); \
	fi
	@printf "] (%d/%d)" $(COUNTER) $(TOTAL_FILES)

.PHONY: all clean fclean re
