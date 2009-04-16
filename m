Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GAQa00030574
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 06:26:36 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.188])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3GAQHOk027409
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 06:26:22 -0400
Message-ID: <49E707C8.8050801@gmx.net>
Date: Thu, 16 Apr 2009 12:26:16 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
In-Reply-To: <29070.706.qm@web94806.mail.in2.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

yogeen honnavar schrieb:
> Dear users,
>=20
> We have created a mirrored logical volume(lv1) in a volume group vg1. we =
have 2 disks /dev/sda and /dev/sdb. output of lvs command shows that mirror=
 image_0 is stored on /dev/sda3 and image_1 on /dev/sdb3 and mirror log on =
/dev/sdb2. Copy % shows 100%. so mirroring is setup correctly.
>=20
> now we wish to simulate mirror leg failure and recovery. as per the redha=
t lvm administrators guide we used the following command to trigger the fai=
lure of mirror leg1
>=20
> dd if=3D/dev/zero of=3D/dev/vg1/lv1 count=3D10
>=20
> as per the redhat guide this should result in mirror leg failure and any =
subsequent write activity to the mirror should convert the mirror into line=
ar volume. but the output of lvs command still shows copy % as 100%. also d=
ata in filesystem of lv1 is erased and it is converted into read only files=
ystem.
>=20
> can anyone please let us know the correct way to simulate lvm mirror fail=
ure and recovery.
>=20
> thanks and regards
> -yogeen

Hi yogeen,

i guess you wanted to do a 'dd if=3D/dev/zero of=3D/dev/sdb3 count=3D10', w=
ith
your command, you filled the logical volume with zeros and that is
mirrored perfectly on both underlying devices - as it should ;-).



--=20
Mit freundlichen Gr=C3=BCssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
