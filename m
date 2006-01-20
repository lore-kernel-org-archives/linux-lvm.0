Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0KHui109325
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 12:56:44 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.187])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0KHubFH012371
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 12:56:37 -0500
Message-ID: <43D124BD.6060200@gmx.net>
Date: Fri, 20 Jan 2006 18:58:21 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pv resize problem
References: <79af7a390601191600v36f7bfccuee8643f2c3adc4bd@mail.gmail.com>
In-Reply-To: <79af7a390601191600v36f7bfccuee8643f2c3adc4bd@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Tiago Freitas schrieb:
> I used pvresize now but it's the same. It resized the pv but I can't=20
> resize the /dev/hda3  lvm partition.
>=20
> I tried parted and fdisk and I get errors like:
>=20
> "Error: Unable to open /dev/hda3 - unrecognised disk label."
>=20
> "Device contains neither a valid DOS partition table, nor Sun, SGI or=20
> OSF disklabel".
Hi Tiago,

honestly, you don't have a clue what your are doing there, he ;-).
You have to point fdisk to the device of your whole disk (which is=20
/dev/hda) ...

Ciao
Klaus
--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
