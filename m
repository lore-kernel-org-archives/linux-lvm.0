From: Andreas Dilger <adilger@turbolabs.com>
Message-Id: <200007190520.e6J5KIJ08751@webber.adilger.net>
Subject: Re: [linux-lvm] made a big misstake
In-Reply-To: <39752C4D.D07D0F2C@marxmeier.com> "from Michael Marxmeier at Jul
 19, 2000 06:19:25 am"
Date: Tue, 18 Jul 2000 23:20:18 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Marxmeier <mike@msede.com>
Cc: linux-lvm@marxmeier.com, bagfors@pdc.kth.se

Michael writes:
> Andreas Dilger wrote:
> > Was hdb1 the first PV created in the VG?  The problem, I think, is that
> > Linux LVM only keeps the VGDA on the first PV.  AIX will keep a VGDA
> > copy on all of the PVs, and even will keep 2 VGDAs on the first PV for
> > backup, in case the first one is corrupt.
> 
> Actually, LVM should have a copy of the dscriptor area. It is kept in
> the file system in the directory /etc/lvmconf which even has the nice
> property that you can back it up. The VGDA is implecitely backed up by 
> most LVM  commands. 
> 
> You should be able to restore them with vgcfgrestore.
> The vgcfgrestore syntax seems to sugest you can even restore it
> to another physical volume (no tested, personally) which would
> solve the actual problem nicely.

Unfortunately, I didn't quote all of the original message.  One part you
must have missed from the original posting:

> > Eric writes:
> > > I was thinking that creating a new pv (on /dev/hdb1) and running 
> > > vgcfgrestore -n disk_vg /dev/hdb1 would help me get it back but it just
> > > say that "size of physical volume /dev/hdb1 differs from backup" and I
> > > cannot remember what size I had last time

So vgcfgrestore is not useful in this case, since it can't be restored to
the new partition or to the other PV in the VG.  Having a VGDA on each PV
in a VG would solve this problem.  It would also fix the major problem
that would happen if the VGDA for the root filesystem/VG is corrupt - you
cannot access the VGDA backups in /etc/lvmconf in this case at all, and
even a rescue disk will not help you because the VG layout is not known.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
