/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strsplit.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aenstein <aenstein@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/09/20 15:54:59 by aenstein          #+#    #+#             */
/*   Updated: 2020/09/20 19:11:42 by aenstein         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int	help_fun(char *str, char *delim, size_t *nb_word, size_t *ptrs_size)
{
	if (nb_word == NULL || ptrs_size == NULL)
		return (-1);
	*nb_word = 1;
	while ((str = ft_strstr(str, delim)))
	{
		str += ft_strlen(delim);
		(*nb_word)++;
	}
	(*ptrs_size) = ((*nb_word) + 1) * sizeof(char*);
	return (0);
}

char		**ft_strsplitstr(const char *s, const char *delim)
{
	void		*data;
	char		*str;
	const char	**ptrs;
	size_t		nb_word;
	size_t		ptrs_size;

	if ((str = (char *)s) == NULL || delim == NULL)
		return (NULL);
	if (help_fun(str, (char *)delim, &nb_word, &ptrs_size))
		return (NULL);
	if ((data = malloc(ptrs_size + ft_strlen(s) + 1)) == NULL)
		return (NULL);
	ptrs = data;
	str = ft_strcpy(((char*)data) + ptrs_size, s);
	*ptrs = str;
	if (nb_word > 1)
		while ((str = ft_strstr(str, delim)))
		{
			*str = '\0';
			str += ft_strlen(delim);
			*++ptrs = str;
		}
	*++ptrs = NULL;
	return (data);
}
