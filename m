Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105151543.f4FFhuQg018741@webber.adilger.int>
Subject: Re: [linux-lvm] Lost filesystems on LVs (forgot the attachment)
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF683CB2@mailsrv.linkvest.com>
 "from Jean-Eric Cuendet at May 15, 2001 02:37:22 pm"
Date: Tue, 15 May 2001 09:43:56 -0600 (MDT)
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

Jean-Eric Cuendet writes:
> I have a BIG problem. I have an LVM VG of 160Gb. There is 3 LVs defined:
> - MS
> - Distrib
> - backups
> This morning, I made a e2fsadm to reduce the MS volume and grow the backup
> one.
> I umounted the MS volume, made the e2fsadm. All was OK, no error.
> I then umounted the backups LV and made the e2fsadm. e2fsck refused to work
> saying that there was no filesystem on it! All was OK, until I umount it!
> And now, I'm sticked with the backups LV with no filesystem (it was OK until
> this night, all backups were OK) and the MS LV with things that I don't
> understand (files that shouldn't be here...)
> 
> I added in attach, the dump2fs and "cat /proc/lvm/global"

If dumpe2fs shows the superblock, then e2fsck should also work.  I assume
that you ran dumpe2fs AFTER the resize?  Is it possible e2fsck is
refusing to work on the backups LV because of the large_file flag set?
What version of e2fsck are you using?  You should update to 1.19 at:
http://sourceforge.net/projects/e2fsprogs/

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
