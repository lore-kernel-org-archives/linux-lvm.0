From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [PATCH][2.5] List macros update for md (10/19)
Message-ID: <20020625120818.C14860@sistina.com>
References: <200206221618.g5MGIGLX018755@hawkeye.luckynet.adm>
Mime-Version: 1.0
In-Reply-To: <200206221618.g5MGIGLX018755@hawkeye.luckynet.adm>; from patch@luckynet.dynu.com on Sat, Jun 22, 2002 at 10:18:16AM -0600
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jun 25 05:15:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Thanks for the hint.

It is in CVS (Branch LVM_BRANCH_1-0 and in 1.1 on top as well).

Regards,
Heinz    -- The LVM Guy --


On Sat, Jun 22, 2002 at 10:18:16AM -0600, Lightweight Patch Manager wrote:
> Multiple devices aren't on new list macros either...
> 
> Two times list_move, and it's done
> 
> diff -Nur thunder-2.5/drivers/md/lvm-snap.c thunder-2.5/drivers/md/lvm-snap.c
> --- thunder-2.5/drivers/md/lvm-snap.c 22 Jun 2002 10:56:13 -0000 +0000
> +++ thunder-2.5/drivers/md/lvm-snap.c 22 Jun 2002 10:56:13 -0000 +0000 thunder (thunder-2.5/drivers/md/lvm-snap.c 1.1 0644)
> @@ -109,11 +109,9 @@ lvm_find_exception_table(kdev_t org_dev,
>  		    kdev_same(exception->rdev_org, org_dev))
>  		{
>  			if (i)
> -			{
>  				/* fun, isn't it? :) */
> -				list_del(next);
> -				list_add(next, hash_table);
> -			}
> +				list_move(next, hash_table);
> +
>  			ret = exception;
>  			break;
>  		}
> diff -Nur thunder-2.5/drivers/md/md.c thunder-2.5/drivers/md/md.c
> --- thunder-2.5/drivers/md/md.c 22 Jun 2002 10:56:14 -0000 +0000
> +++ thunder-2.5/drivers/md/md.c 22 Jun 2002 10:56:14 -0000 +0000 thunder (thunder-2.5/drivers/md/md.c 1.1 0644)
> @@ -1872,8 +1872,7 @@ static void autorun_devices(void)
>  					continue;
>  				}
>  				printk(KERN_INFO "md:  adding %s ...\n", partition_name(rdev->dev));
> -				list_del(&rdev->pending);
> -				list_add(&rdev->pending, &candidates);
> +				list_move(&rdev->pending, &candidates);
>  			}
>  		}
>  		/*
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
