Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9SECBV20280
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 10:12:11 -0400
Received: from voodoo1.evva.com (2-21-164-213.customer.coltnet.at
	[213.164.21.2] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j9SECA2m017057
	for <linux-lvm@redhat.com>; Fri, 28 Oct 2005 10:12:10 -0400
Received: from [172.16.16.1] ([172.16.16.1])
	by localhost (mail1 [172.16.0.4]) (amavisd-new, port 10024)
	with ESMTP id 05558-14 for <linux-lvm@redhat.com>;
	Fri, 28 Oct 2005 16:12:01 +0200 (CEST)
Message-ID: <436231B1.2080808@evva.com>
Date: Fri, 28 Oct 2005 16:12:01 +0200
From: Johannes Ullmann <j.ullmann@evva.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problem with lvm2 and softwareraid
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
To: linux-lvm@redhat.com

Hello!

I'm building a backup to disk system and i have strange problem with lvm
on top of 2 software raid 5 devices.
Each SW Raid-5 has 7x400GB HDDs (=3D2,4TB). On top of these two SW Raid
devices I created one big LV with 4,8TB.
I use Reiserfs as filesystem. I worked fine while the disk usage was
below 1,5TB, above that, the Filesystem was destroyed. I tried the same
with ext3 and had the same results.  So I't not the Filesystem. I also
checked the Softwareraid and the LV for any Problems but i haven't found
anything.
After reading many Mails/howtos/man-pages I quess that LVM can't handle
PV's which are larger than 2TB is this correct?
I haven't found anything in the documentation about the maximum PV size.

thanks for any help.

My setup looks like this:
Debian testing 2.6.12-1-686-smp
lvm2  2.01.04-5
mdadm  1.12.0-1

14x400GB SATA Hdds on two 3-Ware controllers.
mdadm --create /dev/md0 --chunk=3D64 --level=3Draid5 --raid-devices=3D7
/dev/sd[bcdefgh]1
mdadm --create /dev/md1 --chunk=3D64 --level=3Draid5 --raid-devices=3D7
/dev/sd[ijklmno]1

pvcreate /dev/md0 (Softwareraid controller1)
pvcreate /dev/md1 (Softwareraid controller2)
vgcreate vg0 --physicalextentsize 16M /dev/md0 /dev/md1
lvcreate --stripes 2 --stripesize 64 -l <extends> --name backup vg0

I get this Filesystem errors:
Oct 21 15:30:02 backup1 kernel: ReiserFS: warning: is_tree_node: node
level 42225 does not match to the expected one 2
Oct 21 15:30:02 backup1 kernel: ReiserFS: dm-0: warning: vs-5150:
search_by_key: invalid format found in block 73668. Fsck?
Oct 21 15:30:02 backup1 kernel: ReiserFS: dm-0: warning: zam-7001: io
error in reiserfs_find_entry

--=20
Johannes Ullmann
IT-Services

EVVA-Werk Gesellschaft m.b.H. & Co. KG
Wienerbergstra=EF=BF=BDe 59-65
A-1120 Wien
Tel.: +43-1-811 65 / 505
Fax: +43-1-811 65 / 16
e-mail: j.ullmann at evva.com
homepage: http://www.evva.com
