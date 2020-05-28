NAME = libft.a

CC = clang
DEBUG = -g
OPTIM = -O2

CFLAGS = -Wall -Wextra -Werror $(DEBUG)

INCLUDE = -I include/

BUILD_DIR = build/
SRC_DIR = src/

#SRC_FILES = $(shell find $(SRC_DIR) -not \( -path $(MAIN_DIR) -prune \) -type f -name "*.c")

#find src -type f -name '*.c' | sed 'N;N;s/\n/ /g' | sed "s/\$/ \\\\/" | column -t

SRC_FILES = \
src/ft_bzero.c                src/ft_return.c                 src/ft_toupper.c              \
src/ft_tolower.c              src/ft_char_to_str.c            src/test/insert_func.c        \
src/test/insert_mem.c         src/ft_pow.c                    src/ft_word_count.c           \
src/ft_power_ten.c            src/atoi_itoa/ft_ldtoa_prec.c   src/atoi_itoa/ft_itoa.c       \
src/atoi_itoa/ft_atod.c       src/atoi_itoa/ft_itoa_base.c    src/atoi_itoa/ft_atoi_base.c  \
src/atoi_itoa/ft_atoi.c       src/atoi_itoa/ft_ldtoa.c        src/atoi_itoa/ft_mtob.c       \
src/atoi_itoa/ft_atold.c      src/atoi_itoa/ft_ulltoa.c       src/atoi_itoa/ft_lltoa.c      \
src/atoi_itoa/ft_utoa_base.c  src/atoi_itoa/ft_atof.c         src/atoi_itoa/ft_mtob_raw.c   \
src/atoi_itoa/ft_utoa.c       src/lst/ft_lstnew.c             src/lst/ft_lstappend.c        \
src/lst/ft_lstdelone.c        src/lst/ft_lstadd.c             src/lst/ft_lstdel.c           \
src/lst/ft_lstmap.c           src/lst/ft_lstiter.c            src/is/ft_isascii.c           \
src/is/ft_isblank.c           src/is/ft_iscomment.c           src/is/ft_isdigit.c           \
src/is/ft_isnum.c             src/is/ft_isalpha.c             src/is/ft_isprint.c           \
src/is/ft_isalnum.c           src/ft_abs.c                    src/mem/ft_free.c             \
src/mem/ft_memccpy.c          src/mem/ft_memcmp.c             src/mem/ft_mem_rev.c          \
src/mem/ft_memdup.c           src/mem/ft_memalloc.c           src/mem/ft_memdel.c           \
src/mem/ft_memcpy.c           src/mem/ft_realloc.c            src/mem/ft_memchr.c           \
src/mem/ft_memmove.c          src/mem/ft_memset.c             src/file/ft_file_read.c       \
src/file/get_next_line.c      src/put/ft_putstr.c             src/put/ft_putnbr_fd.c        \
src/put/ft_putendl_int_var.c  src/put/ft_putendl_fd.c         src/put/ft_putchar_fd.c       \
src/put/ft_putstr_fd.c        src/put/ft_puterr_null.c        src/put/ft_puterror.c         \
src/put/ft_putstr_free.c      src/put/ft_putchar.c            src/put/ft_putendl.c          \
src/put/ft_putnbr.c           src/put/ft_putendl_free.c       src/str/ft_strdup.c           \
src/str/ft_strjoin_free.c     src/str/ft_strnew.c             src/str/ft_str_spam.c         \
src/str/ft_strmap.c           src/str/ft_strcpy.c             src/str/ft_strcat.c           \
src/str/ft_striteri.c         src/str/ft_strncat.c            src/str/ft_strtrim.c          \
src/str/ft_strequ.c           src/str/ft_strmapi.c            src/str/ft_str_count.c        \
src/str/ft_strnstr.c          src/str/ft_strrchr.c            src/str/ft_striter.c          \
src/str/ft_strsplit.c         src/str/ft_strcfnr.c            src/str/ft_strstr.c           \
src/str/ft_strdel.c           src/str/ft_strsub.c             src/str/ft_str_next_is.c      \
src/str/ft_strncmp.c          src/str/ft_strfnr.c             src/str/ft_str_up.c           \
src/str/ft_strcmp.c           src/str/ft_strncpy.c            src/str/ft_str_low.c          \
src/str/ft_strlen.c           src/str/ft_strnequ.c            src/str/ft_strclr.c           \
src/str/ft_strrev.c           src/str/ft_str_dup_rev.c        src/str/ft_str_div_by_ins.c   \
src/str/ft_strchr.c           src/str/ft_str_add.c            src/str/ft_strsub_free.c      \
src/str/ft_strlcat.c          src/str/ft_strjoin.c            src/str/ft_str_div_by.c       \
src/str/ft_strndup.c          src/printf/flags_p.c            src/printf/flags_u.c          \
src/printf/printf.c           src/printf/f_good_way_before.c  src/printf/flags_di.c         \
src/printf/resolve_arg.c      src/printf/width_format.c       src/printf/parse_flags.c      \
src/printf/f_after_dot.c      src/printf/f_good_way_after.c   src/printf/flags_c.c          \
src/printf/flags_s.c          src/printf/flags_o.c            src/printf/flags_x.c          \
src/printf/f_special.c        src/printf/flags_f.c            src/printf/flags_perc.c       \
src/ft_free_char_2d_arr.c

O_FILES = $(patsubst $(SRC_DIR)%.c, $(BUILD_DIR)%.o, $(SRC_FILES))

SRC_DIRS = $(shell find $(SRC_DIR) -type d)
BUILD_DIRS_REC = $(patsubst $(SRC_DIR)%, $(BUILD_DIR)%, $(SRC_DIRS))

HEADER_FILES = \
include/libft.h   \
include/printf.h

.PHONY: clean fclean all

all: $(NAME)

$(NAME): $(BUILD_DIRS_REC) $(O_FILES)
	@ranlib $(NAME)
	@echo "make: Done compilation of \`$(NAME)'."

$(BUILD_DIRS_REC):
	@mkdir -vp $(BUILD_DIRS_REC)

$(BUILD_DIR)%.o: $(SRC_DIR)%.c $(HEADER_FILES)
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<
	@ar rcs $(NAME) $@

clean:
	@rm -rf $(BUILD_DIR)
	@echo "make: Done clean of \`$(NAME)'."

fclean: clean
	@rm -f $(NAME)
	@echo "make: Done full clean of \`$(NAME)'."

re: fclean all
	@echo "make: Done recompile of \`$(NAME)'."