Date: Mon, 12 Jun 2000 16:18:43 -0500 (CDT)
From: Jay Weber <jay@lazy.accessus.net>
Subject: [linux-lvm] LVM and ext3 filesystem
Message-ID: <Pine.OSF.4.21.0006121613380.24540-100000@lazy.accessus.net>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Hi,

I've started playing with using an ext3 filesystem on top of LVM and have
run across the following when mounting a snapshot volume which uses an
ext3 filesystem.

JFS DEBUG: (recovery.c, 411): journal_recover: JFS: recovery, exit status
0, recovered transactions 12 to 12
lvm - lvm_map: ll_rw_blk write for readonly LV /dev/vol/foo_snap
Bad lvm_map in ll_rw_block
EXT3-fs: recovery complete.
lvm - lvm_map: ll_rw_blk write for readonly LV /dev/vol/foo_snap
Bad lvm_map in ll_rw_block


I'm assuming the Bad lvm_map's are due to the fact that even if I specify
to mount -ro (readonly) the ext3 snapshot volume it still replays the
journal.  Any thoughts on this?

Thanks.
