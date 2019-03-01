Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E20575D9CD
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 07:59:18 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08EBC307D781
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 07:59:17 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x217sX3e006038
	for <linux-lvm@redhat.com>; Fri, 1 Mar 2019 02:59:16 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2qxyweacgm-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 01 Mar 2019 02:59:16 -0500
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <linux-lvm@redhat.com> from <ifranzki@linux.ibm.com>;
	Fri, 1 Mar 2019 07:59:14 -0000
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<alpine.LRH.2.21.1902282235090.22202@fairfax.gathman.org>
From: Ingo Franzki <ifranzki@linux.ibm.com>
Date: Fri, 1 Mar 2019 08:59:13 +0100
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1902282235090.22202@fairfax.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Message-Id: <c4b92bf0-208c-eaf8-bd1c-dcee27bbc2f0@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
To: "Stuart D. Gathman" <stuart@gathman.org>, LVM general discussion and development <linux-lvm@redhat.com>

On 01.03.2019 04:41, Stuart D. Gathman wrote:
> On Fri, 1 Mar 2019, Cesare Leonardi wrote:
> 
>> I've done the test suggested by Stuart and it seems to contradict this.
>> I have pvmoved data from a 512/512 (logical/physical) disk to a newly added 512/4096 disk but I had no data corruption. Unfortunately I haven't any native 4k disk to repeat the same test.
> 
> Use a loopback device with logical block size set to 4096 to confirm
> that your test does detect corruption (using the same LV, filesystem,
> data).
> 
> I believe by "physical sector", the original reporter means logical,
> as he was using an encrypted block device that was virtual - there
> was no "physical" sector size.  It was "physical" as far as the
> file system was concerned - where "physical" means "the next layer
> down".
Well, let me cite from https://www.saout.de/pipermail/dm-crypt/2019-February/006078.html from Ondrej Kozina which is also referenced in my original post:

"dm-crypt advertise itself as a block device with physical sector size 
*at least* equal to encryption sector size. Traditionally it's been only 
512B. So classical dm-crypt mapped over device with phys. sector size = 
512B has no impact. If you mapped dm-crypt over block device with native 
physical sector size = 4096 you got dm-crypt exposing same limits as 
underlying block device. Again no problem. Just internally dm-crypt 
performed encryption on 512B blocks, but it had no impact on exposed limits.

But things get a bit different with encryption sector size > 512B.

If you map dm-crypt with encryption sector size set to 4096B over block 
device with physical sector size = 512B, dm-crypt must increase device 
limits to 4096. Because when it does encryption it must be aligned to 
4096 bytes (and same wrt minimal i/o size)."

> 
> Indeed, even the rotating disk drives make the physical sector size
> invisible except to performance tests.  SSD drives have a "sector" size
> of 128k or 256k - the erase block, and performance improves when aligned
> to that.
> 


-- 
Ingo Franzki
eMail: ifranzki@linux.ibm.com  
Tel: ++49 (0)7031-16-4648
Fax: ++49 (0)7031-16-3456
Linux on IBM Z Development, Schoenaicher Str. 220, 71032 Boeblingen, Germany

IBM Deutschland Research & Development GmbH / Vorsitzender des Aufsichtsrats: Matthias Hartmann
Geschäftsführung: Dirk Wittkopp
Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294
IBM DATA Privacy Statement: https://www.ibm.com/privacy/us/en/
