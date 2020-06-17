/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_read_file.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hush <hush@student.42.fr>                  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/04 00:11:09 by hush              #+#    #+#             */
/*   Updated: 2020/06/18 01:33:28 by hush             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

/*
** Reads file to one string
** Returns NULL on error
*/

char				*ft_read_file(char *filename)
{
	int				fd;

	fd = open(filename, O_RDONLY);
	return (ft_read_stream(fd));
}
