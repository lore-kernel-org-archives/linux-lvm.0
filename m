Date: Wed, 30 Aug 2000 16:22:25 +0200 (MEST)
From: Arne =?ISO-8859-1?Q?Kl=F6cker?= <a.kloecker@gmx.net>
MIME-Version: 1.0
Subject: [linux-lvm] ExChange of Harddisks
Message-ID: <10026.967645345@www17.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com

Hello,

i want to change my actual Setup (1 IDE Disk, 3 SCSI Disks, 1 Logical
Device which has 1 FS =3D> This is used as one big volume for a private
fileserver). The Remianing Space on the SCSI Disks should be enough to hold=
 the Data
from the IDE Disk.

Now i want to exchange the IDE Disk with a bigger SCSI Disk.=20

I dont really know how to do this.

I added 1 of the SCSI Disks after installing the LVM so i generally know
how to change the size of the ext2fs (i dont remember which tool i installed
for this.. ) but tips are appreciated...

Scanning the archive i stumbled over an article where vgreduce was
mentioned, could i use this tool too, or is it just for emty PVs ?

Im kind of stuck and any help is apreciated...

TIA
Arne Kl=EF=BF=BDcker

--=20
Sent through GMX FreeMail - http://www.gmx.net
