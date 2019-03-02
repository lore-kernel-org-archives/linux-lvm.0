Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 711BD5D9D4
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 01:36:46 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5352C307D855
	for <linux-lvm@redhat.com>; Sat,  2 Mar 2019 01:36:45 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id n2so27736187wrw.8
	for <linux-lvm@redhat.com>; Fri, 01 Mar 2019 17:36:45 -0800 (PST)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
Date: Sat, 2 Mar 2019 02:36:33 +0100
MIME-Version: 1.0
In-Reply-To: <eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
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

Hello Ingo, I've made several tests but I was unable to trigger any 
filesystem corruption. Maybe the trouble you encountered are specific to 
encrypted device?

Yesterday and today I've used:
Debian unstable
kernel 4.19.20
lvm2 2.03.02
e2fsprogs 1.44.5

On 01/03/19 09:05, Ingo Franzki wrote:
> Hmm, maybe the size of the volume plays a role as Bernd has pointed out. ext4 may use -b 4K by default on larger devices.
> Once the FS uses 4K block anyway you wont see the problem.
> 
> Use  tune2fs -l <device> after you created the file system and check if it is using 4K blocks on your 512/512 device. If so, then you won't see the problem when moved to a 4K block size device.

I confirm that tune2fs reports 4096 block size for the 1 GB ext4 
filesystem I've used.
I've also verified what Bernd said: mkfs.ext4 still use 4096 block size 
for a +512M partition, but use 1024 for +500M.

As suggested by Stuart, I also made a test using a 4k loop device and 
pvmoving the LV into it. As you expected, no data corruption.
To do it I've recreated the same setup ad yesterday: 
/dev/mapper/vgtest-lvol0 on /dev/sdb4, a 512/512 disk, with some data on 
it. Then:
# fallocate -l 10G testdisk.img
# losetup -f -L -P -b 4096 testdisk.img
# pvcreate /dev/loop0
# vgextend vgtest /dev/loop0
# pvmove /dev/sdb4 /dev/loop0
# fsck.ext4 -f /dev/mapper/vgtest-lvol0

While I was there, out of curiosity, I've created an ext4 filesystem on 
a <500MB LV (block size = 1024) and I've tried pvmoving data from the 
512/512 disk to 512/4096, then to the 4096/4096 loop device.
New partitions and a new VG was used for that.

The setup:
/dev/sdb5: 512/512
/dev/sdc2: 512/4096
/dev/loop0 4096/4096

# blockdev -v --getss --getpbsz --getbsz /dev/sdb
get logical block (sector) size: 512
get physical block (sector) size: 512
get blocksize: 4096

# blockdev -v --getss --getpbsz --getbsz /dev/sdc
get logical block (sector) size: 512
get physical block (sector) size: 4096
get blocksize: 4096

# blockdev -v --getss --getpbsz --getbsz /dev/loop0
get logical block (sector) size: 4096
get physical block (sector) size: 4096
get blocksize: 4096

# pvcreate /dev/sdb5
# vgcreate vgtest2 /dev/sdb5
# lvcreate -L 400M vgtest2 /dev/sdb5
# mkfs.ext4 /dev/mapper/vgtest2-lvol0

# tune2fs -l /dev/mapper/vgtest2-lvol0
[...]
Block size:               1024
[...]

# mount /dev/mapper/vgtest2-lvol0 /media/test
# cp -a SOMEDATA /media/test/
# umount /media/test
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0

Now I've moved data from the 512/512 to the 512/4096 disk:
# pvcreate /dev/sdc2
# vgextend vgtest2 /dev/sdc2
# pvmove /dev/sdb5 /dev/sdc2
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0

No error reported.
Now I've moved data to the 4096/4096 loop device:
# pvcreate /dev/loop0
# vgextend vgtest2 /dev/loop0
# pvmove /dev/sdc2 /dev/loop0
# fsck.ext4 -f /dev/mapper/vgtest2-lvol0

Still no data corruption.

Cesare.
