Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0RMoW1J001380
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 17:50:32 -0500
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0RMoM0F004530
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 17:50:22 -0500
Received: by qyk12 with SMTP id 12so2725916qyk.12
	for <linux-lvm@redhat.com>; Thu, 27 Jan 2011 14:50:22 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 28 Jan 2011 01:50:21 +0300
Message-ID: <AANLkTinoO=4ozufaM6Q4BKm8qZnmv2aSURr4F2xYye60@mail.gmail.com>
From: CoolCold <coolthecold@gmail.com>
Subject: [linux-lvm] unable to create device for volume group
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

Hello!
I've just created new pv & vg, wanted to create lv over it, but
suddenly found there is nothing in /dev or /sys/block or
/sys/class/block related to that vg

a bit info:
I already have another pvs & volume group (inktomia) & lv, working nice:
root@delta:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vgsphinx" using metadata type lvm2
  Found volume group "inktomia" using metadata type lvm2

new vg is "vgsphinx".

root@delta:~# vgdisplay vgsphinx
  --- Volume group ---
  VG Name               vgsphinx
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  1
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                0
  Open LV               0
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               111.79 GB
  PE Size               4.00 MB
  Total PE              28618
  Alloc PE / Size       0 / 0
  Free  PE / Size       28618 / 111.79 GB
  VG UUID               9TSHZX-DbFk-2kSl-RI6I-XYOH-gMho-eI2wsZ

filter looks ok too:
root@delta:~# egrep '^[[:space:]]+filter' /etc/lvm/lvm.conf
    filter = [ "a/.*/" ]

nothing interesting in dmesg.


steps i did when trying to resolve issue:
root@delta:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vgsphinx" using metadata type lvm2
  Found volume group "inktomia" using metadata type lvm2
root@delta:~# vgchange -a y
  0 logical volume(s) in volume group "vgsphinx" now active
  1 logical volume(s) in volume group "inktomia" now active
root@delta:~# vgmknodes -v
    Finding all logical volumes

root@delta:~# ls -la /sys/block/
total 0
drwxr-xr-x  2 root root 0 2011-01-27 23:34 .
drwxr-xr-x 13 root root 0 2011-01-27 23:33 ..
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 dm-0 -> ../devices/virtual/block/dm-0
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop0 ->
../devices/virtual/block/loop0
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop1 ->
../devices/virtual/block/loop1
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop2 ->
../devices/virtual/block/loop2
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop3 ->
../devices/virtual/block/loop3
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop4 ->
../devices/virtual/block/loop4
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop5 ->
../devices/virtual/block/loop5
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop6 ->
../devices/virtual/block/loop6
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 loop7 ->
../devices/virtual/block/loop7
lrwxrwxrwx  1 root root 0 2011-01-27 23:33 md0 -> ../devices/virtual/block/md0
lrwxrwxrwx  1 root root 0 2011-01-27 23:33 md1 -> ../devices/virtual/block/md1
lrwxrwxrwx  1 root root 0 2011-01-27 23:33 md2 -> ../devices/virtual/block/md2
lrwxrwxrwx  1 root root 0 2011-01-27 23:33 md3 -> ../devices/virtual/block/md3
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 sda ->
../devices/pci0000:00/0000:00:1f.2/host0/target0:0:0/0:0:0:0/block/sda
lrwxrwxrwx  1 root root 0 2011-01-28 01:12 sdb ->
../devices/pci0000:00/0000:00:1f.2/host1/target1:0:0/1:0:0:0/block/sdb
lrwxrwxrwx  1 root root 0 2011-01-28 00:09 sdc ->
../devices/pci0000:00/0000:00:1f.2/host5/target5:0:0/5:0:0:0/block/sdc

so, /devices/virtual/block/dm-0 is from vg "inktomia", and there is no
new vg here

system info: debian lenny with 2.6.32 kernel from backports:
root@delta:~# dpkg -p lvm2|grep Version
Version: 2.02.39-7
root@delta:~# cat /proc/version
Linux version 2.6.32-bpo.5-amd64 (Debian 2.6.32-30~bpo50+1)
(norbert@tretkowski.de) (gcc version 4.3.2 (Debian 4.3.2-1.1) ) #1 SMP
Mon Jan 17 18:24:45 UTC 2011


I guess i'm missing something, please point me.

P.S. I'm not on list, so please CC me.

-- 
Best regards,
[COOLCOLD-RIPN]
