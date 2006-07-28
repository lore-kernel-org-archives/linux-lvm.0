Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6SEMxpf020069
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 10:22:59 -0400
Received: from nexredback-216-168-119-94.nexicom.net (mail.fibrespeed.net
	[216.168.105.35] (may be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6SEMuML022848
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 10:22:56 -0400
Message-ID: <44CA1DB7.10609@mikebabcock.ca>
Date: Fri, 28 Jul 2006 10:22:47 -0400
From: "Michael T. Babcock" <mtb@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Performance impact of LVM
References: <20060727120250.GB17454@freshdot.net>	<44C8DC2D.3000408@conterra.de>
	<Pine.LNX.4.64.0607280846060.6888@mhw.ulib.iupui.edu>
In-Reply-To: <Pine.LNX.4.64.0607280846060.6888@mhw.ulib.iupui.edu>
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

Mark H. Wood wrote:
> However this effect is probably down in the noise for most systems.  
> The only way to know if it's a problem for you is to measure.  I would 
> expect that, given contemporary amounts of caching on the drive, the 
> controller, and in the OS, you probably won't see it unless you are 
> driving your storage *really* hard.  If you do, dump/recreate 
> contiguously/restore will make it go away.

For database partitions we always use "lvcreate -C y" when creating LVs 
for this reason, for every other area of the system however, I haven't 
noticed almost any impact of LVM(1 or 2) except that striping is easier 
to set up than using RAID0 because there's no need to repartition.

For example, I often do something like:

lvcreate -C y -n dbdata1 -L 100G mainstore
lvcreate -I 2 -n dbtemp -L 10G mainstore
