Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC70018C54
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 01:52:25 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 784F1C057EC3
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 01:52:24 +0000 (UTC)
Date: Wed, 27 Feb 2019 20:52:04 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
Message-ID: <alpine.LRH.2.21.1902272034560.17954@fairfax.gathman.org>
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Ingo Franzki <ifranzki@linux.ibm.com>

On Thu, 28 Feb 2019, Cesare Leonardi wrote:

> Not to be pedantic, but what do you mean with physical block? Because with 
> modern disks the term is not always clear. Let's take a mechanical disk with 
> 512e sectors, that is with 4k sectors but exposed as 512 byte sectors. Fdisk 
> will refer to it with these terms:
> Sector size (logical/physical): 512 bytes / 4096 bytes
>
> What you are referring as physical size is actually the logical size reported 
> by fdisk, right? And if it's correct, I guess that should be safe to add the 
> above disk with 512e sectors to an LVM storage composed only by disks with 
> real 512 byte sectors. I expect that from the LVM point of view this should 
> not be even considered a mixed sector size setup, even if the real physical 
> sector size of the added disk is 4096 byte.
>
> Do you agree or do you think it would be better to test this specific setup?

I would definitely test it, using the same test script that reproduces the 
problem with loopback devices.

That said, I believe you are right - it should definitely work.  Most of
my drives are 512/4096 logical/phys.  If you actually write a single 512
byte sector, however, the disk firmware will have to do a
read/modify/write cycle - which can tank performance.

hdparm will report logical and physical sector size - but there doesn't
seem to be an option to set logical sectory size.  There really is no
need once you already support a smaller logical sector size, as the
performance hit can be avoided by aligned filesystems with 4k+ block
size (most modern filesystems).

Once I encountered a bug in drive firmware where the R/M/W did not
work correctly with certain read/write patterns (involving unaligned
multi sector writes).  I do not wish that on anyone.  (don't worry,
that drive model is long gone...).

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
