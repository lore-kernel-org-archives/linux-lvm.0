Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3KMf4oM003244
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 18:41:04 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.179])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3KMeqd3030828
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 18:40:52 -0400
Received: by py-out-1112.google.com with SMTP id a29so1676145pyi.0
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 15:40:52 -0700 (PDT)
Message-ID: <480BC65A.1080605@gmail.com>
Date: Mon, 21 Apr 2008 08:40:26 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>	<480A3291.7070702@Media-Brokers.com>	<480AB63C.4070605@gmail.com>
	<480B728C.9010708@Media-Brokers.com>
In-Reply-To: <480B728C.9010708@Media-Brokers.com>
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

> OT: this list seems a little on the dead side... is there a more active 
> LVM oriented list that you are aware of?

The list is active, but its quiet on weekends ;)

> Ok, so I guess the only question I have is - does it matter?

It doesn't really matter. Either method will work fine. I'd prefer to 
remove the partition, but that's only to keep things tidy - I don't like 
having unnecessary partitions.

> Is my following evaluation correct? :
> 
> It is much simpler - because I can do this without rebooting - to just do:
> 
> vgextend vg2 /dev/sdb2, then
> 
> lvextend -L+100G /dev/vg2/var, then
> 
> resize_reiserfs -f /dev/vg2/var
> 
> than it is to:
> 
> delete /dev/sdb2, reboot, then

You could modify the partition table in one step rather than two. Use 
fdisk to delete both partitions then create a new partition that spans 
the entire device (just make sure that you create the partition with the 
same start block). The end result should look something like:

    Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       58352   468712408+  8e  Linux LVM

> resize /dev/sdb1, reboot, then

You may not need to reboot at all... you could use "partprobe" or 
"blockdev --rereadpt", but check /proc/partitions to make sure that the 
kernel knows of the new partition table. I've seen instances where 
partprobe doesn't actually cause the partition table to be refreshed.

> run pvresize, *then*
> 
> run lvextend...
> 
> So, again - does it really matter? Is having my vg2 in one big LVM 
> partition 'better' than having it consist of two different partitions?

There's no difference, LVM doesn't care.

--Dave
