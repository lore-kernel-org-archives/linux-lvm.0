Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l938kuMa018049
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 04:46:56 -0400
Received: from bacterio.es.clara.net (mail.es.clara.net [80.67.96.90])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l938knl5029720
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 04:46:50 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bacterio.es.clara.net (Postfix) with ESMTP id C78F1124C01A
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 10:46:48 +0200 (CEST)
Received: from bacterio.es.clara.net ([127.0.0.1])
	by localhost (bacterio.es.clara.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 08219-01-7 for <linux-lvm@redhat.com>;
	Wed, 3 Oct 2007 10:46:40 +0200 (CEST)
Received: from [192.168.92.83] (ga-bcn-ar4-lpb-1.router.es.clara.net
	[80.67.96.65])
	by bacterio.es.clara.net (Postfix) with ESMTP id D200E124C018
	for <linux-lvm@redhat.com>; Wed,  3 Oct 2007 10:46:40 +0200 (CEST)
Message-ID: <4703572F.8020604@es.clara.net>
Date: Wed, 03 Oct 2007 10:47:43 +0200
From: =?ISO-8859-1?Q?Marc_Patino_G=F3mez?= <mpatino@es.clara.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Backuping "special" snapshots
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi  list,

I am searching a way to backup a "special" logical volume. This special 
lv doesn't contains a filesystem, it contains a hole image disk of a 
running server (MBR,Partition Table, Partitions and filesystems), in 
fact it is a VBD (Virtual Block Device) of a HVM Xen Guest.

I want to be able to make the backup without shutting down the Virtual 
Machine, but the traditional way :

- make a snapshot
- mount snapshot
- backup the snapshots
- umount snapshot
- remove snapshot

is not suitable for this kind of logical volumes.

I search some information about it, but the only clue is:

fdisk -l -u /dev/vg00/lv00

after looking the partition table, mount a partition with mount with the 
corresponding offset parameter...

Exists a way to do this using a snapshot? Any other advice to backup 
this kind of logical volume?

Many thanks in advance,

Cheers,

Marc
