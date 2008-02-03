Received: from [172.16.45.118] (dhcp-118.brisbane.redhat.com [172.16.45.118])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	m134ERmn030460
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 14:14:27 +1000
Message-ID: <47A53FC6.2040007@gmail.com>
Date: Sun, 03 Feb 2008 14:15:02 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
References: <1202005131.5857.18.camel@localhost.localdomain>
In-Reply-To: <1202005131.5857.18.camel@localhost.localdomain>
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

Eckhard Kosin wrote:
> Hi all,
> 
> I just reordered my disk space:  shrunk /dev/hda6, created a new
> partition /dev/hda10 with this new space and added /dev/hda10 to the
> existing volume group vg_uhu00.  After that I could boot and all seems
> to be fine. but running vgscan I get
> 
> root@uhu:/home/ecki/backup/uhu# vgscan
>   Reading all physical volumes.  This may take a while...
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Couldn't find device with uuid 'Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR'.
>   Couldn't find all physical volumes for volume group vg_uhu00.
>   Incorrect metadata area header checksum
>   Couldn't find device with uuid 'Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR'.
>   Couldn't find all physical volumes for volume group vg_uhu00.
>   Incorrect metadata area header checksum
>   Incorrect metadata area header checksum
>   Couldn't find device with uuid 'Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR'.
>   Couldn't find all physical volumes for volume group vg_uhu00.
>   Incorrect metadata area header checksum
>   Couldn't find device with uuid 'Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR'.
>   Couldn't find all physical volumes for volume group vg_uhu00.
>   Volume group "vg_uhu00" not found
> 
> Some additional information:
> 
> I'm running Ubuntu 6.06 (dapper)
> 
> root@uhu:/home/ecki/backup/uhu# uname -a
> Linux uhu 2.6.15-51-386 #1 PREEMPT Thu Dec 6 20:20:49 UTC 2007 i686 GNU/Linux
> 
> root@uhu:/home/ecki/backup/uhu# apt-show-versions lvm2
> lvm2/dapper uptodate 2.02.02-1ubuntu1.5
> 
> root@uhu:/home/ecki/backup/uhu# fdisk -ul
> 
> Disk /dev/hda: 40.0 GB, 40007761920 bytes
> 255 heads, 63 sectors/track, 4864 cylinders, total 78140160 sectors
> Units = sectors of 1 * 512 = 512 bytes
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/hda1   *          63    14329979     7164958+   7  HPFS/NTFS
> /dev/hda2        14329980    78140159    31905090    f  W95 Ext'd (LBA)
> /dev/hda5        23438898    25993169     1277136   82  Linux swap / Solaris
> /dev/hda6        25993233    38443544     6225156   83  Linux
> /dev/hda7        42556248    42684704       64228+  83  Linux
> /dev/hda8        42684768    78140159    17727696   8e  Linux LVM
> /dev/hda9        14330106    23438834     4554364+  83  Linux
> /dev/hda10       38443608    42556184     2056288+  83  Linux
> 
> Partition table entries are not in disk order
> 
> The volume group vg_uhu00 uses the partitions /dev/hda8, /dev/hda9 and
> /dev/hda10 and, I believe, but I'm not sure, /dev/hda5 (swap
> partition).  I can't check, because lvdisplay gives the same output as vgscan above.
> 
> I have a line
> 
>   filter = [ "r|/dev/cdrom|", "r|/dev/hda[1,6,7]|" ]

Is there any particular reason your modifying the filter setting? 
Generally you shouldn't need to modify it, except for a few special 
situations.

Can you attach /etc/lvm/archive/vg_uhu00 ? The file will contain an 
entry showing which device "Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR" is 
likely to correspond to. Is it rejected by your filter setting?

If, when using the default filter setting, you still receive the 
"Couldn't find device with uuid Cm961g-X5km-ifdU-r0Cp-ACmd-N9qG-XcieTR'" 
messages, then you've made an error when resizing the partitions.

--Dave
