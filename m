Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9GAmj5e015105
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 06:48:45 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9GAmXVa029351
	for <linux-lvm@redhat.com>; Thu, 16 Oct 2008 06:48:33 -0400
Message-ID: <48F71C00.3060907@gmx.net>
Date: Thu, 16 Oct 2008 12:48:32 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [IMPORTANT]LVM+iSCSI issue..Local Disk disappeared..
References: <d5dce2210810150620l2e9c4b44uc519eeeebadd604f@mail.gmail.com>	<1224086814.7418.11.camel@localhost.localdomain>
	<d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
In-Reply-To: <d5dce2210810160327r52de7ca4ne982934f5918aebc@mail.gmail.com>
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

Hi himanshu,

himanshu padmanabhi schrieb:
> We configured it as
> *
> Case 1
>=20
> *pv1=3D localdisk1    pv2 =3Dlocaldisk2
>=20
> Vg1=3D pv1,pv2
>=20
> created lv1 of size =3Dpv1size + pv2size
>=20
> Deleted lv1,
> =20
> removed pv2,
>=20
> vg is getting displayed properly in vgs command
>=20
> *
> Case 2
>=20
> *pv1=3D localdisk1    pv2 =3Dremotedisk2(iscsi disk)
>=20
> Vg1=3D pv1,pv2
>=20
> created lv1 of size =3Dpv1size + pv2size
>=20
> Deleted lv1,
>=20
> logout from iscsi target
>=20
> vg is not getting displayed properly in vgs command
In case 1 you just physically removed the pv2? And vgdisplay shows you
the error message of the missing pv in the vg? Or you removed the pv
from the vg, vgdisplay showing you that the vg is ok?

In case 2 you just log the iscsi target out, which is the same as just
pulling the cable off, and vgdisplay doesn't show you, that the vg is
damaged, cause the pv2 is missing?

If you want to remove the pv2 from the vg without getting it in error
state, you have to remove the pv from the vg before iscsi-logout.

Anyways, it would be quite helpfull to cut-n-past the output of
vgdisplay into your mails instead of telling us, that it's not
displaying properly ;-).

Ciao
Klaus
--=20
Mit freundlichen Gr=C3=BCssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
 X        AGAINST HTML MAIL
/ \
