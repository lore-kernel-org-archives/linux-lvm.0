Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA9CSr3s024028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Mon, 9 Nov 2015 07:28:53 -0500
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mx1.redhat.com (Postfix) with ESMTPS id E0DB2C0AEE39
	for <linux-lvm@redhat.com>; Mon,  9 Nov 2015 12:28:52 +0000 (UTC)
Received: by oiww189 with SMTP id w189so74298783oiw.3
	for <linux-lvm@redhat.com>; Mon, 09 Nov 2015 04:28:52 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 9 Nov 2015 14:28:52 +0200
Message-ID: <CAJFSNy5QMgETceG4OvETSPWz_ZWHays36K=L5gYhKm5_qxKuPA@mail.gmail.com>
From: Nikolay Borisov <n.borisov@siteground.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM thin volume cannot be deleted.
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, SiteGround Operations <operations@siteground.com>

Hello,

I've emailed before with the same issue :
https://www.redhat.com/archives/dm-devel/2015-October/msg00171.html

Basically an lvm thin volume cannot be deleted/deactivated since it is
falsely being detected as active:

[root@eusharedlxc4 ~]# lvremove coregroup/c13417
Logical volume coregroup/c13417 contains a filesystem in use.

Now the same things happened on a different server. Here is the state
of the system:

[root@eusharedlxc4 ~]# lvdisplay -v /dev/coregroup/c13417
    Using logical volume(s) on command line.
  --- Logical volume ---
  LV Path                /dev/coregroup/c13417
  LV Name                c13417
  VG Name                coregroup
  LV UUID                kbGSgx-032y-DCdS-Q1ib-dc0b-heqW-dtM9Lr
  LV Write Access        read/write
  LV Creation host, time eusharedlxc4.sgvps.net, 2015-10-08 06:53:13 -0400
  LV Pool name           corepool
  LV Thin origin name    c13416
  LV Status              available
  # open                 1
  LV Size                1.50 TiB
  Mapped size            84.62%
  Current LE             393216
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           252:7

So # open is 1, however this volume is not mounted anywhere:

[root@eusharedlxc4 ~]# grep c13417 /proc/{mounts,swaps}
[root@eusharedlxc4 ~]#

  [root@eusharedlxc4 ~]# losetup -a
/dev/loop0: [fc06]:26937032 (/sdb/backup/tmpsys)
/dev/loop1: [fc07]:26937032 (/sdb/backup/tmpsys)
/dev/loop2: [fc08]:26937032 (/sdb/backup/tmpsys)
/dev/loop3: [fc09]:26937032 (/sdb/backup/tmpsys)
/dev/loop4: [fc06]:26942441 (/sdb/backup/avatar_configs)
/dev/loop5: [fc07]:26941330 (/sdb/backup/avatar_configs)
/dev/loop6: [fc08]:26937191 (/sdb/backup/avatar_configs)
/dev/loop7: [fc09]:26942874 (/sdb/backup/avatar_configs)


Here are the currently loaded dm tables:

[root@eusharedlxc4 ~]# dmsetup table
coregroup-corepool_tmeta: 0 172032 linear 8:16 10807052288
coregroup-vm_to_lxc: 0 614400 thin 252:2 21
coregroup-corepool: 0 10806878208 linear 252:2 0
coregroup-c13419: 0 3221225472 thin 252:2 26
coregroup-c13418: 0 3221225472 thin 252:2 25
coregroup-swap: 0 83886080 thin 252:2 22
coregroup-c13417: 0 3221225472 thin 252:2 24 <--- device to be removed
coregroup-c13416: 0 3221225472 thin 252:2 23
coregroup-corepool-tpool: 0 10806878208 thin-pool 252:0 252:1 8192 0 1
skip_block_zeroing
coregroup-corepool_tdata: 0 10806878208 linear 8:16 174080


Here is the block device topology on the machine:

[root@eusharedlxc4 ~]# lsblk
NAME                                MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                                   8:0    0    50G  0 disk
+-sda1                                8:1    0   488M  0 part /boot
+-sda2                                8:2    0   3.8G  0 part [SWAP]
L-sda3                                8:3    0  45.7G  0 part /
sdb                                   8:16   0   5.2T  0 disk
+-coregroup-corepool_tmeta (dm-0)   252:0    0    84M  0 lvm
¦ L-coregroup-corepool-tpool (dm-2) 252:2    0     5T  0 lvm
¦   +-coregroup-corepool (dm-3)     252:3    0     5T  0 lvm
¦   +-coregroup-vm_to_lxc (dm-4)    252:4    0   300M  0 lvm
¦   +-coregroup-swap (dm-5)         252:5    0    40G  0 lvm  [SWAP]
¦   +-coregroup-c13416 (dm-6)       252:6    0   1.5T  0 lvm  /var/lxc/c13416
¦   +-coregroup-c13417 (dm-7)       252:7    0   1.5T  0 lvm
¦   +-coregroup-c13418 (dm-8)       252:8    0   1.5T  0 lvm  /var/lxc/c13418
¦   L-coregroup-c13419 (dm-9)       252:9    0   1.5T  0 lvm  /var/lxc/c13419
L-coregroup-corepool_tdata (dm-1)   252:1    0     5T  0 lvm
  L-coregroup-corepool-tpool (dm-2) 252:2    0     5T  0 lvm
    +-coregroup-corepool (dm-3)     252:3    0     5T  0 lvm
    +-coregroup-vm_to_lxc (dm-4)    252:4    0   300M  0 lvm
    +-coregroup-swap (dm-5)         252:5    0    40G  0 lvm  [SWAP]
    +-coregroup-c13416 (dm-6)       252:6    0   1.5T  0 lvm  /var/lxc/c13416
    +-coregroup-c13417 (dm-7)       252:7    0   1.5T  0 lvm
    +-coregroup-c13418 (dm-8)       252:8    0   1.5T  0 lvm  /var/lxc/c13418
    L-coregroup-c13419 (dm-9)       252:9    0   1.5T  0 lvm  /var/lxc/c13419

So the particular dm-7 is not mounted anywhere, yet its filesystem is
considered to be in use. The only odd thing is this journalling
process:

[root@eusharedlxc4 ~]# ps aux | grep jbd2/dm-7 | grep -v grep
root     41377  0.1  0.0      0     0 ?        S    Oct14  38:27 [jbd2/dm-7-8]

Which should be gone, given that the filesystem is unmounted. I've
also emailed the ext4 folks regarding this hanging processes since
I've seen it cause other problems but they suggested that this might
be caused by a dm-thin bug, for reference here is the thread:
http://article.gmane.org/gmane.comp.file-systems.ext4/50390

When this situation occurs the only way around it is to reboot the
server and then the volume can be deleted.

Regards,
Nikolay
