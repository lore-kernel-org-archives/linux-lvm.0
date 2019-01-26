Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39DA65C6A6
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2019 21:14:19 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C791C8666D
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2019 21:14:17 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id t9-v6so11129116ljh.6
	for <linux-lvm@redhat.com>; Sat, 26 Jan 2019 13:14:17 -0800 (PST)
Received: from [192.168.1.4] (109-252-90-29.nat.spd-mgts.ru. [109.252.90.29])
	by smtp.gmail.com with ESMTPSA id
	d23sm2243795lfc.11.2019.01.26.13.14.14 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Jan 2019 13:14:14 -0800 (PST)
From: Andrei Borzenkov <arvidjaar@gmail.com>
Message-ID: <ba63b761-d169-a290-3cd9-c6d61f4d5514@gmail.com>
Date: Sun, 27 Jan 2019 00:14:14 +0300
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Option devices/dir different from /dev does not work
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
To: linux-lvm@redhat.com

I attempt to put device nodes for volumes in sub-directory of /dev to
avoid accidental conflict between device name and volume group and
general /dev pollution. VxVM always did it, using /dev/vx as base
directory, so I would use something like /dev/lvm.

Option devices/dir sounds like exactly the right one based on description:

# Directory in which to create volume group device nodes.

Unfortunately it appears to have no effect, LVM devices are still
created directly under /dev. The only device under /dev/lvm is
/dev/lvm/mapper/control ...

I suspect the reason is, device nodes are created by udev and it does
not know anything about LVM settings:

# Create symlinks for top-level devices only.
ENV{DM_VG_NAME}=="?*", ENV{DM_LV_NAME}=="?*",
SYMLINK+="$env{DM_VG_NAME}/$env{DM_LV_NAME}", GOTO="lvm_end"

Is it intentional? In this case at the very least comment in lvm.conf
should explicitly say that this setting has no effect if udev
integration is enabled.

openSUSE Tumbleweed just updated.

10:~ # lvm2
lvm2-2.02.180-3.1.x86_64
10:~ # lvmconfig --type full devices/dir
dir="/dev/lvm"
10:~ # ls -l /dev/lvm
total 0
drwxr-xr-x 2 root root 60 Jan 27 00:05 mapper
10:~ # pvs
  PV         VG     Fmt  Attr PSize  PFree
  /dev/sdb   vgTEST lvm2 a--  10.00g 9.90g
10:~ # vgs
  VG     #PV #LV #SN Attr   VSize  VFree
  vgTEST   1   1   0 wz--n- 10.00g 9.90g
10:~ # lvs
  LV      VG     Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  lvTEST vgTEST -wi-a----- 100.00m

10:~ # ls -l /dev/vgTEST
total 0
lrwxrwxrwx 1 root root 7 Jan 27 00:05 lvTEST -> ../dm-0
10:~ # ls -l /dev/lvm/mapper
total 0
crw------- 1 root root 10, 236 Jan 27 00:05 control
10:~ # ls -l /dev/mapper
total 0
crw------- 1 root root 10, 236 Jan 27 00:05 control
lrwxrwxrwx 1 root root       7 Jan 27 00:05 vgTEST-lvTEST -> ../dm-0
