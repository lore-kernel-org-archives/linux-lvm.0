Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBNARrOO031760
	for <linux-lvm@redhat.com>; Tue, 23 Dec 2008 05:27:53 -0500
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBNARcDC016707
	for <linux-lvm@redhat.com>; Tue, 23 Dec 2008 05:27:39 -0500
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 4691F20009D
	for <linux-lvm@redhat.com>; Tue, 23 Dec 2008 11:27:37 +0100 (CET)
Date: Tue, 23 Dec 2008 11:27:36 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <11910503774.20081223112736@marki-online.net>
Subject: Re: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?
In-Reply-To: <5440B12A673140C89F22744165C88838@analytical>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
	<1229884467.5412.26.camel@localhost.localdomain>
	<5440B12A673140C89F22744165C88838@analytical>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Tuesday, December 23, 2008, 1:15:28, Steve Costaras wrote:

> - What are the limits on PE/LE's per logical volume (>200,000,000? A
> problem?)  (I will be attaching multiple external chassis like above to
> several HBA's and will be using LVM striping to increase performance.   So a
> small PE size (4MB-8MB) would be best to aid in the distribution of requests
> across the physical subsystems.)

I think 4-8 MB for PE size is too small when you will be using such
big (and probably advanced arrays).
LVM stripping (strip size in hundreds of kB) would kill any array,
because when you request for example 512 kB from one array and next
512 kB from another array, they can't handle it efficiently. You won't
see the benefit of reading from all 16 spindles - everytime it will
just load 512 kB from one physical disk. Also detection of sequential
read might not work well in array in this case.

In HP-UX LVM with enterprise arrays like HP EVA or HP XP we use 32-64 MB
PE and enable distribution - that means "stripe" size = PE size.
LE1 = PV1_1
LE2 = PV2_1
LE3 = PV1_2
LE4 = PV2_2 and so on.
Using this you request for example 32 MB from one array. Given the
cache sizes of arrays and readahead, so should get much better
performance, because those 32 MB will be fetched partially from all 16
drives.
Also we don't use ditribution among 2 arrays, just using different
paths to one array (different HBA, different SAN switch and different
array FC controller). We use 2 arrays only for mirroring data to other
datacentre for clusters.
The main reason for us for that PE distribution is that HP-UX does not
have loadbalancing multipath built-in. But even when you will have it,
using more PVs is better because of the architectural limits of arrays
(no. of outstanding request for single virtual drive, scsi queue depth
on server and on array, cache memory limits per virtual drive, etc.)


-- 
  bYE, Marki
