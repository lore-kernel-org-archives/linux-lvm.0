Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8BEWBH4027258
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 10:32:11 -0400
Received: from smtp21.orange.fr ([80.12.242.48])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8BEVtGs012193
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 10:31:55 -0400
Received: from smtp21.orange.fr (mwinf2118 [10.232.7.118])
	by mwinf2115.orange.fr (SMTP Server) with ESMTP id 63B4B1C00F27
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:39:39 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2118.orange.fr (SMTP Server) with ESMTP id C227D1C0005F
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:39:36 +0200 (CEST)
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2118.orange.fr (SMTP Server) with ESMTP id B56AB1C0004A
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:39:36 +0200 (CEST)
Received: from gillibert.homelinux.net
	(ACaen-251-1-56-139.w83-115.abo.wanadoo.fr [83.115.198.139])
	by mwinf2118.orange.fr (SMTP Server) with ESMTP id 384AC1C0005F
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:39:36 +0200 (CEST)
Received: from fixlaptop ([192.168.1.209]
	helo=fixlaptop.gillibert.homelinux.net)
	by gillibert.homelinux.net with esmtp (Exim 4.69)
	(envelope-from <rcvxdg@gmail.com>) id 1Mm6Lf-0004wL-Ex
	for linux-lvm@redhat.com; Fri, 11 Sep 2009 15:39:35 +0200
Date: Fri, 11 Sep 2009 15:39:34 +0200
From: =?UTF-8?B?QW5kcsOp?= Gillibert <rcvxdg@gmail.com>
Subject: Re: [linux-lvm] Snapshots
Message-ID: <20090911153934.58602d31@fixlaptop.gillibert.homelinux.net>
In-Reply-To: <20090910152510.20691nc1e7608sm8@www.destar.net>
References: <20090910152510.20691nc1e7608sm8@www.destar.net>
Mime-Version: 1.0
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
To: linux-lvm@redhat.com

jonr@destar.net wrote:
> Hello List,
>=20
> I don't get it!
>=20
> I have a xen system that has a DomU of FC11 with a 20GB LV for the =20
> disk. I created a snapshot using this command:
>=20
> lvcreate -L +10G -s -n s_cgate-be1 /dev/xenvg/cgate-be1
>=20
> This is the output of an 'lvdisplay' of the snapshot LV:
>=20
> lvdisplay /dev/xenvg/s_cgate-be1
>    --- Logical volume ---
>    LV Name                /dev/xenvg/s_cgate-be1
>    VG Name                xenvg
>    LV UUID                7c1kEs-xYoO-Qxem-2E2M-hlee-pc4Q-zm6TZ5
>    LV Write Access        read/write
>    LV snapshot status     active destination for /dev/xenvg/cgate-be1
>    LV Status              available
>    # open                 2
>    LV Size                20.00 GB
>    Current LE             5120
>    COW-table size         10.00 GB
>    COW-table LE           2560
>    Allocated to snapshot  0.11%
>    Snapshot chunk size    4.00 KB
>    Segments               1
>    Allocation             inherit
>    Read ahead sectors     auto
>    - currently set to     256
>    Block device           253:15
>=20
> I then shutdown the DomU and pointed the 'Disk...' line in the config =20
> file for the DomU to the snapshot. It boots.
>=20
> OK, I must be missing the simple answer because I cannot seem to grasp =20
> the concept of snapshots.
>=20
>=20
> 1. How can I have a 20GB LV as a disk and the snapshot be 10GB and =20
> boot the entire OS?
>=20
That's because the snapshot uses these 10GB as a "COW-table". i.e. A "Copy =
On Write table".
When the snapshot is first created, no copy is performed. All the blocks of=
 the snapshot are identical to the blocks of the original LV. Accessing the=
 snapshot or original LV access the same block.
Then, if you modify some data in either the original LV or the snapshot LV,=
 an "exception list" listing data chunks that are different in the snapshot=
 LV than in the original LV, is created.
When reading a snapshot LV block, LVM first looks at the "exception list". =
If the chunk accessed is the in the "exception list", the chunk data in the=
 exception list is returned. If the chunk isn't in the exception list, the =
chunk data is extracted from the original volume.
When writing a snapshot LV block, it's written in a chunk of the exception =
list, either existing, or created at this time.
When writing a chunk in the original volume, it's first copied in the "exce=
ption list", and then, modified in the original volume.

The chunk size is specified with the --chunksize parameter (4k to 512k) to =
lvcreate(8), when creating a snapshot.

If ever you've so many exceptions that the snapshot volume overflows, it's =
dropped.
Consequently, you must take care of allocating enough space in snapshots. T=
his space is the size of the data that may be modified in the snapshot or o=
riginal volume.
Snapshots are fine for short lived snapshots (e.g. when backing up) but are=
n't designed to cope with heavy modifications of the entire file system.

> 2. Can I create a DomU and then snapshot the LV and use the snapshot =20
> to create other DomU's?

I'm not a Xen user. Sorry, I don't know.
Here, Google may help:
<http://www.google.com/search?rls=3Den&hl=3Den&source=3Dhp&q=3Dxen+device+m=
apper>

>=20
> 3. If 2 is yes, would I want to continue using the snapshot as the =20
> disk or is there something else that should be done, i.e. dd the drive =20
> to a new LV?
>=20
> In the 'lvdisplay' of the snapshot I have these extra lines:
>    LV snapshot status     active destination for /dev/xenvg/cgate-be1
>    # open                 2
>    COW-table size         10.00 GB
>    COW-table LE           2560
>    Allocated to snapshot  0.11%
>    Snapshot chunk size    4.00 KB
>=20
> 4. Does the 0.11% mean that the 10GB snapshot file is only using .11% =20
> of the 10GB LV?
>=20
It means that the internal LVM data structure + the exception chunks are us=
ing 0.11% of the 10GB "COW-table partition".

Create snapshot, dd(1), delete snapshot is a way to create a "forked" copy =
of the original volume.
That may, or may not be what you want. If you intend to share much data wit=
h the original volume, a simple snapshot may be the way to go. If a small o=
r near-zero amount of data is to be shared, in that case, snapshotting won'=
t save data space, but may incur performance penalties (see <http://www.nik=
hef.nl/~dennisvd/lvmcrap.html>), and so, my advice is to create snapshot, d=
d(1), and delete snapshot.

I hope it helps.
--=20
Andr=C3=A9 Gillibert
