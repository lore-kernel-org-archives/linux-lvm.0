Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36EFcj09465
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:15:38 -0400
Received: from srv1.alteeve.com (thelinuxexperience.com [209.167.86.38])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36EFa5D017205
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:15:36 -0400
Received: from alteeve.com (nabiki.thelinuxexperience.com [209.167.86.34])
	(authenticated bits=0)
	by srv1.alteeve.com (8.12.10/8.12.10) with ESMTP id i36EDUYe023169
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 10:13:31 -0400
Message-ID: <4072BB82.4020706@alteeve.com>
Date: Tue, 06 Apr 2004 10:15:30 -0400
From: Madison Kelly <linux@alteeve.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Converting the root filesystem to ReiserFS on LVM...
References: <40717062.6050401@alteeve.com>
	<1081259282.14982.2.camel@grandmother.littlebald.com>
In-Reply-To: <1081259282.14982.2.camel@grandmother.littlebald.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

David Johnston wrote:
> On Mon, 2004-04-05 at 10:42, Madison Kelly wrote:
> 
>>Hi all,
>>
>>I am officially stumped... 
>>When I use the FC1 cd I can't unmount '/mnt/sysimage' which is seen 
>>as the LVM device '/dev/VG00/LV00', it keeps saying the device or 
>>resource is busy
>>Under Fedora the devices I need to mount are on:
>>/dev/VG00/LV00 = '/' (currently ext3)
>>/dev/VG00/LV01 = '/backup' (reiserfs)
>>/dev/VG00/LV02 = '/snapshot' (reiserfs)
> 
> 
> Madison,
> do you by any chance have /mnt/sysimage/backup or /mnt/sysimage/snapshot
> mounted when you get the "resource busy" error?

Nope, I made sure to dismount anything mounted under /mnt/sysimage (inc. 
  boot/). I have since been able to copy the data by using the SysRescCD 
and then using EVMS to simply look at the partitions and then saving out 
and mounting /dev/evms/lvm/<vg>/<lv> but after restoring and rebooting 
it would kernel panic still thinking that '/' was ext3 despite editing 
'/etc/blkid.tab' and '/etc/fstab'.

I am trying now to figure out how to properly use 'chroot /mnt/sysimage' 
followed by 'lvcreate_initrd' to write a new boot loaded but despit 
double checking that the file name was right Grub still fails to find 
the file...

Quite an ordeal but I am making progress, slowly.

Thanks for your reply! Any other tips by chance?

Madison

PS - For the archives, this is a Fedora Core 1 install.
