Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
Message-ID: <3611-78225@sneakemail.com>
References: <15079-39127@sneakemail.com> <1195.192.168.1.26.1057151067.squirrel@www.asociacionser.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1195.192.168.1.26.1057151067.squirrel@www.asociacionser.org>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Fri Jul  4 15:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alberto Picon Couselo wrote 42 lines:

> Wolfgang, thank you very, very much for your advice.

You are welcome.

> Now, I'm able to create a snapshot and mount it, but I receive a strange
> warning message (even if I mount it readonly):

> $~# mount -t ext3 -r /dev/storage/snap /mnt/temporal/
> Can't write to read-only device 3a:04
> kjournald starting.  Commit interval 5 seconds
> Can't write to read-only device 3a:04
> EXT3-fs: mounted filesystem with ordered data mode.

Well ... it is saying: 
    "Hey, this is a read-only fs!"
twice.  Once after mounting and once after starting the
kernelthread for the journalling.

Now, the snapshots are read-only :-) so the complaint is
valid, but not impressive.  I get even a few more warnings in
my syslog (but none to STDOUT/STDERR):

| kernel: Can't write to read-only device 3a:06
| kernel: kjournald starting.  Commit interval 5 seconds
| kernel: EXT3-fs: lvm(58,6): orphan cleanup on readonly fs
| kernel: ext3_orphan_cleanup: deleting unreferenced inode 17
| kernel: ext3_orphan_cleanup: deleting unreferenced inode 163842
| kernel: EXT3-fs: lvm(58,6): 2 orphan inodes deleted
| kernel: EXT3-fs: recovery complete.
| kernel: lvm - lvm_map: ll_rw_blk write for readonly LV /dev/base_vg/SNAP-test
| last message repeated 10 times
| kernel: Can't write to read-only device 3a:06
| last message repeated 2 times
| kernel: EXT3-fs: mounted filesystem with ordered data mode.

Of course, the FS was not clean when I snap-shot it.  (bang!)

> Anyway, the snapshot is mounted and it's visible... So, it seems to
> work... What's your opinion about this?

AFAICT it works.

-Wolfgang
