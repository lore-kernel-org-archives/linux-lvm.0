Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i35Egsj16045
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2004 10:42:54 -0400
Received: from srv1.alteeve.com (thelinuxexperience.com [209.167.86.38])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i35Ego5D002438
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2004 10:42:50 -0400
Received: from alteeve.com (nabiki.thelinuxexperience.com [209.167.86.34])
	(authenticated bits=0)
	by srv1.alteeve.com (8.12.10/8.12.10) with ESMTP id i35EeYYe017778
	for <linux-lvm@redhat.com>; Mon, 5 Apr 2004 10:40:34 -0400
Message-ID: <40717062.6050401@alteeve.com>
Date: Mon, 05 Apr 2004 10:42:42 -0400
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Converting the root filesystem to ReiserFS on LVM...
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

Hi all,

   I am officially stumped... I have tried two rescue discs (SysRescCD 
and PLD Rescue) as well and my Fedora Core 1 install disk using 'linux 
rescue' in an attempt to backup the FC1 root partition so that I can 
reformat it as ReiserFS and then restore it.

   When I use the FC1 cd I can't unmount '/mnt/sysimage' which is seen 
as the LVM device '/dev/VG00/LV00', it keeps saying the device or 
resource is busy (despite being out of the directory and running off the 
CD). When I try to boot off either rescue CD 'root' isn't mounted but 
then I can't find the darn LVM partitions (and yes I made sure that the 
rescue CDs supported LVM and ReiserFS).

   Under Fedora the devices I need to mount are on:

/dev/VG00/LV00 = '/' (currently ext3)
/dev/VG00/LV01 = '/backup' (reiserfs)
/dev/VG00/LV02 = '/snapshot' (reiserfs)

   Under the two rescue CDs though there is no '/dev/VG00...'. Where 
would I find those partitions? I tried looking under '/dev/' but the 
only thing relevant I could find was '/dev/ide/host0/bus0/target0/lun0/' 
and there was no sign of the LVM partitions (nor under variants like 
'bus1', etc.).

   Any help would be greatly appreciated!

Madison
