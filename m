Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j36KOEO05904
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 16:24:14 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j36KO74G021933
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 16:24:07 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1DJH0k-00082e-VK
	for linux-lvm@redhat.com; Wed, 06 Apr 2005 22:20:27 +0200
Received: from adsl-67-119-114-25.dsl.snfc21.pacbell.net ([67.119.114.25])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 06 Apr 2005 22:20:26 +0200
Received: from ian.east by adsl-67-119-114-25.dsl.snfc21.pacbell.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 06 Apr 2005 22:20:26 +0200
From: "Ian East" <ian.east@gmail.com>
Date: Wed, 6 Apr 2005 12:15:10 -0700
Message-ID: <d31cgb$kej$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] LVM snapshot error
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Can anyone help me solve the follwoing error when trying to create an
LVM1 snapshot in Debian Sarge.

dbr01:~# lvcreate -L 40G -s -n snap /dev/vg0/lv0
lvcreate -- WARNING: the snapshot will be automatically disabled once
it gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for
"/dev/vg0/snap"
lvcreate -- ERROR "Cannot allocate memory" creating VGDA for
"/dev/vg0/snap" in kernel

Thanks for any help.
