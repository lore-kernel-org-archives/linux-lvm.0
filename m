From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Patch for vg_status_with_pv_and_lv.c
Message-ID: <20030304124653.A19923@sistina.com>
References: <3E63CFAC.6080405@mac.com>
Mime-Version: 1.0
In-Reply-To: <3E63CFAC.6080405@mac.com>; from dalestephenson@mac.com on Mon, Mar 03, 2003 at 01:57:00PM -0800
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
Date: Tue Mar  4 05:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Accepted.

Thanks,
Heinz    -- The LVM Guy --

On Mon, Mar 03, 2003 at 01:57:00PM -0800, Dale J. Stephenson wrote:
> A minor patch to prevent  a possible segfault -- if an error occurs 
> getting the lv list, vg_setup_pointers_for_snapshot doesn't do well. 
>  Patch was originally generated against 1.0.3, but the bug still seems 
> to be in 1.0.6.
> 
> --- 1.0.3/tools/lib/vg_status_with_pv_and_lv.c.orig	Thu Apr 11 10:45:18 2002
> +++ 1.0.3/tools/lib/vg_status_with_pv_and_lv.c	Thu Apr 11 10:45:41 2002
> @@ -57,10 +57,10 @@
>        for ( p = 0; pv[p] != NULL; p++) (*vg)->pv[p] = pv[p];
>        for ( ; p < (*vg)->pv_max; p++) (*vg)->pv[p] = NULL;
>        for ( l = 0; l < (*vg)->lv_max; l++) (*vg)->lv[l] = lv[l];
> -   }
>  
> -   /* Set up core pointers for snapshots */
> -   vg_setup_pointers_for_snapshots ( *vg);
> +      /* Set up core pointers for snapshots */
> +      vg_setup_pointers_for_snapshots ( *vg);
> +   }
>  
>     debug_leave ( "vg_status_with_pv_and_lv -- LEAVING with ret: %d\n", ret);
>     return ret;
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
