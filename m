Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33D9C608C1
	for <linux-lvm@redhat.com>; Mon,  4 Mar 2019 22:10:34 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B82173082AEE
	for <linux-lvm@redhat.com>; Mon,  4 Mar 2019 22:10:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id c13so772437wmb.0
	for <linux-lvm@redhat.com>; Mon, 04 Mar 2019 14:10:32 -0800 (PST)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
Date: Mon, 4 Mar 2019 23:10:22 +0100
MIME-Version: 1.0
In-Reply-To: <1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
Content-Language: it-IT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Franzki <ifranzki@linux.ibm.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 04/03/19 10:12, Ingo Franzki wrote:
>> # blockdev -v --getss --getpbsz --getbsz /dev/sdb
>> get logical block (sector) size: 512
>> get physical block (sector) size: 512
>> get blocksize: 4096
> You display the physical block size of /dev/sdb here, but you use /dev/sdb5 later on.
> Not sure if this makes a difference ....

I thought that was the right thing to do, as they are disk parameters. 
At least the first two, for the last I'm not sure.
However the output looks the same:
# blockdev -v --getss --getpbsz --getbsz /dev/sdb5
get logical block (sector) size: 512
get physical block (sector) size: 512
get blocksize: 4096

# blockdev -v --getss --getpbsz --getbsz /dev/sdc2
get logical block (sector) size: 512
get physical block (sector) size: 4096
get blocksize: 4096

> Please note that fsck.ext4 does not seem to detect this kind of corruption.
> In my case fsck.ext4 reported that the FS would be clean (!), but a mount count not mount it anymore...
> 
> Do a 'pvs' command here, this should show some error messages.

Uh, I didn't really expect that such corruption could pass unoticed an 
fsck.ext4 check. During my tests, initially I surely tried to mount the 
filesystem and I did ls on it but it's possible that after some steps I 
only trusted fsck.

Today I repeated all the tests and indeed in one case the mount failed: 
after pvmoving from the 512/4096 disk to the 4096/4096 disk, with the LV 
ext4 using 1024 block size.

Here is what I've tested:
/dev/sdb: SSD with 512/512 sector size
/dev/sdc: mechanical disk with 512/4096 sector size
/dev/loop0: emulated disk with 4096/4096 sector size

TEST 1
VG vgtest1: /dev/sdb4 /dev/sdc1 /dev/loop0p1
LV vgtest1-lvol0: filesystem ext4 with 4096 block size
pvmove ext4-4096:
- from /dev/sdb4 (512/512) to /dev/sdc1 (512/4096): ok
- from /dev/sdc1 (512/4096) to /dev/loop0p1 (4096/4096): ok

TEST 2
VG vgtest2: /dev/sdb5 /dev/sdc2 /dev/loop0p2
LV vgtest2-lvol0: filesystem ext4 with 1024 block size
pvmove ext4-1024:
- from /dev/sdb5 (512/512) to /dev/sdc2 (512/4096): ok
- from /dev/sdc2 (512/4096) to /dev/loop0p2 (4096/4096): fail

Here the outputs of the failed test:
=======================
# pvmove /dev/sdc2 /dev/loop0p2
   /dev/sdc2: Moved: 9,00%
   /dev/sdc2: Moved: 100,00%

# mount /dev/mapper/vgtest2-lvol0 /media/test/
mount: /media/test: wrong fs type, bad option, bad superblock on
/dev/mapper/vgtest2-lvol0, missing codepage or helper program, or other
error.

# fsck.ext4 -f  /dev/mapper/vgtest2-lvol0
e2fsck 1.44.5 (15-Dec-2018)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/mapper/vgtest2-lvol0: 35/102400 files (17.1% non-contiguous), 
304877/409600 blocks
=======================

The error happened where you guys expected. And also for me fsck showed 
no errors.

But doesn't look like a filesystem corruption: if you pvmove back the 
data, it will become readable again:
# pvmove /dev/loop0p2 /dev/sdc2
   /dev/loop0p2: Moved: 1,00%
   /dev/loop0p2: Moved: 100,00%
# mount /dev/mapper/vgtest2-lvol0 /media/test/
# ls /media/test/
epson  hp  kerio  lost+found

And also notice that the pvmove that generated the unreadable filesystem 
starts with an unusual high percentage (9%). In all other test it start 
from 0% or a small number near 1%. This happened in more that one case.

Cesare.
