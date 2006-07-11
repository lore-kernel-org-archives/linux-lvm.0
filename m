Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BIAglA005643
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:10:42 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BIAXWb028384
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:10:34 -0400
Subject: Re: [linux-lvm] Copying LVM from one system to another
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <44B3E470.90404@conterra.de>
References: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF39D0@gimli.xb.local>
	<1152551925.8360.52.camel@localhost.localdomain>
	<44B3E470.90404@conterra.de>
Date: Tue, 11 Jul 2006 14:10:18 -0400
Message-Id: <1152641418.2787.106.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Dieter =?ISO-8859-1?Q?St=FCken?= <stueken@conterra.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

yes, you are right for migrating the content from one disk to another
disk.

but in his case, he want to migrate to another system, with same cpu,
ram, disk,...

that is why i think clone is ok.

Ming

On Tue, 2006-07-11 at 19:48 +0200, Dieter St=C3=BCken wrote:
> Ming Zhang wrote:
> > if HW is the same, why not use ghost or alike software to do a clone?
>=20
> Don't "clone" the LVM PVs if you ever want to connect both disks simultan=
eously.
> For normal partitions this is fine, as those are identified by the device
> name. So you can easily distinguish /dev/hda1 from /dev/hdc1.
>=20
> LVM however identifies the different VG/LV/PV by its content, regardless =
of
> where the disks are connected. If you connect your LVM disk to a different
> cable or controller, don't worry, it will be found automatically. If two =
disks,
> however, look exactly the same, LVM gets confused.=20
>=20
> Instead you should connect both disk:
>=20
> arrange booting from <newdisk>,
> lvm from <olddisk> should still work, even if connected differently.
>=20
> pvcreate <new disk>
> vgextend <new disk>
> pvmove <olddisk>
> vgreduce <olddisk>
>=20
> to migrate all LVM content to the new disk.
>=20
> Dieter.
