Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9JEJopo025154
	for <linux-lvm@redhat.com>; Sun, 19 Oct 2008 10:19:50 -0400
Received: from mtaout1.012.net.il (mtaout1.012.net.il [84.95.2.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9JEJcBQ020194
	for <linux-lvm@redhat.com>; Sun, 19 Oct 2008 10:19:39 -0400
Received: from davidb ([77.125.79.81]) by i-mtaout1.012.net.il (HyperSendmail
	v2007.08) with ESMTPA id <0K8Z004KFP739Z81@i-mtaout1.012.net.il> for
	linux-lvm@redhat.com; Sun, 19 Oct 2008 16:21:04 +0200 (IST)
Date: Sun, 19 Oct 2008 16:19:25 +0200
From: David Baron <d_baron@012.net.il>
Message-id: <005e01c931f5$b101bf00$0101c80a@davidb>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] HELP!
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

Set up lvm, a breeze. NO lv root so should boot with a normal lilo.
I was able to boot mounting the lvm volumes to the old failing disk.
I cannot boot the new disk.

Configuration
1 boot-ext3
2 root-ext3
3 swap
5 vfat
6 lvm volumes

What type of lilo do I need for this. I ran it with
boot /dev/hdc1
root  /dev/hdc2

All I get is the bootmagic text "preparing machine to start linux", then
nothing.

I am typing this in (gulp) window 98 (at least that still works--somewhat).

The boot record of the old failing disk is messed so I canot use that
knoppix 3.* will not allow me to chroot (its kernel too old)
knoppix 5.01 will, but will not let me run lilo. The device mapper is too
old for the (Sid) system.

Please reply to my email as well as the list.
Thank for any help
