From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <20020207234716.GB17132@auctionwatch.com>
References: <20020207151811.X15496@lynx.turbolabs.com>
    <CBEHLLOPCKAOIAOINGKAAEHFCAAA.jmoser@erc.wisc.edu>
    <20020207225006.GA16526@auctionwatch.com> <3C630837.5040508@birddog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C630837.5040508@birddog.com>
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
Date: Thu Feb  7 17:47:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 07, 2002 at 05:05:27PM -0600, Kirby C. Bohling wrote:
> Why is he brave, it is just a converted 2.4.15-pre5 with a change to the 
> version number if I remember correctly that has a filesystem bug when 
> you umount during a reboot.  As long as he doesn't reboot and/or umount 
> his data is save. :-)

    I thought there were more changes than that. 

    2.5.x is the development series, not the stable series. 

> 		Kirby
> 
> bzcat patch-2.4.15-to-2.5.0.bz2
> 
> diff -urN linux-2.4.15/Makefile linux-2.5.0/Makefile
> --- linux-2.4.15/Makefile       Thu Nov 22 11:22:58 2001
> +++ linux-2.5.0/Makefile        Thu Nov 22 22:23:44 2001
> @@ -1,7 +1,7 @@
>  VERSION = 2
> -PATCHLEVEL = 4
> -SUBLEVEL = 15
> -EXTRAVERSION =-greased-turkey
> +PATCHLEVEL = 5
> +SUBLEVEL = 0
> +EXTRAVERSION =
> 
>  KERNELRELEASE=$(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)
> 
> 
> Petro wrote:
> >On Thu, Feb 07, 2002 at 04:45:03PM -0600, John Moser wrote:
> >
> >>Is this specific to 2.4.X kernels?  I'm running 2.5.0, and I just noticed
> >>that the 160 gig drives I was using are also partitioned at only 128Gigs.
> >>
> > 
> >    No, it's at the IDE driver level. There are patches to get around
> >    this that are being considered for the mainstream kernel (Andrei H.
> >    I believe). 
> >
> >    Brave man running 2.5.0, the dot-zero release of a development
> >    kernel. 
> > 
> >
> >>-----Original Message-----
> >>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> >>Behalf Of Andreas Dilger
> >>Sent: Thursday, February 07, 2002 4:18 PM
> >>To: linux-lvm@sistina.com
> >>Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
> >>
> >>
> >>On Feb 07, 2002  22:33 +0100, Terje Kvernes wrote:
> >>
> >>> [ Re: IDE 128GB disk limits ]
> >>>
> >>> now, I've added SCSI-devices that where > 500GiB with ease into LVM,
> >>> but here I stumble.  is there some easy solution out there that I've
> >>> missed?
> >>>
> >>> the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
> >>> from 26/11.  patches or anything people want to toss at this will be
> >>> highly appreciated.  we have two of these beasts from Maxtor, and
> >>> stand to loose about 60GiB of space, which isn't all that neat.
> >>>
> >>This is a kernel IDE driver limit.  You need to patch with Andre Hedrik's
> >>IDE patches to support IDE devices over this size.
> >>
> >>Cheers, Andreas
> >>--
> >>Andreas Dilger
> >>http://sourceforge.net/projects/ext2resize/
> >>http://www-mddsp.enel.ucalgary.ca/People/adilger/
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>
> >>
> >>_______________________________________________
> >>linux-lvm mailing list
> >>linux-lvm@sistina.com
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >>
> >
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Share and Enjoy. 
