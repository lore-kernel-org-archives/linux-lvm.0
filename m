Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7CENPa08615
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 10:23:25 -0400
Received: from ebb03.tietoenator.com (ebb03.tietoenator.com [194.142.141.100])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7CENNe1022031
	for <linux-lvm@redhat.com>; Thu, 12 Aug 2004 10:23:24 -0400
content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] fix lost vgda
Date: Thu, 12 Aug 2004 17:23:16 +0300
Message-ID: <30BB5E9998236744913B2C0E04D24D3906151224@zonda.eu.tieto.com>
From: <Onni.Rautanen@tietoenator.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

The disks used to be on another machnine and I found the vg autobackups fro=
m there. I was thinking about using vgcfgrestore to restore the vgda to the=
 disks, do I need to do pvcreate first or should it work without that? And =
does the disk need to be using the same device node as before or how does i=
t know which UUID to assign to the disk(Just wondering if I need to put the=
 disks back to the old machine where the autobackup was taken)?

Onni Rautanen
-----Original Message-----
From: Jan-Benedict Glaw [mailto:jbglaw@lug-owl.de]=20
Sent: 12. elokuuta 2004 16:37
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] fix lost vgda

On Thu, 2004-08-12 09:51:14 +0300, Onni.Rautanen@tietoenator.com <Onni.Raut=
anen@tietoenator.com>
wrote in message <30BB5E9998236744913B2C0E04D24D39061510CE@zonda.eu.tieto.c=
om>:
> Accidentally when creating the partitions for the raid5 array I did it on=
 the wrong machine =3D) and now I've lost the partition table/vgda for thos=
e 160gb disks in the lvm.

For the partition table, try gpart.

MfG, JBG

--=20
Jan-Benedict Glaw       jbglaw@lug-owl.de    . +49-172-7608481             =
_ O _
"Eine Freie Meinung in  einem Freien Kopf    | Gegen Zensur | Gegen Krieg  =
_ _ O
 fuer einen Freien Staat voll Freier B=EF=BF=BDrger" | im Internet! |   im =
Irak!   O O O
ret =3D do_actions((curr | FREE_SPEECH) & ~(NEW_COPYRIGHT_LAW | DRM | TCPA)=
);
