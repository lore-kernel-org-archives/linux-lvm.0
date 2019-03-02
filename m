Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D7155D70A
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 01:46:35 +0000 (UTC)
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDC0B3082B15
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 01:46:33 +0000 (UTC)
Message-ID: <5C79DE6B.2080302@tlinx.org>
Date: Fri, 01 Mar 2019 17:37:47 -0800
From: L A Walsh <lvm@tlinx.org>
MIME-Version: 1.0
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<alpine.LRH.2.21.1902270958001.13312@fairfax.gathman.org>
	<1a22cfdb-e7a7-ad1f-5da7-fefdfd26f62a@linux.ibm.com>
In-Reply-To: <1a22cfdb-e7a7-ad1f-5da7-fefdfd26f62a@linux.ibm.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Cesare Leonardi <celeonar@gmail.com>

On 2/27/2019 9:05 AM, Ingo Franzki wrote:
> Yes that should work:
> # losetup -fP loopbackfile.img --sector-size 4096
> # blockdev --getpbsz /dev/loop0
> 4096
>   
-----
Something I noticed that is troublesome.  When I first got my 4K sectory
size disks, one of the numbers in the kernel listed it as 4K, now ~4-5
years later, that difference no longer appears in the kernel!  To me, this
seems a bit unwise -- as even though these disks are "512_e_"  (a 512 byte
sector size can be emulated but writes will usually or often take a minimum
of 2 revolutions so that the rest of the 4k sector can be read, have
512-bytes
updated, then write the whole 4k sector size out.  In otherwords -- hideous
performance on writes. 

Now the RAID controller that manages this disk also has info on the
disks -- and
there it correctly shows the 4k sector size.  So am wondering what in
the kernel
"broke"(?) to disable detection & display of its native 4k sector size.


Anyway, I don't think it should cause problems unless I reformat or move the
partitions,  but it would be nice to know the various disk software knows
not to try anything smaller than a 4k sector size.
