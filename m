Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103132141.f2DLfd005459@webber.adilger.int>
Subject: Re: [linux-lvm] Changing device numbers.
In-Reply-To: <006701c0ac4d$dc90a4a0$0f01a8c0@myplace.net> from Bas at "Mar 13,
 2001 10:13:17 pm"
Date: Tue, 13 Mar 2001 14:41:39 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Bas writes:
> From: Andreas Dilger <adilger@turbolinux.com>
> > 1) The most important problem is that it is IMPOSSIBLE for LILO to boot
> >    from a striped LV (or MD RAID 0 for that matter).  No matter what you
> >    do, this will not be fixed, because the BIOS cannot handle a kernel
> >    image on multiple disks.
> 
> To avoid miscommunication: the LV is striped across 2 disks. I'm not using
> RAID or anything like that. To be more specific: I used lvcreate -i2 -I 4 -L
> (size) -n (name) (vgname).  The kernel image is on /boot, which is (the
> only) "normal" partition.

Yes, even "-i2" is striping across multiple disks, just like RAID 0.  However,
if you have /boot on a normal (DOS) partition, then you are OK.

> > "Niceness" has nothing to do with it.  LILO is complaining about not
> > recognizing device "58:15" (or whatever), but it would also complain about
> > device "58:0" until you apply the LILO patch.  After that, it will work no
> > matter what you do, as long as LILO is happy with where the kernel is
> > physically located on disk.
> 
> Why does it work when I manually type "root=/dev/rootvg/root"  ?

Maybe because vgscan is changing the device numbers for /dev/rootvg/root?
It may also be that the initrd has different device numbers for the LVM
devices than the root partition does?  If you put a line "root=/dev/vgX/lvY"
in the lilo.conf, it will store the major/minor into the boot parameters.
You probably should use "append=root=/dev/vgX/lvY" to get it correct.

> > Here is the LILO patch again.  The LVM patch is in beta6.  If you use it
> > with anything older than beta3, it will crash your system.
> 
> Just for my understanding: if I use this patch, I will not have to use an
> initrd anymore ?

No, you still need initrd, but you no longer need to keep /boot in a DOS
partition.  You DO need to have a boot LV that is not striped (MD RAID 1
mirroring should be OK).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
