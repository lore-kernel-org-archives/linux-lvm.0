Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102262235.f1QMZcT11483@webber.adilger.net>
Subject: Re: [linux-lvm] Boot with LVM on RAID1 on entire disk
In-Reply-To: <20010226140905.A523@oro.net> from Ralph Jennings at "Feb 26, 2001
 02:09:05 pm"
Date: Mon, 26 Feb 2001 15:35:38 -0700 (MST)
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

Ralph writes:
> I would like to be able to RAID mirror my entire hard drive,
> and run LVM on top of that (/, /boot, /usr, swap, MBR).  So
> that if 1 of them dies, I only have to take out the good one,
> put it in the hda rack, and reboot.

Are you using MD RAID or hardware RAID?

> First off, I need the patch to Lilo to allow /, and /boot to
> be LVM partitions.  Can somebody please point me to this?

You need to boot from initrd (using lvmcreate_initrd to build it)
to have / in LVM.  My (relatively untested) LILO patch is at the
end.

> Second, I need a way to tell pvcreate or lvcreate not to mess
> with the MBR.  Some sort of paramater to one of them that I
> can use to tell it not to use the first 512 bytes (or 4K, or
> whatever it needs).  Or alternatively, some way to create an
> LV which covers the MBR, which I can keep blank, by just not
> writting to it.  I also saw mention of a patch for this in
> the list before, but to an old version of LVM.  If this exists
> for LVM 0.9.1b5, and kernel 2.4.2 can somebody point me to
> this also?

If you have disk partitions, LVM will not mess with the MBR.  If
you pvcreate on a whole disk, then it will overwrite the MBR.
lvcreate is completely irrelevant in this case.  If you really
need to leave the MBR alone, simply create a partition which is
the size of the whole disk, and then pvcreate that partition.

Unless you are terribly unlucky with the disk size, you will not lose any
usable disk space.  LVM can only utilize full multiples of the PE size
(4MB by default), and the LVM metadata (a few hundred kB) usually fits
in the remainder, leaving a extra unused space.  In the future we may
use some of this extra space for LVM metadata backups.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
