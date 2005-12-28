Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBSHIb117708
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2005 12:18:37 -0500
Received: from mta09-winn.ispmail.ntl.com (mta09-winn.ispmail.ntl.com
	[81.103.221.49])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBSHI6pJ018651
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2005 12:18:11 -0500
Received: from aamta11-winn.ispmail.ntl.com ([81.103.221.35])
	by mta09-winn.ispmail.ntl.com with ESMTP id
	<20051228171759.HJLJ8609.mta09-winn.ispmail.ntl.com@aamta11-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2005 17:17:59 +0000
Received: from remain.afraid.org ([213.107.104.166])
	by aamta11-winn.ispmail.ntl.com with ESMTP id
	<20051228171759.PNGQ29634.aamta11-winn.ispmail.ntl.com@remain.afraid.org>
	for <linux-lvm@redhat.com>; Wed, 28 Dec 2005 17:17:59 +0000
Received: from pandora.local ([192.168.178.3])
	by remain.afraid.org with esmtps (TLSv1:AES256-SHA:256) (Exim 4.54)
	id 1Erew0-0001s8-P8
	for linux-lvm@redhat.com; Wed, 28 Dec 2005 17:17:56 +0000
Message-ID: <43B2C8BE.2010401@cantab.net>
Date: Wed, 28 Dec 2005 17:17:50 +0000
From: Zak Kipling <zak.kipling@cantab.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Error in "lvcreate" in LVM2
References: <20051226193622.71516.qmail@web32505.mail.mud.yahoo.com>
In-Reply-To: <20051226193622.71516.qmail@web32505.mail.mud.yahoo.com>
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

natasha patil wrote:

> then  created volume group  using                         :         vgcreate
>     /proc/misc: No entry for device-mapper found
>     Is device-mapper driver missing from kernel?
>     Failure to communicate with kernel device-mapper driver.

I'm not familiar with Mandrake at all, but it looks like the 
device-mapper is neither compiled into your kernel or loaded as a 
module. Try "modprobe dm-mod", which should load the module if it exists 
on your system.

(I'd expect it to be built as a module on most distros' stock kernels -- 
if you've built your own kernel then you need to make sure that you have 
included the device mapper either in the main kernel or as a module -- 
the option is under "Device drivers" -> "Multi-device support (RAID and 
LVM)" -> "Device mapper support".)

Hope this helps,

Zak.
