Return-Path: <jweber@valinux.com>
Date: Fri, 19 Jan 2001 09:22:55 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] Kernel panic while snapshotting.
In-Reply-To: <20010119163758.B1874@66bassett.freeserve.co.uk>
Message-ID: <Pine.LNX.4.30.0101190915110.28951-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Are the LockPage() calls necessary?  I just reverted to iobuf->locked = 1;
and tested with IO in background and it seems to work again.  Feedback is
of course welcome.  I noticed your comment regarding LockPage() in commit
logs, hence why I ask.  To reiterate, I didn't readd the LockPage() chunk
of code.

Btw, I'm also using the LVM_VFS_ENHANCEMENT option for snapshotting
journaled ext3 filesystem to flush the journal and mark the fs clean in
all these snapshot testings.

On Fri, 19 Jan 2001, Joe Thornber wrote:

> Date: Fri, 19 Jan 2001 16:37:58 +0000
> From: Joe Thornber <joe@66bassett.freeserve.co.uk>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Kernel panic while snapshotting.
>
> Hi Jay,
>
> Drat.  I'm really sorry about this.
>
> Can you try reversing this patch please ?  It should fix it.
>
> Let me know if you're still having trouble afterwards.
>
> - Joe
>
> diff -u -r1.2.2.6 -r1.2.2.7
> --- LVM/kernel/lvm-snap.c	2001/01/12 16:08:12	1.2.2.6
> +++ LVM/kernel/lvm-snap.c	2001/01/17 15:20:27	1.2.2.7
> @@ -45,10 +45,6 @@
>
>  static char *lvm_snap_version __attribute__ ((unused)) = "LVM 0.9 snapshot code (13/11/2000)\n";
>
> -#ifndef LockPage
> -#define LockPage(map) set_bit(PG_locked, &(map)->flags)
> -#endif
> -
>  extern const char *const lvm_name;
>  extern int lvm_blocksizes[];
>
> @@ -492,7 +488,7 @@
>  		goto out;
>
>  	err = -ENOMEM;
> -	iobuf->locked = 1;
> +	iobuf->locked = 0;
>  	iobuf->nr_pages = 0;
>  	for (i = 0; i < nr_pages; i++)
>  	{
> @@ -513,9 +509,6 @@
>  #endif
>
>  		iobuf->maplist[i] = page;
> -		/* the only point to lock the page here is to be allowed
> -		   to share unmap_kiobuf() in the fail-path */
> -		LockPage(page);
>  		iobuf->nr_pages++;
>  	}
>  	iobuf->offset = 0;
>
>
> On Fri, Jan 19, 2001 at 07:56:26AM -0800, Jay Weber wrote:
> > Hi,
> >
> > I just got a kernel panic while snapshotting with 0.9.1beta2.  I wonder if
> > anybody has seen any similar issues or I possibly fubar'd the patch on my
> > end?
> >
> > Panic was:
> >
> > 	Kernel panic: brw_kiovec: iobuf not locked for I/O
> >
> > This occured while simultanously copying 20 tarballs back and forth
> > between two dirs on the source volume and performing a snapshot at that
> > time.  It appears to have hung my lvcreate (snapshot) command shell.
> > Oh, this was also using loop device for the source volume on my laptop in
> > this case.  Hmm, actually could this panic be related to the following
> > change in lvm.c?  It did work prior in 0.9.1beta1.
> >
> > @@ -492,7 +488,7 @@
> >                 goto out;
> >
> >         err = -ENOMEM;
> > -       iobuf->locked = 1;
> > +       iobuf->locked = 0;
> >         iobuf->nr_pages = 0;
> >         for (i = 0; i < nr_pages; i++)
> >         {
> >
> >
> > I haven't seen this one before myself, but in testing on our bigger scsi
> > based boxes in the back while snapshots are active and heavy IO is
> > performed on the source volume, the box tends to hang.  I gather this is
> > related to having to journal all source volume changes to the snapshot and
> > when you throw massive IO at it, things get slow. Any thoughts on this one
> > as well?
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> >
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
