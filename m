Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105241704.f4OH4Rom014186@webber.adilger.int>
Subject: Re: [linux-lvm] Raid5 sync problem
In-Reply-To: <001801c0e444$22d57f20$56dc10c3@tal.org> "from Kaj-Michael Lang
 at May 24, 2001 02:24:43 pm"
Date: Thu, 24 May 2001 11:04:27 -0600 (MDT)
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

Kaj-Michael Lang writes:
> Anyway I have 4 6g drives in a RAID5 configuration. On top the md device I
> have a VG and a couple of LV in it. I'm running 2.4.4 with the beta7 LVM
> patch and using ext2 on all the LV's.
> It now happened that one drive failed (actually just a IDE cable problem but
> anyway) and the machine became really really slow. Load was up to 200 and
> almost every command got stuck so all I could do was to boot.
> It came up ok, and I hotadded the drive back and it started to sync but
> after a while the sync was down to 0 kb/sec and the same slow-down started
> to happen.
> So I boot again.. and now when it started to fsck the LV's it slowed-down
> again. So I booted with init=/bin/bash and let the sync finnish without any
> other access to the RAID/LV's and after that everything worked fine again.
> 
> So the problem seems to be that when accessing the RAID5 while it is syncing
> locks somewhere. Does anyone know of a fix or know what I should do so that
> syncing won't kill the machine.

This is the "RAID5 speed limit" which only kicks in if you have I/O to
the volume while you are resyncing.  You can change a parameter somewhere
in the RAID code which increases the minimum speed at which resync is
done on active volumes (at the expense of performance for other apps).

If you have a single huge RAID 5 volume which is always in use while the
system is running, then you will always get the resync slowdown.  I'm not
sure why this would cause your whole system to get so slow, unless it is
something like you are swapping to RAID5, and this kills performance.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
