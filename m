Return-Path: <todd@staff.nm.org>
Date: 16 May 2001 18:10:53 -0600
Date: Wed, 16 May 2001 18:10:53 -0600 (MDT)
From: Todd Underwood <todd@osogrande.com>
Subject: Re: [linux-lvm] successes & resizing
In-Reply-To: <200105161655.f4GGtrHQ007080@webber.adilger.int>
Message-ID: <Pine.LNX.4.10.10105161809060.3494-100000@staff>
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

andreas,

as usual, thanks for the cogent, complete and useful reply.  i suspected
there were size limitations related to the options supplied to mke2fs at
create time.  i'll work with the filesystem offline to prepare it for
bigger sizes.

e2fsadm and ext2online are excellent tools and i highly recommend them.

thanks,

todd underwood
vice president & 
   chief technology officer
oso grande technologies, inc.
todd@osogrande.com

On Wed, 16 May 2001, Andreas Dilger wrote:

> Date: Wed, 16 May 2001 10:55:53 -0600 (MDT)
> From: Andreas Dilger <adilger@turbolinux.com>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] successes & resizing
> 
> Todd Underwood writes:
> > i have a separate question about ext2 resizing on a separate system:  when
> > i try to resize the root (using the ext2online resize patch to 2.4.3) i
> > get:
> > 
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/rootvg/root        495844    250577    219667  54% /
> > /dev/rootvg/usr        2590504   1444748   1014072  59% /usr
> > /dev/rootvg/home       1032088        20    979640   1% /home
> > /dev/rootvg/var         495844    105794    364450  23% /var
> > /dev/hda1               101089      6029     89841   7% /boot
> > bash-2.04# e2fsadm -L +200M / 
> > e2fsadm -- invalid logical volume name "/dev/root"
> 
> That is because in /proc/mounts, "/" is pointing to "/dev/root".  Sorry,
> not much I can do about that - you need to specify the real device name
> for root.
> 
> > bash-2.04# e2fsadm -L +200M /dev/rootvg/root 
> > lvextend -- extending logical volume "/dev/rootvg/root" to 700 MB
> > lvextend -- doing automatic backup of volume group "rootvg"
> > lvextend -- logical volume "/dev/rootvg/root" successfully extended
> > 
> > ext2online v1.1.17 - 2001/03/18 for EXT2FS 0.5b
> > new filesystem size 716800
> > ext2online: group 0, block 4 not reserved
> > 
> > ext2online: unable to resize /dev/rootvg/root past 524288 blocks
> 
> Yes, please see ext2prepare(8) or ext2online(8), starting with the
> paragraph "Because of the original design of the ext2 filesystem...
> there are certain limitations to the amount of resizing that can be
> done online..."  Clearly, you have a 1kB block filesystem for root,
> because it started life at (just) less than 512MB in size.  You
> could still online resize up to the 512MB limit without any other action.
> 
> To increase the filesystem size past 512MB, you need to (unfortunately)
> boot from a rescue floppy which supports LVM so you can play with the
> unmounted root filesystem (you may be able to simply change the LVM
> initrd to go to a shell instead of booting the system... maybe that should
> be an option for lvmcreate_initrd?).
> 
> Use ext2resize to resize the root filesystem to fill the current LV
> (just run it with no size parameter will do the trick).
> 
> ALSO, run ext2prepare on the filesystem to prepare it for some nice
> large size like 8GB (or whatever) so that the next time you need to do
> online resizing of that filesystem you can do so (up to 8GB at least).
> Don't make it _too_ large on a 1kB filesystem, as it starts sucking up
> space at an increasing rate.
> 
> You should do this on your other filesystems as well, while you are there,
> so that you don't run into the problem again later (for non-root fs it is
> easier to fix, but still is a hassle if you can't unmount the fs).
> 
> For 4kB block filesystems, you may as well prepare them for 256GB or
> whatever your max LV size is, it only costs a couple of kB in filesystem
> space (ok, maybe 1MB or so, depending on the current filesystem size).
> Use "dumpe2fs -h <dev>" to see the block size of the filesystems.
> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 
