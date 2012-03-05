Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q25MWfFR023604
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 17:32:41 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q25MWeHN001123
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 17:32:40 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q25MVnJq007038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 17:31:49 -0500
Received: from bmsred (bmsred [192.168.9.50])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id q25MVnvT030537
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 17:31:49 -0500
Date: Mon, 5 Mar 2012 17:31:49 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
Message-ID: <alpine.LRH.2.00.1203051720020.30456@bmsred.bmsi.com>
References: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Long ago, Nostradamus foresaw that on Mar 5, Richard Petty would write:

> GOAL: Retrieve a KVM virtual machine from an inaccessible LVM volume.
>
> DESCRIPTION: In November, I was working on a home server. The system
> boots to software mirrored drives but I have a hardware-based RAID5
> array on it and I decided to create a logical volume and mount it at
> /var/lib/libvirt/images so that all my KVM virtual machine image
> files would reside on the hardware RAID.
>
> All that worked fine. Later, I decided to expand that
> logical volume and that's when I made a mistake which wasn't
> discovered until about six weeks later when I accidentally rebooted
> the server. (Good problems usually require several mistakes.)
>
> Somehow, I accidentally mis-specified the second LMV physical
> volume that I added to the volume group. When trying to activate
> the LV filesystem, the device mapper now complains:
>
> LOG ENTRY
> table: 253:3: sdc2 too small for target: start=2048, len=1048584192, dev_size=1048577586
>
> As you can see, the length is greater than the device size.

I've run into something like this.  The issue was that the device was
reporting the incorrect size.  It turned out to be buggy firmware in the 
SATA/USB adapter.  Using another adapter or connecting the drive directly
to SATA made the problem go away.

You didn't mention the crucial details of which PV was on which kind of
device.

You could try pvresize on sdc2, which could succeed if it won't invalidate
any extents.  The size difference is small.

You might have changed the partition table on sdc, and the change would
be written to disk (with a warning) but wouldn't be seen until you rebooted.

As long as the origin didn't change, pvresize will fix it, at most losing
one extent at the end of sdc2.  (Size difference is 6606 sectors, ~3M.)

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
