Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j07NkNr12379
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 18:46:23 -0500
Received: from io.sync-intertainment.com (io.sync-intertainment.com
	[66.79.188.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j07NkMYp002680
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 18:46:22 -0500
Received: from 80-26-155-200.adsl.nuria.telefonica-data.net ([80.26.155.200]
	helo=rohan.local.olmo.org)
	by io.sync-intertainment.com with esmtpa (Exim 4.43)
	id 1Cn3oM-0003GM-ON
	for linux-lvm@redhat.com; Sat, 08 Jan 2005 00:46:31 +0100
Content-class: urn:content-classes:message
Subject: RE: [linux-lvm] Extending a stripped Logical Volume
MIME-Version: 1.0
Date: Sat, 8 Jan 2005 00:43:39 +0100
Message-ID: <02A2B3D4A7D9DA4891257E8FF177C9F9032899@rohan.local.olmo.org>
From: =?iso-8859-1?Q?Olmo_Gonz=E1lez_Alcojor?= <olmo@olmo.org>
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


Hi,

Thanks for your reply.=20

95388 PE of 4mb each is ~370 Gbyte, right? I may be missing something... I'=
ve tried to lvextend and get the same error, even when trying to extend jus=
t 1Gbyte.

Thanks for your help,
Olmo.


-----Mensaje original-----
De: AJ Lewis [mailto:alewis@redhat.com]=20
Enviado el: martes, 04 de enero de 2005 20:40
Para: LVM general discussion and development
Asunto: Re: [linux-lvm] Extending a stripped Logical Volume

Olmo Gonz=EF=BF=BDlez <olmo@olmo.org> writes:

> I am new to this list, seeking for some help.
>=20
>  I have setup LVM2 under debian sarge (2.6.8-k7 kernel).
>=20
> I originally created a volumen group (nasvg) on 4 x ST3200822A ATA
> DISK drives. I created a stripped logical volume spanning these 4
> disks and using up al PE's available. I then attached two aditional
> ST3200822A ATA DISK drives and I would now want to resive my logical
> volumen to use al the PE's provided by the two new disks. The problem
> is I can't extend the logical volume, getting the following error:
>=20
> gollum:~# lvextend -L+1G /dev/nasvg/naslv
>   Using stripesize of last segment 64KB
>   Extending logical volume naslv to 746.23 GB
>   Insufficient allocatable extents suitable for parallel use for
> logical volume naslv: 191036 required
>=20
> I have been googl'ing and it seems that this has to do with
> restrictions on resizing sttriped LV's. However, the information I
> have found says the restrictions no longer apply to LVM2.

You should be able to 'lvextend -L+1G /dev/nasvg/naslv -i1' if you
have and additional 1G of free space in the VG.  However, based on the
vgdisplay output below, it looks like you only have 3.72G free (or
95388 extents), so you'd want do do: 'lvextend -l+95388
/dev/nasvg/naslv -i2' if you want to stripe it across the 2 new disks,
or 'lvextend -l+95388 /dev/nasvg/naslv -i1' if you want it to be a
linear segment.

> gollum:~# vgdisplay
>   --- Volume group ---
>   VG Name               nasvg
>   System ID
>   Format                lvm2
>   Metadata Areas        6
>   Metadata Sequence No  25
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                1
>   Open LV               1
>   Max PV                0
>   Cur PV                6
>   Act PV                6
>   VG Size               1.09 TB
>   PE Size               4.00 MB
>   Total PE              286168
>   Alloc PE / Size       190780 / 745.23 GB
>   Free  PE / Size       95388 / 372.61 GB
>   VG UUID               LWqtTF-F8vA-yjXt-AYwK-yFQr-skDa-s9UVRC
>=20
>   --- Logical volume ---
>   LV Name                /dev/nasvg/naslv
>   VG Name                nasvg
>   LV UUID                GMm5PD-6Rdk-h8lG-35Fw-rZp3-L42s-N6k9QC
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                745.23 GB
>   Current LE             190780
>   Segments               1
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:0
>=20

Regards,
--=20
AJ Lewis                                   Voice:  612-638-0500
Red Hat Inc.                               E-Mail: alewis@redhat.com
720 Washington Ave. SE, Suite 200
Minneapolis, MN 55414
  =20
Current GPG fingerprint =3D D9F8 EDCE 4242 855F A03D  9B63 F50C 54A8 578C 8=
715
Grab the key at: http://people.redhat.com/alewis/gpg.html or one of the
many keyservers out there...


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
