Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATFdXRF014652
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 10:39:33 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATFdO8D029268
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 10:39:25 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PN5p5-00011d-97
	for linux-lvm@redhat.com; Mon, 29 Nov 2010 07:39:23 -0800
Date: Mon, 29 Nov 2010 09:39:20 -0600
From: Ray Morris <support@bettercgi.com>
References: <AANLkTi=CJCVsGbmmtUGEiWXSXLDVq=cc=ZaYSmUpn1HN@mail.gmail.com>
In-Reply-To: <AANLkTi=CJCVsGbmmtUGEiWXSXLDVq=cc=ZaYSmUpn1HN@mail.gmail.com>
	(from yanghatespam@gmail.com on Sat Nov 27 21:58:18 2010)
Message-Id: <1291045160.1076.29@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How to grow LVM and underlying partition?
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

use fdisk -u to be sure the new, larger partition starts
with the exact same sector as the old, smaller one.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/27/2010 09:58:18 PM, Yang Zhang wrote:
> I was messing around with a VM running Ubuntu 10.04 Server (64-bit)
> with LVM on a single 4GB disk. I just used the installer's automatic
> LVM setup and I landed with (ignore the disk size - that was after I
> resized the disk to be 8GB):
> 
> <<<
> Disk /dev/sda: 8589 MB, 8589934592 bytes
> 255 heads, 63 sectors/track, 1044 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> Sector size (logical/physical): 512 bytes / 512 bytes
> I/O size (minimum/optimal): 512 bytes / 512 bytes
> Disk identifier: 0x0004b903
> 
>    Device Boot      Start         End      Blocks   Id  System
> /dev/sda1   *           1          32      248832   83  Linux
> Partition 1 does not end on cylinder boundary.
> /dev/sda2              32         523     3942401    5  Extended
> Partition 2 does not end on cylinder boundary.
> /dev/sda5              32         523     3942400   8e  Linux LVM
> >>>
> 
> Ubuntu also made the LVM house just a root FS and a 512M swap.
> 
> At this point, I grew the underlying disk to 8GB using the VM
> management software, then booted into the VM and tried to figure out
> how to grow my swap and root FS. Reading man pvresize:
> 
> <<<
> ...
> EXAMPLES
> Expand the PV on /dev/sda1 after enlarging the partition with fdisk
> pvresize /dev/sda1
> ...
> >>>
> 
> This made me figure I had to first enlarge the partition with fdisk.
> So I tried deleting the extended partition 2 (which also deleted the
> logical partition 5 housing LVM), then recreating both partitions but
> this time using all cylinders (with the same partition numbers and
> also setting the logical partition's type to 8e for Linux LVM). Alas,
> that failed - I rebooted at that point, but the VM would no longer
> boot. (Sorry I didn't jot down the exact error message(s), but there
> was something about the /dev/mapper/testbox-root not being found - I
> can retry the whole experiment if this message is critical.)
> 
> So is what I'm trying to do possible? What's the right way to go about
> it? Thanks in advance.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
