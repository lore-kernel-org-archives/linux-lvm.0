Return-Path: <Frederic.BODART@MICH.elf-atochem.fr>
Content-Identifier: lvmcreate_init
Date: Tue, 9 Jan 2001 14:35:56 +0100
From: Frederic BODART <Frederic.BODART@MICH.elf-atochem.fr>
Message-Id: <010109143056Z.WT03137.119*/PN=Frederic.BODART/OU=MICH/O=ATO/PRMD=ELF03/ADMD=ATLAS/C=FR/@MHS>
Subject: [linux-lvm] lvmcreate_initrd don't find module lvm.o
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
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've tried to install root filesystem on a logical volume as explained in the mini "HOWTO boot your root FS OFF oF LVM"
but lvmcreate_initrd doesn't find lvm.o module :

pc031104:~ # lvmcreate_initrd

Logical Volume Manager 0.8 by Heinz Mauelshagen  11/11/1999

lvmcreate_initrd -- this script creates a LVM initial ram disk in /boot/initrd.gz

lvmcreate_initrd -- making ram filesystem
lvmcreate_initrd -- mounting ram filesystem
lvmcreate_initrd -- creating etc/conf.modules
lvmcreate_initrd -- creating new modules.dep
lvmcreate_initrd -- copying files to ram disk
find: /lib/modules/2.2.16/block/lvm.o: No such file or directory
lvmcreate_initrd -- figuring out shared libraries
lvmcreate_initrd -- copying shared libraries to ram disk
lvmcreate_initrd -- creating linuxrc
lvmcreate_initrd -- creating etc/fstab
lvmcreate_initrd -- ummounting ram disk
lvmcreate_initrd -- creating compressed initrd in /boot/initrd.gz
8192+0 records in
8192+0 records out
pc031104:~ #   

pc031104:~ # ls -al /lib/modules/2.2.16/block/
total 128
drwxr-xr-x   2 root     root         1024 Dec  1 17:08 .
drwxr-xr-x  14 root     root         1024 Dec 22 11:43 ..
-rw-r--r--   1 root     root        70648 Aug  2 22:36 DAC960.o
-rw-r--r--   1 root     root        23736 Aug  2 22:36 cpqarray.o
-rw-r--r--   1 root     root         8160 Aug  2 22:36 nbd.o
-rw-r--r--   1 root     root        21644 Aug  2 22:36 xd.o
pc031104:~ # 

If i try to boot with root file system on /dev/vg00/root, kernel is launched but boot fails when mounting root file system.

--> Kernel release is 2.2.16 and the distribution is SuSE 7.0 French release.LVM V0.8-112

LVM is  used for others file systems 

pc031104:~ # df
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda3               147327        46867     92598  34%    /
/dev/vg00/lvol3         991872    381640    559032  41%    /opt
/dev/vg00/lvol4         198299        25    188034   0%    /tmp
/dev/vg00/lvol5        1289400    786880    435960  64%    /usr
/dev/vg00/lvol6         495682     27113    442969   6%    /var
/dev/hda1                22635      2824     18603  13%      /boot                  

How can I obtain lvm.o module?
Regards
