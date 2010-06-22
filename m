Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5MCcFs6024276
	for <linux-lvm@redhat.com>; Tue, 22 Jun 2010 08:38:15 -0400
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5MCc6va020651
	for <linux-lvm@redhat.com>; Tue, 22 Jun 2010 08:38:06 -0400
Received: by bwz7 with SMTP id 7so1707765bwz.33
	for <linux-lvm@redhat.com>; Tue, 22 Jun 2010 05:38:05 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Jun 2010 14:38:04 +0200
Message-ID: <AANLkTimk8fpjTkBdJKUMNV1BjcbuDp_s7WrNRaWnaJYs@mail.gmail.com>
From: Philippe Cerfon <philcerf@googlemail.com>
Subject: [linux-lvm] does alignment work out of the box now
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi.

I recently stumbled across the whole alignment thingy and read many
email threads and so how to actually do it, but still I guess I do not
fully understand it ^^
It seems however that many works out of the box already, so may I ask
for confirmation whether this is the case in my scenarios.

I'll have basically two setups:
a) SSD -> lvm2 -> dm-crypt/LUKS -> filesystems (ext4, btrfs)
b) 4xHDD -> mdadm/raid6 -> lvm2 -> dm-crypt/LUKS -> filesystems (ext4, btrs)

Now AFAIK there are several things that have to be aligned:
- To the single physical blocks thorugh all layers, so that I e.g.
don't write actually two physical blocks on my SSD when only writing
one logical
- To the stripe sizes of the RAID
- To the extents of LVM
Right?


My kernel is 2.6.34, my lvm2 is 2.02.66, my mdadm is 3.1.2 my
cryptsetup/dm-crypt/LUKS is 1.1.2, my e2fsprogs is 1.41.12.
Please forgive me if md/dm-crypt/filesystem related questions are a
little bit off topic here.


a) AFAIK mdadm automatically determines a aligned stripe size (I guess
a multiple of the physical block size of my HDDs), right?

b) I have the following in my lvm.conf
sysfs_scan = 1
md_component_detection = 1
md_chunk_alignment = 1
data_alignment_detection = 1
data_alignment = 0
data_alignment_offset_detection = 1
Am I right with the following?
- This will automatically get the underlying block size from BOTH the
physical device (SSD) OR the md device (raid6) and "use" the same.
- And it will automatically detect the stripe size, right?
Does this now mean that the extent size is automatically choosen to be
a multiple of the blocksize PLUS the stripe size?
And does it mean that the data-part of PVs is automatically algined to
the blocksize and the stripe size?

When I now create a snapshot, is the chunksize also automatically
aligned as well as the chunks themselves? Or do (how) I have to do
this manully? I guess by using a multiple of the block size _and_
stripe size.


c) Do the LVs themselves publish that info (block size, extent size
and so on) to upper layers (in my case dm-crypt) so that those layers
can choose the right values?

d) I think cryptsetup is able to automatically detect those stuff in
the most recent versions, but I'm not sure if this only works when
dm-crypt is directly on a physical block device or also when it is on
top of mdadm->lvm2

e) Does the filesystem also get the blocksize automatically? Or do I
have to specify it via mke2fs -b <blocksize>

f) I've seen that mke2fs also has the options -f fragments,
stride=stride-size and stripe-width=stripe-width but I have no idea at
all whether and how I have to set them.


g) There are some howtos which say one should create PVs on partitions
rather than whole devices, while other say it's fully ok to have them
directly on the device.
But I think this must also have an impact on all the alignment as I
have 63 more 512 sectors, right? So how should I best do this?


Thanks for your help,
Philippe.


btw: I've already read all the recent posts here regarding alignment,
including that one:
http://osdir.com/ml/linux-lvm/2010-03/msg00032.html
I read $ cat /sys/block/sda/sda1/alignment_offset
0
which I don't understand. I thought having the 63 sectors partition
table in the beginning should destroy the alignment?
