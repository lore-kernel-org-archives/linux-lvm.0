Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102081915.f18JFdc17650@webber.adilger.net>
Subject: Re: [linux-lvm] Setup for RAID1 with LVM
In-Reply-To: <3A827F18.4B387240@suse.de> from Jens Bruckmann at "Feb 8, 2001
 12:12:25 pm"
Date: Thu, 8 Feb 2001 12:15:39 -0700 (MST)
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

Jens, you write:
> I would like to setup a configuration with LVM and RAID1. Poorly you
> can't just do a lvextend -m 1 like on HP-UX :-))
> 
> I have two SCSI-Disks of nearly the same size, on Disk 1 I already have
> a working installation of Linux.

You need to use MD to do mirroring on Linux, not LVM (as in HP-UX and AIX).

> /usr, /opt and /var reside on LVs. I want these three LVs to be mirrored
> online to the second disk as it is possible on HP-UX.

You _may_ be able to create an MD RAID-0 mirror of your existing disk,
and then run vgscan again to detect the new configuration.  However, this
has probably never been done - normally, you would create the MD mirror
first and then create VG/LV on top of it.  It may NOT work, because I
recall something about MD storing a backup superblock at the end of the
MD device, and this would break LVM I think (LVM aligns the PEs at the
end of the partition as well).

> Can someone shortly describe, how to setup such a configuration?

The safest would be to backup your system, and start with creating an
MD device, and then adding LVM on top of it.  If you have a backup,
you could test to see if mirroring an existing LVM disk works, because
this may be something people want to do in the future.

It is also be possible (if you have extra disk space) to create a mirrored
MD device, make a PV of it, add it into the VG, and pvmove all of your
existing LVs to the mirrored device.  You can then vgreduce the old
(unmirrored) PV out of the VG.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
