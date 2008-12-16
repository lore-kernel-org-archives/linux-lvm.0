Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBGBdYEj003180
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 06:39:34 -0500
Received: from email.skywaywest.net (tweedledee.skywaywest.net
	[216.251.128.22])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBGBd69I017263
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 06:39:06 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by email.skywaywest.net (Postfix) with ESMTP id 563C940FBF9
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 03:39:05 -0800 (PST)
Received: from email.skywaywest.net ([127.0.0.1])
	by localhost (tweedledee.skywaywest.net [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 5yvdR3VQXyRI for <linux-lvm@redhat.com>;
	Tue, 16 Dec 2008 03:39:05 -0800 (PST)
Received: from [192.168.1.25] (unknown [216.251.146.74])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by email.skywaywest.net (Postfix) with ESMTP id F113640FD53
	for <linux-lvm@redhat.com>; Tue, 16 Dec 2008 03:39:04 -0800 (PST)
Message-ID: <49479356.8090704@skywaywest.com>
Date: Tue, 16 Dec 2008 04:39:02 -0700
From: Greg Varga <gvarga@skywaywest.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Large disk problem with LVM2...
References: <4946B2B8.2000801@skywaywest.com> <49477013.8090504@redhat.com>
In-Reply-To: <49477013.8090504@redhat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Bryn for getting back to me.

Here is the information you requested...  I see that it is indeed a 
MSDos partition table... I've done a quite google search, but I can't 
find out how to convert it over to a GPT Partition table...  Can you 
please help me with that or can it even be done (without erasing all the 
data)

Thanks,
  --Greg

======================

[root@bill ~]# fdisk -l /dev/sda

Disk /dev/sda: 3499.8 GB, 3499890573312 bytes
255 heads, 63 sectors/track, 425504 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14       13067   104856255   8e  Linux LVM
/dev/sda3           13068      158155  1165416554+  8e  Linux LVM
[root@bill ~]# parted /dev/sda p

Model: Promise 14+2 Disk RAID6 (scsi)
Disk /dev/sda: 3500GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos

Number  Start   End     Size    Type     File system  Flags
 1      32.3kB  107MB   107MB   primary  ext3         boot
 2      107MB   107GB   107GB   primary               lvm 
 3      107GB   1301GB  1193GB  primary               lvm 

Information: Don't forget to update /etc/fstab, if necessary.            

[root@bill ~]# cat /proc/partitions
major minor  #blocks  name

   8     0 3417861888 sda
   8     1     104391 sda1
   8     2  104856255 sda2
   8     3 1165416554 sda3
 253     0   40960000 dm-0
 253     1   59768832 dm-1
 253     2    4096000 dm-2
 253     3  167772160 dm-3
 253     4  314572800 dm-4
 253     5  524288000 dm-5
 253     6  104857600 dm-6


--Greg

Bryn M. Reeves wrote:
> Greg Varga wrote:
>> device-mapper: table: device 8:3 too small for target
>> device-mapper: table: 253:7: linear: dm-linear: Device lookup failed
>> device-mapper: ioctl: error adding target to table
>
> How was the underlying device (sda) partitioned? For a device this 
> large, you'll need to use a GPT partition table, rather than the 
> traditional MSDOS MBR. Some versions of tools may allow you to create 
> large partitions on MSDOS which later cause problems, since the MSDOS 
> format is limited to 2TiB addressing.
>
> The output of "fdisk -l /dev/sda" and "parted /dev/sda p", as well as 
> the content of /proc/partitions would help to confirm if this is the 
> problem.
>
>> Anyone have any ideas why pvs shows the DevSize of 1.09TB?
>
> There have been some cosmetic bugs that caused the wrong device sizes 
> to be reported, but this doesn't look like one of those cases - since 
> you're getting errors from the kernel when mapping LVs onto the
> device, it really does appear that it's not as big as we're expecting.
>
> Regards,
> Bryn.
>
-- 
----------------------------------------------------------------------
Greg Varga
Systems Engineer & Development

Skyway West
  Phone: (604) 482-1128
  Email: gvarga@skywaywest.com
  WebSite: www.skywaywest.com
----------------------------------------------------------------------

This communication contains confidential information intended only 
for the person to whom it is addressed.  Any unauthorized disclosure, 
copying, other distribution of this communication or taking any action 
on its contents is strictly prohibited. If you have received this 
message in error, please notify immediately and delete this message 
without reading, copying or forwarding it to anyone.
