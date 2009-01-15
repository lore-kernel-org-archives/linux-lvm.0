Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0F15mX7004307
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:05:48 -0500
Received: from e1.ny.us.ibm.com (e1.ny.us.ibm.com [32.97.182.141])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0F14gCH030099
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:04:42 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e1.ny.us.ibm.com (8.13.1/8.13.1) with ESMTP id n0F13L6x005264
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:03:21 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay02.pok.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id
	n0F14gUm190582
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:04:42 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	n0F14g8D016864
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:04:42 -0500
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	n0F14gN2016858
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 20:04:42 -0500
Date: Wed, 14 Jan 2009 17:04:41 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Major problems after soft raid 5 failure
Message-ID: <20090115010441.GA6852@us.ibm.com>
References: <496E8353.50207@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <496E8353.50207@gmail.com>
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
To: linux-lvm@redhat.com

Colin Faber [cfaber@gmail.com] wrote:
> was unavailable. After searching around I kept coming back to suggestions 
> stating that removal of the missing device from the volume group was the 
> solution to getting thing back online again. So using 'vgreduce 
> --removemissing raid' then 'lvchange -ay raid' to update the changes - 
> Neither command errored and vgreduce noted that 'raid' was not available 
> again.

Since your LV (array) is most likely allocated on md1 that disappeared,
you really want --partial (lvm command) rather than --removemissing.
Your metadata is updated and any knowledge about 'array' LV is now
almost gone due to the above 'vgreduce'. I say almost gone because it
might be there but you really need true LVM expertise now!

Did you save a copy of your old LVM metadata before the reboot? See your
/etc/lvm/backup/raid has any reference to 'array' LV at all.

--Malahal.

> So as it stands now I have no logical volume, I have a volume group and I 
> have a functional md0 array. If I dump the first 50 or so megs of the md0 
> raid array I can see the volume group information, as well as the lv 
> information including various bits of file system information.
>
> At this point I'm wondering can I recover the logical volume and recover 
> this 1.8TB of data.
>
> For completeness here is the results of various display and scan commands:
>
> root@Aria:/dev/disk/by-id# pvscan
>  PV /dev/md0   VG raid   lvm2 [1.82 TB / 1.82 TB free]
>  Total: 1 [1.82 TB] / in use: 1 [1.82 TB] / in no VG: 0 [0   ]
>
> root@Aria:/dev/disk/by-id# pvdisplay
>  --- Physical volume ---
>  PV Name               /dev/md0
>  VG Name               raid
>  PV Size               1.82 TB / not usable 2.25 MB
>  Allocatable           yes
>  PE Size (KByte)       4096
>  Total PE              476933
>  Free PE               476933
>  Allocated PE          0
>  PV UUID               oI1oXp-NOSk-BJn0-ncEN-HaZr-NwSn-P9De9b
>
> root@Aria:/dev/disk/by-id# vgscan
>  Reading all physical volumes.  This may take a while...
>  Found volume group "raid" using metadata type lvm2
>
> root@Aria:/dev/disk/by-id# vgdisplay
>  --- Volume group ---
>  VG Name               raid
>  System ID
>  Format                lvm2
>  Metadata Areas        1
>  Metadata Sequence No  11
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                0
>  Cur LV                0
>  Open LV               0
>  Max PV                0
>  Cur PV                1
>  Act PV                1
>  VG Size               1.82 TB
>  PE Size               4.00 MB
>  Total PE              476933
>  Alloc PE / Size       0 / 0
>  Free  PE / Size       476933 / 1.82 TB
>  VG UUID               quRohP-EcsI-iheW-lbU5-rBjO-TnqS-JbjmZA
>
> root@Aria:/dev/disk/by-id# lvscan
> root@Aria:/dev/disk/by-id#
>
> root@Aria:/dev/disk/by-id# lvdisplay
> root@Aria:/dev/disk/by-id#
>
>
> Thank you.
>
> -cf
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
