Message-ID: <36DEC203.C9CCD889@notes.seagate.com>
Date: Thu, 04 Mar 1999 11:25:23 -0600
From: Steve Brueggeman <steve_brueggeman@notes.seagate.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problems with LVM 0.6
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

First off, I had trouble compiling the tools.  I got a warning that
"LVM_BLK_MAJOR" was undeclared, when compiling
tools/lib/lvm_tab_get_free_blk_dev.c

Since I could not find any defination anywhere for LVM_BLK_MAJOR, I
assumed that some sort of name change was not properly propegated, and
renamed all occurances of "LVM_BLK_MAJOR" to "LVM_BLOCK_MAJOR" in
tools/lib/lvm_tab_get_free_blk_dev.c, and the compile completed
successfully.

However,
I am now having problems when creating a second Logica volume.  These
are the steps I took

Using fdisk, created  3 partitions, /dev/sdb2, /dev/sdb3, and /dev/sdb4,
and set the partition type to FE. (Note that /dev/sdb1 is a swap
partition).

pvcreate /dev/sdb[23]
vgcreate test_vg /dev/sdb[23]
lvcreate -L1500 -nlv1 test_vg
mke2fs /dev/test_vg/lv1
(this created a very small filesystem.  Apperently the -L is not
assuming a size modifier of Megabyte)

I deleted the test logical volume with
lvremove -f /dev/test_vg/lv1

and created two new logical volumes with

lvcreate -L1500M -nlv1 test_vg
lvcreate -L3G -nlv2 test_vg
mke2fs /dev/test_vg/lv1
mke2fs /dev/test_vg/lv2

mount /dev/test_vg/lv1 /mnt1 
suceeded, but
mount /dev/test_vg/lv2 /mnt2
said that either lv2 or mnt2 was already mounted

I did a ls -l of /dev/test_vg and have the following

total 0
crw-r-----   1 root     root     109,   0 Mar  4 10:54 group
brw-r-----   1 root     root      58,   0 Mar  4 10:55 lv1
brw-r-----   1 root     root      58,   0 Mar  4 10:56 lv2

Why do lv1 and lv2 have the exact same major and minor values???  
Is this related to my possibly incorrect assumption above that
LVM_BLK_MAJOR needed to be renamed to LVM_BLOCK_MAJOR????

Has anybody else seen problems like this? 
Or is it something that I've done wrong?  
Anybody out there who can help me?


Steve Brueggeman
steve_brueggeman@notes.seagate.com
stevebr@primenet.com
