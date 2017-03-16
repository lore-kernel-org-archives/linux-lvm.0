MIME-Version: 1.0
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Thu, 16 Mar 2017 12:47:20 -0700
Message-ID: <CAB-bdyQ=G78=oaAqdTdiLKBwd1M0wyQ=LpETUVi89VJf64shbQ@mail.gmail.com>
Subject: [linux-lvm] lvcreate hangs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, David Teigland <teigland@redhat.com>

I'm seeing "lvcreate" command hang when running "lvcreate -l 100%FREE
-i 30 -I 16 -n vol1_lv vol1".  "lvs" shows the actual lv is created
but the command  got stuck.

From syslog I see this:
Mar 16 12:32:57 vm3 systemd-udevd[27820]: Process '/sbin/dmsetup
udevcomplete 23113993' failed with exit code 1.

The program hangs at semop and doesn't return. Below is gdb trace:
Thread 1 (Thread 0x7f60e9d7e840 (LWP 27131)):
#0  0x00007f60e8be4057 in semop () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007f60e9302559 in _udev_wait (cookie=223195401,
nowait=nowait@entry=0x7ffef972d614) at libdm-common.c:2607
#2  0x00007f60e9303c27 in dm_udev_wait (cookie=<optimized out>) at
libdm-common.c:2626
#3  0x0000555781e932b5 in fs_unlock () at activate/fs.c:491
#4  0x0000555781e9cd65 in _file_lock_resource (cmd=<optimized out>,
resource=<optimized out>, flags=320, lv=<optimized out>) at
locking/file_locking.c:64
#5  0x0000555781e26e38 in _lock_vol (cmd=cmd@entry=0x555783fcb000,
resource=<optimized out>, resource@entry=0x7ffef972e6e0 "#sync_names",
flags=flags@entry=320,
    lv_op=lv_op@entry=LV_NOOP, lv=lv@entry=0x0) at locking/locking.c:275
#6  0x0000555781e277a3 in lock_vol (cmd=0x555783fcb000, vol=<optimized
out>, vol@entry=0x555781ed6941 "#sync_names", flags=flags@entry=320,
lv=lv@entry=0x0) at locking/locking.c:355
#7  0x0000555781e28440 in sync_local_dev_names (cmd=<optimized out>)
at locking/locking.c:529
#8  0x0000555781e3ddda in wipe_lv (lv=lv@entry=0x555784051db8, wp=...)
at metadata/lv_manip.c:6905
#9  0x0000555781e42447 in _lv_create_an_lv
(vg=vg@entry=0x55578404ef70, lp=lp@entry=0x7ffef972fd70,
new_lv_name=<optimized out>) at metadata/lv_manip.c:7692
#10 0x0000555781e4325f in lv_create_single
(vg=vg@entry=0x55578404ef70, lp=lp@entry=0x7ffef972fd70) at
metadata/lv_manip.c:7869
#11 0x0000555781dc2e10 in _lvcreate_single
(cmd=cmd@entry=0x555783fcb000, vg_name=vg_name@entry=0x555784010968
"vol1", vg=vg@entry=0x55578404ef70,
handle=handle@entry=0x5557840108c8)
    at lvcreate.c:1610
#12 0x0000555781de12d0 in _process_vgnameid_list
(process_single_vg=0x555781dc22c0 <_lvcreate_single>,
handle=0x5557840108c8, arg_tags=0x7ffef972fbd0,
arg_vgnames=0x7ffef972fbe0,
    vgnameids_to_process=0x7ffef972fc00, read_flags=<optimized out>,
cmd=0x555783fcb000) at toollib.c:1964
#13 process_each_vg (cmd=cmd@entry=0x555783fcb000, argc=argc@entry=0,
argv=argv@entry=0x0, one_vgname=<optimized out>,
use_vgnames=use_vgnames@entry=0x0, read_flags=<optimized out>,
    read_flags@entry=1048576, include_internal=0,
handle=0x5557840108c8, process_single_vg=0x555781dc22c0
<_lvcreate_single>) at toollib.c:2277
#14 0x0000555781dc5878 in lvcreate (cmd=0x555783fcb000,
argc=<optimized out>, argv=<optimized out>) at lvcreate.c:1649
#15 0x0000555781dcc953 in lvm_run_command
(cmd=cmd@entry=0x555783fcb000, argc=1, argc@entry=10,
argv=0x7ffef9730110, argv@entry=0x7ffef97300c8) at lvmcmdline.c:1723
#16 0x0000555781dcd647 in lvm2_main (argc=10, argv=0x7ffef97300c8) at
lvmcmdline.c:2249
#17 0x00007f60e8afc830 in __libc_start_main (main=0x555781db20d0
<main>, argc=10, argv=0x7ffef97300c8, init=<optimized out>,
fini=<optimized out>, rtld_fini=<optimized out>,
    stack_end=0x7ffef97300b8) at ../csu/libc-start.c:291
#18 0x0000555781db2109 in _start ()


I'm using lvm2 v2_02_168 built from source and on Ubuntu 16.04.
