Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KFg5p08067
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:42:05 -0400
Received: from grivedraine.passereaux.jmsp.net
	(grivedraine.passereaux.jmsp.net [212.23.162.45])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3KFg4Fe002096
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:42:05 -0400
Received: from hirondelle.passereaux.as.i2 ([192.168.160.3])
	by grivedraine.passereaux.jmsp.net (8.12.11/8.12.11) with ESMTP id
	i3KFfvkQ009977
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:41:57 +0200
Received: from hirondelle.passereaux.as.i2 (localhost [127.0.0.1])
	by hirondelle.passereaux.as.i2 (8.11.7/8.11.6) with ESMTP id
	i3KFf3509991
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:41:03 +0200
Received: from zoe-00.melanie.i2 (zoe-00.melanie.i2 [192.168.251.100])
	by hirondelle.passereaux.as.i2 (8.11.7/8.11.6) with ESMTP id
	i3KFf3I09968
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:41:03 +0200
Received: from localhost (localhost [127.0.0.1])
	by amelie-relais01-x.melanie2.test.i2 (Postfix) with ESMTP id
	D645E17351
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 17:41:56 +0200 (CEST)
Received: from amelie-relais01-x.melanie2.test.i2 ([127.0.0.1])
	by localhost (amelie-relais01-x [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 09240-08 for <linux-lvm@redhat.com>;
	Tue, 20 Apr 2004 17:41:54 +0200 (CEST)
Date: Tue, 20 Apr 2004 17:41:54 +0200
From: "COMBES Julien (SSII) (VRAIE MELANIE),
	CETE Lyon/DI/ET/PAMELA" <julien.combes@i-carre.net>
Message-Id: <20040420174154.7565e081.julien.combes@i-carre.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Ext3, 2.4.26 and lvm snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello,

I have some trouble with lvm snapshot with a logical volume formated with
ext3 file system on a linux 2.4.26. This logical volume is active and
mounted. The snapshot is created correctly (with a command like this for
example : lvcreate -L 100M -s -n lvsnap0 /dev/vg01/lv01). But when I try
to mount it, I have this error :
   mount: wrong fs type, bad option, bad superblock on
   /dev/vgt01/tsnap01, or too many mounted file systems
If I format this logical volume in ext2, I can use snapshot without
problem.

I searched on internet and I found some information but it let me
confused. I found many informations about a VFS-patch which seems to be
necessary, but I don't found this patch for a linux kernel 2.4.26 (I only
found it for version up to 2.4.22).

So I wonder if this patch is always necessary ?
Do you have some links which can help me ?

Regards,
Julien
P.S: Sorry for my english which isn't very good.
