Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102271658.f1RGwkl27047@webber.adilger.net>
Subject: Re: [linux-lvm] Possible to raise Max LV?
In-Reply-To: <20010227131526.1C48E3FDB@math.ohio-state.edu> from Dave Alden at
 "Feb 27, 2001 01:15:26 pm"
Date: Tue, 27 Feb 2001 09:58:46 -0700 (MST)
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

Dave Alden writes:
>   I'm hoping to use LVM with my hardware RAID array so I can take snapshots
> of the filesystem for backups.  What I'm worried about is that my current
> array is 240GB, so the next drive I add will take it over 256GB which (if
> I'm reading the HOWTO correctly) means that I won't be able to use LVM
> anymore (since it's being presented as one drive).  Is there someway to
> get around the 256GB limit (or did I misunderstand this completely? :-)

The max LV size is dependent upon the PE size that you select at VG
creation time.  This is because there is a limit of 64k PEs per LV.

64k = 2^16, 4MB = 2^22 -> 2^16 * 2^22 = 2^38 = 2^8 * 2^30 = 256GB

There is no way to fix this, unfortunately, without backup/restore or
having enough disk space to make a new VG with larger PE size and
then copy your filesystem over.  You can only have 1 PE size in a VG,
so it is not possible to do a "pvmigrate" to a larger PE size.

If you don't have a single LV > 256GB then you do not have a problem.
The 256GB limit is per LV.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
