Date: Wed, 30 Aug 2000 20:10:14 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] ExChange of Harddisks
Message-ID: <20000830201014.A312@guldukat.muon>
References: <10026.967645345@www17.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <10026.967645345@www17.gmx.net>; from a.kloecker@gmx.net on Wed, Aug 30, 2000 at 04:22:25PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

On Wed, 30.08.00, Arne Kl=EF=BF=BDcker <a.kloecker@gmx.net> wrote:
> i want to change my actual Setup (1 IDE Disk, 3 SCSI Disks, 1 Logical
> Device which has 1 FS =3D> This is used as one big volume for a private
> fileserver). The Remianing Space on the SCSI Disks should be enough to
> hold the Data from the IDE Disk.
=20
If i understand your setup right you can just move the physical extents from
your IDE-Drive to the SCSI-Drives. You do this with "pvmove <device>",
<device> being the physical volume you want to remove.  You can, if you
want, also specify to which PV's the PE's get moved to (see manpage).

If i am not mistaken, this can even be done without unmounting the
filesystem(s).

Dont forget to remove the PV from your VG before you remove the drive.

have fun,

Nils

--=20
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
