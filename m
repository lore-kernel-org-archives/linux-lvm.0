Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6EFFVur032449
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 11:15:31 -0400
Received: from web50702.mail.yahoo.com (web50702.mail.yahoo.com
	[206.190.38.100])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6EFFTif005709
	for <linux-lvm@redhat.com>; Fri, 14 Jul 2006 11:15:29 -0400
Message-ID: <20060714151524.37351.qmail@web50702.mail.yahoo.com>
Date: Fri, 14 Jul 2006 08:15:23 -0700 (PDT)
From: John Koshi <jkoshi@yahoo.com>
Subject: Re: [linux-lvm] LVM question on move and resize
In-Reply-To: <44B77938.9020601@conterra.de>
MIME-Version: 1.0
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


Hi Dieter,

Thanks for your e-mail. I did go through the steps as
mentioned, including the resize2fs after the fsck, and
everything worked fine. The one other thing I had to do
was to initially create the new partition in the empty
space, first as ext2, and then move to type 8e/LVM.

You're right about the W95 extended partition. It is
pretty ugly! But I had to consider the /dev/hda2 Linux
partition at the end of the disk, which handles the
quick-play feature of the HP laptop. I did not want to
lose that in the process of adding Linux/dual-boot, so
I went with Partition Magic for this.

Actually I do have a large USB disk (Seagate 160GB)
and had considered using it during this expansion of=20
the Linux installation. I'm interested in seeing your
solution, in this case.

Thanks again.

regards,
John



--- Dieter St=EF=BF=BDken <stueken@conterra.de> wrote:

> John Koshi wrote:
> > I assume the next steps will be (from a rescue CD):
> >=20
> > 1) Use fdisk to format the unused 25 Gb space in the
> >    extended partition, to a new type 8E partition.
> > 2) Use pvcreate to create a new physical vol there.
> > 3) Use vgextend to extend VolGroup00 to include the
> >    new physical volume.
> > 4) Use lvextend to extend LogVol00 by the XX Gb.
> > 5) Do a file system check of LogVol00.
> >=20
> > Does this look right? Am I missing any steps?
>=20
> after you grow LogVol00 you also have to expand the
> ext2/ext2 filesystem inside (step 4a)
>=20
> resize2fs -p /dev/mapper/VolGroup00-LogVol00
>=20
> This actually does the real work. resize2fs recommends
> to perform an fsck before. If you are in doubt, do it,
> else you may skip this using "resize2fs -f -p".
>=20
> You don't have to supply a size, resize2fs will find
> the current size of the extended volume auomatically
>=20
> Will you perform this while booting from a rescue CD?
> If this is your root filesystem you have to, anyway.
> Else you possibly have to reboot, after changing the
> partition table, because it may be locked by the system
> while it is in use.
>=20
> Tip: you may rename your VG and your LVs to get expressive
> names like "/dev/mapper/Sonota-Root". Imo this is less=20
> error prone than working with technical names like "LogVol42".
>=20
> > Disk /dev/hda: 80.0 GB, 80026361856 bytes
> > 255 heads, 63 sectors/track, 9729 cylinders
> > Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
> >    Device Boot      Start         End      Blocks   Id  System
> > /dev/hda1   *           1        5201    41777001    7  HPFS/NTFS
> > /dev/hda2            9704        9729      208845   88  Linux plaintext
> > /dev/hda3            5202        5214      104422+  83  Linux
> > /dev/hda4            5215        9703    36057892+   f  W95 Ext'd (LBA)
> > /dev/hda5            8425        9703    10273536   8e  Linux LVM
> > Partition table entries are not in disk order
>=20
> So you end up with an extended partition containing your LVM.
> Even if this works, it is an ugly solution. This Win95 extended
> partition hack is something like a poor-mans LVM with partition
> magic as its management tool.
> =20
> It would be much better, to REPLACE the extended partition by LVM.
> Unfortunately I don't see any easy migration path without an external
> disk. If you have any spare disk, to temporary hold the 8.2Gb root
> volume, I may point out an other solution.
>=20
> Dieter.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
