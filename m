Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJJrMr10611
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:53:22 -0500
Received: from gorski.com.pl (qmailr@wm38.internetdsl.tpnet.pl [80.55.194.38])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iAJJr9fB010018
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 14:53:17 -0500
Message-ID: <419E4F1C.7060006@gorski.com.pl>
Date: Fri, 19 Nov 2004 20:53:00 +0100
From: SoboL <sobol@gorski.com.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Lost PV info after moving box to new place
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello
We moved server box with linux and lvm1 to new server room. After power 
up we discovered that system doesent see sda drvice.
After some maintaince in box, moving cables etc system see sda, fdisk 
see correct info on /dev/sda.
But well lvm is not. He doesent see PV info on sda1. Here's my errors:

vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- only found 33167 of 37507 LEs for LV /dev/worm/worm
vgscan -- ERROR: no volume group quorum on "worm" (8 / 9 physical volumes)!
vgscan -- found inactive volume group "worm"
vgscan -- only found 33167 of 37507 LEs for LV /dev/worm/worm
vgscan -- only found 33167 of 37507 LEs for LV /dev/worm/worm
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume 
group

pvdisplay /dev/sda1
pvdisplay -- ERROR "pv_read(): open" no VALID physical volume "/dev/sda1"

lvmdiskscan
lvmdiskscan -- /dev/sda  [      33.92 GB] free whole disk
lvmdiskscan -- /dev/sdb1 [      33.92 GB] Primary  LVM partition [0x8E]

fdisk
   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1     34732  35565552   8e  Linux LVM

Anyone can help please ?
                                                                         
                           greetz SoboL
