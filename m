From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Again (still?): File size limit exceeded
Message-Id: <20020116200236.U775@lynx.adilger.int>
References: <20020116193850.T775@lynx.adilger.int>
    <NBBBKLKHMJHIJLHOGAOJOEKAJDAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJOEKAJDAA.steve.wray@paradise.net.nz>;
    from steve.wray@paradise.net.nz on Thu, Jan 17, 2002 at 03:47:52PM +1300
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
Date: Wed Jan 16 21:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve Wray <steve.wray@paradise.net.nz>
Cc: linux-lvm@sistina.com

On Jan 17, 2002  15:47 +1300, Steve Wray wrote:
> How about when I'm logged in as root and I try to say;
> dd if=/dev/hda5 of=/tmp/hda5.img
> 
> where hda5 is a 5 gig partition?
> 
> And it coredumps when the file size of hda5.img exceeds 2G?

Well, there are two possibilities:
1) You are hitting the aforementioned kernel bug and have a ulimit set
   somewhere.  Even though it is _likely_ that root does not have a
   ulimit set, it is not impossible that it is set.
2) Your dd/glibc/filesystem is not LFS capable and is hitting the normal
   2GB limit.
   
You should be able to check this by running "strace dd <options>" and
looking for several things:
1) dd is opening the files with "O_LARGEFILE"
2) whether dd is getting SIGXFSZ on read or write.

> > On Jan 17, 2002  01:21 +0100, lvm@xbits.de wrote:
> > > On Wed, 16 Jan 2002, Andreas Dilger wrote:
> > > > Kernel + libc bug.  You need to log in directly as root (no "su",
> > > > no "sudo") and you must not have any ulimits set.  Even if you try
> > > > to set your ulimit to "unlimited" (and even if it shows "unlimited")
> > > > it is really 2GB.
> > > >
> > > > You can also upgrade to 2.4.18-pre2+ or glibc-2.2 to fix this.
> > >
> > > Thanks for your helpful reply. Just one last short question: Until I can
> > > upgrade my libc or my kernel, if I created this 2GB+ LV's on
> > the console,
> > > can I use them or should they generally be at most 2GB?
> >
> > If you log in directly as root, and you can mkfs and fsck the partition,
> > then you will have no problem with 2GB+ LVs.  If your non-root userid
> > doesn't have a ulimit set, then you will not have any problem.
> >
> > My system, for example, has:
> >
> > /etc/profile:			ulimit -c 1000000
> > /etc/gdm/Sessions/Gnome:	ulimit `loginoptionvalue ULIMIT`
> >
> > The first is for core files, can be ignored.  The second will set
> > the ulimit for gdm (X Windows login manager) to some value, and
> > hence any X Windows sessions will also inherit this ulimit.  Since
> > there is a kernel/glibc bug, setting any value of the ULIMIT option
> > will be a problem, so it should simply be removed for single-user
> > systems until you update your kernel and/or glibc.
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
