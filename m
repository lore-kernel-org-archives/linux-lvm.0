Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4U8bjO00519
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 04:37:45 -0400
Received: from dgate2.fujitsu-siemens.com (dgate2.fujitsu-siemens.com
	[217.115.66.36])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4U8bcTS005144
	for <linux-lvm@redhat.com>; Mon, 30 May 2005 04:37:39 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 30 May 2005 10:36:42 +0200
Message-ID: <ADC8F7AA316AF74EBEC87590CCDA6162051489DB@PDBEX02E.pdb.fsc.net>
From: <Dirk.Laurenz@fujitsu-siemens.com>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problems with lvm2 / devive mapper
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
To: suse-linux-e@lists.suse.com, linux-lvm@redhat.com
Cc: Mathias.Lutz@fujitsu-siemens.com, Christopher.Schnirch@fujitsu-siemens.com, Dieter.Speckels@fujitsu-siemens.com

Hello everbody,

i'm having problems setting up lvm2.

creating a a new vg works fine:

	pvcreate /dev/sdb1 /dev/sdc1
	vgcreate -s 64M vgEQ51fs /dev/sdc1 /dev/sdb1

but lvcreate=20

	lvcreate -n lvsapdbQ51sapdata -L 100G vgEQ51fs

rises this dmesg output:

	hgesst40:~ # dmesg | tail -n 10
	eth0: no IPv6 routers present
	bond0: no IPv6 routers present
	mtrr: type mismatch for d0000000,1000000 old: uncachable new: write-combin=
ing
	device-mapper: : dm-linear: Device lookup failed
	device-mapper: error adding target to table
	device-mapper: : dm-linear: Device lookup failed
	device-mapper: error adding target to table

doing an mkfs.xfs produces this failure:

	hgesst40:~ # mkfs.xfs /dev/vgEQ51fs/lvsapdbQ51sapdata
	can't get size of data subvolume
	Usage: mkfs.xfs
	/* blocksize */         [-b log=3Dn|size=3Dnum]
	/* data subvol */       [-d agcount=3Dn,agsize=3Dn,file,name=3Dxxx,size=3D=
num,
                            (sunit=3Dvalue,swidth=3Dvalue|su=3Dnum,sw=3Dnum=
),=09
	[...]

but lvscan find's the volume:
	hgesst40:~ # lvscan
  		ACTIVE            '/dev/vgEQ51fs/lvsapdbQ51sapdata' [100.00 GB] next fr=
ee (default)
  		ACTIVE            '/dev/vgOS/lvusrfs' [3.00 GB] next free (default)
	[...]

Here're some info's on the system:
=09
	SuSE Linux Enterprise Server 9 (x86_64)
	Service Pack 1
	device-mapper-1.00.19-2.2
	lvm2-2.00.15-0.8
	kernel-smp-2.6.5-7.139
	kernel-smp-2.6.5-7.147
	Linux hgesst40 2.6.5-7.139-smp #1 SMP Fri Jan 14 15:41:33 UTC 2005 x86_64 =
x86_64 x86_64 GNU/Linux

The kernel -139 is running because it's the latest sap certified kernel.

However, creating an ext2 fs on /dev/sdb1 works fine.

	hgesst40:~ # mke2fs /dev/sdb1
	mke2fs 1.34 (25-Jul-2003)
	Filesystem label=3D
	OS type: Linux
	Block size=3D4096 (log=3D2)
	Fragment size=3D4096 (log=3D2)
	26214400 inodes, 52428119 blocks
	2621405 blocks (5.00%) reserved for the super user
	First data block=3D0
	1600 block groups
	32768 blocks per group, 32768 fragments per group
	16384 inodes per group
	Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736, 1605632, 2654=
208,
        4096000, 7962624, 11239424, 20480000, 23887872

	Writing inode tables: done
	Writing superblocks and filesystem accounting information:=20
	done

	This filesystem will be automatically checked every 27 mounts or
	180 days, whichever comes first.  Use tune2fs -c or -i to override.

has anyone an idea, how to solve this issue?

Mit freundlichem Gru=EF=BF=BD,



Dirk Laurenz
Systems Engineer=09

Fujitsu Siemens Computers
S CE DE SE PS N/O
Sales Central Europe Deutschland=20
Professional Service Nord / Ost

Hildesheimer Strasse 25
30880 Laatzen
Germany

Telephone:	+49 (511) 84 89 - 18 08
Telefax:	+49 (511) 84 89 - 25 18 08
Mobile:	+49 (170) 22 10 781
Email:	mailto:dirk.laurenz@fujitsu-siemens.com
Internet:	http://www.fujitsu-siemens.com
            http://www.fujitsu-siemens.de/services/index.html
***************************************************************************=
****************************************
=20
