Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j56GjWO07397
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:45:32 -0400
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j56GjWOT020693
	for <linux-lvm@redhat.com>; Mon, 6 Jun 2005 12:45:32 -0400
Received: from rich (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 3607E15789
	for <linux-lvm@redhat.com>; Mon,  6 Jun 2005 09:39:19 -0700 (PDT)
Subject: Re: [linux-lvm] grub and lvm
From: rich turner <rich@storix.com>
In-Reply-To: <42A47B70.4060000@berbee.com>
References: <1118074394.4482.2.camel@rich>  <42A47B70.4060000@berbee.com>
Date: Mon, 06 Jun 2005 09:50:18 -0700
Message-Id: <1118076618.4482.7.camel@rich>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

using a partition works fine. but i am trying to understand why i can't
write my grub bootloader to a disk that is being used as a physical
volume. is grub and lvm using the same part of the disk for its own use?


On Mon, 2005-06-06 at 11:36 -0500, Alan Jurgensen wrote:
> You may want to create a Linux LVM partition, and using that in lvm 
> (pvcreate /dev/hdb1)...
> 
> 
> rich turner wrote:
> 
> >i have a volume group built on a physical volume that is the
> >disk /dev/hdb. when i write the grub bootloader to that disk, it appears
> >that the bootloader overwrites part or all of the lvm data on that disk,
> >essentially wiping out my volume group. does anyone know if that is
> >normal or if lvm and grub indeed share the same place on the disk?
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >  
> >
> 
