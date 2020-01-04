/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_intlen.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: lsmienk <lsmienk@student.codam.nl>           +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/03/25 14:17:48 by lsmienk        #+#    #+#                */
/*   Updated: 2019/11/28 16:00:13 by lsmienk       ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

int		ft_intlen(long long nb)
{
	int	len;

	len = 0;
	if (nb < 0)
	{
		len = 1;
		nb = nb * -1;
	}
	if (nb < 10)
		return (len + 1);
	else
		return (len + 1 + ft_intlen(nb / 10));
}
