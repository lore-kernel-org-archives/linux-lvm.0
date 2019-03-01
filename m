Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 035715D717
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 01:24:31 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81B71307ACE4
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 01:24:29 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id i12so24122066wrw.0
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 17:24:29 -0800 (PST)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
Date: Fri, 1 Mar 2019 02:24:24 +0100
MIME-Version: 1.0
In-Reply-To: <11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
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

On 28/02/19 09:41, Ingo Franzki wrote:
> Well, there are the following 2 commands:
> 
> Get physical block size:
>   blockdev --getpbsz <device>
> Get logical block size:
>   blockdev --getbsz <device>

I didn't know the blockdev command and, to recap, we have:
--getpbsz: physical sector size
--getss: logical sector size
--getbsz: blocksize used internally by the kernel

getpbsz/getss correspond to physical/logical sector size reported by 
fdisk, smartctl, etc.

> Filesystems seem to care about the physical block size only, not the logical block size.
> 
> So as soon as you have PVs with different physical block sizes (as reported by blockdev --getpbsz) I would be very careful...

I've done the test suggested by Stuart and it seems to contradict this.
I have pvmoved data from a 512/512 (logical/physical) disk to a newly 
added 512/4096 disk but I had no data corruption. Unfortunately I 
haven't any native 4k disk to repeat the same test.

Here is what I've done.
/dev/sdb: SSD with 512/512 sector size
/dev/sdc: mechanical disk with 512/4096 sector size

# blockdev -v --getss --getpbsz --getbsz /dev/sdb
get logical block (sector) size: 512
get physical block (sector) size: 512
get blocksize: 4096

# blockdev -v --getss --getpbsz --getbsz /dev/sdc
get logical block (sector) size: 512
get physical block (sector) size: 4096
get blocksize: 4096

# pvcreate /dev/sdb4
# vgcreate vgtest /dev/sdb4
# lvcreate -L 1G vgtest /dev/sdb4
# mkfs.ext4 /dev/mapper/vgtest-lvol0
# mkdir /media/test
# mount /dev/mapper/vgtest-lvol0 /media/test
# cp -a SOMEDATA /media/test/
# umount /media/test
# fsck.ext4 -f /dev/mapper/vgtest-lvol0

Filesystem created and no error on it. Now the disk with different 
physical size:

# pvcreate /dev/sdc1
# vgextend vgtest /dev/sdc1
# pvmove /dev/sdb4 /dev/sdc1
# fsck.ext4 -f /dev/mapper/vgtest-lvol0
# mount /dev/mapper/vgtest-lvol0 /media/test
# ls /media/test/

The fsck command reports no errors, the filesystem is mountable and the 
data is there.

Looks like physical sector size didn't matter here. Or I'm missing 
something?

Cesare.
