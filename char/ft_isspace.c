/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isspace.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ajabado <ajabado@student.42beirut.com>     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/28 02:09:07 by ajabado           #+#    #+#             */
/*   Updated: 2024/06/28 02:09:07 by ajabado          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

int	ft_isspace(int c)
{
	return (c == ' ' || c == '\f' || c == '\n'
		|| c == '\r' || c == '\t' || c == '\v');
}
