Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42F6H84018435
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:06:17 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m42F5GPO001232
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 11:05:18 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 995B1200092
	for <linux-lvm@redhat.com>; Fri,  2 May 2008 17:05:15 +0200 (CEST)
Date: Fri, 2 May 2008 17:05:14 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <19210404265.20080502170514@marki-online.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481B299E.7040509@redhat.com>
References: <Pine.LNX.4.44.0805021022270.30479-100000@bmsred.bmsi.com>
	<481B299E.7040509@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: Marek Podmaka <marki@marki-online.net>,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Friday, May 2, 2008, 16:47:58, Bryn M. Reeves wrote:

> - -P | --partial
>  When set, the tools will do their best to provide access to volume
>  groups that are only partially available.  Where part of a logical
>  volume is missing, /dev/ioerror  will be substituted, and you could use
>  dmsetup (8) to set this up to return I/O errors when accessed, or
>  create it as a large block device of nulls.  Metadata may not be
>  changed with this option. To insert a replacement physical volume of
>  the same or large size use pvcreate -u to set the uuid to match the
>  original followed by vgcfgrestore (8).

> You can also choose the device used for mapping segments on any
> incomplete logical volumes by setting the missing_stripe_filler
> parameter in the activation section of lvm.conf.

It is not the same. I was doing this about 2 years ago when one HDD
died and I wanted to recover as much data as possible (I mean data
changes since last backup), but it was not possible to activate the VG
with missing PV (or activate only read-only, which prevented me from
mounting the filesystem, because it required fsck, which cannot be
done on readonly lvol). I had to google quite a lot on how to create
this "virtual" PV with dmsetup which returned all zeros (or I/O
errors). It had to be the same size as original (but fortunately you
can create 100 GB sparse file in RAM and use loop to turn it into
PV)... But this is only for recovery - you are making "virtual"
identical PV instead of the original missing... So it is definitely
not the same as activating VG/LV with missing PV.


-- 
  bYE, Marki
