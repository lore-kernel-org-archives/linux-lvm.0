Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0QBFZ125260
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 06:15:35 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0QBFT1e000931
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 06:15:29 -0500
Received: by zproxy.gmail.com with SMTP id n29so325937nzf
	for <linux-lvm@redhat.com>; Thu, 26 Jan 2006 03:15:29 -0800 (PST)
Message-ID: <5485940d0601260315u58bfca5dlbe9db964e25bdcdd@mail.gmail.com>
Date: Thu, 26 Jan 2006 11:15:28 +0000
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problems with LVM
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

Hello,

I've been trying to compile Linux 2.6.14-3 on my RHEL-AS-4 instalation
and I can't seem to get it to boot. I've /, /home & /tmp as LVs of
only one VG (surprisingly called vg). My hdds are all IDE and the
distro boots with the generic kernel normally. However, with my
compiled kernel and the initrd image (the I created afterwards
installing the kernel's modules), I can't boot.

The error is the following:

Mounting root file system
mount : error 6 mounting ext3
mount: error 2 mounting none
switching to new root
switchroot: mount failed 22
umount /initrd/dev failed: 2

I am sure you know how to fix, I just can't seem to though. I do have
ext3 as module right now, but I did tests with ext3 built-in, so I
don't think that all I need is to have ext3 built-in  to fix my
problem as I was able to find online through google.

Thanks very much for any sugestions/solutions!
Pierre
