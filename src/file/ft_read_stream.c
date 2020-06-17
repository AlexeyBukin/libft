/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_read_stream.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hush <hush@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/03 22:37:54 by hush              #+#    #+#             */
/*   Updated: 2020/06/18 01:23:03 by hush             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/*
** Reads from a given stream to one string
** Returns non-zero if error
*/

static int			ft_looped(char **str, char *buf, int val)
{
	char			*old;

	if (str == NULL)
		return (-1);
	buf[val] = '\0';
	old = *str;
	*str = ft_str_add(*str, buf);
	if (*str == NULL)
	{
		free(old);
		return (-1);
	}
	return (0);
}

char				*ft_read_stream(int fd)
{
	char			*str;
	int				val;
	char			buf[READ_BUFFER_SIZE + 1];

	str = NULL;
	if (fcntl(fd, F_GETFD) != 0)
		return (NULL);
	while ((val = read(fd, buf, READ_BUFFER_SIZE)) > 0)
		if (ft_looped(&str, buf, val) < 0)
		{
			close(fd);
			return (NULL);
		}
	close(fd);
	if (val < 0)
	{
		free(str);
		return (NULL);
	}
	return (str);
}
