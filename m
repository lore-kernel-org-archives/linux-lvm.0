Message-ID: <2EDAF6DC7CE9D4118D4C00508BAED31508DFED5D@icex3.cc.ic.ac.uk>
From: "Neil, Mark" <mark.neil@imperial.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] Vol management problems over loopback mounted files
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed May 14 05:06:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Dear All,

I am trying to set up a volume managed file system over ordinary files using
the loopback devices.  However whatever I try seems to work until I try and
actually use any logical volumes as file systems.  Otherwise the volume
management system is completely happy with what I have done according to the
various display utilities 

What am I doing wrong?  

As a simple example of this problem see below (all on a Redhat 9.0 system,
Kernel 2.4.20-9 - also fails in the same way on a Redhat 8 system with a
2.4.18 kernel)

[root@dex root]# dd if=/dev/zero of=/tmp/diskfile0 bs=512M count=1
1+0 records in
1+0 records out
[root@dex root]# dd if=/dev/zero of=/tmp/diskfile1 bs=512M count=1
1+0 records in
1+0 records out
[root@dex root]# dd if=/dev/zero of=/tmp/diskfile2 bs=512M count=1
1+0 records in
1+0 records out
[root@dex root]# losetup /dev/loop0 /tmp/diskfile0
[root@dex root]# losetup /dev/loop1 /tmp/diskfile1
[root@dex root]# losetup /dev/loop2 /tmp/diskfile2
[root@dex root]# pvcreate /dev/loop[0-2]
pvcreate -- physical volume "/dev/loop0" successfully created
pvcreate -- physical volume "/dev/loop1" successfully created
pvcreate -- physical volume "/dev/loop2" successfully created

[root@dex root]# vgcreate test_vg /dev/loop[0-2]
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "test_vg"
vgcreate -- volume group "test_vg" successfully created and activated

[root@dex root]# lvcreate -L768M -n test_lv test_vg
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/test_lv" successfully created

[root@dex root]# mke2fs /dev/test_vg/test_lv
mke2fs 1.32 (09-Nov-2002)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
98304 inodes, 196608 blocks
9830 blocks (5.00%) reserved for the super user
First data block=0
6 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks:
        32768, 98304, 163840

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 33 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.
[root@dex root]# mkdir /mnt/tmp
[root@dex root]# mount /dev/test_vg/test_lv /mnt/tmp
mount: you must specify the filesystem type
[root@dex root]# mount -t ext2 /dev/test_vg/test_lv /mnt/tmp
mount: wrong fs type, bad option, bad superblock on /dev/test_vg/test_lv,
       or too many mounted file systems
[root@dex root]# e2fsck /dev/test_vg/test_lv
e2fsck 1.32 (09-Nov-2002)
Couldn't find ext2 superblock, trying backup blocks...
e2fsck: Bad magic number in super-block while trying to open
/dev/test_vg/test_lv

The superblock could not be read or does not describe a correct ext2
filesystem.  If the device is valid and it really contains an ext2
filesystem (and not swap or ufs or something else), then the superblock
is corrupt, and you might try running e2fsck with an alternate superblock:
    e2fsck -b 8193 <device>

[root@dex root]#

Cheers

Mark Neil
Imperial College
London 
