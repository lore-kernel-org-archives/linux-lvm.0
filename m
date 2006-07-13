Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DIMZB7010787
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 14:22:35 -0400
Received: from web50714.mail.yahoo.com (web50714.mail.yahoo.com
	[206.190.39.116])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6DIMWxB022872
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 14:22:33 -0400
Message-ID: <20060713182227.8697.qmail@web50714.mail.yahoo.com>
Date: Thu, 13 Jul 2006 11:22:27 -0700 (PDT)
From: John Koshi <jkoshi@yahoo.com>
Subject: Re: [linux-lvm] LVM question on move and resize
In-Reply-To: <44B605D0.7070904@conterra.de>
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

Dieter,

Thanks very much for your prompt reply.

I went ahead and committed the changes using
Partition Magic, as described earler, and now
have the following:

Note: the /dev/hda2 at the very end of the disk
      is the instant DVD play (Linux) partition
      that came with the laptop's XP install.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[root@sonata /]# fdisk -l
omitting empty partition (5)
Disk /dev/hda: 80.0 GB, 80026361856 bytes
255 heads, 63 sectors/track, 9729 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes
   Device Boot      Start         End      Blocks   Id  System
/dev/hda1   *           1        5201    41777001    7  HPFS/NTFS
/dev/hda2            9704        9729      208845   88  Linux plaintext
/dev/hda3            5202        5214      104422+  83  Linux
/dev/hda4            5215        9703    36057892+   f  W95 Ext'd (LBA)
/dev/hda5            8425        9703    10273536   8e  Linux LVM
Partition table entries are not in disk order
---------------------------------------------------------------------------=
--
[root@sonata /]# df -lH
Filesystem             Size   Used  Avail Use% Mounted on
/dev/mapper/VolGroup00-LogVol00
                       8.2G   5.7G   2.1G  74% /
/dev/hda3              104M    13M    86M  14% /boot
/dev/shm               526M      0   526M   0% /dev/shm
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Both Linux and Windows boot up correctly, without any
further changes.=20

I assume the next steps will be (from a rescue CD):

1) Use fdisk to format the unused 25 Gb space in the
   extended partition, to a new type 8E partition.
2) Use pvcreate to create a new physical vol there.
3) Use vgextend to extend VolGroup00 to include the
   new physical volume.
4) Use lvextend to extend LogVol00 by the XX Gb.
5) Do a file system check of LogVol00.

Does this look right? Am I missing any steps?

Thanks again for your help.

regards,
John



--- Dieter St=EF=BF=BDken <stueken@conterra.de> wrote:

> John Koshi wrote:
> > Hello,
> >=20
> > I have the following setup:
> >=20
> > HP dv1000 laptop with an 80G hard disk laid out as follows:
> > 1)70Gb NTFS, WinXP primary
> > 2)100Mb ext3 primary Fedora 4 /boot
> > 3)10Gb Extd primary, containing logical(8E) LVM Fedora 4 root
> >=20
> > Since the Linux root is getting full, I want to expand it,
> > by reducing the NTFS partition, and moving all the Linux
> > partitions down, and then expand the LVM root outwards.
> >=20
> > With Partition Magic 8.0, I can resize the NTFS disk, and
> > move the ext3 boot partition (after removing it's features
> > resize_inode, dir_index, and ext_attr using e2fsprogs),
> > and resize the Extended partition to the left as needed.
> >=20
> > The problem now is how to move and expand the LVM root as
> > mentioned above. Partition Magic and Qtparted can't do it.
> >=20
> > Is it possible to do this? If so, what are the steps?
>=20
> can you send us a "fdisk -l" of your partition layout?
>=20
> Why moving your LVM?
>=20
> After you shrunk the leading partitions, you should get a gap
> below your LVM partition. Can you fit a new partition into this gap?
> There after you format this new partition as an additional PV
> using "pvcreate" and extend your VG using vgextend.
>=20
> Now your VG extends over both partitions, and you may use the new
> space to extend any LV within your VG. LVM does not care about
> how the available disk spaces (its PVs) is organized nor has it
> to be contiguous. It may even spread over several disks.
>=20
> This is the reason why LVM is much more flexible than DOS partitions
> and Partition Magic will ever be.
>=20
> Dieter.
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20
