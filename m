Return-Path: <jweber@valinux.com>
Date: Sat, 17 Feb 2001 22:24:38 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Message-ID: <Pine.LNX.4.30.0102172218260.8781-100000@beefcake.hdqt.valinux.com>
MIME-Version: 1.0
Subject: [linux-lvm] vgscan creation of device nodes for volume groups.
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I've noticed the following and am wondering about the proper way to handle
this.

I'll try to explain by example, since it's kinda awkward.

I've created 3 volume groups.  vol0, vol1, vol2.  On these I have a
logical volume for each, same names.  Each volume group lives on a
seperate device (pv).  After creation, here's the layout for the /dev/
entries.

[root@localhost jweber]# ls -la /dev/vol0
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:21 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:18 ..
crw-r-----    1 root     disk     109,   0 Feb 17 22:15 group
brw-rw----    1 root     disk      58,   0 Feb 17 22:21 vol0
[root@localhost jweber]# ls -la /dev/vol1
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:21 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:18 ..
crw-r-----    1 root     disk     109,   1 Feb 17 22:16 group
brw-rw----    1 root     disk      58,   1 Feb 17 22:21 vol1
[root@localhost jweber]# ls -la /dev/vol2
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:21 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:18 ..
crw-r-----    1 root     disk     109,   2 Feb 17 22:18 group
brw-rw----    1 root     disk      58,   2 Feb 17 22:21 vol2


Next, I turn all the volumes off and essentially turn off lvm.  I remove
one of the devices (loop devices in this case to test this out).  I'm
removing /dev/loop1 which is the device for /dev/vol1.  I then rerun
vgscan and activate my volumes.  Below are the new /dev entries for the
volumes.

[jweber@localhost jweber]$ ls -la /dev/vol0
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:38 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:38 ..
crw-r-----    1 root     disk     109,   0 Feb 17 22:38 group
brw-rw----    1 root     disk      58,   0 Feb 17 22:38 vol0
[jweber@localhost jweber]$ ls -la /dev/vol1
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:21 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:38 ..
crw-r-----    1 root     disk     109,   1 Feb 17 22:16 group
brw-rw----    1 root     disk      58,   1 Feb 17 22:21 vol1
[jweber@localhost jweber]$ ls -la /dev/vol2
total 40
dr-xr-xr-x    2 root     root         4096 Feb 17 22:38 .
drwxr-xr-x   10 root     root        36864 Feb 17 22:38 ..
crw-r-----    1 root     disk     109,   1 Feb 17 22:38 group
brw-rw----    1 root     disk      58,   1 Feb 17 22:38 vol2
[jweber@localhost jweber]$

Note the duplicate device nodes numbers for vol1 and vol2.  This makes
sense in that the prior /dev entry for a volume is left around after
volumes are disable (rather than cleaned up).  Now, the problem I'm having
with this situation is that obviously any entries in /etc/fstab based on
the device node entries may not be proper, I could end up with the wrong
devices mounted on the wrong mount points. ;(

I gather one possible way around this would be to use a filesystem label
on the filesystem on above devices and mount via that.  But last I check,
mount via fslabel didn't work with LVM devices.

Any thoughts on this?  Much appreciated.
