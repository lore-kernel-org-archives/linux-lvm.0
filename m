Message-ID: <3F663873.6070008@gbrmpa.gov.au>
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Single snapshots do weird things?
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
Date: Mon Sep 15 17:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Since my last message to the list, when I found I was using an old
version of the driver(4.0.2), I've done a completly new install
of the kernel.org 2.4.21 sources, and the device-mapper.1.00.05 and
LVM2.2.00.06 tarballs. This is still on Debian unstable, but no
Debian lvm packages or kernel patches are installed this time.

I've patched the kernel with the device-mapper and VFS patch,
compiled and installed both tarballs, and can insmod the dm-mod
with no errors.

Now, when I copy 2Mb onto the filesystem and create an 8Mb snapshot,
it's immediately flagged INACTIVE, "Allocated to snapshot" is 100%
and is not mountable.

I'm using a 256k PE size and a 512Mb LV on a 10Gb disk.

Here's the sequence of commands, with output omitted where the command
works normally.

lvm:~# pvcreate /dev/hdb
lvm:~# vgcreate -s 256k vg0 /dev/hdb
lvm:~# vgdisplay vg0
   --- Volume group ---
   VG Name               vg0
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  1
   VG Access             read/write
   VG Status             resizable
   MAX LV                256
   Cur LV                0
   Open LV               0
   Max PV                256
   Cur PV                1
   Act PV                1
   VG Size               9.54 GB
   PE Size               256.00 KB
   Total PE              39092
   Alloc PE / Size       0 / 0
   Free  PE / Size       39092 / 9.54 GB
   VG UUID               w7c4AZ-nmm5-BI4q-#OAm-yvSc-E0eh-#dRhSk

lvm:~# lvcreate -L 512m -n lv0 vg0
lvm:~# lvdisplay /dev/vg0/lv0
   --- Logical volume ---
   LV Name                /dev/vg0/lv0
   VG Name                vg0
   LV UUID                fAfvNg-fBhr-DCWS-Gwm6-RWfX-hHpz-EPi7zn
   LV Write Access        read/write
   LV Status              available
   # open                 0
   LV Size                512.00 MB
   Current LE             2048
   Segments               1
   Allocation             next free (default)
   Read ahead sectors     0
   Block device           254:0

lvm:~# mke2fs /dev/vg0/lv0
lvm:~# mount /dev/vg0/lv0 fs
lvm:~# df -k fs
/dev/vg0/lv0            507748        13    481521   1% /root/fs
lvm:~# cp -R /usr/src/device-mapper.1.00.05* fs
lvm:~# sync
lvm:~# df -k fs
/dev/vg0/lv0            507748      2028    479506   1% /root/fs
lvm:~# lvcreate -s -L 8m -p r -n snap0 -d -v /dev/vg0/lv0
     Setting chunksize to 16 sectors.
     Finding volume group "vg0"
     Creating logical volume snap0
     Archiving volume group "vg0" metadata.
     Creating volume group backup "/etc/lvm/backup/vg0"
     Found volume group "vg0"
     Loading vg0-snap0
     Found volume group "vg0"
     Zeroing start of logical volume "snap0"
     Found volume group "vg0"
     Removing vg0-snap0
     Found volume group "vg0"
     Found volume group "vg0"
     Found volume group "vg0"
     Loading vg0-lv0-real
     Loading vg0-snap0-cow
     Loading vg0-snap0
     Loading vg0-lv0
     Creating volume group backup "/etc/lvm/backup/vg0"
   Logical volume "snap0" created
lvm:~# lvdisplay /dev/vg0/snap0
   --- Logical volume ---
   LV Name                /dev/vg0/snap0
   VG Name                vg0
   LV UUID                WL5TXy-gE0H-jQu!-BJod-XPmk-WnFL-VVgLus
   LV Write Access        read only
   LV snapshot status     INACTIVE destination for /dev/vg0/lv0
   LV Status              available
   # open                 0
   LV Size                512.00 MB
   Current LE             2048
   Segments               1
   Snapshot chunk size    8.00 KB
   Allocated to snapshot  100.00%
   Allocation             next free (default)
   Read ahead sectors     0
   Block device           254:4

lvm:~# mount -t ext2 /dev/vg0/snap0 snap/
mount: block device /dev/vg0/snap0 is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/vg0/snap0,
        or too many mounted file systems

My syslog now shows

device-mapper: 4.0.4-ioctl (2003-08-30) initialised: dm@uk.sistina.com
device-mapper: snapshot is marked invalid
EXT2-fs: unable to read superblock

Here's some version numbers:

lvm:~# lvm version
   LVM version:     2.00.06 (2003-08-20)
   Library version: 1.00.05-ioctl-cvs (2003-09-01)
   Driver version:  4.0.4

lvm:~# uname -a
Linux lvm 2.4.21-dm #1 Fri Sep 12 12:52:48 EST 2003 i686 GNU/Linux

lvm:~# gcc -v
Reading specs from /usr/lib/gcc-lib/i386-linux/2.95.4/specs
gcc version 2.95.4 20011002 (Debian prerelease)

lvm:/usr/src# lsmod
Module                  Size  Used by    Not tainted
dm-mod                 40364   7
3c59x                  25096   1
af_packet              11976   1
rtc                     6236   0  (autoclean)
unix                   14020   4  (autoclean)

Thanks, glen.
