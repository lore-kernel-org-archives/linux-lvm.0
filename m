Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9FBeYs3018605
	for <linux-lvm@redhat.com>; Mon, 15 Oct 2007 07:40:34 -0400
Received: from galaxy.systems.pipex.net (galaxy.systems.pipex.net
	[62.241.162.31])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9FBeSaG016453
	for <linux-lvm@redhat.com>; Mon, 15 Oct 2007 07:40:28 -0400
Received: from katy.localdomain (81-178-98-216.dsl.pipex.com [81.178.98.216])
	by galaxy.systems.pipex.net (Postfix) with ESMTP id 90FB7E00063C
	for <linux-lvm@redhat.com>; Mon, 15 Oct 2007 12:40:22 +0100 (BST)
Received: from [192.168.100.54] (daisy.localdomain [192.168.100.54])
	by katy.localdomain (Postfix) with ESMTP id D1D4D23B49
	for <linux-lvm@redhat.com>; Mon, 15 Oct 2007 12:40:21 +0100 (BST)
Message-ID: <471351AD.4070406@ianburnett.com>
Date: Mon, 15 Oct 2007 12:40:29 +0100
From: Ian Burnett <maillist-lvm@ianburnett.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on an external USB device - why not?
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
To: linux-lvm@redhat.com

My current system configuration is a 250GB internal IDE HDD, managed 
using LVM2 under Fedora Core 6. What I would like to do is to put this 
disk into an external USB enclosure to reduce heat generation inside the 
PC. Another reason is to allow the addition of extra disks very easily 
(current case only has room for 1x 3.5" HDD).

Once the USB drive is connected, I will be performing the initial boot 
stages off a small (2GB) solid-state CF disk, so I don't necessarily 
need the full "boot from USB" capabilities.

I can't see any problems in doing so myself. I realise that if 
additional usb-storage devices are added, then the raw device may change 
from /dev/sda to /dev/sdb, but with LVM using PV UUIDs to locate 
devices, won't that be irrelevant?

Are there any caveats to doing this? I haven't seen anything 
particularly relevant on the archives of this mailing list, and I've 
Googled around the subject. I did discover a couple of boot-from-USB 
walkthroughs scattered around the web which unhelpfully said "don't do 
it" without giving any particular reasons. That was from some old posts 
(c. 2005), without any citations, and didn't mention LVM2 so could have 
been based on LVM1.

All advice welcomed.

Ian.

-- 
Ian Burnett :: www.ianburnett.com
