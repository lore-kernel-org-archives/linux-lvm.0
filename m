Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4NALvM9014562
	for <linux-lvm@redhat.com>; Tue, 23 May 2006 06:21:57 -0400
Received: from amsfep18-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4NALqLR022844
	for <linux-lvm@redhat.com>; Tue, 23 May 2006 06:21:52 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep18-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060523102146.YXJL1370.amsfep18-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Tue, 23 May 2006 12:21:46 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4NALjLj027525
	for <linux-lvm@redhat.com>; Tue, 23 May 2006 12:21:45 +0200
Message-ID: <4472E235.6020707@neuroweave.nl>
Date: Tue, 23 May 2006 12:21:41 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] booting from an LV
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

I have one question.
Is it possible with grub to use a logical volume as boot partition?
(e.g.:partition: /dev/VG01/lvol0.
Entry in grub.conf would then be:
title Fedora Core (xxx..)
    root hd(0,5) # partition on which VG01 resides
    kernel /dev/VG01/lvol0/vmlinuz-xxx... ro root=/dev/VG01/lvol1
    initrd /dev/VG01/lvol0/initrd-xxx....img
I think I read somewhere that grub is not happy with this but I'm not sure,
Joep
