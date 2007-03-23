Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2N1WMA1004430
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 21:32:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2N1WK0d018941
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 21:32:20 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l2N1WEql009368
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 21:32:14 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l2N1WEVG017864
	for <linux-lvm@redhat.com>; Thu, 22 Mar 2007 21:32:14 -0400
Date: Thu, 22 Mar 2007 21:32:14 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] failing hard drive
In-Reply-To: <200703221633.05727.peregrine@openbrainstem.net>
Message-ID: <Pine.LNX.4.44.0703222125390.17837-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 22 Mar 2007, Lamont Peterson wrote:

> If you're not using RAID, might I suggest that you do?  Those 9 disks would 
> make a nice RAID5 or RAID6 array, and LVM works beautifully on top of 
> software RAID, hardware RAID or any combination of both.
> 
> LVM does not provide redundancy (yes, I know it can do mirroring, but I 
> wouldn't suggest that), it's about easily managing lots of storage space.  
> RAID is about reliability/redundancy.  Use the right tool for the right job, 
> and use both tools together to get all the best benefits of both.

In my use, reliability is paramount.  So I prefer RAID1.  You get 
a performance boost for reads as well.  The md based mirrors can be
mounted separately (careful!) if needed for data recovery and bug workarounds.
(E.g. On Centos-3 grub won't install on mirrored boot partition.  So 
unmount md0, setfaulty hdb1, mount hda1 /boot, grub-install, umount hda1,
mount md0, raidhotadd hdb1.)  RAID5 arrays can only be accessed as raid.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
