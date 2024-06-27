/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putptr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/06/14 15:47:53 by ajabado           #+#    #+#             */
/*   Updated: 2024/06/17 02:00:40 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/libft.h"

int	ft_putptr_fd(unsigned long long num, int fd)
{
	char	*hex_digits;
	char	buffer[20];
	int		i;
	int		len;

	len = 0;
	i = 0;
	if (!num)
	{
		ft_putstr_fd("(nil)", 1);
		return (5);
	}
	hex_digits = "0123456789abcdef";
	len += ft_putstr_fd("0x", fd);
	if (num == 0)
		return (ft_putchar_fd('0', fd));
	while (num)
	{
		buffer[i++] = hex_digits[num % 16];
		num /= 16;
	}
	while (i > 0)
		len += ft_putchar_fd(buffer[--i], fd);
	return (len);
}
