Date: Wed, 20 Sep 2000 22:50:21 -0700
From: Tracy R Reed <treed@ultraviolet.org>
Subject: [linux-lvm] hangs when mounting snapshot
Message-ID: <20000920225021.H6334@ultraviolet.org>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Over the past few weeks I have been playing around with LVM with great success.
However, I have been experimenting with snapshots recently and run into a
problem. I have tried this with reiserfs and ext2 as the filesystem (not that
it should matter to LVM but I mention it because mount is involved) and get
identical results.

I am using kernel 2.4.0-test6 and lvm_0.8final.

I created a snapshot like so:

# lvcreate --size 16m --snapshot --name snap /dev/test_vg/test_lv 
lvcreate -- WARNING: all snapshots will be disabled if more than 16 MB are changed
lvcreate -- INFO: using default snapshot chunk size of 64 KB
lvcreate -- doing automatic backup of "test_vg"
lvcreate -- logical volume "/dev/test_vg/snap" successfully created

Everything looks cool:

# lvscan
lvscan -- ACTIVE   "/dev/another_test_vg/another_test_lv" [300 MB]
lvscan -- ACTIVE   "/dev/test_vg/test_lv" [63.91 GB] striped[2]
lvscan -- ACTIVE   "/dev/test_vg/snap" [63.91 GB] striped[2]
lvscan -- 3 logical volumes with 128.12 GB total in 2 volume groups
lvscan -- 3 active logical volumes

Then I try to mount it with:

# mount /dev/test_vg/snap /snap1
Segmentation fault

Then I try:

# mount /dev/test_vg/snap /snap1

which hangs the mount command. The rest of the system is ok but not even kill
-9 can get rid of that mount command. The system won't reboot properly because
it hangs when trying to unmount filesystems and I have to hit the switch.

Any ideas? Do I need to update my version of mount to support snapshots or
something?

-- 
Tracy Reed      http://www.ultraviolet.org
