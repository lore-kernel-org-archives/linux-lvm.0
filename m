Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7388dnW019246
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 04:08:39 -0400
Received: from web26614.mail.ukl.yahoo.com (web26614.mail.ukl.yahoo.com
	[217.146.177.66])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id k7388TQ8030100
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 04:08:30 -0400
Message-ID: <20060803080824.48652.qmail@web26614.mail.ukl.yahoo.com>
Date: Thu, 3 Aug 2006 08:08:24 +0000 (GMT)
From: ramsis farhat <sismar2002@yahoo.fr>
In-Reply-To: <44CC94C8.1080306@conterra.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] booting on a new root partition
Reply-To: ramsis farhat <sismar2002@yahoo.fr>,
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
To: linux-lvm@redhat.com, linux-lvm@sistina.com

Hello every body.
=20
think you Dieter St=EF=BF=BDken for you response.
I'm still working on a virtual machine with Red Hat Entreprise 3. So don't =
worry if I break it
I'm working with 2 hard disks of 8GB. The first is partitioned like this
sda1 boot (101 MB)
sda2 /      (7400MB)
sda3 swap (573 MB)
 =20
I followed exactly the steps in the LVM-HOWTO excepted that I added the sec=
ond Hard disk sdb.
I made an lvm partion sdb1 and I put all the root data (size 6GB) on it. Th=
e new partition is /dev/vg00/root

Then, I had a problem : when I type "lvmcreate_initrd", the RAM disk can't =
be created because of the lack of space ( I'm not sure of that).
=20
I used "lvmcreate_initrd  -D", the instruction returns 0 ( it means ok). Bu=
t when I reboot, there is kernel panic.
so if I use initrd, i don't know if i need that!!!!!!!
=20
Think you for helping me
