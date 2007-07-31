Received: from [172.16.44.152] (friday.brisbane.redhat.com [172.16.44.152])
	by pobox.brisbane.redhat.com (8.13.1/8.13.1) with ESMTP id
	l6VMl7ub027360
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 08:47:08 +1000
Message-ID: <46AFBBEB.1000703@gmail.com>
Date: Wed, 01 Aug 2007 08:47:07 +1000
From: David Robinson <zxvdr.au@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on hardware RAID
References: <20070731210052.da6bf8cb@mail.dougware.net>
In-Reply-To: <20070731210052.da6bf8cb@mail.dougware.net>
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

Doug Eubanks wrote:
> Quick question....
> 
> I've got three drives in on a hardware SCSI raid.  Within the next
> week, I will be adding two drives to the array and using the
> controller's expand function to increase the size of my array.
> 
> Will the pv and vg sizes automatically be increased after a parted a
> reboot?

No. You would need to run pvresize first (you would need to resize the 
underlying partition first if one is used) - after pvresize has been run 
you will see that the size of the VG the PV is in has increased.

   I was also considering just adding a second LVM partition to
> once the expand has completed and adding that pv to the vg.
> 
> Does anyone have any advice or pointers or best practices?

I prefer to enlarging the underlying partition (if possible) then do a 
pvresize rather than adding an additional partition and doing pvcreate 
and vgextend. The only reason is to avoid adding partitions necessarily, 
but obviously this isn't always possible and there is the increased risk 
that you could break things if your not careful (make sure the 
partition's start block is the same).

Dave
