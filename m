Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5KHD9008857
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 13:13:09 -0400
Received: from mwinf0102.wanadoo.fr (smtp1.wanadoo.fr [193.252.22.30])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5KHD8e1004029
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 13:13:08 -0400
Received: from tangerine.coulon.evette
	(ADijon-107-1-3-193.w81-48.abo.wanadoo.fr [81.48.28.193])
	by mwinf0102.wanadoo.fr (SMTP Server) with ESMTP id C55A51BE774B
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 19:13:01 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1Bc5sH-00016B-Of
	for linux-lvm@redhat.com; Sun, 20 Jun 2004 19:12:57 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01361-07 for <linux-lvm@redhat.com>;
	Sun, 20 Jun 2004 19:12:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1Bc5sG-000165-8G
	for linux-lvm@redhat.com; Sun, 20 Jun 2004 19:12:56 +0200
Date: Sun, 20 Jun 2004 19:12:55 +0200
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20040620171255.GA2783@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Failed to boot 2.6.6 with root on lvm
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I've a lvm1 system, all filesystems are xfs but  /boot which is ext3.
I boot 2.4.36 telling root=3a02, (58,2) is the major/minor for my root  
lv. This works fine.

I've booted from an other partition 2.6.6 and I can access my lvm via  
the device mapper without any problem.

I built xfs support hard coded in the kernel to avoid side effects with  
the xfs module.

I tried to boot 2.6.6 on my lvm system but I failed.

I built the initrd with lvm2create_initrd from
Jeff Layton <jtlayton@poochiereds.net>

If I tell grub:
root=/dev/ram0 lvm2root=/dev/vg00/root_lv I get the following messages  
at boot :
[ ... ]
device-mapper: 4.1.0-ioct (2003-12-10) initialised: dm@uk.syistina.com
[ ... ]
VFS cannot open root device "ram0" or unknown-block (0,0)
Please apped a correct "root=" boot option

If I tell grub:
root=3a02 (like with 2.4.21 and lvm1) I get the following

VFS cannot open root device "3a02" or unknown-block (58,2)
Please apped a correct "root=" boot option

Is there any mean to boot an lvm1 based root filesystem from 2.6.x (or  
2.4.xx and the device-mapper) ?

--
Regards
		- Jean-Luc
