Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l67MFiMX011796
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 18:15:44 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l67MFfU3001351
	for <linux-lvm@redhat.com>; Sat, 7 Jul 2007 18:15:42 -0400
Content-Type: text/plain; charset="iso-8859-1"
Date: Sun, 08 Jul 2007 00:15:35 +0200
From: "Lomp Hemul" <LoMp0101@gmx.net>
In-Reply-To: <20070707191211.6FD8D77702@mail.futurelabusa.com>
Message-ID: <20070707221535.17470@gmx.net>
MIME-Version: 1.0
References: <20070707134753.181690@gmx.net>
	<20070707191211.6FD8D77702@mail.futurelabusa.com>
Subject: Re: [linux-lvm] Restore LVM after drive error
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello

thanks for your replay. I have noticed that in your case the "old" disk has=
 faild, but in my case the new disk faild. That means that the disks of the=
 old LVM are all woring ! No bad Blocks or so. But SMART told me that one d=
evice will fail in future. So i put that bad disk in (i testet it befor - i=
t showed no error).
My first atempt to get everything back working was to remove the device, th=
row it out of my hw-array config and boot. Well,i think pvmode tries to acc=
ess this device , but it is no longer availible !
I have another disk that is bigger than the drive that faild. Does pvmove w=
orke again if i put that drive in its place and start pvmove again ? Perhap=
s i have to mark the partition on the disk as lvm bevore, but is there a ch=
ance that pvmove just continues ? By the way how do i tell pvmove to contin=
ue ?

F F=EF=BF=BDrster =20

-------- Original-Nachricht --------
Datum: Sat, 07 Jul 2007 13:12:16 -0600
Von: Jim Schatzman <james.schatzman@futurelabusa.com>
An: LVM general discussion and development <linux-lvm@redhat.com>
Betreff: Re: [linux-lvm] Restore LVM after drive error

> Another note:
>=20
> Re: Using dd to image a failing hard drive. Ryan Nelson in an earlier
> posting explained how to get your VG back online:
>=20
> "vgcfgbackup, edit the backup, edit the ids in the logical_volumes
> sections, check your work carefully, and vgcfgrestore?"
>=20
> This will allow you to substitute the new id for the old and LVM should
> then be good to go. Presumably, you will have lost some data, so I would
> recommend mounting the FS readonly and copying files elsewhere. If you do=
n't
> care what may happen, you could mount RW, run fsck and repair the filesys=
tem.
>=20
> Jim
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
