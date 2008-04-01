Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m31AJbIo025839
	for <linux-lvm@redhat.com>; Tue, 1 Apr 2008 06:19:37 -0400
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m31AJMjG000573
	for <linux-lvm@redhat.com>; Tue, 1 Apr 2008 06:19:23 -0400
Date: Tue, 1 Apr 2008 12:19:05 +0200 (CEST)
From: Stephan Schulz <ss.c@gmx.net>
Message-ID: <Pine.LNX.4.64.0804011210060.5647@p3-700.home.all>
MIME-Version: 1.0
Subject: [linux-lvm] device x:x too small for target
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi!

I've currently problems to access my data on a logical volume, reason:
"/etc/init.d/lvm start" gives the following output:

Setting up LVM Volume Groups...
  Reading all physical volumes.  This may take a while...
  Found volume group "storage_vg" using metadata type lvm2
  device-mapper: reload ioctl failed: Invalid argument
  1 logical volume(s) in volume group "storage_vg" now active

A look to "dmesg" reveals the following:
device-mapper: table: device 8:0 too small for target
device-mapper: table: 254:0: linear: dm-linear: Device lookup failed
device-mapper: ioctl: error adding target to table

The LVM-System consists of one logical volume with two harddrives (sda and 
sdb, which contains each a physical volume) and worked flawless in the 
past. I used to swap these both disks between a linux and a windows 
system without any problems (access in windows through vmware as 
"physical disks"), but for some reason something screwed it up..
I thought about overwriting the lvm metadata but I wasn't sure how to do 
it in a way without doing more damage to the non-metadata.

Any hints where to look or what to do about it?

Yours,
Stephan

-- 

A computer is like an Old Testament god, with a lot of rules and no mercy.
- Joseph Campbell
