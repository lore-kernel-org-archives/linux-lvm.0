Return-Path: <root@srv.sistina.com>
Date: Mon, 7 May 2001 10:34:57 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] typo in CVS: LVM/kernel/lvm.c
Message-ID: <20010507103457.C25752@sistina.com>
References: <Pine.LNX.4.32.0105052321020.24489-100000@falka.mfa.kfki.hu> <20010506101133.A642@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010506101133.A642@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Sun, May 06, 2001 at 10:11:33AM +0100
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

On Sun, May 06, 2001 at 10:11:33AM +0100, Joe Thornber wrote:
> On Sat, May 05, 2001 at 11:24:43PM +0200, Gergely Tamas wrote:
> > Hi!
> > 
> > There is a typo in CVS:LVM/kernel/lvm.c
> > 
> > Gergely
> 
> Yes, I just looked at cvs, you're right.  Thanks.
> 
> Heinz & Patrick what are you playing at !?
> 
> lvm.c revision 1.10
> -------------------
> 
> o why did you feel the need to change the name of __update_hardblocksize ?
> 

Just to adopt the new naming in > 2.4.3

> o why change the name of the max_hardblocksize variable.

Same as above.

> 
> o you've duplicated ~10 lines of code instead of putting them into a seperate 
>   function such as:

No, just added the (wrong) version check and function call.

> 
>   static inline ulong _get_hard_block_size(kdev_t dev) {
>       etc.
>   }

I don't mind.

> 
> o The code has a typo 'get_hardbsect_size' from which we can conclude that it
>   was *never* compiled for a kernel < 2.4.4

Oops, my fault ;-)

> 
> o The version check itself is wrong.
> 
> It looks to me like a botched search and replace without subsequent
> testing, or even a cvs diff before checkin.

May be... ;-)

> 
> lvm.c revision 1.11
> -------------------
> 
> o typo still there, it can't have been tested.
> 
> lvm.c revision 1.12
> -------------------
> 
> Patrick, you correctly fix most of the remaining mistakes apart from
> the version number.  But what are all the other code changes that have
> slipped in ?  They aren't mentioned in the checkin message, are they
> meant to be there ?
> 
> - Joe
> 
> 
> 
> > 
> > --- LVM/kernel/lvm.c.orig	Thu May  3 15:37:19 2001
> > +++ LVM/kernel/lvm.c	Sat May  5 23:01:22 2001
> > @@ -1879,7 +1879,7 @@
> >  	int max_hardsectsize = 0, hardsectsize;
> > 
> >  	for (le = 0; le < lv->lv_allocated_le; le++) {
> > -#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 4)
> > +#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 3)
> >  		hardsectsize = get_hardblocksize(lv->lv_current_pe[le].dev);
> >  #else
> >  		hardsectsize = get_hardsect_size(lv->lv_current_pe[le].dev);
> > @@ -1892,7 +1892,7 @@
> > 
> >  	if (lv->lv_access & LV_SNAPSHOT) {
> >  		for (e = 0; e < lv->lv_remap_end; e++) {
> > -#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 4)
> > +#if LINUX_VERSION_CODE <= KERNEL_VERSION ( 2, 4, 3)
> >  			hardsectsize = get_hardblocksize( lv->lv_block_exception[e].rdev_new);
> >  #else
> >  			hardsectsize = get_hardsect_size( lv->lv_block_exception[e].rdev_new);
> > 
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
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
