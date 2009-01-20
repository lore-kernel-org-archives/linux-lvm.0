Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0K9Yo2x014536
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:34:50 -0500
Received: from mailstore03.fastname.no (mailstore03.fastname.no [85.19.150.34])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0K9YaVR029417
	for <linux-lvm@redhat.com>; Tue, 20 Jan 2009 04:34:37 -0500
Received: from [84.49.98.33] (helo=[192.168.3.25])
	by mailstore03.fastname.no with esmtpa (Exim 4.69)
	(envelope-from <morten@mortent.org>) id 1LPD0F-0002Km-9P
	for linux-lvm@redhat.com; Tue, 20 Jan 2009 10:34:35 +0100
Message-ID: <49759AAD.4070608@mortent.org>
Date: Tue, 20 Jan 2009 10:34:37 +0100
From: Morten Torstensen <morten@mortent.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2GB limit
References: <4975932A.6090902@bortal.de>
In-Reply-To: <4975932A.6090902@bortal.de>
Content-Transfer-Encoding: 7bit
Reply-To: morten@mortent.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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

ml@bortal.de wrote:
> Hello List,
> 
> i have a 32bit Linux box with a 3Ware Raidcontroller and 4x 1TB disks. 
> After installing Debian Etch i had to find out that i am running into 
> some limits.
> 
> Is there a way to use a Partition >2GB with 32Linux/LVM?

You hit the 2TB partition max size (I assume you mean 2TB and not 2GB).

With LVM you can use physical disks as a PV, e.g /dev/sdb instead of 
/dev/sdb1. If you need to boot from the disk too, then you have to use a 
partition table. With such a small RAID anyway, your easiest option in 
that case is to create one root disk (and a /boot), say 20-30GB, on a 
root vg, then two more partitions with the rest of the space and use 
them as PVs for another vg for data/apps.

You can also put all three partitions into one VG if you prefer that.

-- 

//Morten Torstensen
//Email: morten@mortent.org
//IM: morten.torstensen@gmail.com

I can't listen to that much Wagner. I start getting the urge to conquer 
Poland.
	-- Woody Allen
