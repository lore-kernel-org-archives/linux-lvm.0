Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2V0SBW2031685
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 20:28:11 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2V0S6DG019392
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 20:28:07 -0400
Date: Wed, 30 Mar 2011 20:27:52 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <20110330132837.07e8d0ea@bettercgi.com>
Message-ID: <alpine.LRH.2.00.1103302019060.412@bmsred.bmsi.com>
References: <20110329124814.7fd059c7@bettercgi.com>
	<784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>
	<5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>
	<20110330132837.07e8d0ea@bettercgi.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] copy lv from lv?
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
Cc: ooolinux@163.com

On Wed, 30 Mar 2011, Ray Morris wrote:

>> 1..how to pipe two copy  together
>
> This is what I use after some experimenting.  I've found
> it's often far faster than the more obvious use of dd:
>
> nice -5 dd if=/dev/clones/from bs=64M iflag=direct |
>        dd of=/dev/scratch/to bs=64M oflag=direct
>
> I use 64 MB extents. For smaller extents, a matching dd
> block size might be good.

Thanks for that recipe.  It ought to be in lvm2 as an lvcopy utility
(dynamically determining extent size, etc).

>> 2.i take lv as xen-guestOS's  disk. usually many  guestOS created
>> from one lv(called template), maybe many data is readonly, so  if  so
>> many lvs share readonly part ,and have its private data? COW save
>> disk space, and take less time. i do not think snapshot is sutable
>> for this case. thanks

As long as the origin is not often modified, having many snapshots
is efficient.  Each write to the origin will of course entail a write
to each snapshot.  (And as I discovered recently, if write barriers are
disabled or buggy at any hardware or software layer, a power failure during
heavy writes to the origin is particularly vulnerable to write reordering 
corrupting a snapshot.  So make sure UPS is working before updating the
origin.)

--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
