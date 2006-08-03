Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k73BdZfX026393
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 07:39:36 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k73BdTm1009888
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 07:39:29 -0400
Message-ID: <44D1E050.9030007@conterra.de>
Date: Thu, 03 Aug 2006 13:38:56 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting on a new root partition
References: <20060803080824.48652.qmail@web26614.mail.ukl.yahoo.com>
In-Reply-To: <20060803080824.48652.qmail@web26614.mail.ukl.yahoo.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

ramsis farhat wrote:
> I'm still working on a virtual machine with Red Hat Entreprise 3. So don't worry if I break it
> I'm working with 2 hard disks of 8GB. The first is partitioned like this
> sda1 boot (101 MB)
> sda2 /      (7400MB)
> sda3 swap (573 MB)
>   
> I followed exactly the steps in the LVM-HOWTO excepted that I added the second Hard disk sdb.
> I made an lvm partion sdb1 and I put all the root data (size 6GB) on it. The new partition is /dev/vg00/root
> 
> Then, I had a problem : when I type "lvmcreate_initrd", the RAM disk can't be created because of the lack of space ( I'm not sure of that).
>  
> I used "lvmcreate_initrd  -D", the instruction returns 0 ( it means ok). But when I reboot, there is kernel panic.
> so if I use initrd, i don't know if i need that!!!!!!!

I don't know about "lvmcreate_initrd", seems this is Redhad specific (I'm using SuSE).
I googled for it and found it should create some file:

/boot/initrd-lvm-<KernelVersion>.gz

is this created on your system? (May be your /boot partition is full?)
IF it was created, please verify, if it is referenced in your grub/lilo
configuration. Can you please post an "ls -ltr /boot", to show us the
content of your /boot partition and your grub or lilo configuration?

You also should edit the /etc/fstab of the new LVM-root change the name
of the new root partition/volume.

Dieter.
