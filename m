Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7Q3IIV22022
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2005 23:18:18 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7Q3IGIA027549
	for <linux-lvm@redhat.com>; Thu, 25 Aug 2005 23:18:17 -0400
Date: Thu, 25 Aug 2005 21:17:56 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] problems with basic lvm commands on Debian
Message-ID: <7D1B3B5A91BC5E4215864733@dhcp-2-206.wgops.com>
In-Reply-To: <Pine.LNX.4.62.0508252240480.27495@Chrestomanci>
References: <Pine.LNX.4.62.0508252240480.27495@Chrestomanci>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Cc: Faheem Mitha <faheem@email.unc.edu>

Yeah.  You CAN'T use mounted filesystems for LVM.  You'll corrupt both.

--On August 25, 2005 11:09:13 PM -0400 Faheem Mitha <faheem@email.unc.edu> 
wrote:

>
> Dear People,
>
> I must be missing something obvious, but I'm having problems with basic
> commands on Debian Sarge, using lvm2.
>
> I installed lvm2 and dmsetup. I'm using the stock Debian kernel
> 2.6.8-2-386.
>
> I can do basic manipulations using /dev/hda1, but not with /dev/hda2.
>
> This is on a very ordinary Dell Optiplex, normal x86 architecture.
>
> *******************************************************************
>
> root@io:/home/faheem# df
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/hda2             37483592    300352  35279136   1% /
> tmpfs                   258052         0    258052   0% /dev/shm
> /dev/hda1               918322     14622    854704   2% /boot
>
>    Physical volume "/dev/hda2" successfully created
>
> root@io:/dev/mapper# pvcreate /dev/hda1
>
> root@io:/dev/mapper# pvdisplay /dev/hda1
>    --- Physical volume ---
>    PV Name               /dev/hda1
>    VG Name               testvg
>    PV Size               956.00 MB / not usable 0
>    Allocatable           yes
>    PE Size (KByte)       4096
>    Total PE              239
>    Free PE               239
>    Allocated PE          0
>    PV UUID               sGOTrW-ttC4-m4uq-Cwck-V5s3-knz7-NpydvJ
>
> root@io:/dev/mapper# vgcreate testvg /dev/hda1
>    Volume group "testvg" successfully created
> root@io:/dev/mapper# vgdisplay testvg
>    --- Volume group ---
>    VG Name               testvg
>    System ID
>    Format                lvm2
>    Metadata Areas        1
>    Metadata Sequence No  1
>    VG Access             read/write
>    VG Status             resizable
>    MAX LV                0
>    Cur LV                0
>    Open LV               0
>    Max PV                0
>    Cur PV                1
>    Act PV                1
>    VG Size               956.00 MB
>    PE Size               4.00 MB
>    Total PE              239
>    Alloc PE / Size       0 / 0
>    Free  PE / Size       239 / 956.00 MB
>    VG UUID               IHrOgz-RWDW-EIAY-m9vD-idgT-1I99-cyoS8n
>
> root@io:/dev/mapper# pvcreate /dev/hda2
>    Physical volume "/dev/hda2" successfully created
>
> All good so far. However.
>
> root@io:/dev/mapper# pvdisplay /dev/hda2
>    No physical volume label read from /dev/hda2
>    Failed to read physical volume "/dev/hda2"
>
> root@io:/home/faheem# vgextend testvg  /dev/hda2
>    No physical volume label read from /dev/hda2
>    /dev/hda2 not identified as an existing physical volume
>    Unable to add physical volume '/dev/hda2' to volume group 'testvg'.
>
> Any idea what is going on here? This is a new installation, and only has
> the bare bones on it.
>
> Please cc me on any reply. Thanks in advance.
>
>                                                       Faheem.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
