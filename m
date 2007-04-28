Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3SNZc7s013683
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 19:35:40 -0400
Received: from smtp1.berklee.edu (smtp.berklee.edu [192.136.22.34])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3SNZbDE030648
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 19:35:37 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.berklee.edu (Postfix) with ESMTP id 1C60F2C0002
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 19:35:31 -0400 (EDT)
Received: from smtp1.berklee.edu ([127.0.0.1])
	by localhost (smtp2.berklee.edu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xw6lG9br4thK for <linux-lvm@redhat.com>;
	Sat, 28 Apr 2007 19:35:30 -0400 (EDT)
Received: from [192.168.1.202]
	(216-15-121-70.c3-0.frm-ubr3.sbo-frm.ma.static.cable.rcn.com
	[216.15.121.70])
	by smtp1.berklee.edu (Postfix) with ESMTP id 3034E2C0001
	for <linux-lvm@redhat.com>; Sat, 28 Apr 2007 19:35:30 -0400 (EDT)
Message-ID: <4633DA43.60003@berklee.edu>
Date: Sat, 28 Apr 2007 19:35:31 -0400
From: Louis Guillaume <lguillaume@berklee.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to resize a PV located on a SAN LUN
References: <20070420114742.GA6661@mail.mhnet.de>
In-Reply-To: <20070420114742.GA6661@mail.mhnet.de>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Micha Holzmann wrote:
> Hello,
> 
> since a few weeks we have an IBM SAN environment with Blade-Center.
> The SAN controller is a DS4700 formerly known as FASTt. We have a LUN
> with 200 GB of size. The LUN ist partioned:
> 
> 
> fdisk -l /dev/sda
> 
> Disk /dev/sda: 214.7 GB, 214748364800 bytes
> 255 heads, 63 sectors/track, 26108 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1   *           1         125     1004031   83  Linux
> /dev/sda2             126       26108   208708447+   5  Extended
> /dev/sda5             126         188      506016   83  Linux
> /dev/sda6             189        1185     8008371   83  Linux
> /dev/sda7            1186        1435     2008093+  83  Linux
> /dev/sda8            1436        1560     1004031   83  Linux
> /dev/sda9            1561        1810     2008093+  83  Linux
> /dev/sda10           1811        2060     2008093+  83  Linux
> /dev/sda11           2061        4053    16008741   83  Linux
> /dev/sda12           4054       24960   167935446   8e  Linux LVM
> /dev/sda13          24961       26108     9221278+  82  Linux swap
> 
> 
> 
> Now i had to increase the size of partition of sda12 which is a LVM.
> I am not sure which is the right way. Within the storage managment
> software i can increase the size of the LUN. After rebooting the machine
> the additional space is appended at the end of partitions and it is
> marked as free. How can i now increase the LVM partition. Which
> tool/programm i do need for this task?
> 
> Best regards,
> Micha
> 


Others have suggested what is probably your only option if you're stuck
with this configuration, i.e. create a new PV and add it to the volume
group.

This configuration seems a little strange to me. How come you
partitioned the LUN this way? Using LVM for everything would have been
much more flexible in general.

If you had created a single PV from the whole LUN and created Logical
Volumes for each "partition", you would not have any problem now: You
would be able to simply do a "pvresize" then "lvextend" to grow the LV,
then resize2fs (assuming ext[23]).

Louis
