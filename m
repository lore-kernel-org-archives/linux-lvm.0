Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q6UJF0oQ009628
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 15:15:00 -0400
Received: from mail.profihost.ag (mail.profihost.ag [85.158.179.208])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6UJEvvh006002
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 15:14:58 -0400
Message-ID: <5016DD33.3050000@profihost.ag>
Date: Mon, 30 Jul 2012 21:14:59 +0200
From: Stefan Priebe <s.priebe@profihost.ag>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how to online resize pv?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello list,

i'm able to resize my block device online. The kernel also shows the 
correct new size in blockdev --getsize64.

But then i got stuck to extend the pv as i'm unable to extend my 
partition table without reboot.

Disk /dev/vda: 48,3GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start   End     Size    File system  Name       Flags
  1      1049kB  2097kB  1049kB               GRUB_BOOT  bios_grub
  2      2097kB  32,2GB  32,2GB               Linux LVM  lvm

If i delete 2 and recreate it starting at the same sector i can't reread 
the part. table.

Is there a way todo online resizing?

Greets
Stefan
