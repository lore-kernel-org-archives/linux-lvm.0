Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGGMGr01982
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 11:22:16 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iBGGMA7G026278
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 11:22:10 -0500
Message-ID: <41C1B62A.8020200@gmx.net>
Date: Thu, 16 Dec 2004 17:22:02 +0100
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to increase/decrease space
References: <OFE9BB603A.48ABDE42-ON86256F6C.00557C0E-86256F6C.00573F84@schneider.com>
In-Reply-To: <OFE9BB603A.48ABDE42-ON86256F6C.00557C0E-86256F6C.00573F84@schneider.com>
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

AdabalaP@schneider.com wrote:
Hi Abdala,

seem's that you mix disks, partions, and filesystems. Here a little=20
PC-primer that you get an idea what all the other people are talking about.

1. You have a disk - obviously an IDE-drive 'caue the Linux device name=20
is hda.

2. On the disk, you have 2 Partitions, named hda1 and hda2.

3. On the first partition, you have an ext3 filesystem (?) probably for=20
/boot ??, the second partition is the only phisical volume of your=20
volume group VolGrp00 managed by LVM2, countaining several logical volumes.

4. The logical volumes in your volume group VolGrp00 containing are=20
formatted with a ext3 filesystem.

> Austine,
>=20
> I have a hard disk of 4.8GB which i partitioned it into 2 parts (hda1 =3D=
 100
> meg, hda2 =3D 4.7gb). The whole disk is of ext3 file system type.
This means, that /dev/hda is an ext3 filesystem ... if that's the case,=20
then the filesystem spans all partiotions and all the logical volumes=20
and if you were able to mount it, you will surely damage all the other=20
stuff on you drive ... well, you can't : i think Linux doesn't allow=20
mounting of overlapping devices/partitions, and if it does, the=20
filesystem is surely already damaged ...

> The hda2 is managed by using lvm2.
But you said, all drive is ext3 - well, seems you mixed something up ;-)

> Following is the partition sizes of the hda2 disk;
>=20
> hda2        VolGrp00          4.6 gb
>=20
> /           VolGrp00/LogVol00 450 meg     35% used
> /usr        VolGrp00/LogVol04 1.9 gb      92% used
> /usr/local  VolGrp00/LogVol05 128 meg     25% used
> /home       VolGrp00/LogVol03 128 meg     60% used
> /opt        VolGrp00/LogVol02 128 meg     35% used
> /var        VolGrp00/LogVol07 450 meg     30 % used
> swap        VolGrp00/LogVol01 342 meg
>=20
> Here is sequence of steps that i have performed to inc/dec the partition
> sizes;
>=20
> tried to increase /usr size by 400 meg.
>=20
>       #lvresize -L +450 VolGrp00/LogVol04
>=20
>       when i display using the "lvdisplay VolGrp00/LogVOl04" i see 2.4 gig
> allocated to this partition, but when i   see it through "df -m /usr" it
> hasn't changed.
>=20
>       So, As per Jason's email i have done the below;
>=20
>       #lvextend -L2.4G VolGrp00/LogVol04
So you resized the logical volumes, which is a kind of 'virtual=20
partition', but the filesystem is still of the same size, it doesn't=20
recognize the the 'device' or 'partition' it lives on has grown, so you=20
have to tell him to (Jason Martin told you earlier, and pointed you to=20
the LVM-HOWTO <http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html>).

Instead of complainig you should have better read that doc, and you'd=20
know what to do.

>=20
>       But again this hasn't changed my "df -m /usr" output.
>=20
> I thought using LVM commands one should be able to take care of the inc/d=
ec
> of partitions sizes under a given VG. Why should i be using "fdisk" and
> "e2fsadm" ?
Well, if you'd read the e2fsadm man page before growing your lvol, you'd=20
  have known what to do. For an offline ext3 (don't know Fedora,=20
propably they aleady use the online resize patches for ext3 ?), you can=20
use resize2fs to grow your filesystem.

>=20
> If i have missed or done any thing wrong while resizing the partitions can
> please provide me an example so that i could try it.
Jason pointed you there in the first reply to your request, so Read That=20
Fucking Manual ;-).

Ciao
Klaus

--=20
Mit freundlichen Gr=EF=BF=BDssen / best regards

Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
