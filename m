From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010312105.e9VL5XY11520@webber.adilger.net>
Subject: Re: [linux-lvm] Exporting VG
In-Reply-To: <20001031203559.A8120@gondor.com> "from Jan Niehusmann at Oct 31,
 2000 08:35:59 pm"
Date: Tue, 31 Oct 2000 14:05:33 -0700 (MST)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <jan@gondor.com>
Cc: Andreas Dilger <adilger@turbolinux.com>, linux-lvm@msede.com

Jan writes:
> > When you do vgexport, this does not do anything like NFS export (does NOT
> > allow network access to the VG).  It allows you to physically move the
> > disks to another machine.
> 
> Is vgexport/vgimport doing something important? I just moved a harddisk with
> a vg to another computer without vgexport/vgimport and didnot notice any 
> problems. Or is it only needed if I add a vg to an already running system?

I think the only thing that vgexport does is mark on disk that the VG
is "exported" and not shown on vgscan or imported when a "vgchange -a"
is done.  On AIX, there is no difference on disk for imported and exported
VGs, the VG state is stored in a config file.

IMHO, we should not store this state in the VG, nor advocate running
"vgscan" on each boot.  From what I have read in the past on this mailing
list, running vgscan on boot is likely to delete important info from
/etc/lvmtab if there is a minor problem, that has to later be restored
(if possible).

It would be a lot safer to keep the state of LVM in /etc/lvmtab, and
only add or remove VGs with administrator actions (explicit vgimport,
vgexport, vgscan (for a new system or major problems).  This at least
lets you know at boot time that a VG has a problem, rather than vgscan
simply deleting it from lvmtab.

What will make this a lot more likely is the work that Heinz is doing
on PVIDs, so that you only store the VGID + vgname in /etc/lvmtab
and then only the PVIDs in the VGDA.  You don't have to worry about
device names changing if disks are added/moved/removed, because you
never depend on the device name.

PVIDs will also make vgimport much easier (like AIX) so you only specify
a single device and the VGDA knows all of the PVIDs that belong to that
volume group.  Using VG names is dangerous if you are moving VGs between
systems in case the two systems have identical VG names.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
