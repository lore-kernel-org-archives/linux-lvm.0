Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56GaIO04798
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:36:18 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j56GaC9S017677
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:36:16 -0400
Message-ID: <42A47B70.4060000@berbee.com>
Date: Mon, 06 Jun 2005 11:36:00 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] grub and lvm
References: <1118074394.4482.2.camel@rich>
In-Reply-To: <1118074394.4482.2.camel@rich>
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

You may want to create a Linux LVM partition, and using that in lvm 
(pvcreate /dev/hdb1)...


rich turner wrote:

>i have a volume group built on a physical volume that is the
>disk /dev/hdb. when i write the grub bootloader to that disk, it appears
>that the bootloader overwrites part or all of the lvm data on that disk,
>essentially wiping out my volume group. does anyone know if that is
>normal or if lvm and grub indeed share the same place on the disk?
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>  
>

-- 

----------------------------------------------------------------------
Alan W. Jurgensen - Berbee Information Networks - jurgensen@berbee.com 
