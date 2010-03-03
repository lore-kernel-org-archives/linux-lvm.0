Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o23AiP4D013049
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2010 05:44:25 -0500
Received: from smtp-auth.no-ip.com (smtp-auth.no-ip.com [204.16.252.95])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o23AiAmA018376
	for <linux-lvm@redhat.com>; Wed, 3 Mar 2010 05:44:10 -0500
Received: from [127.0.0.1] (unknown [62.58.16.80])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: simonloewen.com@noip-smtp)
	by smtp-auth.no-ip.com (Postfix) with ESMTPSA id 75463B4A5EA
	for <linux-lvm@redhat.com>; Wed,  3 Mar 2010 02:44:09 -0800 (PST)
Message-ID: <4B8E3D56.50703@klunky.co.uk>
Date: Wed, 03 Mar 2010 11:43:34 +0100
From: J4 <junk4@klunky.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] System won't create devices from volume group : advice
 on dmsetup create command required (or alternative solution)
Reply-To: junk4@klunky.co.uk,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Dear all,

    I am moving an LVM between two machines but the new machine won't
create the devices.

** Source machines set-up:
LVM created on XEN server as one volume group.
The Volume Group was then presented to a XEN host via xm block-attach.
The XEN host then used fdisk to create two partitions on the new device
(/dev/xvdd1 and /dev/xvdd2) [I wish they had not done this!]
The devices were removed from the XEN host (xm block detach) and then
vgchange -a n mds  (mds is the vg)
The discs were unpresented from the source machine.

** Target machine set-up:
Phsyical server.
The discs were presented from the target machine.
# pvscan [results as expected]
# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "mds" using metadata type lvm2
# vgchange -a y mds
 # vgdisplay mds
  --- Volume group ---
  VG Name               mds
  System ID            
  Format                lvm2
  Metadata Areas        4
  Metadata Sequence No  2
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                4
  Act PV                4
  VG Size               209.95 GB
  PE Size               4.00 MB
  Total PE              53746
  Alloc PE / Size       53735 / 209.90 GB
  Free  PE / Size       11 / 44.00 MB
  VG UUID               TnUWZQ-kK5S-iLTR-U0C5-NYHk-96cw-smDLm2

However, the devices are not created:
# ls /dev/mapper | grep mds
brw------- 1 root root 253, 11 Mar  3 11:17 /dev/mapper/mds-mds

# fdisk -l /dev/mds/mds
Disk /dev/mds/mds: 225.3 GB, 225380925440 bytes
255 heads, 63 sectors/track, 27401 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

       Device Boot      Start         End      Blocks   Id  System
/dev/mds/mds1               1       24152   193992907   83  Linux
/dev/mds/mds2           24152       27401    26105594   83  Linux

# ls -l /dev/mds/mds*
lrwxrwxrwx 1 root root 19 Mar  3 11:17 /dev/mds/mds -> /dev/mapper/mds-mds

I think that I have to use dmsetup to create the devices:  dmsetup create 
However, I have no idea where to start.

I would be very grateful if someone could advice me on how to proceed,
because I have a finite time to keep this UAT environment down.

Best regards, J.




   
