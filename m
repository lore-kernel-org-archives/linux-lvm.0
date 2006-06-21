Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LMlx8b003084
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 18:47:59 -0400
Received: from ms-smtp-03.southeast.rr.com (ms-smtp-03.southeast.rr.com
	[24.25.9.102])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5LMlvV6008336
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 18:47:57 -0400
Received: from [192.168.10.2] (cpe-024-167-155-172.triad.res.rr.com
	[24.167.155.172])
	by ms-smtp-03.southeast.rr.com (8.13.6/8.13.6) with ESMTP id
	k5LMls7E014352
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 18:47:55 -0400 (EDT)
Message-ID: <4499CCA0.6080202@earthlink.net>
Date: Wed, 21 Jun 2006 18:48:00 -0400
From: raptorfan <raptorfan@earthlink.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 + 2.6.17 + 'lvremove <snapshot>' = hang
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I watched this thread...

https://www.redhat.com/archives/linux-lvm/2006-May/msg00007.html

..with some interest as I have a slack10-current box using LVM2 which 
would hang doing an 'lvremove <snapshot>.' Unlike the thread, though, I 
do NOT get a segfault/panic. The lvremove command simply hangs. The only 
way to resolve it is reboot the system via sysrq: i can't even reboot 
because the hang blocks. Anyone out there have suggestions? This is with 
a 2.6.17 vanilla kernel, though I've had this problem with any kernel 
past the 2.6.15.x series...

Below is a test of what I try to do. Let me know if anyone needs more 
info. Thanks.

-r
---

root@demo:~# lvremove --version
   LVM version:     2.01.15 (2005-10-16)
   Library version: 1.01.05 (2005-09-26)
   Driver version:  4.6.0
root@demo:~# uname -r
2.6.17
root@demo:~# lvdisplay --debug /dev/vg00/mvs
   --- Logical volume ---
   LV Name                /dev/vg00/mvs
   VG Name                vg00
   LV UUID                V90PIA-AWGB-JzxA-kgce-OlEd-dVzX-tcuKAF
   LV Write Access        read/write
   LV snapshot status     source of
                          /dev/vg00/mvsClone [active]
   LV Status              available
   # open                 1
   LV Size                1.00 GB
   Current LE             128
   Segments               1
   Allocation             inherit
   Read ahead sectors     0
   Block device           254:8

root@demo:~# lvdisplay --debug /dev/vg00/mvsClone
root@demo:~# lvdisplay /dev/vg00/mvsClone
root@demo:~# ls -la /dev/vg00
total 44
drwx------  2 root root  4096 2006-06-21 18:29 ./
drwxr-xr-x 23 root root 40960 2006-06-21 18:30 ../
lrwxrwxrwx  1 root root    21 2006-06-21 18:29 dblv -> /dev/mapper/vg00-dblv
lrwxrwxrwx  1 root root    22 2006-06-21 18:29 ibmlv -> 
/dev/mapper/vg00-ibmlv
lrwxrwxrwx  1 root root    25 2006-06-21 18:29 instance -> 
/dev/mapper/vg00-instance
lrwxrwxrwx  1 root root    23 2006-06-21 18:29 instlv -> 
/dev/mapper/vg00-instlv
lrwxrwxrwx  1 root root    20 2006-06-21 18:29 mvs -> /dev/mapper/vg00-mvs
lrwxrwxrwx  1 root root    25 2006-06-21 18:29 mvsClone -> 
/dev/mapper/vg00-mvsClone
lrwxrwxrwx  1 root root    22 2006-06-21 18:29 optlv -> 
/dev/mapper/vg00-optlv
lrwxrwxrwx  1 root root    24 2006-06-21 18:29 slacklv -> 
/dev/mapper/vg00-slacklv
lrwxrwxrwx  1 root root    23 2006-06-21 18:29 templv -> 
/dev/mapper/vg00-templv
root@demo:~# ls -la /dev/mapper
total 44
drwxr-xr-x  2 root root    4096 2006-06-18 14:21 ./
drwxr-xr-x 23 root root   40960 2006-06-21 18:30 ../
crw-rw----  1 root root  10, 63 2006-03-05 23:34 control
brw-------  1 root root 254,  2 2006-06-21 18:29 vg00-dblv
brw-------  1 root root 254,  4 2006-06-21 18:29 vg00-ibmlv
brw-------  1 root root 254, 10 2006-06-18 14:21 vg00-instance
brw-------  1 root root 254,  9 2006-06-18 14:21 vg00-instlv
brw-------  1 root root 254,  8 2006-06-21 18:29 vg00-mvs
brw-------  1 root root 254,  6 2006-06-18 14:21 vg00-mvs-real
brw-------  1 root root 254,  7 2006-06-18 14:21 vg00-mvsClone
brw-------  1 root root 254,  5 2006-06-18 14:21 vg00-mvsClone-cow
brw-------  1 root root 254,  3 2006-05-14 08:14 vg00-optlv
brw-------  1 root root 254,  0 2006-05-14 08:14 vg00-slacklv
brw-------  1 root root 254,  1 2006-05-14 08:14 vg00-templv


