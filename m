Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o825uoYN003530
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 01:56:50 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o825ubPK021033
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 01:56:38 -0400
Received: by wwb18 with SMTP id 18so190853wwb.27
	for <linux-lvm@redhat.com>; Wed, 01 Sep 2010 22:56:37 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 2 Sep 2010 01:56:37 -0400
Message-ID: <AANLkTinf2_y2j+i_xNZpiJBQNkkYo7_xv8iLnT-tHpVY@mail.gmail.com>
From: Tom Wizetek <tom@wizetek.com>
Subject: [linux-lvm] Removing a failed PV from VG/LV
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

Can someone please outline the process of removing a failed PV
(without replacing it) from a single VG / single LV? Let's say we just
want to continue using what's left of the LV and accept the data loss.

I'm going to throw some ideas here, so forgive my ignorance if this
sounds utterly stupid. My vague understanding of how it would be done
is as follows (assuming ext2):

# vgreduce --removemissing --force /dev/vg1/lv1
...but this would also remove the one and only LV

# lvcreate -n lv1 vg1

# vgchange -ay vg1

# mount /dev/vg1/lv1 /mnt/lv1
...this would fail because the FS doesn't know about the missing drive
(blocks count would be off)

# fsadm check /dev/vg1/lv1
...would fail being unable to determine FSTYPE of /dev/dm-0

# e2fsck /dev/vg1/lv1
...would produce far too many errors but would eventually complete

# fsadm resize /dev/vg1/lv1
...would fail but at least will give us the current blocks count

# resize2fs /dev/vg1/lv1 1234567890
...fails as well since superblock is fubar

# debugfs -w /dev/vg1/lv1
debugfs: set_super_value blocks_count 1234567890
...fail

# mke2fs -n /dev/vg1/lv1
...to get superblock backups locations

# e2fsck -f -y -b 32768 /dev/vg1/lv1
...check using alternative superblock = fail

# debugfs -w -s 98304 -b 4096 /dev/vg1/lv1
...fail

# mke2fs -S -b 4096 /dev/vg1/lv1
...LAST RESORT (and a really bad idea): rewrite superblock and group
descriptors without touching the inode table and block and inode
bitmaps
# e2fsck -fy dev/vg1/lv1
# mount /dev/vg1/lv1 /mnt/lv1
...now no errors but as expected everything is gone

So, is it at all possible to get the LV back up without an actual
replacement PV? What is the right way to do this? Could we "simulate"
the missing PV (if so, how?) and run vgcfgrestore, then fsck, then
reduce FS and finally reduce VG?

Please provide some suggestions or, if it has been covered before, a
link to a solution. I searched the list archives and found two threads
(one in 2006 and the other in 2009) describing a similar scenario but
no clear instructions on how this should be handled were posted.

Many thanks in advance for any input on this subject.

-- 
TW
