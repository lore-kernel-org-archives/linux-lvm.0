Return-Path: <raheesom@navpoint.com>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
From: Rupert Heesom <raheesom@navpoint.com>
In-Reply-To: <000001c0e345$a6088a40$7d80a8c0@dyndns.org>
References: <000001c0e345$a6088a40$7d80a8c0@dyndns.org>
Date: 23 May 2001 10:11:45 -0400
Message-Id: <990627110.1179.0.camel@localhost>
Mime-Version: 1.0
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

Hi Michael:

Thanks for the notes below.

Yes, I do want to keep the old PV active.  My whole exercise here is to
use LVM to expand my root partition to cover 2 disk.  Therefore I've
created a PV on my 2nd disk (new one I'm adding onto the PC) and that's
up and running as my root currently.  Now I'm trying to copy the file
system to my orig disk (better disk) and expand the LV to cover both
disks. 

The expanding the LV & file system using e2fsadm is what I'm dithering
about now.   I think it's necessary to umount the LV to change it's size
(my e2fsadm is using the resize2fs util).  Since my current new root is
already an LVM partition, I need some way of unmounting it, doing the
LVM work on it, then remounting it.

I think the miniroot ramdisk which Steve Wray pointed out is probably my
answer. However I do wonder whether it's possible to do this another
way?   The miniroot ramdisk is still a great idea that I will implement.



On 23 May 2001 01:03:02 -0400, S. Michael Denton wrote:
> With pvmove-ing an lv, it's actually quite easy... and I've done it
> several times with the VG active... here's how:
> 
> pvcreate <new-pv>
> vgextend <vg> <new-pv>
> [make sure <new-pv> has at least as many pe's as <old-pv>]
> pvmove <old-pv> <new-pv> (may require a -f or something if the lv's
> are open)
> vgreduce <vg> <old-pv> (unless you want to keep the old pv for
> expansion or something)
> 
> viola!  all lv's that were on <old-pv> are now on <new-pv> :)  This
> is also how I "defragment" the lv's if it gets too crazy with the
> allocation... although you really don't need to do this (i just like
> to keep the vgdisplay -v's easier to parse with scripts, etc :) )
> 

-- 
regs
rupert
