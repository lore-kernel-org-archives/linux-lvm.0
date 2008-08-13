Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7D9hqKA021602
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 05:43:52 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7D9het5018147
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 05:43:41 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 60E3A2001FA
	for <linux-lvm@redhat.com>; Wed, 13 Aug 2008 11:43:39 +0200 (CEST)
Date: Wed, 13 Aug 2008 11:43:38 +0200
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <325343817.20080813114338@marki-online.net>
Subject: Re: [linux-lvm] LVM with large arrays,
	one large or mutiple small PV's?
In-Reply-To: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
References: <54AA5D29CDD96948959171E0DF2990295352@EMC1.uvic.ca>
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

Tuesday, August 12, 2008, 5:53:26, David S. Broome wrote:

> Hello - This is a best practices style question.
> LVM with large arrays, one large or mutiple small PV's?

> What is the suggested physical partition layout with large hardware
> RAID arrays (is NAS or SAN) in the case where there can be one VG?
> ie I have two Raid 5 Arrays that can either present one large
> logical volume ie 3.5T and 2.9T each or a multiple smaller logical volumes ie 500G.

I think from LVM side it doesn't matter if you have 10x PV of size 100
GB or 1 PV of size 1 TB. But it really depends on the SAN disk array
you have and how it handles each virtual disk. Does it have queues,
caches for each vdisk or for the entire array? For example for HP EVA
arrays it is recommended to prefer smaller vdisks if possible.

If array has for example queue for 100 outstanding requests per vdisk
then it means 100 req for 1 TB vdisk, or 10x100 req for the same 1TB
over 10 vdisks.

The same applies also for OS. Don't know how are the defaults on
linux, but for HP-UX we have to increase scsi queue depth for large
disks.

Also more PV is better when you somewhere in future want to shrink the
VG... you just pvmove some data and can remove PV. This can't be done
when you will have only one big PV.


-- 
  bYE, Marki
