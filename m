Message-ID: <20010827150751.14611.qmail@web14405.mail.yahoo.com>
Date: Mon, 27 Aug 2001 08:07:51 -0700 (PDT)
From: Aman Shahi <shahi_aman@yahoo.com>
In-Reply-To: <E15bMBF-0002FJ-00@hermes.sistina.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problem mounting snapshot with reiserfs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I am having problem in mounting snapshot with
reiserfs.

I am using linux kernel 2.4.8 and lvm 1.0. Here
is the sequence of steps I did. Same steps with
ext2 I did not have nay problem. But with reiserfs
I am not able to do the mounting.

using fdisk I change the type of /dev/sdb2 to "8e".
capacity of /dev/sdb2 is around 30G

# pvcreate  /dev/sdb2
# vgcreate  vg1  /dev/sdb2
# lvcreate -L10G  -n  lv1  vg1
# mkfs -t reiserfs  /dev/vg1/lv1
# mount -t reiserfs  /dev/vg1/lv1  /lv1

I copy some data(60M) to /lv1

# lvcreate -L2G  -s  -n back1  /dev/vg1/lv1

# mount -t reiserfs  /dev/vg1/back1  /back1
mount: block device /dev/vg1/back1 is write-protected,
mounting read-only
reiserfs: checking transaction log (device 3a:01) ...
clm-2076: device is readonly, unable to replay log
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal
space
mount: wrong fs type, bad option, bad superblock on
/dev/vg1/back1,
       or too many mounted file systems

# mount  /dev/vg1/back1  /back1
mount: block device /dev/vg1/back1 is write-protected,
mounting read-only
FAT: bogus logical sector size 0
VFS: Can't find a valid FAT filesystem on dev 3a:01.
mount: you must specify the filesystem type


I had read a similar problem in the mailing list. But
I
think the reiserfs and vfs patches are not required in
linux kernel 2.4.8 and lvm 1.0.  Or am I missing
something or doing something wrong.

Aman Shahi.

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
