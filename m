Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBHHi0r31240
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2004 12:44:00 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBHHhxCn027397
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2004 12:43:59 -0500
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CfM90-0007WA-00
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2004 18:43:58 +0100
Received: from tesuji.nac.uci.edu ([128.200.34.35])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2004 18:43:58 +0100
Received: from strombrg by tesuji.nac.uci.edu with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 17 Dec 2004 18:43:58 +0100
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
Date: Fri, 17 Dec 2004 09:35:54 -0800
Message-ID: <pan.2004.12.17.17.35.52.98729@dcs.nac.uci.edu>
References: <1102967092.3784.192.camel@tesuji.nac.uci.edu>
	<1102982038.3784.224.camel@tesuji.nac.uci.edu>
	<20041214032114.GB6748@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Re: Fedora Core 3 system with lvm2 won't boot
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


Robin, I owe you.

I'd like to repay you either by coding a small to medium-sized app for you
in C, bash or python, or by buying you a tea/coffee/beer/wine of your
choice (one of moderate price :).

What would you prefer?

This is what worked for me:

On FC3's recovery cdrom...

1) Do startup network interfaces
2) Don't try to automatically mount the filesystems - not even readonly
3) lvm vgchange --ignorelockingfailure -P -a y
4) fdisk -l, and guess which partition is which based on size: the small one was /boot, and the large one was /
5) mkdir /mnt/boot
6) mount /dev/hda1 /mnt/boot
7) Look up the device node for the root filesystem in /mnt/boot/grub/grub.conf
8) A first tentative step, to see if things are working: fsck -n /dev/VolGroup00/LogVol00
9) Dive in: fsck -f -y /dev/VolGroup00/LogVol00
10) Wait a while...  Be patient.  Don't interrupt it
11) Reboot
