Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3A74641E.DC4D93DA@nortelnetworks.com>
Date: Sun, 28 Jan 2001 12:25:34 -0600
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Repost (line wrapping removed): Help: lvm 0.9.1_beta3 oops (can't get
 my data)
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
content-type: text/plain
To: linux-lvm@sistina.com

If I can't resolve this, I will have lost all the data in my /home and
/usr/local volumes.  So please, any comments or suggestions are welcome.

I am using lvm-0.9.1_beta3 and both kernels 2.2.18 and 2.4.0.  I created
the volume groups fresh using beta3 on 2.4.0.  I used both vgextend and
lvextend sucessfully several times.  I was leary of problems I'd seen
before with the vgextend oops.  However, everything looked okay with
beta3.

I then created LVs home and local on one of the VGs and put all my data
on it.

Finally, I went back to 2.2.18 and applied the rawio patch and the 2.2.18 patch for beta3.  I successfully booted on 2.2.18 once (or maybe twice).  And then when I was booting into 2.2.18 I got an oops when calling 'vgchange -a y'.  I get the same oops now on 2.4.0, so I can't get my data.  The puzzling thing is that the oops implies that it is trying to load the af_packet module.  The traceback looks basically the same on 2.2.18.

Here is an annotated typescript with some more details:

Script started on Sun Jan 28 11:44:02 2001
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "w0"
vgscan -- found inactive volume group "w1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgchange -a y
Segmentation fault
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# tail -22 /var/log/messages
Jan 28 11:44:04 btexi0c1 kernel: LVM version 0.9.1_beta3  by Heinz Mauelshagen  (25/01/2001)
Jan 28 11:44:04 btexi0c1 kernel: lvm -- Module successfully initialized
Jan 28 11:44:24 btexi0c1 kernel: Unable to handle kernel NULL pointer dereference at virtual address 000001b0
Jan 28 11:44:24 btexi0c1 kernel:  printing eip:
Jan 28 11:44:24 btexi0c1 kernel: d8908e71
Jan 28 11:44:24 btexi0c1 kernel: *pde = 00000000
Jan 28 11:44:24 btexi0c1 kernel: Oops: 0000
Jan 28 11:44:24 btexi0c1 kernel: CPU:    0
Jan 28 11:44:24 btexi0c1 kernel: EIP:    0010:[<d8908e71>]
Jan 28 11:44:24 btexi0c1 kernel: EFLAGS: 00210246
Jan 28 11:44:24 btexi0c1 kernel: eax: 00000000   ebx: 00000021   ecx: 00000100   edx: 00000100
Jan 28 11:44:24 btexi0c1 kernel: esi: d28cf000   edi: 00000300   ebp: 00000000   esp: c47ffb5c
Jan 28 11:44:24 btexi0c1 kernel: ds: 0018   es: 0018   ss: 0018
Jan 28 11:44:24 btexi0c1 kernel: Process vgchange (pid: 9915, stackpage=c47ff000)
Jan 28 11:44:24 btexi0c1 kernel: Stack: c4425000 d89090cb d28cf000 0000ffff 00000000 00000400 c4605400 00000330 
Jan 28 11:44:24 btexi0c1 kernel:        00000000 00021c36 d89077c4 d28cf000 c4605400 d28cf000 40239008 00000001 
Jan 28 11:44:24 btexi0c1 kernel:        00000100 00000005 c47ffbdc 00000000 c47ffd84 d28cf000 d8906bda 00000000 
Jan 28 11:44:24 btexi0c1 kernel: Call Trace: [<d89090cb>] [<d89077c4>] [<d8906bda>] [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packet/af+0/96] [<d8904707>] [do_anonymous_page+50/128] [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packet/af+-675481/96] 
Jan 28 11:44:24 btexi0c1 kernel:        [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packet/af+-660111/96] [iget4+76/208] [af_packet:__insmod_af_packet_O/lib/modules/2.4.0/kernel/net/packet/af+-675027/96] [d_alloc+22/352] [real_lookup+79/192] [path_walk+1906/2144] [ret_from_intr+0/32] [chrdev_open+54/64] 
Jan 28 11:44:24 btexi0c1 kernel:        [dentry_open+192/336] [filp_open+77/96] [getname+91/160] [sys_ioctl+375/400] [system_call+51/56] 
Jan 28 11:44:24 btexi0c1 kernel: 
Jan 28 11:44:24 btexi0c1 kernel: Code: 8b 80 b0 01 00 00 5e c3 8d b4 26 00 00 00 00 55 31 d2 57 56 
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# lsmod
Module                  Size  Used by
lvm-mod                39752   1  (autoclean)
ide-cd                 26640   0  (autoclean)
cdrom                  27132   0  (autoclean) [ide-cd]
nls_cp437               4376   7  (autoclean)
smbfs                  31980   7  (autoclean)
nfs                    48636   1  (autoclean)
autofs                 11036   1  (autoclean)
3c59x                  22748   1  (autoclean)
nls_iso8859-1           2864   9  (autoclean)
ntfs                   38632   2  (autoclean)
i810_audio             11940   0 
soundcore               4036   2  [i810_audio]
ac97_codec              7780   0  [i810_audio]
usb-uhci               21900   0  (unused)
usbcore                52580   1  [usb-uhci]
unix                   14628  93  (autoclean)
ide-disk                7232   7  (autoclean)
ext2                   38152   3 
ide-probe-mod           9044   0 
ide-mod                69088   7  [ide-cd ide-disk ide-probe-mod]
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgdisplay -v w0
vgdisplay -- "w0" is NOT active; try -D

]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgchange -a y w0
vgchange -- volume group "w0" already active

]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# wgdisplay -vD w0
bash: wgdisplay: command not found
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgdisplay -vD w0
--- Volume group ---
VG Name               w0
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               13.54 GB
PE Size               4 MB
Total PE              3466
Alloc PE / Size       1394 / 5.45 GB
Free  PE / Size       2072 / 8.09 GB
VG UUID               iFipbk-Or50-trN7-yAzb-6gsr-sBma-hNQj0A

