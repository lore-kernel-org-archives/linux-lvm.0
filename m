Date: Wed, 19 Jul 2000 09:51:23 +0200
From: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>
Subject: Re: [linux-lvm] made a big misstake
Message-ID: <20000719095123.A14554@zyrgelkwyt.pdc.kth.se>
References: <20000718231557.B13413@zyrgelkwyt.pdc.kth.se> <200007182302.e6IN2m930146@webber.adilger.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200007182302.e6IN2m930146@webber.adilger.net>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Dilger <adilger@turbolinux.com>
Cc: =?iso-8859-1?Q?Erik_B=E5gfors?= <bagfors@pdc.kth.se>, linux-lvm@msede.com

On Tue, Jul 18, 2000 at 05:02:47PM -0600, Andreas Dilger wrote:
> Erik writes:
> > I just installed a new computer the other day and since I'm a long time
> > aix-user and love there lvm-system I installed the linux-lvm.
> >=20
> > So far I am VERY impressed.  I've tried resizeing and moving end extend=
ing
> > and all kinds of stuff and everything worked!! Good work!!!
>=20
> Online resize and move, or offline?  I'm not sure if online moving of PEs
> is really safe if the filesystem is being used.  Of course, it is safe if
> the PE doesn't change while it is being moved...

The resize was done offline but the move was online.  But I didn't use the
box while doing it so I don't thing there is any danger there.

> > Now the misstake, I did not run a vgreduce before I fdisk'ed the whole =

> > disk (hdb).  Now when I start up, vgscan cannot find any vg's.
>=20
> Was hdb1 the first PV created in the VG?  The problem, I think, is that
> Linux LVM only keeps the VGDA on the first PV.  AIX will keep a VGDA
> copy on all of the PVs, and even will keep 2 VGDAs on the first PV for
> backup, in case the first one is corrupt.

Ahh..
No.. hdb1 was not the first PV in the VG.  So I should be safe since it was
hdb1 I removed.

> > So.. anyone knows how to solve this?  Sorry I don't have better output =
from
> > my commands but it's hard since the network is not working on it right =
now :)
>=20
> Sorry, I don't know enough about how the VGDA backups are stored.  You may
> be able to examine the VGDA backup to find the old size of /dev/hdb1 and
> then restore it, but otherwise I'm not sure what you can do.

That's what I was thinking too but it's in a binary format I know nothing
about.

> I think Linux LVM needs to be updated to keep VGDA backups on all disks
> instead of in the filesystem, exactly for reasons like this.  Right now,
> if the first disk fails, then you are unable to access any LVs that are
> wholly on another disk.  This is bad.

Agreed.

/Erik
--=20
Erik B=EF=BF=BDgfors               | Center for Parallel Computers
http://erik.bagfors.nu/    | http://www.pdc.kth.se/
erik@bagfors.nu            | bagfors@pdc.kth.se =20
Supporter of free software | GSM +46 70 398 54 43=20
