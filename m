Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB01A5C546
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2017 19:08:42 +0000 (UTC)
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C46DA81243
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2017 19:08:41 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id x75so104674268vke.2
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2017 12:08:40 -0700 (PDT)
MIME-Version: 1.0
From: Neutron Sharc <neutronsharc@gmail.com>
Date: Tue, 21 Mar 2017 12:07:59 -0700
Message-ID: <CAB-bdySeF5boiNRa6x16-DYPPAz75-36NwYAnK+Y3KvCz_bLBw@mail.gmail.com>
Subject: [linux-lvm] lvm operation hangs at semop()
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
To: linux-lvm@redhat.com

Hi all,

I'm running very latest lvm2 code and I frequently see lvm command
hangs. gdb shows the code is blocked waiting for semop to complete.

Is there some reference about udev rules I should use?

Below is an example of backtrace of "lvcreate" hanging:
(gdb) bt
#0  0x00007fdd91e64057 in semop () at ../sysdeps/unix/syscall-template.S:84
#1  0x00007fdd925829b9 in _udev_wait (cookie=223166712,
nowait=nowait@entry=0x7fff92fd9884) at libdm-common.c:2611
#2  0x00007fdd92584087 in dm_udev_wait (cookie=<optimized out>) at
libdm-common.c:2630
#3  0x0000560b22a2ca65 in fs_unlock () at activate/fs.c:491
#4  0x0000560b22a36545 in _file_lock_resource (cmd=<optimized out>,
resource=<optimized out>, flags=320, lv=<optimized out>) at
locking/file_locking.c:64
#5  0x0000560b229b9e88 in _lock_vol (cmd=cmd@entry=0x560b249ae000,
resource=<optimized out>, resource@entry=0x7fff92fda950 "#sync_names",
flags=flags@entry=320, lv_op=lv_op@entry=LV_NOOP,
    lv=lv@entry=0x0) at locking/locking.c:275
#6  0x0000560b229ba7f3 in lock_vol (cmd=0x560b249ae000, vol=<optimized
out>, vol@entry=0x560b22a82839 "#sync_names", flags=flags@entry=320,
lv=lv@entry=0x0) at locking/locking.c:355
#7  0x0000560b229bb490 in sync_local_dev_names (cmd=<optimized out>)
at locking/locking.c:529
#8  0x0000560b229d1c7a in wipe_lv (lv=lv@entry=0x560b24a7f4d0, wp=...)
at metadata/lv_manip.c:7064
#9  0x0000560b229d6437 in _lv_create_an_lv
(vg=vg@entry=0x560b24a7d490, lp=lp@entry=0x7fff92fdbfe0,
new_lv_name=<optimized out>) at metadata/lv_manip.c:7842
#10 0x0000560b229d722f in lv_create_single
(vg=vg@entry=0x560b24a7d490, lp=lp@entry=0x7fff92fdbfe0) at
metadata/lv_manip.c:8018
#11 0x0000560b22953b44 in _lvcreate_single
(cmd=cmd@entry=0x560b249ae000, vg_name=vg_name@entry=0x560b249f6a40
"vol3name", vg=vg@entry=0x560b24a7d490,
handle=handle@entry=0x560b249f6998)
    at lvcreate.c:1608
#12 0x0000560b22972530 in _process_vgnameid_list
(process_single_vg=0x560b22952ff0 <_lvcreate_single>,
handle=0x560b249f6998, arg_tags=0x7fff92fdbe40,
arg_vgnames=0x7fff92fdbe50,
    vgnameids_to_process=0x7fff92fdbe70, read_flags=<optimized out>,
cmd=0x560b249ae000) at toollib.c:1964
#13 process_each_vg (cmd=cmd@entry=0x560b249ae000, argc=argc@entry=0,
argv=argv@entry=0x0, one_vgname=<optimized out>,
use_vgnames=use_vgnames@entry=0x0, read_flags=<optimized out>,
    read_flags@entry=1048576, include_internal=0,
handle=0x560b249f6998, process_single_vg=0x560b22952ff0
<_lvcreate_single>) at toollib.c:2277
#14 0x0000560b22956628 in lvcreate (cmd=0x560b249ae000,
argc=<optimized out>, argv=<optimized out>) at lvcreate.c:1647
#15 0x0000560b2295d9d1 in lvm_run_command
(cmd=cmd@entry=0x560b249ae000, argc=1, argc@entry=10,
argv=0x7fff92fdc490, argv@entry=0x7fff92fdc448) at lvmcmdline.c:2880
#16 0x0000560b2295e4d1 in lvm2_main (argc=10, argv=0x7fff92fdc448) at
lvmcmdline.c:3408
#17 0x00007fdd91d7c830 in __libc_start_main (main=0x560b2293ea10
<main>, argc=10, argv=0x7fff92fdc448, init=<optimized out>,
fini=<optimized out>, rtld_fini=<optimized out>,
    stack_end=0x7fff92fdc438) at ../csu/libc-start.c:291
#18 0x0000560b2293ea49 in _start ()


I'm using (almost) latest lvm2 code from Mar 16:
 73d0280 [origin/master] lvmetad: fix bug in snprintf of disable reason