--- Logical volume ---
LV Name                /dev/w0/home
VG Name                w0
LV Write Access        read/write
LV snapshot status     INACTIVE original
LV Status              NOT available
LV #                   1
# open                 0
LV Size                1.25 GB
Current LE             320
Allocated LE           320
Stripes               2
Stripe size (KByte)   8
Allocation             next free
Read ahead sectors     120
Block device           58:0

--- Logical volume ---
LV Name                /dev/w0/local
VG Name                w0
LV Write Access        read/write
LV snapshot status     INACTIVE original
LV Status              NOT available
LV #                   2
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
Stripes               2
Stripe size (KByte)   8
Allocation             next free
Read ahead sectors     120
Block device           58:1

--- Logical volume ---
LV Name                /dev/w0/home.2001.01.27.17.04
VG Name                w0
LV Write Access        read only
LV snapshot status     INACTIVE snapshot
LV Status              NOT available
LV #                   3
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
snapshot chunk size    64 KB
Allocation             next free
Read ahead sectors     120
Block device           58:2

--- Logical volume ---
LV Name                /dev/w0/local.2001.01.27.17.08
VG Name                w0
LV Write Access        read only
LV snapshot status     INACTIVE snapshot
LV Status              NOT available
LV #                   4
# open                 0
LV Size                200 MB
Current LE             50
Allocated LE           50
snapshot chunk size    64 KB
Allocation             next free
Read ahead sectors     120
Block device           58:3

--- Logical volume ---
LV Name                /dev/w0/home.2001.01.27.21.40
VG Name                w0
LV Write Access        read only
LV snapshot status     INACTIVE snapshot
LV Status              NOT available
LV #                   5
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
snapshot chunk size    64 KB
Allocation             next free
Read ahead sectors     120
Block device           58:4

--- Logical volume ---
LV Name                /dev/w0/home.2001.10.27.22.44
VG Name                w0
LV Write Access        read only
LV snapshot status     INACTIVE snapshot
LV Status              NOT available
LV #                   6
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
snapshot chunk size    64 KB
Allocation             next free
Read ahead sectors     120
Block device           58:5


