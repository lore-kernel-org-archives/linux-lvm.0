From: Steve_J_Brueggeman@notes.seagate.com
Message-ID: <8825672B.0077D985.00@sv-gw1.stsv.seagate.com>
Date: Fri, 5 Mar 1999 15:50:03 -0600
Subject: [linux-lvm] More problems with LVM 0.6
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I haven't looked into the source of this yet, but I suspect that some LVM
tables are messed up, or some bounds calculations are incorrect.

I am getting the following errors
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3918612, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3926804, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3934996, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3943188, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3951380, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3959572, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3967764, limit=3004155
Mar  5 15:34:40 kilroy kernel: attempt to access beyond end of device
Mar  5 15:34:40 kilroy kernel: 08:14: rw=1, want=3975956, limit=3004155

When I have configured a volume group as follows

--- Volume group ---
VG Name               vg00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                2
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               8.34 GB
PE Size               4 MB
Total PE              2134
Alloc PE / Size       2048 / 8 GB
Free  PE / Size       86 / 344 MB

--- Logical volume ---
LV Name               /dev/vg00/lv00
VG Name               vg00
LV Write Access       read/write
LV Status             available
LV #                  1
# open                0
LV Size               2 GB
Current LE            512
Allocated LE          512
Allocation            next free
Read ahead sectors    120
Block device          58:0

--- Logical volume ---
LV Name               /dev/vg00/lv01
VG Name               vg00
LV Write Access       read/write
LV Status             available
LV #                  2
# open                0
LV Size               6 GB
Current LE            1536
Allocated LE          1536
Allocation            next free
Read ahead sectors    120
Block device          58:1


--- Physical volumes ---
PV Name (#)           /dev/sdb2 (1)
PV Status             available / allocatable
Total PE / Free PE    360 / 0

PV Name (#)           /dev/sdb3 (3)
PV Status             available / allocatable
Total PE / Free PE    802 / 86

PV Name (#)           /dev/sdb4 (2)
PV Status             available / allocatable
Total PE / Free PE    972 / 0

My disk partitons are
Disk /dev/sdb: 255 heads, 63 sectors, 1106 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start      End   Blocks   Id  System
/dev/sdb1             1       17   136521   82  Linux swap
/dev/sdb2            18      201  1477980   fe  Unknown
/dev/sdb3           202      610  3285292+  fe  Unknown
/dev/sdb4           611     1106  3984120   fe  Unknown

Note the order of creation above.  First I did a vgcreate vg00
/dev/sdb[24], then a vgextend vg00 /dev/sdb3, then created a 2G LV and a 6G
 LV that crosses past the end of /dev/sdb4.


Anybody got any clues? or pointers where to start debugging?
I'd find it hard to believe that this would be related to the changes I
just posted here that I made to tools/lib/lvm_tab_get_free_blk_dev.c, but
little supprises me any more.


Have a good weekend!

Steve Brueggeman
