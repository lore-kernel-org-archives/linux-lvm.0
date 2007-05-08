Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l48CHeIb030796
	for <linux-lvm@redhat.com>; Tue, 8 May 2007 08:17:40 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.169])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l48CHbuV010052
	for <linux-lvm@redhat.com>; Tue, 8 May 2007 08:17:37 -0400
Received: by ug-out-1314.google.com with SMTP id x30so75410ugc
	for <linux-lvm@redhat.com>; Tue, 08 May 2007 05:17:36 -0700 (PDT)
Message-ID: <c2df0f750705080517o74f63c7cjaa4c7b3deb97afec@mail.gmail.com>
Date: Tue, 8 May 2007 14:17:36 +0200
From: "David Fuchs" <php4flicks@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_38589_32647933.1178626656693"
Subject: [linux-lvm] recovering data from broken volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_38589_32647933.1178626656693
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list

I am running a debian system with 2 raid arrays (+swap). on md0, I have the
/ filesystem (about 500 MB). md1 (about 200GB) contains a LVM2 volume group
with 5 volumes, where /home, /var, /usr, /tmp, and /home/vpopmail reside.
all filesystems are of type ext3.

this setup has been running just fine for 2 years now. until I upgraded from
debian 3.1 to 4.0. the update went smooth, but when I rebooted I got:

[/sbin/fsck.ext3 (1) -- /var ] fsck.ext3 -a -C0 /dev/mapper/volg1-b
fsck.ext3: no such file or directory while trying to open
/dev/mapper/volg1-b
/dev/mapper/volg1-b:
The superblock could not be read or does not describe a correct ext2
filesystem. if the device is valid and it really contains an ext2 filsystem
(and not swap or ufs or something else), then the superblock is corrupt, and
you might try running e2fsck with an alternate superblock:
    e2fsck -b 8192 <device>

the same for all other lvs.

the first problem was that md1 did not get started, so I did this manually
and continued the boot process. I got

[/sbin/fsck.ext3 (1) -- /var] fsck.ext3 -a -C0 /dev/mapper/volg1-b
/var: recovering journal
/var contains a file system with errors, check forced.
/var:
Inode 184326 has illegal block(s)
/var: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY (i.e. without the -a or -o
options)

( again, for all lvs)

fsck died with exit status 4.

here I got dropped into a maintenance shell again, but forced the system to
continue to boot (probably not the wisest choice, in retrospect).

EXT3-fs warning: mounting fs with errors. running e2fsck is recommended
EXT3 FS on dm-4, internal journal
EXT3-FS: mounted filesystem with ordered data mode.

...  (same for dm-3, dm-2, dm-1, dm-0)

EXT3-fs error (device dm-1) in ext3_reserve_inode_write: Journal has aborted
EXT3-fs error (device dm-1) in ext3_orphan)write: Journal has aborted
EXT3-fs error (device dm-1) in ext3_orphan_del: Journal has aborted
EXT3-fs error (device dm-1) in ext3_truncate_write: Journal has aborted
ext3_abort called.
EXT3-fs error (device dm-1): ext3_journal)_start_sb: Detected aborte
djournal
Remounting filesystem read-only

and finally I get tons of these:

dm-0: rw-9, want=6447188432, limit=10485760
attempt to access beyond end of device


I can boot to a root shell specifying init=/bin/sh w/o any file system
related errors, and from here I can also start the volume group without
getting any errors.

when I mount one of the lvs read only and look at the data, it seems as
there is an 'offset' to the whole volume group: looking at files I see
contents that should be in other files, and directory listings suddenly show
subdirectories that really are in other directories. or, I get 'attempt to
access beyond end of device' errors.

because all 5 filesystems started failing simultaneously,  this must be an
error in either the underlying LVM vg or raid volume. since md0 works just
fine and lvm seems to find it's metadata on md1, I don't think it's the
raid. so, it must be lvm...

I do think (and hopefully, this is not just wishful thinking) that most of
the data should still be *physically* intact on the disk. now, before I rip
out the disks and try to rescue the data from another system with e2salvage
or something like that, is there a possible way how I could fix the broken
LVM volume group?

many thanks in advance,
- Dave.

------=_Part_38589_32647933.1178626656693
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

