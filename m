Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Subject: Re: [linux-lvm] mounting reiserfs snapshot fails
Date: Fri, 13 Apr 2001 18:42:19 -0400
References: <363990000.987194192@tiny>
In-Reply-To: <363990000.987194192@tiny>
MIME-Version: 1.0
Message-Id: <01041318421900.14209@oscar>
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@sistina.com, Chris Mason <mason@suse.com>

On Friday 13 April 2001 16:36, Chris Mason wrote:
> On Friday, April 13, 2001 01:29:58 PM -0400 Ed Tomlinson <tomlins@cam.org>
>
> wrote:
> > Hi,
> >
> > Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
> > patch applied I get:
> >
> > oscar# mount /dev/lv/snap /snap -t reiserfs -oro
> > mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
> >        or too many mounted file systems
>
> BTW, you can drop the -o ro, LVM sets the snapshot device readonly, so VFS
> forces a readonly mount for you.
>
> > When trying to mount the snap shot.  It was created with:
> > lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
> > without problems
>
> I doubt it, but was /dev/lv/root a freshly created reiserfs disk?
>
> What does dumpreiserfs tell you about /dev/lv/snap and /dev/lv/root tell
> you?

oscar# lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for "/dev/lv/snap"
lvcreate -- doing automatic backup of "lv"
lvcreate -- logical volume "/dev/lv/snap" successfully created
 
oscar# mount -t reiserfs /dev/lv/snap /snap
mount: block device /dev/lv/snap is write-protected, mounting read-only
mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
       or too many mounted file systems

oscar# dumpreiserfs /dev/lv/snap
dumpe2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
dumpreiserfs: Bad magic number in super-block while trying to open /dev/lv/snap
Couldn't find valid filesystem superblock.

oscar# dumpreiserfs /dev/lv/root
dumpe2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
dumpreiserfs: Bad magic number in super-block while trying to open /dev/lv/root
Couldn't find valid filesystem superblock.oscar# debugreiserfs /dev/lv/snap
 
<-------------debugreiserfs, 2001------------->
reiserfsprogs 3.x.0j
reiserfs_open: neither new nor old reiserfs format found on /dev/lv/snap
print_block: buffer is NULL
oscar# debugreiserfs /dev/lv/root
 
<-------------debugreiserfs, 2001------------->
reiserfsprogs 3.x.0j
Super block of format 3.6 found on the 0x3 in block 16
Block count 3670016
Blocksize 4096
Free blocks 1241068
Busy blocks (skipped 16, bitmaps - 112, journal blocks - 8193
1 super blocks, 2420626 data blocks
Root block 40201
Journal block (first) 18
Journal dev 0
Journal orig size 8192
Filesystem state ERROR
Tree height 5
Hash function used to sort names: "r5"
Objectid map size 304, max 972
Version 2
oscar#                               = ?

Ed
