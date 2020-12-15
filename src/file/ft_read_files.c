/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   fio_read_files.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kcharla <kcharla@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/10/14 00:12:16 by kcharla           #+#    #+#             */
/*   Updated: 2020/10/14 01:37:28 by kcharla          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static int		ft_read_files_cat(char **dest, char **files)
{
	int			i;
	size_t		size;

	if (dest == NULL || files == NULL)
		return (-1);
	size = 0;
	i = 0;
	while (files[i] != NULL)
		size += ft_strlen(files[i++]);
	if ((*dest = ft_memalloc(size + 1)) == NULL)
		return (-1);
	(*dest)[0] = '\0';
	i = 0;
	while (files[i] != NULL)
		ft_strcat(*dest, files[i++]);
	return (0);
}

/*
** Glues contents of multiple files into one string
**
** example call:
** fio_read_files(&mystr, "file1 file2 dir/file3");
*/

int				ft_read_files(char **dest, char *filenames)
{
	int			i;
	char		**files;

	if (filenames == NULL || dest == NULL)
		return (-1);
	files = ft_strsplit(filenames, ' ');
	i = 0;
	while (files[i] != NULL)
	{
		if ((files[i] = ft_read_file(files[i])) == NULL)
		{
			ft_free_char_2d_arr(&files);
			return (-1);
		}
		i++;
	}
	i = ft_read_files_cat(dest, files);
	ft_free_char_2d_arr(&files);
	if (i != 0)
		return (-1);
	return (0);
}
