Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3KBllp8009358
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 07:47:47 -0400
Received: from mail.mhnet.de (213-146-240-5.skytron.de [213.146.240.5])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3KBliDY018977
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 07:47:45 -0400
Received: from mail.mhnet.de (localhost [127.0.0.1])
	by mail.mhnet.de (Postfix) with ESMTP id C741A72378
	for <linux-lvm@redhat.com>; Fri, 20 Apr 2007 13:47:43 +0200 (CEST)
Date: Fri, 20 Apr 2007 13:47:43 +0200
From: Micha Holzmann <holzmann@gmx.de>
Message-ID: <20070420114742.GA6661@mail.mhnet.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] How to resize a PV located on a SAN LUN
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

since a few weeks we have an IBM SAN environment with Blade-Center.
The SAN controller is a DS4700 formerly known as FASTt. We have a LUN
with 200 GB of size. The LUN ist partioned:


fdisk -l /dev/sda

Disk /dev/sda: 214.7 GB, 214748364800 bytes
255 heads, 63 sectors/track, 26108 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1         125     1004031   83  Linux
/dev/sda2             126       26108   208708447+   5  Extended
/dev/sda5             126         188      506016   83  Linux
/dev/sda6             189        1185     8008371   83  Linux
/dev/sda7            1186        1435     2008093+  83  Linux
/dev/sda8            1436        1560     1004031   83  Linux
/dev/sda9            1561        1810     2008093+  83  Linux
/dev/sda10           1811        2060     2008093+  83  Linux
/dev/sda11           2061        4053    16008741   83  Linux
/dev/sda12           4054       24960   167935446   8e  Linux LVM
/dev/sda13          24961       26108     9221278+  82  Linux swap



Now i had to increase the size of partition of sda12 which is a LVM.
I am not sure which is the right way. Within the storage managment
software i can increase the size of the LUN. After rebooting the machine
the additional space is appended at the end of partitions and it is
marked as free. How can i now increase the LVM partition. Which
tool/programm i do need for this task?

Best regards,
Micha

-- 
Who the hell is General Failure, and why he is reading my disk?
