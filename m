Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3029419724
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 00:12:34 +0000 (UTC)
Received: from mail.gathman.org (mail.gathman.org [70.184.247.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A15359441
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 00:12:31 +0000 (UTC)
Date: Mon, 4 Mar 2019 19:12:24 -0500 (EST)
From: "Stuart D. Gathman" <stuart@gathman.org>
In-Reply-To: <325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
Message-ID: <alpine.LRH.2.21.1903041908110.14821@fairfax.gathman.org>
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
	<325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
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

On Mon, 4 Mar 2019, Cesare Leonardi wrote:

> Today I repeated all the tests and indeed in one case the mount failed: after 
> pvmoving from the 512/4096 disk to the 4096/4096 disk, with the LV ext4 using 
> 1024 block size.
  ...
> The error happened where you guys expected. And also for me fsck showed no 
> errors.
>
> But doesn't look like a filesystem corruption: if you pvmove back the data, 
> it will become readable again:
  ...

THAT is a crucial observation.  It's not an LVM bug, but the filesystem
trying to read 1024 bytes on a 4096 device.  I suspect it could also
happen with an unaligned filesystem on a 4096 device.

-- 
 	      Stuart D. Gathman <stuart@gathman.org>
"Confutatis maledictis, flamis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
