Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k39MBJH1011200
	for <linux-lvm@redhat.com>; Sun, 9 Apr 2006 18:11:19 -0400
Received: from charybdis.ellipsis.cx (charybdis.ellipsis.cx [64.119.36.29])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k39MB7iH011217
	for <linux-lvm@redhat.com>; Sun, 9 Apr 2006 18:11:13 -0400
Subject: Re: [linux-lvm] can't use swap after switch to LVM 
In-Reply-To: Your message of "Sun, 09 Apr 2006 19:31:33 +0200."
	<20060409173133.AC8FDEA78@charybdis.ellipsis.cx> 
From: Joel Uckelman <uckelman@nomic.net>
Date: Mon, 10 Apr 2006 00:11:02 +0200
Sender: uckelman@ellipsis.cx
Message-Id: <20060409221102.4E883EA9F@charybdis.ellipsis.cx>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Thus spake Joel Uckelman:
> I just switched my desktop FC5 system from using software RAID over regular
> partitions to using software RAID over LVM; everything works fine, except
> I can't enable my swap.
> 
> On boot, I get the following messages:
> 
>    device-mapper: device 9:1 too small for target
>    device-mapper: dm-linear: Device lookup failed
>    device-mapper: error adding target to table
>    .
>    .
>    .
>    Unable to find swap-space signature
> 
> My swap volume is listed like this in my /etc/fstab:
> 
>    /dev/VolGroup00/LogVol01 swap swap defaults 0 0
> 
> If I try to format the swap volume, mkswap tells me that it's too small:
> 
>    # mkswap /dev/mapper/VolGroup00-LogVol01
>    mkswap: error: swap area needs to be at least 40kB
> 
> But 'lvm lvs' reports that's it's 1GB:
> 
>    LogVol01 VolGroup00 -wi-d-     1.00G
> 
> I've tried deleting and recreating the swap volume:
> 
>    # lvm lvremove VolGroup00/LogVol01
>    # lvm lvcreate -L 1024M -n LogVol01 VolGroup00
>    device-mapper: reload ioctl failed: Invalid argument
>    Failed to activate new LV.
> 
> Does anyone have an idea of what's going wrong here?

Finally the cause of my problem dawned on me: The two drives in my
software RAID are not exactly the same size (despite being the same
"model"). I created the volume group on the drive which is about 1GB
larger, and then put the two drives together as a software RAID.
Thus, my swap partition, which was coincindentally also 1GB, "fell off
the end" of the volume group when creating the RAID chopped off the
last 1GB of it.

I solved this by:

1. Using resize2fs to reduce the size of the filesystem in one of my
logical volumes by 1GB.

2. Shrinking the logical volume by 1GB.

3. Creating another logical volume for my swap partition.

-- 
J.
