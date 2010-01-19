Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0J3WSVW009017
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 22:32:28 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0J3WHV4022683
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 22:32:17 -0500
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by e31.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id o0J3OAa4007362
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 20:24:10 -0700
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o0J3WCcY092578
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 20:32:13 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id o0J3WCrP016013
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 20:32:12 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av03.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o0J3WCVO016006
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 20:32:12 -0700
Date: Mon, 18 Jan 2010 19:32:12 -0800
From: malahal@us.ibm.com
Message-ID: <20100119033212.GA18351@us.ibm.com>
References: <42784f261001181815y340170dbs4775230080358bc3@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42784f261001181815y340170dbs4775230080358bc3@mail.gmail.com>
Subject: Re: [linux-lvm] Mounting an LVM disk image.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

Jason Dusek [jason.dusek@gmail.com] wrote:
>   I'm trying to mount a disk image that contains an LVM volume.
>   I've managed to follow this tutorial to the point where I've
>   got the volume on `/dev/loop7':
> 
>     http://www.thegibson.org/blog/archives/467
> 
>   Now I want to mount the image. My machine, a CentOS machine,
>   is already using LVM; running `lvm pvscan' shows me that the
>   the disk image has been stuck in `VolGroup00' with the rest of
>   them:
> 
>    :; lvm pvscan
>     PV /dev/loop7   VG VolGroup00   lvm2 [7.88 GB / 0    free]
>     PV /dev/sda5    VG VolGroup00   lvm2 [133.06 GB / 0    free]
>     PV /dev/sdb2    VG VolGroup00   lvm2 [135.16 GB / 0    free]
>     Total: 3 [276.09 GB] / in use: 3 [276.09 GB] / in no VG: 0 [0   ]

Looks like a name clash here. You have a volume group names VolGroup00
with two PVs (sda5 and sdb2 in it). /dev/loop7 is also a PV with same
group name VolGroup00. They should have different UUIDs though...

You may be running into this problem:
http://liorkaplan.wordpress.com/2008/07/25/when-lvm-volume-groups-collide/

And this method may work, although written for something else:
http://thread.gmane.org/gmane.linux.lvm.general/9628

It is probably a lot easier to with a system that doesn't have
VolGroup00 to begin with!

>   At this point in the tutorial, I run in to trouble. As they
>   suggest, I run `lvm vgchange -ay' and then inspect
>   `/dev/mapper':
> 
>    :; lvm vgchange -ay
>     2 logical volume(s) in volume group "VolGroup00" now active
>     2 logical volume(s) in volume group "VolGroup00" now active
>    :; ls /dev/mapper/
>     control  VolGroup00-LogVol00  VolGroup00-LogVol01
> 
>   Mounting fails:
> 
>    :;  mount -t ext2 /dev/mapper/VolGroup00-LogVol01 /media/img/
>     mount: /dev/mapper/VolGroup00-LogVol01 already mounted or /media/img/ busy
>    :;  mount -t ext2 /dev/mapper/VolGroup00-LogVol00 /media/img/
>     mount: /dev/mapper/VolGroup00-LogVol00 already mounted or /media/img/ busy
>     mount: according to mtab, /dev/mapper/VolGroup00-LogVol00 is mounted on /

You are probably trying to re-mount the root device and swap devices.

>   At this point, I'm stuck. I've tried removing `/dev/loop7'
>   from the volume group, to no avail:
> 
>    :; vgcreate shim /dev/loop7
>     Physical volume '/dev/loop7' is already in volume group 'VolGroup00'
>     Unable to add physical volume '/dev/loop7' to volume group 'shim'.
>    :; vgreduce VolGroup00 /dev/loop7
>     Physical Volume "/dev/loop7" not found in Volume Group "VolGroup00"

Again, this is probably an artifact of name space collision!
 
>   What's the right way to mount and LVM disk image? I'm doing it
>   to perform maintenance on a Xen guest.

Certainly easier to work on a system that doesn't have VolGroup00 to
begin with. If you can't avoid it, you may try renaming the volume group
using uuid or the above mentioned link that is written for cloning a
volume group.

Thanks, Malahal.
