Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2TMecDd011953
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 18:40:38 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2TMeQV0011251
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 18:40:26 -0400
Received: by wf-out-1314.google.com with SMTP id 28so1633402wfc.6
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2008 15:40:25 -0700 (PDT)
Date: Sun, 30 Mar 2008 08:40:12 +1000
From: David Robinson <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Problem with partition table on LV
Message-ID: <20080329224010.GA6475@laptop.home>
References: <47EE2926.3020201@onart.com.tr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47EE2926.3020201@onart.com.tr>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Mar 29, 2008 at 01:33:58PM +0200, Mufit Eribol wrote:
> Hello,
>
> After loosing all the data on my production server by issuing wrong lvm 
> commands in restoring the logical volume, I have worked for weeks to setup 
> my server again from scratch up. Now, today I noticed another problem, but 
> scared to death to touch it.
>
> This time I have to ask you before issuing any commands as obviously I 
> haven't learned LVM internals.
>
> Please find the details below. I would appreciate any help.
>
> Thanks,
> Mufit
>
> Problem:
> The system works but fdisk -l gives the following error:
>
> [root@server ~]# fdisk -l
> ...
>    Device Boot      Start         End      Blocks   Id  System
>
> Disk /dev/sdc: 799.9 GB, 799937658880 bytes
> 255 heads, 63 sectors/track, 97253 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
>
> Disk /dev/sdc doesn't contain a valid partition table

That's not an error. Its simply saying that there is no partition table on sdc.
You don't necessarily need a partition table. A lot of people actually setup
their system like this, especially when the device is from a SAN.

>  --- Physical volume ---
>  PV Name               /dev/sdc

LVM is using the correct device. You don't need to change anything.

> [root@server ~]# pvscan
>  PV /dev/sdc   VG raid_vg0   lvm2 [744.97 GB / 480.00 MB free]
>  Total: 1 [744.97 GB] / in use: 1 [744.97 GB] / in no VG: 0 [0   ]

--Dave