--- Physical volumes ---
PV Name (#)           /dev/hda8 (1)
PV Status             available / allocatable
Total PE / Free PE    1733 / 627

PV Name (#)           /dev/hdb3 (2)
PV Status             available / allocatable
Total PE / Free PE    1733 / 1445


]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgdisplay -vD w1
--- Volume group ---
VG Name               w1
VG Access             read/write
VG Status             NOT available/resizable
VG #                  1
MAX LV                256
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               5.45 GB
PE Size               4 MB
Total PE              1394
Alloc PE / Size       0 / 0
Free  PE / Size       1394 / 5.45 GB
VG UUID               WhYelk-ZTE1-YXnK-wlU7-kSJs-tP3f-x8z0SM

--- No logical volumes defined in "w1" ---


--- Physical volumes ---
PV Name (#)           /dev/hdb4 (1)
PV Status             NOT available / allocatable
Total PE / Free PE    1394 / 1394


]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# uname -a
Linux btexi0c1.us.nortel.com 2.4.0 #3 Sat Jan 27 12:48:32 CST 2001 i686 unknown
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# 
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# date
Sun Jan 28 11:46:58 CST 2001
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# exit

Script done on Sun Jan 28 11:47:00 2001
Script started on Sun Jan 28 11:49:25 2001
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgchange -a y
vgchange -- volume group "w0" already active
vgchange -- volume group "w1" successfully activated

]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vi /etc/fstab
[uncommented out mount points to logical volumes as follows]
...
#/dev/w0/home[11C/home[19Cext2    defaults
#/dev/w0/local[10C/usr/local[14Cext2    defaults
...
/dev/w0/home		/home			ext2	defaults	1 2
/dev/w0/local		/usr/local		ext2	defaults	1 2
...
root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# mount -a
mount: /dev/w0/home is not a valid block device
mount: /dev/w0/local is not a valid block device
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vgdisplay
Segmentation fault
[no oops on this one]

root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# vi /etc/fstab
[commented out mount points to VGs]
...
/dev/w0/home[12C/home[19Cext2    defaults
/dev/w0/local[11C/usr/local[14Cext2    defaults
[...]
#/dev/w0/home		/home			ext2	defaults	1 2
#/dev/w0/local		/usr/local		ext2	defaults	1 2
[...]
root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# cat /p proc/lvm/global
LVM module version 0.9.1_beta3 (25/01/2001)

Total:  2 VGs  3 PVs  5 LVs (0 LVs open)
Global: 1487801 bytes malloced   IOP version: 10   0:14:20 active

VG: Iw0  [2 PV, 5 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 14196736 /3466 total  5709824 /1394 used  8486912 /2072 free
  PVs: [AA] hda8                   7098368 /1733     1179648 /288      5918720 /1445  
       [AA] hdb3                   7098368 /1733     1179648 /288      5918720 /1445  
    LVs: [AWDS2 ] home                       1310720 /320      close
         [AWDS2 ] local                      1048576 /256      close
         [ARDS2 ] home.2001.01.27.17.04      1310720 /320      close
         [ARDS2 ] local.2001.01.27.17.08     1048576 /256      close
         [ARDS2 ] home.2001.01.27.21.40      1310720 /320      close[IRDS2 ] home.2001.10.27.22.44      1310720 /320      close

VG:  w1  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
  Usage [KB/PE]: 5709824 /1394 total  0 /0 used  5709824 /1394 free
  PV:  [AA] hdb4                   5709824 /1394           0 /0        5709824 /1394  
    LVs: none
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# 
Script done on Sun Jan 28 11:58:34 2001
Script started on Sun Jan 28 12:06:13 2001
]0;root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# cat /etc/rc.d/rc.sysinit
[ normal redhat 7.0 rc.sysinit showing where my LVM commands are (They are commented out since the oops)]
#!/bin/sh
#
# /etc/rc.sysinit - run once at boot time
#
# Taken in part from Miquel van Smoorenburg's bcheckrc.
#
[...]
# Add raid devices
[...]
#echo "Scanning for volume groups: "
#vgscan
#echo "Activating volume groups: "
#vgchange -a y

_RUN_QUOTACHECK=0
# Check filesystems
[...]

root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# cat /etc/rc.d/init.d/halt
#!/bin/bash
#
# rc.halt       This file is executed by init when it goes into runlevel
#               0 (halt) or runlevel 6 (reboot). It kills all processes,
#               unmounts file systems and then either halts or reboots.
#
# Author:       Miquel van Smoorenburg, <miquels@drinkel.nl.mugnet.org>
#               Modified for RHS Linux by Damien Neil
#
[...]
# turn off raid
[...]
# deactivate volume groups
#echo "Deactivating volume groups: "
#vgchange -a n
[...]
root@btexi0c1.us.nortel.com: /root[root@btexi0c1 /root]# 
Script done on Sun Jan 28 12:06:43 2001