root@demo:~# strace lvremove /dev/vg00/mvsClone
{ .. snip .. }
stat64("/etc/lvm/archive/vg00_00045.vg", {st_mode=S_IFREG|0600, 
st_size=4709, ...}) = 0
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(6, 110592, [110592], SEEK_SET)  = 0
read(6, "e = \"striped\"\nstripe_count = 1\t#"..., 4096) = 4096
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(6, 110592, [110592], SEEK_SET)  = 0
read(6, "e = \"striped\"\nstripe_count = 1\t#"..., 4096) = 4096
_llseek(6, 110592, [110592], SEEK_SET)  = 0
read(6, "e = \"striped\"\nstripe_count = 1\t#"..., 8192) = 8192
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(6, 0, [0], SEEK_SET)            = 0
read(6, "\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0"..., 
4096) = 4096
_llseek(6, 110592, [110592], SEEK_SET)  = 0
read(6, "e = \"striped\"\nstripe_count = 1\t#"..., 4096) = 4096
ioctl(7, DM_DEV_STATUS, 0x80ddb30)      = 0
mlockall(MCL_CURRENT|MCL_FUTURE)        = 0
brk(0x88f6000)                          = 0x88f6000
brk(0x8ade000)                          = 0x8ade000
getpriority(PRIO_PROCESS, 0)            = 20
setpriority(PRIO_PROCESS, 0, -18)       = 0
ioctl(7, DM_LIST_DEVICES, 0x80ddb30)    = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1b38)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1ba0)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1bf8)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1c48)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1ca0)      = 0
ioctl(7, DM_DEV_STATUS, 0x80e1cf8)      = 0
ioctl(7, DM_LIST_VERSIONS, 0x80ddb30)   = 0
ioctl(7, DM_LIST_VERSIONS, 0x80ddb30)   = 0
ioctl(7, DM_DEV_SUSPEND, 0x80ddb30)     = 0
ioctl(7, DM_DEV_SUSPEND, 0x80ddb30)     = 0
ioctl(7, DM_DEV_SUSPEND, 0x80ddb30)     = 0
ioctl(7, DM_TABLE_LOAD, 0x80e1cf0)      = 0
ioctl(7, DM_DEV_SUSPEND, 0x80ddb30)     = 0
ioctl(7, DM_TABLE_LOAD, 0x80e1cf0)      = 0
ioctl(7, DM_TABLE_LOAD

--- sysrq show-state output ---
SysRq : Show State

                                                sibling
   task             PC      pid father child younger older
init          S 00000000     0     1      0     2               (NOTLB)
        c11d0b40 c11cfa50 c040b5e0 00000000 00000000 c132d8f4 c11d0b3c 
cbfbbe50
        cbb21734 c11d0b28 c01a3645 cbb21734 c11d0b54 00011608 b1d06bc2 
000000c2
        c11cfa50 c11cfb6c c11d0b54 0000cbb7 0000000b c11d0b7c c02dab10 
c11d0b54
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
ksoftirqd/0   S C11D0E90     0     2      1             3       (L-TLB)
        c11d3f9c c11cf540 c040b5e0 c11d0e90 c02da0e8 c11d3fb0 c11cfa50 
c040b5e0
        00000000 c11d3f90 c0118578 c040b610 ca863a50 0000025c 3752be7c 
000000c2
        c11cf540 c11cf65c c11d3000 c11d0f5c 00000000 c11d3fb0 c01210d5 
c11cf540
Call Trace:
  <c01210d5> ksoftirqd+0x95/0xa0  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
watchdog/0    S 000000AF     0     3      1             4     2 (L-TLB)
        c11d5f94 c11cf030 c040b5e0 000000af c040b5e0 c11cf030 c11d5f6c 
c0117a22
        d28c95a3 000000af 00001152 00000000 c11d9a70 000010ed 56933c73 
000000c3
        c11cf030 c11cf14c c11d5000 c11d0f60 00000000 c11d5fb0 c013a132 
c11cf030
Call Trace:
  <c013a132> watchdog+0x52/0x70  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
events/0      S 00000003     0     4      1             5     3 (L-TLB)
        c11daf48 c11d9a70 c040b5e0 00000003 00000001 00000000 00000000 
c041ff84
        00000286 c11daf48 00000286 00000000 c11f8580 000069b0 60b8fde1 
000000c3
        c11d9a70 c11d9b8c c11da000 c11cc650 c11cc648 c11dafb0 c012b392 
c11cc640
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
khelper       S 00000003     0     5      1             6     4 (L-TLB)
        c11dbf48 c68e30b0 c040b5e0 00000003 00000001 00000000 00000000 
ca87dd04
        00000296 c11dbf48 00000296 00000000 c68e30b0 000009b7 a2f3b3b9 
00000014
        c11d9560 c11d967c c11db000 c11cc5d0 c11cc5c8 c11dbfb0 c012b392 
c11cc5c0
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kthread       S 00000003     0     6      1     8      71     5 (L-TLB)
        c11f3f48 ca2e8560 c040b5e0 00000003 00000001 00000000 00000000 
ca488ef8
        00000282 c11f3f48 00000282 00000000 ca2e8560 0000018b d0561044 
00000011
        c11d9050 c11d916c c11f3000 c11f2870 c11f2868 c11f3fb0 c012b392 
c11f2860
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kblockd/0     S 00000003     0     8      6            25       (L-TLB)
        c1209f48 c126a5c0 c040b5e0 00000003 00000001 00000000 00000000 
cbc20c28
        00000286 c1209f48 00000286 00000000 c126a5c0 0000173b 21456e72 
000000c2
        c11f8580 c11f869c c1209000 c11f23f0 c11f23e8 c1209fb0 c012b392 
c11f23e0
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kseriod       S C11BF0C0     0    25      6            69     8 (L-TLB)
        c1260f54 ca0c3ad0 c040b5e0 c11bf0c0 ca6bde40 ca6bde40 c03930a0 
c1260f3c
        c02db167 c03930a0 ca6bde40 c1260f90 ca0c3ad0 00001cd9 bdae287c 
00000010
        c125fab0 c125fbcc c1260000 c1260f90 c1260f78 c1260fb0 c025e1ab 
c1260fb0
Call Trace:
  <c025e1ab> serio_thread+0xfb/0x100  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
pdflush       D C0269856     0    69      6            70    25 (L-TLB)
        c1239e0c c126a5c0 c040b5e0 c0269856 cbc207c4 cbfae7e0 cbfae980 
c1239de4
        c026721e cbfae7e0 cb3378e0 c1239df8 c0269856 00003536 3a7d57c2 
000000c2
        c126a5c0 c126a6dc c1239e78 00000000 c1239e80 c1239e14 c02daa6e 
c1239e24
Call Trace:
  <c02daa6e> io_schedule+0xe/0x20  <c015c8c5> sync_buffer+0x45/0x50
  <c02dabe6> __wait_on_bit+0x46/0x70  <c02dac8f> 
out_of_line_wait_on_bit+0x7f/0x90
  <c015c95c> __wait_on_buffer+0x2c/0x30  <c0160417> 
sync_dirty_buffer+0x87/0x110
  <c01bd4bb> ext2_sync_super+0x4b/0x60  <c01bd6b6> ext2_remount+0x166/0x1a0
  <c0162973> do_remount_sb+0xc3/0x110  <c0162a5b> 
do_emergency_remount+0x9b/0xa0
  <c0143ac4> __pdflush+0xa4/0x170  <c0143bc3> pdflush+0x33/0x40
  <c012e7c6> kthread+0xa6/0xf0  <c0101405> kernel_thread_helper+0x5/0x10
pdflush       S 00000000     0    70      6            72    69 (L-TLB)
        c1263f64 c126a0b0 c040b5e0 00000000 c1263f10 00000400 00000000 
00000000
        00000000 00000000 00000000 00000005 c4f68050 00000601 71b9100a 
000000c2
        c126a0b0 c126a1cc c1263f9c c1263f90 c1263000 c1263f7c c0143a99 
00000000
Call Trace:
  <c0143a99> __pdflush+0x79/0x170  <c0143bc3> pdflush+0x33/0x40
  <c012e7c6> kthread+0xa6/0xf0  <c0101405> kernel_thread_helper+0x5/0x10
kswapd0       S C01253CE     0    71      1           671     6 (L-TLB)
        c1267f74 c11cfa50 c040b5e0 c01253ce c0380640 c1267f50 c011d799 
c0380640
        c1267000 c1267000 c03811a0 c1267fac c11cfa50 00004dfa b2cd7646 
00000004
        c1270a50 c1270b6c c03816b0 c03811a0 00000000 c1267fe4 c0146f85 
c02f1325
Call Trace:
  <c0146f85> kswapd+0x125/0x130  <c0101405> kernel_thread_helper+0x5/0x10
aio/0         S 00000004     0    72      6           683    70 (L-TLB)
        c1269f48 c11d9560 b2e360ec 00000004 c1269f18 00000000 c12709c4 
00000000
        b2e360ec 00000004 00001a36 00000000 c11d9560 00004962 b2e39f02 
00000004
        c1270540 c127065c c1269000 c129bc70 c129bc68 c1269fb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
khpsbpkt      S 00000005     0   671      1           778    71 (L-TLB)
        cbc34f84 c11d9560 57d62b4f 00000005 c011d98e cbc34000 cbc34000 
cbc2a580
        57d62b4f 00000005 00001d38 00000000 c11d9560 0000098f 57d67086 
00000005
        cbc2a580 cbc2a69c c0392398 cbc34000 00000246 cbc34fc4 c02dbbbf 
c03923a0
Call Trace:
  <c02dbbbf> __down_interruptible+0x7f/0xef  <c02d9d6a> 
__down_failed_interruptible+0xa/0x10
  <c024de5c> .text.lock.ieee1394_core+0x1b/0x2f  <c0101405> 
kernel_thread_helper+0x5/0x10
kcryptd/0     S 5822AD5B     0   683      6           684    72 (L-TLB)
        cbc26f48 c11f8a90 c040b5e0 5822ad5b cbc26f18 00000000 c130aef4 
00000000
        00000000 cbc26000 c130aa70 cbc26f34 c11f8a90 00000300 5825387a 
00000005
        c130aa70 c130ab8c cbc26000 c12dca50 c12dca48 cbc26fb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kmirrord      S 5825484A     0   684      6           686   683 (L-TLB)
        cbc27f48 c130a050 c040b5e0 5825484a cbc27f18 00000000 c11f8f14 
00000000
        00000000 cbc27000 c11f8a90 cbc27f34 c130a050 00000894 5835b82d 
00000005
        c11f8a90 c11f8bac cbc27000 c12dc850 c12dc848 cbc27fb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kjournald     S CBC24F20     0   686      6          1087   684 (L-TLB)
        cbc24f44 c126a5c0 c040b5e0 cbc24f20 c0118578 c11d0cf8 00000003 
00000000
        00000000 00000000 00000296 00000001 c126a5c0 000008af 2dd75a05 
000000c2
        c130a050 c130a16c 00000000 c12f0800 00000001 cbc24fb0 c01b4b62 
00000000
Call Trace:
  <c01b4b62> kjournald+0x1d2/0x1e0  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
udevd         S 00000014     0   778      1          1373   671 (NOTLB)
        c1356b40 cb8c8ad0 c040b5e0 00000014 c1356b08 c1356b44 c0103a3c 
cbf6a200
        a2da1237 00000014 000484ef 00000000 cb8c8ad0 00005c9d a73fa8db 
00000014
        cbba4090 cbba41ac 7fffffff 00000000 00000007 c1356b7c c02dab5c 
c1356b64
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
kcopyd        S 0000000A     0  1087      6          1139   686 (L-TLB)
        cb067f48 c11d9560 b90f70af 0000000a cb067f18 00000000 cbc2af14 
00000000
        b90f70af 0000000a 0093cd81 00000000 c11d9560 00000830 ba6d7fd5 
0000000a
        cbc2aa90 cbc2abac cb067000 cb56ca70 cb56ca68 cb067fb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
reiserfs/0    S 00000003     0  1139      6          1161  1087 (L-TLB)
        cb608f48 c125f090 c040b5e0 00000003 00000001 00000000 00000000 
cca06128
        00000246 cb608f48 00000246 00000000 c4f68050 00001106 3b7dcbea 
000000c2
        c125f090 c125f1ac cb608000 cb4517d0 cb4517c8 cb608fb0 c012b392 
cb4517c0
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kjournald     S CA29AF20     0  1161      6          1176  1139 (L-TLB)
        ca29af44 c126aad0 c040b5e0 ca29af20 c0118578 cbb91d7c 00000003 
00000000
        00000000 00000000 00000296 c12f0600 c126aad0 0000274d 54a1cb54 
0000000c
        cbae1540 cbae165c 00000000 c12f0600 00000001 ca29afb0 c01b4b62 
00000000
Call Trace:
  <c01b4b62> kjournald+0x1d2/0x1e0  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
kjournald     S CAA01F20     0  1176      6          3261  1161 (L-TLB)
        caa01f44 cb8c80b0 c040b5e0 caa01f20 c0118578 cbb91d7c 00000003 
00000000
        00000000 00000000 00000296 00000001 caa01f44 00000897 73db6571 
000000c1
        cb8c80b0 cb8c81cc 00000000 caf7ec00 00000001 caa01fb0 c01b4b62 
00000000
Call Trace:
  <c01b4b62> kjournald+0x1d2/0x1e0  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
syslogd       S CBBA7E08     0  1373      1          1376   778 (NOTLB)
        ca733b40 ca2e8050 c040b5e0 cbba7e08 00000002 00000002 ca733b14 
c012ed1f
        ca1f8344 ca1f8344 cbba7e08 cbba7e08 c126a5c0 00002556 99100add 
000000c2
        ca2e8050 ca2e816c 7fffffff 00000000 00000001 ca733b7c c02dab5c 
ca733b64
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
klogd         R running     0  1376      1          3360  1373 (NOTLB)
kpsmoused     S 00000010     0  3261      6          3315  1176 (L-TLB)
        c9ec8f48 c11d9560 adb0158f 00000010 c9ec8f18 00000000 c9ef2f34 
00000000
        adb0158f 00000010 00000a26 00000000 c11d9560 00000325 adb02d99 
00000010
        c9ef2ab0 c9ef2bcc c9ec8000 ca5bf5f0 ca5bf5e8 c9ec8fb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
khubd         S 00000010     0  3315      6          3453  3261 (L-TLB)
        cab1cf58 c11d9560 d963d7ff 00000010 c11d9050 cab1cf38 c0117bca 
c11d9050
        d963d7ff 00000010 000008d4 00000000 c11d9560 00000292 d963ece9 
00000010
        ca0c3ad0 ca0c3bec cab1c000 cab1cf90 cab1cf78 cab1cfb0 ccbd2439 
cab1c000
Call Trace:
  <ccbd2439> hub_thread+0xe9/0xf0 [usbcore]  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
rpc.portmap   S CA71AD4C     0  3360      1          3366  1376 (NOTLB)
        ca71abb0 ca415540 c040b5e0 ca71ad4c caa34e40 00000246 c9ef68a0 
cbae73f8
        ca71ab90 c016f08f ca71ad4c c9c51900 ca415540 00002da4 df977b74 
00000011
        cb8c85c0 cb8c86dc ca71abc4 7fffa10f ca71afac ca71abec c02dab10 
ca71abc4
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <c016fedf> do_poll+0xcf/0x120
  <c0170130> do_sys_poll+0x200/0x270  <c01701e7> sys_poll+0x47/0x80
  <c0102fd7> syscall_call+0x7/0xb
inetd         S 00000008     0  3366      1          3404  3360 (NOTLB)
        ca74bb40 ca863030 c040b5e0 00000008 cbf9e7a0 ca74bb60 c01cbe7e 
cbc20b90
        cbf9e7a0 cbf9e7a0 c114a720 0079572f 00000000 0002b16e 0b98a109 
00000011
        ca863030 ca86314c 7fffffff 00000000 00000006 ca74bb7c c02dab5c 
c02a7390
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
sshd          S 00000053     0  3404      1  3761    3451  3366 (NOTLB)
        ca050b40 caa5eab0 c040b5e0 00000053 00000000 cac1cfa8 ca050b3c 
c9c48aec
        35aa018d 00000053 00011b8d 00000000 c4f68a70 00001aae 185bc062 
000000bc
        caa5eab0 caa5ebcc 7fffffff 00000000 00000004 ca050b7c c02dab5c 
c02a7390
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
rpc.rquotad   S C986DD4C     0  3451      1          3454  3404 (NOTLB)
        c986dbb0 ca0c35c0 c040b5e0 c986dd4c caa34c80 00000246 cb65ba20 
c91b78f8
        c986db90 c016f08f c986dd4c c9c50880 ca0c35c0 00015037 ce14ab29 
00000011
        ca749560 ca74967c c986dbc4 7fffa0f2 c986dfac c986dbec c02dab10 
c986dbc4
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <c016fedf> do_poll+0xcf/0x120
  <c0170130> do_sys_poll+0x200/0x270  <c01701e7> sys_poll+0x47/0x80
  <c0102fd7> syscall_call+0x7/0xb
nfsd4         S 00000003     0  3453      6          3464  3315 (L-TLB)
        ca0fbf48 ca0c35c0 c040b5e0 00000003 00000001 00000000 00000000 
ccc3f844
        00000296 ca0fbf48 00000296 00000000 ca749a70 00000518 6d86d785 
000000b9
        ca0c35c0 ca0c36dc ca0fb000 c9421bb0 c9421ba8 ca0fbfb0 c012b392 
c9421ba0
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
nfsd          S 58E45F52     0  3454      1          3455  3451 (L-TLB)
        ca89aefc ca2e8a70 c040b5e0 58e45f52 00004741 d0530d4d ca2e8560 
ca088bc0
        ca2e8560 ffffa0f8 cab28efc c02da0e8 ca2e8a70 0000019a d0576773 
00000011
        ca2e8560 ca2e867c ca89af10 00051f38 ca89a000 ca89af38 c02dab10 
ca89af10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S C11F8070     0  3455      1          3456  3454 (L-TLB)
        ca0c4efc ca721a90 c040b5e0 c11f8070 d02cb5e6 c11f8070 ca088bc0 
c11f8070
        ffffa0f8 ca89af2c c02da0e8 ca0c4f28 ca721a90 00001557 d056b921 
00000011
        c11f8070 c11f818c ca0c4f10 00051f38 ca0c4000 ca0c4f38 c02dab10 
ca0c4f10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CA721A90     0  3456      1          3457  3455 (L-TLB)
        c9eedefc cbae1030 c040b5e0 ca721a90 d02d055c ca721a90 ca088bc0 
ca721a90
        ffffa0f8 ca0c4efc c02da0e8 c9eedf28 cbae1030 00000578 d056d9f4 
00000011
        ca721a90 ca721bac c9eedf10 00051f38 c9eed000 c9eedf38 c02dab10 
c9eedf10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CBAE1030     0  3457      1          3458  3456 (L-TLB)
        c98b3efc ca863a50 c040b5e0 cbae1030 d02d39d1 cbae1030 ca088bc0 
cbae1030
        ffffa0f8 c9eedefc c02da0e8 c98b3f28 ca863a50 000004c8 d056f6a7 
00000011
        cbae1030 cbae114c c98b3f10 00051f38 c98b3000 c98b3f38 c02dab10 
c98b3f10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CA863A50     0  3458      1          3459  3457 (L-TLB)
        ca485efc ca863540 c040b5e0 ca863a50 d02d80fb ca863a50 ca088bc0 
ca863a50
        ffffa0f8 c98b3efc c02da0e8 ca485f28 ca863540 0000047c d0571193 
00000011
        ca863a50 ca863b6c ca485f10 00051f38 ca485000 ca485f38 c02dab10 
ca485f10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CA863540     0  3459      1          3460  3458 (L-TLB)
        c9b2aefc ca749050 c040b5e0 ca863540 d02dbbb7 ca863540 ca088bc0 
ca863540
        ffffa0f8 ca485efc c02da0e8 c9b2af28 ca749050 000004a3 d0572d66 
00000011
        ca863540 ca86365c c9b2af10 00051f38 c9b2a000 c9b2af38 c02dab10 
c9b2af10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CA749050     0  3460      1          3461  3459 (L-TLB)
        ca211efc cbba45a0 c040b5e0 ca749050 d02df08a ca749050 ca088bc0 
ca749050
        ffffa0f8 c9b2aefc c02da0e8 ca211f28 cbba45a0 00000485 d0574885 
00000011
        ca749050 ca74916c ca211f10 00051f38 ca211000 ca211f38 c02dab10 
ca211f10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
nfsd          S CBBA45A0     0  3461      1          3463  3460 (L-TLB)
        cab28efc ca2e8560 c040b5e0 cbba45a0 d02e25d7 cbba45a0 ca088bc0 
cbba45a0
        ffffa0f8 ca211efc c02da0e8 cab28f28 ca2e8560 000003d2 d0575f71 
00000011
        cbba45a0 cbba46bc cab28f10 00051f38 cab28000 cab28f38 c02dab10 
cab28f10
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccc093f8> nfsd+0xe8/0x300 [nfsd]  <c0101405> 
kernel_thread_helper+0x5/0x10
lockd         S 5E5F08D4     0  3463      1          3465  3461 (L-TLB)
        ca488f14 ca2e8a70 c040b5e0 5e5f08d4 00004741 ca488eec ca2e8a70 
ca088bc0
        ca2e8a70 ffffa0f8 ca2eaf48 c02da0e8 00000246 000007ea d057d4c8 
00000011
        ca2e8a70 ca2e8b8c 7fffffff ca488f90 ca488000 ca488f50 c02dab5c 
ca488f2c
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <ccdbadb9> svc_recv+0x3b9/0x4e0 
[sunrpc]
  <ccbb01df> lockd+0x11f/0x280 [lockd]  <c0101405> 
kernel_thread_helper+0x5/0x10
rpciod/0      S D055FF08     0  3464      6                3453 (L-TLB)
        ca2eaf48 ca2e8a70 c040b5e0 d055ff08 ca2eaf18 00000000 c9ef2514 
00000000
        00000000 ca2ea000 c9ef2090 ca2eaf34 ca2e8a70 00000261 d057ad33 
00000011
        c9ef2090 c9ef21ac ca2ea000 c9421b30 c9421b28 ca2eafb0 c012b392 
00000011
Call Trace:
  <c012b392> worker_thread+0x122/0x170  <c012e7c6> kthread+0xa6/0xf0
  <c0101405> kernel_thread_helper+0x5/0x10
rpc.mountd    S 00000000     0  3465      1          3468  3463 (NOTLB)
        ca416b40 ca415030 c040b5e0 00000000 00000000 00000000 00000000 
00000246
        cb176be0 c9f72df8 ca416b28 c016f08f ca415030 0001b5eb d3b8d913 
00000011
        ca749a70 ca749b8c 7fffffff 00000000 00000005 ca416b7c c02dab5c 
c02a7390
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
rpc.statd     S C0118532     0  3468      1          3475  3465 (NOTLB)
        ca892b40 ca415540 c040b5e0 c0118532 c11f8580 00000003 00000000 
00000246
        cb1768c0 c9f72918 ca892b28 c016f08f ca892bd8 0000407f df98bdf2 
00000011
        ca415540 ca41565c 7fffffff 00000000 00000007 ca892b7c c02dab5c 
c02a7390
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
crond         S CA84BF54     0  3475      1          3477  3468 (NOTLB)
        ca84bf0c c125f5a0 c040b5e0 ca84bf54 c0380a8c c0380a8c cb773a40 
6fd87de8
        000000c4 c0380a88 ca84bf0c 00000286 ca84bf54 00001143 37806a06 
000000bc
        c125f5a0 c125f6bc ca84b000 ca84bf54 00000000 ca84bf30 c02db699 
ca84bf54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
atd           S CA7F1F54     0  3477      1          3579  3475 (NOTLB)
        ca7f1f0c c1270030 c040b5e0 ca7f1f54 c0380a8c c0380a8c cb773a40 
087fc1c0
        000000e1 c0380a88 ca7f1f0c 00000286 ca7f1f54 00005ea4 c5efe4a0 
0000009f
        c1270030 c127014c ca7f1000 ca7f1f54 00000000 ca7f1f30 c02db699 
ca7f1f54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
gpm           S 00000000     0  3579      1          3582  3477 (NOTLB)
        c6c77b40 c6913070 c040b5e0 00000000 00000000 cac1cfa8 c6c77b3c 
c6c9a6e4
        cbb21734 c6c77b28 c01a3645 cbb21734 c6913070 00018dbd 87fe46ae 
00000014
        c126aad0 c126abec c6c77b54 00837b87 00000006 c6c77b7c c02dab10 
c6c77b54
Call Trace:
  <c02dab10> schedule_timeout+0x50/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
distccd       S C040B5E0     0  3582      1  3583    3584  3579 (NOTLB)
        ca2e4f08 ca721070 c040b5e0 c040b5e0 ca2e4f54 c0380a8c c0380a8c 
cb773a40
        97783028 00000010 c0380a88 ca2e4f0c 00000286 00000935 3357031e 
00000015
        ca721070 ca72118c fffffe00 ca721134 ca721134 ca2e4f80 c011f58a 
ffffffff
Call Trace:
  <c011f58a> do_wait+0x2ea/0x3c0  <c011f72c> sys_wait4+0x3c/0x40
  <c011f755> sys_waitpid+0x25/0x27  <c0102fd7> syscall_call+0x7/0xb
distccd       S C02E3E40     0  3583   3582          3661       (NOTLB)
        c6f1dde4 ca721070 c040b5e0 c02e3e40 00175540 c111a320 00000010 
c0381630
        00000000 34313438 c6f1ddc4 c027ac2f ca721070 000238f0 7ee34cbd 
00000014
        c130a560 c130a67c 7fffffff c9142060 c6f1d000 c6f1de20 c02dab5c 
c11b6b60
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02a64a7> 
inet_csk_wait_for_connect+0xc7/0x100
  <c02a65a1> inet_csk_accept+0xc1/0x180  <c02c53df> inet_accept+0x2f/0xc0
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
agetty        S CBC0BBC4     0  3584      1          3585  3582 (NOTLB)
        c6d77e7c ca415030 c040b5e0 cbc0bbc4 c6d77e5c c0132971 cbc0bbc4 
00000000
        c6d77000 c02197f0 cbc0bbc8 cbc0bbc8 ca415030 00017bb9 bf1913ee 
00000014
        ca415030 ca41514c 7fffffff cbc0b80c cbc0b800 c6d77eb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
agetty        S C6CF63C4     0  3585      1          3586  3584 (NOTLB)
        c6ebbe7c ca721580 c040b5e0 c6cf63c4 c6ebbe5c c0132971 c6cf63c4 
00000000
        c6ebb000 c02197f0 c6cf63c8 c6cf63c8 ca721580 00011bce c4870fab 
00000014
        ca721580 ca72169c 7fffffff c6cf600c c6cf6000 c6ebbeb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
agetty        S C6F66BC4     0  3586      1          3587  3585 (NOTLB)
        c6d67e7c caa5e090 c040b5e0 c6f66bc4 c6d67e5c c0132971 c6f66bc4 
00000000
        c6d67000 c02197f0 c6f66bc8 c6f66bc8 caa5e090 0000fe61 ce0f0c8d 
00000014
        caa5e090 caa5e1ac 7fffffff c6f6680c c6f66800 c6d67eb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
agetty        S 00000014     0  3587      1          3588  3586 (NOTLB)
        c6c6be7c cbc2a070 d23b2df1 00000014 c6c6be5c c0132971 c6830bc4 
00000000
        d23b2df1 00000014 0008d2b5 00000000 cbc2a070 0000f9ce d23b2df1 
00000014
        ca0c30b0 ca0c31cc 7fffffff c683080c c6830800 c6c6beb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
agetty        S C6F87BC4     0  3588      1          3589  3587 (NOTLB)
        c9f97e7c cbc2a070 c040b5e0 c6f87bc4 c9f97e5c c0132971 c6f87bc4 
00000000
        c9f97000 c02197f0 c6f87bc8 c6f87bc8 cbc2a070 0000b380 d2417d74 
00000014
        cbc2a070 cbc2a18c 7fffffff c6f8780c c6f87800 c9f97eb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
agetty        S C6F873C4     0  3589      1          3590  3588 (NOTLB)
        ca87de7c cbae1a50 c040b5e0 c6f873c4 ca87de5c c0132971 c6f873c4 
00000000
        ca87d000 c02197f0 c6f873c8 c6f873c8 cbae1a50 0000f003 e251e466 
00000014
        cbae1a50 cbae1b6c 7fffffff c6f8700c c6f87000 ca87deb8 c02dab5c 
22222222
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02198f0> read_chan+0x510/0x5c0
  <c021467c> tty_read+0xcc/0xe0  <c015b461> vfs_read+0xa1/0x190
  <c015b83b> sys_read+0x4b/0x80  <c0102fd7> syscall_call+0x7/0xb
db2fmcd       S CA8A2F54     0  3590      1          3697  3589 (NOTLB)
        ca8a2f0c cbba4ab0 c040b5e0 ca8a2f54 c0380a8c c0380a8c c6094f54 
09045b50
        000000bf c0380a88 ca8a2f0c 00000286 ca8a2f54 0000094b 631772db 
000000c3
        cbba4ab0 cbba4bcc ca8a2000 ca8a2f54 00000000 ca8a2f30 c02db699 
ca8a2f54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
distccd       S C02E3E40     0  3661   3582          3662  3583 (NOTLB)
        c693dde4 ca721070 c040b5e0 c02e3e40 00000001 00000020 c693ddd4 
00000000
        00000000 34333539 00000004 00000000 ca721070 0000cd8d bafe8237 
00000014
        c6913a90 c6913bac 7fffffff c9142060 c693d000 c693de20 c02dab5c 
c10d15a0
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02a64a7> 
inet_csk_wait_for_connect+0xc7/0x100
  <c02a65a1> inet_csk_accept+0xc1/0x180  <c02c53df> inet_accept+0x2f/0xc0
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
distccd       S C02E3E40     0  3662   3582                3661 (NOTLB)
        c6e3cde4 ca721070 c040b5e0 c02e3e40 001c1248 c0420620 c6e3cee4 
fffffffe
        c6e3cdc0 34333630 c11c1220 c6c44011 ca721070 0000c45d f72f0d4e 
00000014
        c68a6090 c68a61ac 7fffffff c9142060 c6e3c000 c6e3ce20 c02dab5c 
c6e3ce00
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02a64a7> 
inet_csk_wait_for_connect+0xc7/0x100
  <c02a65a1> inet_csk_accept+0xc1/0x180  <c02c53df> inet_accept+0x2f/0xc0
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S C02E3E40     0  3697      1          3698  3590 (NOTLB)
        c6097de4 c60a30b0 c040b5e0 c02e3e40 00000000 00000020 00000000 
00000000
        00000000 34343238 00000000 00000000 00000000 000518f6 8e0edfc5 
00000023
        c60a30b0 c60a31cc 7fffffff c9143500 c6097000 c6097e20 c02dab5c 
00000000
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c02a64a7> 
inet_csk_wait_for_connect+0xc7/0x100
  <c02a65a1> inet_csk_accept+0xc1/0x180  <c02c53df> inet_accept+0x2f/0xc0
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S C60B8F54     0  3698      1          3699  3697 (NOTLB)
        c60b8f0c c60a30b0 c040b5e0 c60b8f54 c0380a8c c0380a8c c6084f54 
1fc75790
        00000365 c0380a88 c60b8f0c 00000286 c60a30b0 0000c975 89e8968a 
00000023
        c6091a50 c6091b6c c60b8000 c60b8f54 00000000 c60b8f30 c02db699 
c60b8f54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S C6084F54     0  3699      1          3702  3698 (NOTLB)
        c6084f0c c60a3ad0 c040b5e0 c6084f54 c0380a8c c0380a8c ca7f1f54 
32adfac8
        000006ab c0380a88 c6084f0c 00000286 c6084f54 0005c336 6c1795f6 
00000023
        c60a3ad0 c60a3bec c6084000 c6084f54 00000000 c6084f30 c02db699 
c6084f54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S C014188B     0  3702      1          3703  3699 (NOTLB)
        c6092c88 c60a30b0 c040b5e0 c014188b 000280d2 00000000 c0381658 
00000044
        c6092c64 c014fa0b 00000010 00000001 c60a30b0 0014a21f 6eb4b432 
00000023
        c68a6ab0 c68a6bcc 7fffffff 00000000 00000000 c6092cc4 c02dab5c 
b7c11000
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c028294f> 
wait_for_packet+0xef/0x150
  <c0282a21> skb_recv_datagram+0x71/0xd0  <c02be539> udp_recvmsg+0x89/0x250
  <c027f36d> sock_common_recvmsg+0x4d/0x70  <c027b2ab> 
sock_recvmsg+0xcb/0x100
  <c027c88a> sys_recvfrom+0xaa/0x120  <c027d1ab> sys_socketcall+0x1bb/0x240
  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S FFFFFFFF     0  3703      1          3704  3702 (NOTLB)
        c60aede0 caa5e5a0 c040b5e0 ffffffff c02e3e40 002f0870 c60ae020 
c60aedf4
        c12f0a48 c60aedd4 34343035 c12f0a48 caa5e5a0 000b73c0 6ed30f74 
00000023
        c9ef25a0 c9ef26bc 7fffffff 00000000 00000000 c60aee1c c02dab5c 
c01a6f64
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c028294f> 
wait_for_packet+0xef/0x150
  <c0282a21> skb_recv_datagram+0x71/0xd0  <cc86c44f> 
unix_accept+0x7f/0x120 [unix]
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
db2dasrrm     S FFFFFFFF     0  3704      1          3720  3703 (NOTLB)
        c6095de0 caa5e5a0 c040b5e0 ffffffff c02e3e40 00175540 c10bba20 
00000010
        c0381630 00000000 34343038 c6095dc4 c027ac2f 000858da 6edb684e 
00000023
        caa5e5a0 caa5e6bc 7fffffff 00000000 00000000 c6095e1c c02dab5c 
c015804a
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c028294f> 
wait_for_packet+0xef/0x150
  <c0282a21> skb_recv_datagram+0x71/0xd0  <cc86c44f> 
unix_accept+0x7f/0x120 [unix]
  <c027c351> sys_accept+0xd1/0x1c0  <c027d0c4> sys_socketcall+0xd4/0x240
  <c0102fd7> syscall_call+0x7/0xb
db2fmd        S C6094F54     0  3720      1                3704 (NOTLB)
        c6094f0c c68a65a0 c040b5e0 c6094f54 c0380a8c c0380a8c cb773a40 
2ee551a0
        000000c2 c0380a88 c6094f0c 00000286 c6094f54 0000b6fd 1c85fdb8 
000000c2
        c68a65a0 c68a66bc c6094000 c6094f54 00000000 c6094f30 c02db699 
c6094f54
Call Trace:
  <c02db699> do_nanosleep+0x59/0x90  <c0131c9f> hrtimer_nanosleep+0x4f/0x120
  <c0131dd9> sys_nanosleep+0x69/0x80  <c0102fd7> syscall_call+0x7/0xb
sshd          S 00000053     0  3761   3404  3763    3913       (NOTLB)
        c5863d08 c6091030 c040b5e0 00000053 00000001 c5863ce8 c0282583 
c5841e00
        c742bbb1 00000053 000096aa 00000000 c6091030 000000d0 c7468b22 
00000053
        cb8c8ad0 cb8c8bec 7fffffff c5875e40 c5863d64 c5863d44 c02dab5c 
c5863d5c
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <cc86d24e> 
unix_stream_data_wait+0x8e/0xd0 [unix]
  <cc86d581> unix_stream_recvmsg+0x2f1/0x410 [unix]  <c027b4a4> 
do_sock_read+0x94/0xa0
  <c027b60b> sock_aio_read+0x8b/0xa0  <c015b36a> do_sync_read+0xba/0x110
  <c015b547> vfs_read+0x187/0x190  <c015b83b> sys_read+0x4b/0x80
  <c0102fd7> syscall_call+0x7/0xb
sshd          S 0000008E     0  3763   3761  3764               (NOTLB)
        c5f80b40 c6091030 c040b5e0 0000008e 00000246 c6830000 c5f80b58 
c0213603
        c6830000 c02817d2 00000000 00000096 c1273f00 0000dbdd 3393cf25 
0000008e
        c6091030 c609114c 7fffffff 00000000 00000009 c5f80b7c c02dab5c 
00000286
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
bash          S 00000000     0  3764   3763  3775               (NOTLB)
        c6669f08 c6913070 c040b5e0 00000000 00000000 c5841e00 c6669ef0 
c0118578
        c61feecc 00000001 ffffffff c6669ee8 c6913070 00014ac8 7de892ab 
00000054
        c6091540 c609165c fffffe00 c6091604 c6091604 c6669f80 c011f58a 
ffffffff
Call Trace:
  <c011f58a> do_wait+0x2ea/0x3c0  <c011f72c> sys_wait4+0x3c/0x40
  <c011f755> sys_waitpid+0x25/0x27  <c0102fd7> syscall_call+0x7/0xb
bash          S 00000000     0  3775   3764  3869               (NOTLB)
        c61fef08 c60a35c0 c040b5e0 00000000 00000000 c6c99400 c61feef0 
c0118578
        c59e9ecc 00000001 ffffffff c61feee8 c60a35c0 00011bc8 e5bbe646 
0000008b
        c6913070 c691318c fffffe00 c6913134 c6913134 c61fef80 c011f58a 
ffffffff
Call Trace:
  <c011f58a> do_wait+0x2ea/0x3c0  <c011f72c> sys_wait4+0x3c/0x40
  <c011f755> sys_waitpid+0x25/0x27  <c0102fd7> syscall_call+0x7/0xb
strace        S 0000008E     0  3869   3775  3870               (NOTLB)
        c59e9f20 c6091030 330fcfd4 0000008e 00000092 00000016 c59e9f08 
9882c420
        330fcfd4 0000008e 00341b21 00000000 c6091030 00001268 338b3882 
0000008e
        c60a35c0 c60a36dc fffffe00 c60a3684 c60a3684 c59e9f98 c011f58a 
ffffffff
Call Trace:
  <c011f58a> do_wait+0x2ea/0x3c0  <c011f72c> sys_wait4+0x3c/0x40
  <c0102fd7> syscall_call+0x7/0xb
lvremove      D 00000000     0  3870   3869                     (NOTLB)
        c5aa1d20 c60a35c0 c040b5e0 00000000 00000000 c5aa1dc0 c5aa1d8c 
c5aa1d28
        c026ce87 c5aa1d48 00000000 00000000 c60a35c0 00040bcc 338a92da 
0000008e
        c6913580 c691369c c5aa1000 00000001 ccc76080 c5aa1d28 c02daa6e 
c5aa1d70
Call Trace:
  <c02daa6e> io_schedule+0xe/0x20  <c026cf11> sync_io+0x81/0x100
  <c026d14d> dm_io_sync_vm+0x3d/0x50  <c02713ac> chunk_io+0x5c/0x60
  <c0271476> read_header+0x26/0xa0  <c0271851> 
persistent_read_metadata+0x21/0xd0
  <c026fc23> read_snapshot_metadata+0x13/0x70  <c026fffc> 
snapshot_ctr+0x37c/0x3d0
  <c026925c> dm_table_add_target+0x12c/0x1e0  <c026bd1e> 
populate_table+0x8e/0xf0
  <c026bdfa> table_load+0x7a/0x160  <c026c647> ctl_ioctl+0xd7/0x140
  <c016e63f> do_ioctl+0x4f/0x80  <c016e7b2> vfs_ioctl+0x62/0x1d0
  <c016e961> sys_ioctl+0x41/0x70  <c0102fd7> syscall_call+0x7/0xb
sshd          S 000000BC     0  3913   3404  3915          3761 (NOTLB)
        c4819d08 c4f68050 c040b5e0 000000bc 00000001 c4819ce8 c0282583 
c4863c00
        1b084dd3 000000bc 000081e0 00000000 c4f68050 000000d3 1b0be42a 
000000bc
        c4f68a70 c4f68b8c 7fffffff c5875cc0 c4819d64 c4819d44 c02dab5c 
c4819d5c
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <cc86d24e> 
unix_stream_data_wait+0x8e/0xd0 [unix]
  <cc86d581> unix_stream_recvmsg+0x2f1/0x410 [unix]  <c027b4a4> 
do_sock_read+0x94/0xa0
  <c027b60b> sock_aio_read+0x8b/0xa0  <c015b36a> do_sync_read+0xba/0x110
  <c015b547> vfs_read+0x187/0x190  <c015b83b> sys_read+0x4b/0x80
  <c0102fd7> syscall_call+0x7/0xb
sshd          S 000000C3     0  3915   3913  3916               (NOTLB)
        c484ab40 c48c2090 71e8cbac 000000c3 00000246 c4965800 c484ab58 
c0213603
        71e8cbac 000000c3 0000d89d 00000000 c48c2090 00005323 71eaccb5 
000000c3
        c4f68050 c4f6816c 7fffffff 00000000 00000009 c484ab7c c02dab5c 
00000286
Call Trace:
  <c02dab5c> schedule_timeout+0x9c/0xa0  <c016f4ca> do_select+0x33a/0x3c0
  <c016f713> core_sys_select+0x1c3/0x390  <c016f997> sys_select+0xb7/0x190
  <c0102fd7> syscall_call+0x7/0xb
bash          S 000200D2     0  3916   3915  3927               (NOTLB)
        c4f83f08 c48c2090 c040b5e0 000200d2 00000000 c0381658 00000044 
c4f83ee0
        c014fa0b 00000010 ffffffff c4f83ee8 c48c2090 000145c7 6ebd4a78 
000000bc
        c4f68560 c4f6867c fffffe00 c4f68624 c4f68624 c4f83f80 c011f58a 
ffffffff
Call Trace:
  <c011f58a> do_wait+0x2ea/0x3c0  <c011f72c> sys_wait4+0x3c/0x40
  <c011f755> sys_waitpid+0x25/0x27  <c0102fd7> syscall_call+0x7/0xb
bash          R running     0  3927   3916                     (NOTLB)

Showing all blocking locks in the system:
S            init:    1 [c11cfa50, 119] (not blocked on mutex)
S     ksoftirqd/0:    2 [c11cf540, 134] (not blocked on mutex)
S      watchdog/0:    3 [c11cf030,   0] (not blocked on mutex)
S        events/0:    4 [c11d9a70, 110] (not blocked on mutex)
S         khelper:    5 [c11d9560, 115] (not blocked on mutex)
S         kthread:    6 [c11d9050, 111] (not blocked on mutex)
S       kblockd/0:    8 [c11f8580, 110] (not blocked on mutex)
S         kseriod:   25 [c125fab0, 110] (not blocked on mutex)
D         pdflush:   69 [c126a5c0, 115] (not blocked on mutex)
S         pdflush:   70 [c126a0b0, 115] (not blocked on mutex)
S         kswapd0:   71 [c1270a50, 125] (not blocked on mutex)
S           aio/0:   72 [c1270540, 120] (not blocked on mutex)
S        khpsbpkt:  671 [cbc2a580, 116] (not blocked on mutex)
S       kcryptd/0:  683 [c130aa70, 111] (not blocked on mutex)
S        kmirrord:  684 [c11f8a90, 111] (not blocked on mutex)
S       kjournald:  686 [c130a050, 110] (not blocked on mutex)
S           udevd:  778 [cbba4090, 114] (not blocked on mutex)
S          kcopyd: 1087 [cbc2aa90, 111] (not blocked on mutex)
S      reiserfs/0: 1139 [c125f090, 110] (not blocked on mutex)
S       kjournald: 1161 [cbae1540, 111] (not blocked on mutex)
S       kjournald: 1176 [cb8c80b0, 110] (not blocked on mutex)
S         syslogd: 1373 [ca2e8050, 116] (not blocked on mutex)
R           klogd: 1376 [ca415a50, 116] (not blocked on mutex)
S       kpsmoused: 3261 [c9ef2ab0, 111] (not blocked on mutex)
S           khubd: 3315 [ca0c3ad0, 111] (not blocked on mutex)
S     rpc.portmap: 3360 [cb8c85c0, 115] (not blocked on mutex)
S           inetd: 3366 [ca863030, 125] (not blocked on mutex)
S            sshd: 3404 [caa5eab0, 116] (not blocked on mutex)
S     rpc.rquotad: 3451 [ca749560, 118] (not blocked on mutex)
S           nfsd4: 3453 [ca0c35c0, 110] (not blocked on mutex)
S            nfsd: 3454 [ca2e8560, 120] (not blocked on mutex)
S            nfsd: 3455 [c11f8070, 119] (not blocked on mutex)
S            nfsd: 3456 [ca721a90, 119] (not blocked on mutex)
S            nfsd: 3457 [cbae1030, 119] (not blocked on mutex)
S            nfsd: 3458 [ca863a50, 119] (not blocked on mutex)
S            nfsd: 3459 [ca863540, 119] (not blocked on mutex)
S            nfsd: 3460 [ca749050, 119] (not blocked on mutex)
S            nfsd: 3461 [cbba45a0, 119] (not blocked on mutex)
S           lockd: 3463 [ca2e8a70, 120] (not blocked on mutex)
S        rpciod/0: 3464 [c9ef2090, 111] (not blocked on mutex)
S      rpc.mountd: 3465 [ca749a70, 119] (not blocked on mutex)
S       rpc.statd: 3468 [ca415540, 120] (not blocked on mutex)
S           crond: 3475 [c125f5a0, 116] (not blocked on mutex)
S             atd: 3477 [c1270030, 116] (not blocked on mutex)
S             gpm: 3579 [c126aad0, 117] (not blocked on mutex)
S         distccd: 3582 [ca721070, 121] (not blocked on mutex)
S         distccd: 3583 [c130a560, 125] (not blocked on mutex)
S          agetty: 3584 [ca415030, 117] (not blocked on mutex)
S          agetty: 3585 [ca721580, 116] (not blocked on mutex)
S          agetty: 3586 [caa5e090, 116] (not blocked on mutex)
S          agetty: 3587 [ca0c30b0, 116] (not blocked on mutex)
S          agetty: 3588 [cbc2a070, 116] (not blocked on mutex)
S          agetty: 3589 [cbae1a50, 116] (not blocked on mutex)
S         db2fmcd: 3590 [cbba4ab0, 116] (not blocked on mutex)
S         distccd: 3661 [c6913a90, 121] (not blocked on mutex)
S         distccd: 3662 [c68a6090, 121] (not blocked on mutex)
S       db2dasrrm: 3697 [c60a30b0, 124] (not blocked on mutex)
S       db2dasrrm: 3698 [c6091a50, 120] (not blocked on mutex)
S       db2dasrrm: 3699 [c60a3ad0, 125] (not blocked on mutex)
S       db2dasrrm: 3702 [c68a6ab0, 125] (not blocked on mutex)
S       db2dasrrm: 3703 [c9ef25a0, 125] (not blocked on mutex)
S       db2dasrrm: 3704 [caa5e5a0, 125] (not blocked on mutex)
S          db2fmd: 3720 [c68a65a0, 116] (not blocked on mutex)
S            sshd: 3761 [cb8c8ad0, 116] (not blocked on mutex)
S            sshd: 3763 [c6091030, 115] (not blocked on mutex)
S            bash: 3764 [c6091540, 116] (not blocked on mutex)
S            bash: 3775 [c6913070, 115] (not blocked on mutex)
S          strace: 3869 [c60a35c0, 115] (not blocked on mutex)
D        lvremove: 3870 [c6913580, 100] (not blocked on mutex)
S            sshd: 3913 [c4f68a70, 116] (not blocked on mutex)
S            sshd: 3915 [c4f68050, 115] (not blocked on mutex)
S            bash: 3916 [c4f68560, 115] (not blocked on mutex)
R            bash: 3927 [c48c2090, 115] (not blocked on mutex)

---------------------------
| showing all locks held: |
---------------------------

#001:             [cbc0bbc4] {initialize_tty_struct}
.. held by:            agetty: 3584 [ca415030, 117]
... acquired at:               read_chan+0x410/0x5c0

#002:             [c6cf63c4] {initialize_tty_struct}
.. held by:            agetty: 3585 [ca721580, 116]
... acquired at:               read_chan+0x410/0x5c0

#003:             [c6f66bc4] {initialize_tty_struct}
.. held by:            agetty: 3586 [caa5e090, 116]
... acquired at:               read_chan+0x410/0x5c0

#004:             [c6830bc4] {initialize_tty_struct}
.. held by:            agetty: 3587 [ca0c30b0, 116]
... acquired at:               read_chan+0x410/0x5c0

#005:             [c6f87bc4] {initialize_tty_struct}
.. held by:            agetty: 3588 [cbc2a070, 116]
... acquired at:               read_chan+0x410/0x5c0

#006:             [c6f873c4] {initialize_tty_struct}
.. held by:            agetty: 3589 [cbae1a50, 116]
... acquired at:               read_chan+0x410/0x5c0

#007:             [ca230090] {init_once}
.. held by:          lvremove: 3870 [c6913580, 100]
... acquired at:               freeze_bdev+0x17/0x80

#008:             [ca230490] {init_once}
.. held by:          lvremove: 3870 [c6913580, 100]
... acquired at:               freeze_bdev+0x17/0x80

#009:             [c11c6270] {init_once}
.. held by:          lvremove: 3870 [c6913580, 100]
... acquired at:               freeze_bdev+0x17/0x80

#010:             [c11c6070] {init_once}
.. held by:          lvremove: 3870 [c6913580, 100]
... acquired at:               freeze_bdev+0x17/0x80

#011:             [cb7e2a48] {alloc_super}
.. held by:           pdflush:   69 [c126a5c0, 115]
... acquired at:               do_remount_sb+0xac/0x110

=============================================
