Return-Path: <root@srv.sistina.com>
Date: Tue, 20 Feb 2001 23:21:58 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Newbie question: ERROR "pv_move_pe(): PE lock"
Message-ID: <20010220232158.L21281@srv.sistina.com>
References: <E14UARa-00078r-00@whittlesey.cl.cam.ac.uk> <200102201824.f1KIOBl13089@webber.adilger.net>
Mime-Version: 1.0
In-Reply-To: <200102201824.f1KIOBl13089@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 20, 2001 at 11:24:10AM -0700
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

It will show up in the next release.
Added the check Andreas recommended for destination PVs as well.

On Tue, Feb 20, 2001 at 11:24:10AM -0700, Andreas Dilger wrote:
> It looks like the fix for this problem is not yet in CVS.  I'm pretty sure
> Heinz has taken a look at the patch already as well (at least he commented
> on this thread).  This fixes a BUG where it is not possible to do pvmove
> on an MD device.
> 
> > > In any case, try the below patch, and it should fix this problem.
> > 
> > # pvmove /dev/md7
> > pvmove -- moving physical extents in active volume group "vg01"
> > pvmove -- WARNING: moving of active logical volumes may cause data loss!
> > pvmove -- do you want to continue? [y/n] y
> > pvmove -- doing automatic backup of volume group "vg01"
> > pvmove -- 76 extents of physical volume "/dev/md7" successfully moved
> >
> > Many thanks -- seems to work a treat !
> 
> Here is the patch again.
> 
> Cheers, Andreas
> ============================================================================
> diff -u -u -r1.3.2.5 pvmove.c
> --- tools/pvmove.c	2001/02/14 14:48:01	1.3.2.5
> +++ tools/pvmove.c	2001/02/20 18:16:22
> @@ -234,7 +234,8 @@
>  
>     if ( opt_v > 0) printf ( "%s -- reading data of source physical volume "
>                              "from \"%s\"\n", cmd, src_pv_name);
> -   if ( ( ret = pv_read ( src_pv_name, &pv, NULL)) < 0) {
> +   if ( ( ret = pv_read ( src_pv_name, &pv, NULL)) < 0 &&
> +	ret != -LVM_EPV_READ_MD_DEVICE) {
>        if ( ret == -LVM_EPV_READ_OPEN) {
>           fprintf ( stderr, "%s -- source physical volume \"%s\" "
>                             "doesn't exist\n\n",
> 
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

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
