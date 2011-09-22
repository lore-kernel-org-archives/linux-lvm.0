Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p8MEocUJ027621
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 10:50:38 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8MEob9V021980
	for <linux-lvm@redhat.com>; Thu, 22 Sep 2011 10:50:38 -0400
Date: Thu, 22 Sep 2011 10:50:06 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <4E7AF8E7.1070807@gmail.com>
Message-ID: <alpine.LRH.2.00.1109220927270.17377@bmsred.bmsi.com>
References: <4E784A95.8060709@gmail.com>
	<20110920133023.GA10330@planungsteam-eb.de>
	<4E789BBB.2040903@gmail.com>
	<20110920202334.GA3174@planungsteam-eb.de>
	<4E7AF8E7.1070807@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Debian 64bit get a "Volume vg0 not found" message
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
Cc: Holger Parplies <wopp@planungsteam-eb.de>

On Thu, 22 Sep 2011, Brent Clark wrote:

> I ended, up taking a initrd.img-2.6.32-5-amd64 from another server and 
> placing it in /boot.
> And that worked.
>
> But what I dont understand is, in the chroot environment, I restalled the 
> kernel, lvm2 packages, ran mkinitramfs and update-initramfs. Nothing would 
> work.
>
> So ultimately, I still dont have the solution. :)

A chroot doesn't have enough info to reliably run mkinitrd on RedHat.
I'm assuming the same is true for Debian and mkinitramfs.  Things
like volumegroups work fine - the usual problem is device drivers.

Mkinitrd has --with to include specific drivers.  For instance,

mkinitrd -v --omit-scsi-modules --with=xenblk --with=xennet initrd-2.6.9-100.ELxenU.img 2.6.9-100.ELxenU

To include xen drivers for a virtual machine or

mkinitrd -v --with=megaraid ...


--
 	      Stuart D. Gathman <stuart@bmsi.com>
     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
