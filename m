From: Terje Kvernes <terjekv@math.uio.no>
Date: 24 Aug 2001 02:23:52 +0200
Message-ID: <wxxitfenw4n.fsf@ninhursaga.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] snapshot of reiserfs lv -- status of the VFS lock patches.
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

  using an unmodified (besides the lvm1.0-patches generated) kernel
  I attempted to make a snapshot of a lv:

,----
| marduk:/tmp# lvcreate -L1G -s -n drift-snap-01 /dev/cornucopia/drift
| lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
| lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for "/dev/cornucopia/drift-snap-01"
| lvcreate -- doing automatic backup of "cornucopia"
| lvcreate -- logical volume "/dev/cornucopia/drift-snap-01" successfully created
| 
| marduk:/tmp# mount -t reiserfs /dev/cornucopia/drift-snap-01 /mnt/tmp/
| mount: block device /dev/cornucopia/drift-snap-01 is write-protected, mounting read-only
| mount: wrong fs type, bad option, bad superblock on /dev/cornucopia/drift-snap-01,
|        or too many mounted file systems
| marduk:/tmp# debugreiserfs /dev/cornucopia/drift-snap-01             
| 
| <-------------debugreiserfs, 2001------------->
| reiserfsprogs 3.x.0j
| Super block of format 3.6 found on the 0x3 in block 16
| Block count 1310720
| Blocksize 4096
| Free blocks 1277687
| Busy blocks (skipped 16, bitmaps - 40, journal blocks - 8193
| 1 super blocks, 24783 data blocks
| Root block 8213
| Journal block (first) 18
| Journal dev 0
| Journal orig size 8192
| Filesystem state ERROR
| Tree height 3
| Hash function used to sort names: "r5"
| Objectid map size 2, max 972
| Version 2
| marduk:/tmp# uname -r                                                
| 2.4.9
`----

  from /var/log/messages I get:
  
  Aug 24 02:06:47 marduk kernel: reiserfs: checking transaction log (device 3a:09) ...
  Aug 24 02:06:47 marduk kernel: clm-2076: device is readonly, unable to replay log
  Aug 24 02:06:47 marduk kernel: Replay Failure, unable to mount
  Aug 24 02:06:47 marduk kernel: reiserfs_read_super: unable to initialize journal space

  this reminds me of the VFS lock-issue. 

  my questions then, 1) do I have to patch a bit more? 2) if I have to
  patch is there one for 2.4.9 out there (the 2.4.4-patch fuzzes a
  bit[1]), and 3) if I need to patch, when does this hit the
  mainstream kernel. :)
  

  [1] the patchlog of the 2.4.4 VFS lock patch against 2.4.9, the
  reject of ksyms.c is as far as I can see only two
  EXPORT_SYMBOL-calls. 

,----
| marduk:/work/terjekv/linux# patch -p1 < ../LVM/1.0/PATCHES/linux-2.4.4-VFS-lock.patch 
| patching file drivers/md/lvm.c
| Hunk #1 succeeded at 162 with fuzz 1 (offset -45 lines).
| patching file fs/buffer.c
| Hunk #1 succeeded at 372 with fuzz 1 (offset 41 lines).
| patching file fs/super.c
| Hunk #1 succeeded at 716 with fuzz 1 (offset 86 lines).
| patching file include/linux/fs.h
| Hunk #1 succeeded at 1161 with fuzz 2 (offset 54 lines).
| Hunk #2 succeeded at 1117 (offset -1 lines).
| patching file kernel/ksyms.c
| Hunk #1 FAILED@179.
| 1 out of 1 hunk FAILED -- saving rejects to file kernel/ksyms.c.rej
`----

-- 
Terje