hi list<br><br>I am running a debian system with 2 raid arrays (+swap). on md0, I have the / filesystem (about 500 MB). md1 (about 200GB) contains a LVM2 volume group with 5 volumes, where /home, /var, /usr, /tmp, and /home/vpopmail reside. all filesystems are of type ext3.
<br><br>this setup has been running just fine for 2 years now. until I upgraded from debian 3.1 to 4.0. the update went smooth, but when I rebooted I got:<br><br><span style="font-family: courier new,monospace;">[/sbin/fsck.ext3 (1) -- /var ] 
fsck.ext3 -a -C0 /dev/mapper/volg1-b</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">fsck.ext3: no such file or directory while trying to open /dev/mapper/volg1-b</span>
<br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">/dev/mapper/volg1-b:</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">
The superblock could not be read or does not describe a correct ext2 filesystem. if the device is valid and it really contains an ext2 filsystem (and not swap or ufs or something else), then the superblock is corrupt, and you might try running e2fsck with an alternate superblock:
</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">&nbsp;&nbsp;&nbsp;&nbsp;e2fsck -b 8192 &lt;device&gt;</span><br><br>the same for all other lvs.<br><br>the first problem was that md1 did not get started, so I did this manually and continued the boot process. I got
<br><br><span style="font-family: courier new,monospace;">[/sbin/fsck.ext3 (1) -- /var] fsck.ext3 -a -C0 /dev/mapper/volg1-b</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">
/var: recovering journal</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">/var contains a file system with errors, check forced.</span><br style="font-family: courier new,monospace;">
<span style="font-family: courier new,monospace;">/var:</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">Inode 184326 has illegal block(s)</span><br style="font-family: courier new,monospace;">
<span style="font-family: courier new,monospace;">/var: UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY (i.e. without the -a or -o options)</span><br><br>( again, for all lvs)<br><br><span style="font-family: courier new,monospace;">
fsck died with exit status 4.<br><br></span>here I got dropped into a maintenance shell again, but forced the system to continue to boot (probably not the wisest choice, in retrospect).<br><br><span style="font-family: courier new,monospace;">

EXT3-fs warning: mounting fs with errors. running e2fsck is recommended</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">EXT3 FS on dm-4, internal journal</span><br style="font-family: courier new,monospace;">

<span style="font-family: courier new,monospace;">EXT3-FS: mounted filesystem with ordered data mode.</span><br><br>...&nbsp; (same for dm-3, dm-2, dm-1, dm-0)<br><br><span style="font-family: courier new,monospace;">
EXT3-fs error (device dm-1) in ext3_reserve_inode_write: Journal has aborted</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">EXT3-fs error (device dm-1) in ext3_orphan)write: Journal has aborted
</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">EXT3-fs error (device dm-1) in ext3_orphan_del: Journal has aborted</span><br style="font-family: courier new,monospace;">

<span style="font-family: courier new,monospace;">EXT3-fs error (device dm-1) in ext3_truncate_write: Journal has aborted</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">

ext3_abort called.</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">EXT3-fs error (device dm-1): ext3_journal)_start_sb: Detected aborte djournal</span><br style="font-family: courier new,monospace;">

<span style="font-family: courier new,monospace;">Remounting filesystem read-only</span><br><br>and finally I get tons of these:<br><br><span style="font-family: courier new,monospace;">dm-0: rw-9, want=6447188432, limit=10485760
</span><br style="font-family: courier new,monospace;"><span style="font-family: courier new,monospace;">attempt to access beyond end of device<br><br><br></span>I can boot to a root shell specifying init=/bin/sh w/o any file system related errors, and from here I can also start the volume group without getting any errors. 
<br><br>when I mount one of the lvs read only and look at the data, it seems as there is an &#39;offset&#39; to the whole volume group: looking at files I see contents that should be in other files, and directory listings suddenly show subdirectories that really are in other directories. or, I get &#39;attempt to access beyond end of device&#39; errors.
<br><br>because all 5 filesystems started failing simultaneously,&nbsp; this must be an error in either the underlying LVM vg or raid volume. since md0 works just fine and lvm seems to find it&#39;s metadata on md1, I don&#39;t think it&#39;s the raid. so, it must be lvm... 
<br><br>I do think (and hopefully, this is not just wishful thinking) that most of the data should still be *physically* intact on the disk. now, before I rip out the disks and try to rescue the data from another system with e2salvage or something like that, is there a possible way how I could fix the broken LVM volume group?
<br><br>many thanks in advance,<br>- Dave.<br><span style="font-family: courier new,monospace;"></span><span style="font-family: courier new,monospace;"></span>

------=_Part_38589_32647933.1178626656693--
