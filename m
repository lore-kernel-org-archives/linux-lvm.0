Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105012312.RAA27583@lynx.turbolabs.com>
Subject: Re: [linux-lvm] odd problem
Date: Tue, 1 May 2001 17:12:47 -0600 (MDT)
In-Reply-To: <Pine.LNX.4.10.10105011628100.21405-100000@staff> from "Todd Underwood" at May 01, 2001 04:36:16 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Todd Underwood writes:
> All was working well but recently i needed to reboot (i was unable to
> increase the size of my / with the online ext2 tools and it was full
> --not sure what the error was there, or whether that is relevant).

Probably not relevant, but it is of interest to me what sort of problems
you had.  I assume you have patched the kernel with the online ext2
kernel patches and also enabled CONFIG_EXT2_RESIZE?  You should not have
any problems resizing root.

> lvm -- lvm_chr_ioctl:  unknown command 4004fe0a

Expected behaviour with new tools (compatibility reasons).  However, it
_does_ indicate that you do not have beta7 LVM kernel code.

> VGS: Mounted root (ext2 filesystem) readonly.
> change_root: old root has d_count=3
> Trying to unmount old root ... <7>uhci.c: suspect_hd
> okay

Don't know about this.

> a bunch of other stuff

Hmm...

> Activating swap partitions swapon: /dev/rootvg/swap: Invalid argument
> Setting hostname zapata.staff.osogrande.net execvp: No such file or
> directory
> 
> /etc/rc.d/rc.sysinit:  domainname: command not found
> 
> and so on.  looks like nothing's mounted.  the same kernel boots fine with
> an older root fs on a 'real' partition.

Do you run "vgchange -a y" (and optionally vgscan) in startup scripts?
There is a "LVM root howto" somewhere on the Sistina site.

Cheers, Andreas
-- 
Andreas Dilger                               Turbolinux filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
