Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i21BsE830453
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 06:54:14 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.126.184])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i21BsCb29404
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 06:54:13 -0500
Received: from [212.227.126.203] (helo=mrvnet.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1Axlzw-0007PA-00
	for linux-lvm@redhat.com; Mon, 01 Mar 2004 12:54:12 +0100
Subject: Re: [linux-lvm] ReCreating the 1st 512 bytes of PV
From: =?iso-8859-1?Q?Tobias_Katzer?= <lvm-list.mail@nex-consult.com>
Message-Id: <5643332$1078141610404322aa0e38c1.20834736@config22.schlund.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  1 06:52:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com
Cc: =?iso-8859-1?Q?Tobias_Katzer?= <lvm-list.mail@nex-consult.com>

{...CUT...}


>>****************
>>
>>I?ve found "/etc/lvmtab.d/vg00", "/etc/lvmconf/vg00.conf" and
>>"/etc/lvmtab" on a backup 
>>(which doesn?t contain my real important data)
>>
>>But: 
>>
>>root 0[hda7]# vgcfgrestore -n vg00 /dev/hda5
>>vgcfgrestore -- INFO: using backup file "/etc/lvmconf/vg00.conf"
>>vgcfgrestore -- ERROR: different structure size stored in
>>"/etc/lvmconf/vg00.conf" than expected in file vg_cfgrestore.c [line
>>120]
>>vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
>>"vg00"
>>****************
>
>This must be a rather old metadata backup when you hit this problem
>of changed structure sizes.
>You need an actual metadata backup or the vgcfgrestore you took the backup with
>in order to restore the old one.
>
>>
>>.. to locate the file-systems directly on /dev/hda5/, "dd" them into a
>>file and mount it as loop-back-device works 
>>slightly, but contains only a few usable data (after fsck.reiserfs
>>--rebuilt-tree), mostly only files with crap content.
>
>You started with the wrong offset and/or have a non-trivial mapping
>where logical extents and physical extents ar not in order.

I guess, it's in a mixed order... Why ?


{...CUT...}

>
>
>Summary:
>
>a) if you have an *actual* metadata backup, restore it.

I�ve only the backups which I got from "dd". (I thought first, I got it
from a backup CD)

>b) if not, use the LVM tool version you used for the metadata backup
>   to vgcfgrestore it (mind to "pvcreate -ff /dev/hda5" before vgcfgrestore).

***
dd if=/dev/zero of=/dev/hda5 bs=512 count=1
1+0 Records ein
1+0 Records aus
512 bytes transferred in 0,005832 seconds (87790 bytes/sec)

***
pvcreate -ff /dev/hda5
pvcreate -- WARNING: forcing physical volume creation on "/dev/hda5"
pvcreate -- physical volume "/dev/hda5" successfully created

***
0000000: 484d 0100 0000 0000 0004 0000 0010 0000  HM..............
0000010: 0010 0000 0000 0000 0000 0000 0000 0000  ................
0000020: 0000 0000 0000 0000 0000 0000 674b 346c  ............gK4l
0000030: 3630 484e 3251 5953 776a 714b 4d38 5265  60HN2QYSwjqKM8Re
0000040: 7030 7566 7772 4671 4163 7350 0000 0000  p0ufwrFqAcsP....
0000050: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000060: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000080: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000090: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000a0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000b0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000100: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000110: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000120: 0000 0000 0000 0000 0000 0000 4b6e 6f70  ............Knop
0000130: 7069 7831 3037 3831 3337 3234 3600 0000  pix1078137246...
0000140: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000150: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000160: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000170: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000180: 0000 0000 0000 0000 0000 0000 0000 0000  ................
0000190: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00001a0: 0000 0000 0000 0000 0000 0000 0300 0000  ................
00001b0: 0000 0000 0000 0000 0200 0000 0cb6 fd00  ................
00001c0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00001d0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00001e0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00001f0: 0000 0000 0000 0000 0000 0000 0000 0000  ................
***
root@0[lvmconf]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda5" is in no VG  [7.93 GB]
pvscan -- total: 1 [7.93 GB] / in use: 0 [0] / in no VG: 1 [7.93 GB]

***
vgcfgrestore -f /mnt/hda7/20040229_vg-test/1/lvmconf/vg00.conf -n vg00
-t -v /dev/hda5

vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "vg00" from
"/mnt/hda7/20040229_vg-test/1/lvmconf/vg00.conf"
vgcfgrestore -- checking existence of
"/mnt/hda7/20040229_vg-test/1/lvmconf/vg00.conf"
vgcfgrestore -- reading volume group data for "vg00" from
"/mnt/hda7/20040229_vg-test/1/lvmconf/vg00.conf"
vgcfgrestore -- ERROR: different structure size stored in
"/mnt/hda7/20040229_vg-test/1/lvmconf/vg00.conf" than expected in file
vg_cfgrestore.c [line 120]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"vg00"

***
pvdata /dev/hda5

--- NEW Physical volume ---
PV Name               /dev/hda5
VG Name
PV Size               7.93 GB [16627212 secs]
PV#                   0
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               gK4l60-HN2Q-YSwj-qKM8-Rep0-ufwr-FqAcsP

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               7.92 GB
PE Size               4 MB
Total PE              2028
Alloc PE / Size       2028 / 7.92 GB
Free  PE / Size       0 / 0
VG UUID               xe1EZa-92lV-3Nyq-BX36-z9Te-7EcA-1vonap

--- List of logical volumes ---

pvdata -- logical volume struct at offset   0 is inconsistent
pvdata -- logical volume struct at offset   1 is empty
...
pvdata -- logical volume struct at offset  12 is empty
pvdata -- logical volume struct at offset  13 is inconsistent
...
pvdata -- logical volume struct at offset  25 is inconsistent
pvdata -- logical volume struct at offset  26 is empty
...
pvdata -- logical volume struct at offset 124 is empty
...
pvdata -- logical volume struct at offset 139 is inconsistent
pvdata -- logical volume struct at offset 140 is empty
...
pvdata -- logical volume struct at offset 255 is empty

--- List of physical volume UUIDs ---

Segmentation fault

***
==> You can find "lvmconf" on my site:
http://www.NEX-consult.com/vg00-cfg.from-dd.tar.gz
Could you please check it if it's usable ?

***



>c) if you have a sequential 1:1 mapping, find the correct offset of the
>   first extent and retry dd'ing data off hda5
>

I�m afraid, it�s not sequential.



Thanks
Tobias
