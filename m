Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105232256.f4NMuZgf030596@webber.adilger.int>
Subject: Re: [linux-lvm] Converting my Root file system to LVM
In-Reply-To: <990627110.1179.0.camel@localhost> "from Rupert Heesom at May 23,
 2001 10:11:45 am"
Date: Wed, 23 May 2001 16:56:35 -0600 (MDT)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rupert writes:
> The expanding the LV & file system using e2fsadm is what I'm dithering
> about now.   I think it's necessary to umount the LV to change it's size
> (my e2fsadm is using the resize2fs util).  Since my current new root is
> already an LVM partition, I need some way of unmounting it, doing the
> LVM work on it, then remounting it.
> 
> I think the miniroot ramdisk which Steve Wray pointed out is probably my
> answer. However I do wonder whether it's possible to do this another
> way?   The miniroot ramdisk is still a great idea that I will implement.

If you patch your kernel with the online ext2 patches, you can resize
your root partition while it is still mounted.  You will still need a
reboot to install the new kernel, however, but only the one time.  See
http://sourceforge.net/projects/ext2resize/

It still isn't a bad idea to have a small non-LVM partition on one of
your disks which has a kernel you can boot from, along with useful
tools in /lib and /sbin.  I guess miniroot is such a thing.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
