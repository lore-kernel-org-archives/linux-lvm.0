Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j149nRO13637
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 04:49:27 -0500
Received: from mail.upcore.net (postfix@upcore.net [195.84.97.50])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j149nLAA018501
	for <linux-lvm@redhat.com>; Fri, 4 Feb 2005 04:49:21 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.upcore.net (Postfix) with ESMTP id 920C4131FD
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 10:49:19 +0100 (CET)
Received: from sauron.int.tixit.se (b118.broadband.quicknet.se [217.78.17.118])
	by mail.upcore.net (Postfix) with ESMTP id 03629128EC
	for <linux-lvm@redhat.com>; Fri,  4 Feb 2005 10:49:09 +0100 (CET)
From: Magnus Nilsson <magnus@upcore.net>
Date: Fri, 04 Feb 2005 10:49:15 +0100
Message-Id: <1107510555.14978.30.camel@sauron.int.tixit.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing faulty disk from LVM2
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I've got an 8 disk VG where one PV is dying.

Through pvmove'ing parts of the PV I've narrowed it down to PE #14858 of
38154 4MB PE's. All the other PE's on that PV have been moved.
The machine hard-locks every time that PE is accessed, so I can't
activate the VG with 'vgchange -ay vg00'. It also seems that I have an
unfinished pvmove of that last PE that I can't abort since I can't
activate the VG.

According to the lvm manpage I've tried using 'vgchange -P -ay vg00'
after creating /dev/ioerror using dmsetup. That lets me activate the VG
without having the faulty PV plugged in, but it still doesn't let me
mount the LV's complaining that it can't find the superblock.
I did 'echo "0 99999999999 error" >/foo && dmsetup ioerror /foo && ln
-s /dev/mapper/ioerror /dev/ioerror'

Nevertheless, the manpage says that activating with -P will only let me
read, but I don't have the required ~1TB of space to do a backup.

Is there any way of just skipping that last PE and let me repair the
filesystem afterwards? Perhaps by vgcfgrestore'ing an edited backup,
excluding the broken PV?
Alternatively I could remove another PV from the VG, create a new VG and
copy data over in chunks (I've added a new disk so I have free space in
the VG).

Sadly I can't provide any command output since both /usr and /var is on
the VG. I'm using Linux 2.6.10 with device-mapper 1.00.21 and LVM
2.00.33.

//Magnus
