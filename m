Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F21E819CBB
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 03:42:09 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC21430DBC08
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 03:42:07 +0000 (UTC)
Date: Thu, 28 Feb 2019 22:41:58 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
Message-ID: <alpine.LRH.2.21.1902282235090.22202@fairfax.gathman.org>
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
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

On Fri, 1 Mar 2019, Cesare Leonardi wrote:

> I've done the test suggested by Stuart and it seems to contradict this.
> I have pvmoved data from a 512/512 (logical/physical) disk to a newly added 
> 512/4096 disk but I had no data corruption. Unfortunately I haven't any 
> native 4k disk to repeat the same test.

Use a loopback device with logical block size set to 4096 to confirm
that your test does detect corruption (using the same LV, filesystem,
data).

I believe by "physical sector", the original reporter means logical,
as he was using an encrypted block device that was virtual - there
was no "physical" sector size.  It was "physical" as far as the
file system was concerned - where "physical" means "the next layer
down".

Indeed, even the rotating disk drives make the physical sector size
invisible except to performance tests.  SSD drives have a "sector" size
of 128k or 256k - the erase block, and performance improves when aligned
to that.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
