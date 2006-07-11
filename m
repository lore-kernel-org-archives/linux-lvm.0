Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BI3sdX020057
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:03:54 -0400
Received: from smtp3.marviq.com (smtp3.marviq.com [80.248.35.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BI3j2W026771
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 14:03:46 -0400
Received: from owa.xb.nl (unknown [10.0.56.10])
	by smtp3.marviq.com (Postfix) with ESMTP id BDE9F94223
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 20:03:41 +0200 (CEST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Copying LVM from one system to another
Date: Tue, 11 Jul 2006 20:03:36 +0200
Message-ID: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF3C0B@gimli.xb.local>
In-Reply-To: <44B3E470.90404@conterra.de>
From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
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

Thanks very much, but the problem is I want be able to restore my LVM files=
ystems from a backup. This is why I came with the idea of booting the PC I =
want to restore from a USB stick. The idea is the stick has a copy of the b=
ackup client. The LVM filesystems are mounted under /restore and I restore =
all the data to /restore.

How do I tell LVM the data has moved? I've experimented using this method b=
ut I noticed devmapper complains when I boot the PC from the newly restored=
 data.

Cheers

Shaun

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of Dieter St=EF=BF=BDken
Sent: dinsdag 11 juli 2006 19:49
To: mingz@ele.uri.edu; LVM general discussion and development
Subject: Re: [linux-lvm] Copying LVM from one system to another

Ming Zhang wrote:
> if HW is the same, why not use ghost or alike software to do a clone?

Don't "clone" the LVM PVs if you ever want to connect both disks simultaneo=
usly.
For normal partitions this is fine, as those are identified by the device
name. So you can easily distinguish /dev/hda1 from /dev/hdc1.

LVM however identifies the different VG/LV/PV by its content, regardless of
where the disks are connected. If you connect your LVM disk to a different
cable or controller, don't worry, it will be found automatically. If two di=
sks,
however, look exactly the same, LVM gets confused.=20

Instead you should connect both disk:

arrange booting from <newdisk>,
lvm from <olddisk> should still work, even if connected differently.

pvcreate <new disk>
vgextend <new disk>
pvmove <olddisk>
vgreduce <olddisk>

to migrate all LVM content to the new disk.

Dieter.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/




Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is o=
p http://www.xb.nl/disclaimer.html
