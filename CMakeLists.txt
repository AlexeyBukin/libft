cmake_minimum_required(VERSION 3.10)

set(CMAKE_C_STANDARD  90)
set(CMAKE_C_STANDARD_REQUIRED True)

# set the project name
project(ft)

#file(GLOB SOURCES "src/*.c")

#  find src -type f -name '*.c' | sed "s/^/       /" | sort | column -c 120
set(${PROJECT_NAME}_SOURCES
		src/atoi_itoa/ft_atod.c                 src/mem/ft_free.c                       src/str/ft_str_count.c
		src/atoi_itoa/ft_atof.c                 src/mem/ft_mem_rev.c                    src/str/ft_str_div_by.c
		src/atoi_itoa/ft_atoi.c                 src/mem/ft_memalloc.c                   src/str/ft_str_div_by_ins.c
		src/atoi_itoa/ft_atoi_base.c            src/mem/ft_memccpy.c                    src/str/ft_str_dup_rev.c
		src/atoi_itoa/ft_atold.c                src/mem/ft_memchr.c                     src/str/ft_str_low.c
		src/atoi_itoa/ft_itoa.c                 src/mem/ft_memcmp.c                     src/str/ft_str_next_is.c
		src/atoi_itoa/ft_itoa_base.c            src/mem/ft_memcpy.c                     src/str/ft_str_spam.c
		src/atoi_itoa/ft_ldtoa.c                src/mem/ft_memdel.c                     src/str/ft_str_up.c
		src/atoi_itoa/ft_ldtoa_prec.c           src/mem/ft_memdup.c                     src/str/ft_strcat.c
		src/atoi_itoa/ft_lltoa.c                src/mem/ft_memmove.c                    src/str/ft_strcfnr.c
		src/atoi_itoa/ft_mtob.c                 src/mem/ft_memset.c                     src/str/ft_strchr.c
		src/atoi_itoa/ft_mtob_raw.c             src/mem/ft_realloc.c                    src/str/ft_strclr.c
		src/atoi_itoa/ft_ulltoa.c               src/printf/f_after_dot.c                src/str/ft_strcmp.c
		src/atoi_itoa/ft_utoa.c                 src/printf/f_good_way_after.c           src/str/ft_strcpy.c
		src/atoi_itoa/ft_utoa_base.c            src/printf/f_good_way_before.c          src/str/ft_strdel.c
		src/file/ft_read_file.c                 src/printf/f_special.c                  src/str/ft_strdup.c
		src/file/ft_read_stream.c               src/printf/flags_c.c                    src/str/ft_strequ.c
		src/file/get_next_line.c                src/printf/flags_di.c                   src/str/ft_strfnr.c
		src/ft_abs.c                            src/printf/flags_f.c                    src/str/ft_striter.c
		src/ft_bzero.c                          src/printf/flags_o.c                    src/str/ft_striteri.c
		src/ft_char_to_str.c                    src/printf/flags_p.c                    src/str/ft_strjoin.c
		src/ft_free_char_2d_arr.c               src/printf/flags_perc.c                 src/str/ft_strjoin_free.c
		src/ft_pow.c                            src/printf/flags_s.c                    src/str/ft_strlcat.c
		src/ft_power_ten.c                      src/printf/flags_u.c                    src/str/ft_strlen.c
		src/ft_return.c                         src/printf/flags_x.c                    src/str/ft_strmap.c
		src/ft_tolower.c                        src/printf/parse_flags.c                src/str/ft_strmapi.c
		src/ft_toupper.c                        src/printf/printf.c                     src/str/ft_strncat.c
		src/ft_word_count.c                     src/printf/resolve_arg.c                src/str/ft_strncmp.c
		src/is/ft_isalnum.c                     src/printf/width_format.c               src/str/ft_strncpy.c
		src/is/ft_isalpha.c                     src/put/ft_putchar.c                    src/str/ft_strndup.c
		src/is/ft_isascii.c                     src/put/ft_putchar_fd.c                 src/str/ft_strnequ.c
		src/is/ft_isblank.c                     src/put/ft_putendl.c                    src/str/ft_strnew.c
		src/is/ft_iscomment.c                   src/put/ft_putendl_fd.c                 src/str/ft_strnstr.c
		src/is/ft_isdigit.c                     src/put/ft_putendl_free.c               src/str/ft_strrchr.c
		src/is/ft_isnum.c                       src/put/ft_putendl_int_var.c            src/str/ft_strrev.c
		src/is/ft_isprint.c                     src/put/ft_puterr_null.c                src/str/ft_strsplit.c
		src/lst/ft_lstadd.c                     src/put/ft_puterror.c                   src/str/ft_strstr.c
		src/lst/ft_lstappend.c                  src/put/ft_putnbr.c                     src/str/ft_strsub.c
		src/lst/ft_lstdel.c                     src/put/ft_putnbr_fd.c                  src/str/ft_strsub_free.c
		src/lst/ft_lstdelone.c                  src/put/ft_putstr.c                     src/str/ft_strtrim.c
		src/lst/ft_lstiter.c                    src/put/ft_putstr_fd.c                  src/test/insert_func.c
		src/lst/ft_lstmap.c                     src/put/ft_putstr_free.c                src/test/insert_mem.c
		src/lst/ft_lstnew.c                     src/str/ft_str_add.c			src/str/ft_str_split_str.c
        )

#target_include_directories(${PROJECT_NAME} PUBLIC ${PROJECT_SOURCE_DIR}/include )
include_directories(${PROJECT_SOURCE_DIR}/include )

add_library(${PROJECT_NAME} ${${PROJECT_NAME}_SOURCES})

#add_subdirectory(src)
