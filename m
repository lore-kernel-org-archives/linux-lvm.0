Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2PEYpj31381
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 09:34:51 -0500
From: Rainer Krienke <krienke@uni-koblenz.de>
Date: Thu, 25 Mar 2004 15:34:47 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_H4uYAmJ448JgZe6";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200403251534.47502.krienke@uni-koblenz.de>
Subject: [linux-lvm] Somewhat offtopic: Strange umount problem ....
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com


--Boundary-02=_H4uYAmJ448JgZe6
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hello,

I have a problem with 3 server machines and I would as far as possible try =
to=20
isolate the bug which might be related to lvm or might not be. Perhaps=20
someone can help me where and how to look for the problem:

I am running 3 NFS and SMB servers (suse8.2; SuSE kernel 2.4.21-199, LVM=20
2.2.00.05) which run perfectly stable but show a strange behaviour
when rebooting the machines: The filesystems which contain user directories
cannot be umounted since the kernel claims that they are still busy. When I
switch to single user mode and run fuser -v or lsof on the mountpoints I
see no output. There are no more smb or other processes in the processlist
that might access the filesystems but nevertheless I cannot umount them.
The output of fuser -v shows only=A0=A0this:

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0USER=A0=A0=
=A0=A0=A0=A0=A0=A0PID=A0ACCESS=A0COMMAND
/export/user1=A0=A0=A0=A0=A0=A0=A0=A0root=A0=A0=A0=A0=A0kernel=A0mount=A0=
=A0/export/user1

fuser -vm /export/user1 and lsof /export/user1=A0=A0do=A0not=A0output=A0any=
thing.

The filesystems are xfs on top of LVM2 logical volumes which again run on
top of a md raid1 softmirror (the one and only physical vol)  which is buil=
t=20
upon a md multipath device:

xfs_fs: LVM2: md_soft_raid1: md_multipath: Fibrechannel_hardware_raid_5

Basically all of the software except for LVM2 is a "original" suse 8.2=20
installation.=20
=20
The problem when I cannot umount the filesystems is, that the software
mirror cannot be shut down cleanly so it is resynced when restarting the
machine (eg for a kernel security upgrade). Since the mirror has a size of
about 1TB this takes quite a long time.  After all if one fine day during s=
uch=20
a unneeded resync the data source, one of two  hardware raid5 arrays should=
=20
decide to fail then all the data on the mirror would be lost. At the moment=
=20
usually one IDE disk in one hardware raid dies duing the sync.  If two disk=
s=20
would die all the data could vanish in a big black hole.

Actually I do not know at the moment how to go on searching and I cannot=20
determine if eg LVM might be involved in this problem. So I would be very=20
greatful if someone could give me a hint or perhaps even say that this cann=
ot=20
be a LVM problem.=20

Thanks for any help
Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--Boundary-02=_H4uYAmJ448JgZe6
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAYu4Haldtjc/KDEoRAo6AAJ937fO8qBm5Sh5dtd6aqU7dw8yrugCg9CGz
h9vHFPJJqPagqeD1Un/20aA=
=Z6ny
-----END PGP SIGNATURE-----

--Boundary-02=_H4uYAmJ448JgZe6--
