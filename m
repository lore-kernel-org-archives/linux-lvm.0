Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2Bfaqa026632
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 07:41:36 -0400
Received: from kenny.oneemedia.com (mail-o.oneemedia.com [92.240.244.203])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2BfYqO030884
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 07:41:34 -0400
Received: from MPODMAKA1.emea.hpqcorp.net (mail-o.oneemedia.com
	[92.240.244.203]) (Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTPA id 862CC20009A
	for <linux-lvm@redhat.com>; Wed,  2 Nov 2011 12:41:30 +0100 (CET)
Date: Wed, 2 Nov 2011 12:41:29 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <581100587.20111102124129@marki-online.net>
In-Reply-To: <4EB1190A.30501@ankh.org>
References: <604704853.1651560.1320172792894.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
	<4EB1190A.30501@ankh.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
	Volume Group ?
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Wednesday, November 2, 2011, 11:18:50, James Hawtin wrote:

> Personally even with LVM I would still write a partition table the disk,
> this helps show the disk as being used to other system administrators,
> however there would be one partition on it of type 8e, and on that I 
> would create a PV (physical volume), this PV can then be used to create

How do you extend the PV then? For example extend the LUN on storage
or just resize a RAID1+0 set by adding 2 new disks... Resizing the
block device is no problem, resizing the PV also, but to resize the
PV, you need to resize the partition also - and if I remember well,
the kernel won't re-read the new partition table while it is used...


-- 
  bYE, Marki
