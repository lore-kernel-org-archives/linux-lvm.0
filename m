From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] Again (still?): File size limit exceeded
Message-Id: <NBBBKLKHMJHIJLHOGAOJOEKAJDAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020116193850.T775@lynx.adilger.int>
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
Date: Wed Jan 16 20:48:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

How about when I'm logged in as root and I try to say;
dd if=/dev/hda5 of=/tmp/hda5.img

where hda5 is a 5 gig partition?

And it coredumps when the file size of hda5.img exceeds
2G?

Ok so this isn't LVM but its related to this topic


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Andreas Dilger
> Sent: Thursday, 17 January 2002 3:39 p.m.
> To: lvm@xbits.de
> Cc: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Again (still?): File size limit exceeded
>
>
> On Jan 17, 2002  01:21 +0100, lvm@xbits.de wrote:
> > On Wed, 16 Jan 2002, Andreas Dilger wrote:
> > > Kernel + libc bug.  You need to log in directly as root (no "su",
> > > no "sudo") and you must not have any ulimits set.  Even if you try
> > > to set your ulimit to "unlimited" (and even if it shows "unlimited")
> > > it is really 2GB.
> > >
> > > You can also upgrade to 2.4.18-pre2+ or glibc-2.2 to fix this.
> >
> > Thanks for your helpful reply. Just one last short question: Until I can
> > upgrade my libc or my kernel, if I created this 2GB+ LV's on
> the console,
> > can I use them or should they generally be at most 2GB?
>
> If you log in directly as root, and you can mkfs and fsck the partition,
> then you will have no problem with 2GB+ LVs.  If your non-root userid
> doesn't have a ulimit set, then you will not have any problem.
>
> My system, for example, has:
>
> /etc/profile:			ulimit -c 1000000
> /etc/gdm/Sessions/Gnome:	ulimit `loginoptionvalue ULIMIT`
>
> The first is for core files, can be ignored.  The second will set
> the ulimit for gdm (X Windows login manager) to some value, and
> hence any X Windows sessions will also inherit this ulimit.  Since
> there is a kernel/glibc bug, setting any value of the ULIMIT option
> will be a problem, so it should simply be removed for single-user
> systems until you update your kernel and/or glibc.
>
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
