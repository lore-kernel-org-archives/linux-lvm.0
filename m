Reply-To: <david@procom.fsbusiness.co.uk>
From: "David Ayton" <david@procom.fsbusiness.co.uk>
Subject: RE: [linux-lvm] hangs when mounting snapshot
Date: Thu, 21 Sep 2000 14:18:47 +0100
Message-ID: <007001c023ce$7a20f7f0$0101a8c0@ecosse>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20000920225021.H6334@ultraviolet.org>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Yes, I get the same.  kdb says:

Entering kdb (0xc1780000) Panic: divide error
due to panic @ 0xc0195f81
eax = 0x000013fc ebx = 0xc1b6e370 ecx = 0xc1b6e200 edx = 0x00000000
esi = 0x000013fe edi = 0x00000002 esp = 0xc1781d44 eip = 0xc0195f81
ebp = 0xc1781d68  ss = 0x00000018  cs = 0x00000010 eflags = 0x00010246
 ds = 0xc2aa0018  es = 0x00000018 origeax = 0xffffffff &regs = 0xc1781d10
kdb>

and the backtrace says:

kdb> bt
    EBP       EIP         Function(args)
0xc1781d68 0xc0195f81 lvm_snapshot_remap_block+0x11 (0xc1781de6, 0xc1781de8,
0x1
3fc, 0xc1b6e200)
                               kernel .text 0xc0100000 0xc0195f70 0xc019605c
0xc1781dec 0xc0198281 lvm_map+0x3dd (0xc17e7f80, 0x0)
                               kernel .text 0xc0100000 0xc0197ea4 0xc01982d8
0xc1781dfc 0xc0198314 lvm_make_request_fn+0x10 (0xc0391350, 0x0, 0xc17e7f80)
                               kernel .text 0xc0100000 0xc0198304 0xc0198320
0xc1781e24 0xc018d6d2 generic_make_request+0xb6 (0x0, 0xc17e7f80)
                               kernel .text 0xc0100000 0xc018d61c 0xc018d734
0xc1781e44 0xc018d81a ll_rw_block+0xe6 (0x0, 0x1, 0xc1781e58)
                               kernel .text 0xc0100000 0xc018d734 0xc018d884
0xc1781e5c 0xc012c239 bread+0x31 (0x3a01, 0x1, 0x400)
                               kernel .text 0xc0100000 0xc012c208 0xc012c270
0xc1781ec8 0xc014a96a ext2_read_super+0xb6 (0xc1b6ee00, 0xc16fd000, 0x0)
                               kernel .text 0xc0100000 0xc014a8b4 0xc014af64
0xc1781ee8 0xc012efb5 read_super+0x105 (0x3a01, 0xc1274420, 0xc02ef870, 0x1,
0xc
16fd000)
                               kernel .text 0xc0100000 0xc012eeb0 0xc012f00c
0xc1781f38 0xc012f19c get_sb_bdev+0x128 (0xc02ef870, 0xc16fe000, 0x1,
0xc16fd000
)
                               kernel .text 0xc0100000 0xc012f074 0xc012f1f0
0xc1781f8c 0xc012fcaa do_mount+0x19e (0xc16fe000, 0xc380c000, 0xc16ff000,
0xc0ed
0001, 0xc16fd000)
                               kernel .text 0xc0100000 0xc012fb0c 0xc012fdc0
0xc1781fbc 0xc012fe3c sys_mount+0x7c (0x8058408, 0x8058420, 0x8058438,
0xc0ed000
1, 0x8058468)
                               kernel .text 0xc0100000 0xc012fdc0 0xc012fe80
more>
           0xc0108e23 system_call+0x33
                               kernel .text 0xc0100000 0xc0108df0 0xc0108e28
kdb>

Hope this helps.

D



-----Original Message-----
From: owner-linux-lvm@msede.com [mailto:owner-linux-lvm@msede.com]On
Behalf Of Tracy R Reed
Sent: Thursday, September 21, 2000 6:50 AM
To: linux-lvm@msede.com
Subject: [linux-lvm] hangs when mounting snapshot


Over the past few weeks I have been playing around with LVM with great
success.
However, I have been experimenting with snapshots recently and run into a
problem. I have tried this with reiserfs and ext2 as the filesystem (not
that
it should matter to LVM but I mention it because mount is involved) and get
identical results.

I am using kernel 2.4.0-test6 and lvm_0.8final.

I created a snapshot like so:

# lvcreate --size 16m --snapshot --name snap /dev/test_vg/test_lv
lvcreate -- WARNING: all snapshots will be disabled if more than 16 MB are
changed
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

which hangs the mount command. The rest of the system is ok but not even
kill
-9 can get rid of that mount command. The system won't reboot properly
because
it hangs when trying to unmount filesystems and I have to hit the switch.

Any ideas? Do I need to update my version of mount to support snapshots or
something?

--
Tracy Reed      http://www.ultraviolet.org
