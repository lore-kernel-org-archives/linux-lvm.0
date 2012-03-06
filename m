Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q26LKlIZ011707
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2012 16:20:47 -0500
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q26LKkIB031058
	for <linux-lvm@redhat.com>; Tue, 6 Mar 2012 16:20:46 -0500
Mime-Version: 1.0 (Apple Message framework v1257)
From: Richard Petty <richard@nugnug.com>
In-Reply-To: <alpine.LRH.2.00.1203051720020.30456@bmsred.bmsi.com>
Date: Tue, 6 Mar 2012 15:20:09 -0600
Message-Id: <E8F62315-E291-4E7B-929C-D76934A42753@nugnug.com>
References: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
	<alpine.LRH.2.00.1203051720020.30456@bmsred.bmsi.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Corrupt PV (wrong size)
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
To: LVM general discussion and development <linux-lvm@redhat.com>


On Mar 5, 2012, at 4:31 PM, Stuart D. Gathman wrote:

> Long ago, Nostradamus foresaw that on Mar 5, Richard Petty would write:
> 
>> GOAL: Retrieve a KVM virtual machine from an inaccessible LVM volume.
>> 
>> DESCRIPTION: In November, I was working on a home server. The system
>> boots to software mirrored drives but I have a hardware-based RAID5
>> array on it and I decided to create a logical volume and mount it at
>> /var/lib/libvirt/images so that all my KVM virtual machine image
>> files would reside on the hardware RAID.
>> 
>> All that worked fine. Later, I decided to expand that
>> logical volume and that's when I made a mistake which wasn't
>> discovered until about six weeks later when I accidentally rebooted
>> the server. (Good problems usually require several mistakes.)
>> 
>> Somehow, I accidentally mis-specified the second LMV physical
>> volume that I added to the volume group. When trying to activate
>> the LV filesystem, the device mapper now complains:
>> 
>> LOG ENTRY
>> table: 253:3: sdc2 too small for target: start=2048, len=1048584192, dev_size=1048577586
>> 
>> As you can see, the length is greater than the device size.
> 
> I've run into something like this.  The issue was that the device was
> reporting the incorrect size.  It turned out to be buggy firmware in the SATA/USB adapter.  Using another adapter or connecting the drive directly
> to SATA made the problem go away.
> 
> You didn't mention the crucial details of which PV was on which kind of
> device.
> 
> You could try pvresize on sdc2, which could succeed if it won't invalidate
> any extents.  The size difference is small.
> 
> You might have changed the partition table on sdc, and the change would
> be written to disk (with a warning) but wouldn't be seen until you rebooted.
> 
> As long as the origin didn't change, pvresize will fix it, at most losing
> one extent at the end of sdc2.  (Size difference is 6606 sectors, ~3M.)

The system is a Dell PowerEdge 1900 and the PV is on a PERC 5 RAID controller. Other PVs on the same disk array appear to function fine.

Here I issued the pvresize command:

[root@zeus] pvresize /dev/sdc2
  /dev/sdc2: cannot resize to 127999 extents as 128001 are allocated.
  0 physical volume(s) resized / 1 physical volume(s) not resized

No bueno.

--RP
