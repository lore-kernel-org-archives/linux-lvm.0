Message-ID: <3F5E9A43.5010202@gbrmpa.gov.au>
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Multiple snapshots do weird things?
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
Date: Tue Sep  9 22:29:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

 From a few notes here and there, I've been under the impression that
multiple snapshots of a single LV are possible. The problem is that
whenever I try to take more than two, everything falls apart.

I'm running Debian unstable, kernel 2.4.20, with the following packages:
kernel-patch-device-mapper	1.00.03-1
libdevmapper1.0		1.00.03-1
lvm2			2.00.06-1
lvm-common		1.5.9.3

I've also applied the linux-2.4.20-VFS-lock.patch from the device-mapper
1.00.05 tarball at sistina.

The kernel compiles fine and dm-mod loads. I've run devmap_mknod.sh from
the tarball as well, and I can create PVs, VGs and LVs. I can make file-
systems on them which survive reboots, and everything looks fine.

I have a shell script which creates a snapshot named for the current time:
===
#!/bin/bash
WHEN=`date "+%Y%m%d%H%M%S"`
lvcreate -L 4M -s -n $WHEN /dev/vg0/lv0
mkdir /test/snap/$WHEN
mount /dev/vg0/$WHEN /test/snap/$WHEN
===

So, here's an example session which demonstrates my problem. Everything
looks fine until the third snapshot, which gives an I/O error when I try
to mount it, and also appears to trash the first snapshot - "ls -la"
doesn't even list "." or ".."!

test:~# pvcreate /dev/hdb
   Physical volume "/dev/hdb" successfully created

test:~# vgcreate -s 256k vg0 /dev/hdb
   Volume group "vg0" successfully created

test:~# lvcreate -L 512m -n lv0 vg0
   Logical volume "lv0" created

test:~# mke2fs /dev/vg0/lv0
[SNIPPED - Believe me, it worked fine]

test:~# mount /dev/vg0/lv0 /test/fs

test:~# df
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda2               841340    742420     56184  93% /
/dev/mapper/vg0-lv0     507748        13    481521   1% /test/fs

test:~# ./snap
   Logical volume "20030910123716" created

test:~# cp -R * /test/fs/

test:~# sync

test:~# ./snap
   Logical volume "20030910123756" created

test:~# rm -rf /test/fs/src/

test:~# ./snap
   Logical volume "20030910123812" created
/dev/vg0/20030910123812: Input/output error
mount: you must specify the filesystem type

test:~# ls -la /test/snap/20030910123716/
total 0

test:~# ls -la /test/snap/20030910123756/
total 22
drwxr-xr-x    4 root     root         1024 Sep 10 12:37 .
drwxr-xr-x    5 root     root         4096 Sep 10 12:38 ..
drwx------    2 root     root        12288 Sep 10 12:37 lost+found
-rwxr-xr-x    1 root     root           62 Sep 10 12:37 makelv0
-rwxr-xr-x    1 root     root           41 Sep 10 12:37 makelv0~
-rwxr-xr-x    1 root     root          166 Sep 10 12:37 snap
-rwxr-xr-x    1 root     root          151 Sep 10 12:37 snap~
drwxr-xr-x    5 root     root         1024 Sep 10 12:37 src

test:~# ls -la /test/snap/20030910123812/
total 8
drwxr-xr-x    2 root     root         4096 Sep 10 12:38 .
drwxr-xr-x    5 root     root         4096 Sep 10 12:38 ..

Thanks, glen.

-- 
| Nine megs for the secretaries fair,      | One disk to rule them all,     |
| Seven megs for the hackers scarce,       | One disk to bind them,         |
| Five megs for the grads in smoky lairs,  | One disk to hold the files     |
| Three megs for system source;            | And in the darkness grind 'em. |
-----------------------------------------------------------------------------
| Glen Harris | glen@gbrmpa.gov.au | 07 47500893 | http://www.gbrmpa.gov.au |
-----------------------------------------------------------------------------

=============================================================================
If you have received this transmission in error please notify us immediately
by return email and delete all copies. Any unauthorised use, disclosure or
distribution of this email is prohibited.
=============================================================================
