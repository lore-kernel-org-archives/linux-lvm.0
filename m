Message-ID: <390FD771.DB59EECB@msede.com>
Date: Wed, 03 May 2000 09:38:25 +0200
From: Michael Marxmeier <mike@msede.com>
Reply-To: adilger@turbolabs.com
MIME-Version: 1.0
Subject: Re: [linux-lvm] SuSE/LVM boot problem
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Forwarded message from Andreas Dilger <adilger@turbolabs.com>

-------- Original Message --------
From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200005030309.e4339BK11871@webber.adilger.net>
Subject: Re: [linux-lvm] SuSE/LVM boot problem
In-Reply-To: <20000502232221.A20803@gondor.com> "from Jan Niehusmann
at May 2,
 2000 11:22:21 pm"
To: Jan Niehusmann <list039@gondor.com>
Date: Tue, 2 May 2000 21:09:10 -0600 (MDT)

Jan writes:
> > On this topic, what is needed to make lvm work for both / and /boot with
> > full lilo support? I think it somewhat limits the utility of lvm not to
> > be able to make a fully lvm system, and might be tempted to do some of
> > the heavy lifting if it is not too gruesome.
> 
> I can imagine two ways to make lilo work with lvm:
> 
> 1) at install time (when you run /sbin/lilo), lilo maps the logical (lvm)
> locations to physical locations and writes these to the boot block. The boot
> code doesn't need to be changed.
> 
> Option 1 is way easier to implement, but has one big disadvantage: Whenever
> you move physical extents, you have to re-run lilo.
> 
> Both ways, you may end up with the kernel (or parts of it) moved to
> a drive that's not accessible by lilo.  (while the 1024-cylinder-limit
> is gone, there are still drives that are accessible by linux but not by
> the bios, for example scsi drives on a controller without bios)

I don't think that these limitations are very serious.  You can always
put some restrictions on how /boot is created under LVM (e.g. must be
contiguous or on a BIOS visible disk).  I assume it is possible with
lvcreate to force creation of an LV on a specific PV, at least.  With
the newer LILO, there is no longer the 1024 cylinder limit either, so
as long as the kernel is on a single disk, LILO can boot it.

It might be nice to allow LILO to boot from a mirrored /boot LV, by
having it internally think there are two kernels involved, or by
having it write slightly different boot sectors to the mirror drives
used (i.e. if we are using /dev/hda1 and /dev/hdb1 to mirror /boot,
LILO could go through /etc/lilo.conf once with root=/dev/hda and once
with root=/dev/hdb).  However, this is not a requirement at all - get
LILO to work with /boot in an LV, and you've won 90% of the battle.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               --
Dogbert
