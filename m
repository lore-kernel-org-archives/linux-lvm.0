Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBDFSw86002454
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 10:28:58 -0500
Received: from mail-da0-f46.google.com (mail-da0-f46.google.com
	[209.85.210.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBDFSvRa007886
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 10:28:57 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so848663dak.33
	for <linux-lvm@redhat.com>; Thu, 13 Dec 2012 07:28:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
References: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
Date: Thu, 13 Dec 2012 16:28:57 +0100
Message-ID: <CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Subject: Re: [linux-lvm] Convert striped lv to single pv on another disk?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Searching on Internet I found several methods and the one I tested (at
the moment only on loop devices) and seems ok is this one below, that
passes through creating a mirror between the initial striped lv
components and the new pv with lvconvert command and then gets rid off
the initial pvs

Just in case anyone else arrives here...
Gianluca

- working dir
cd /depot/test

- create pvs on file
[root@dep001 test]# time dd if=/dev/zero of=pv1 bs=1024k count=1024

same for pv2
# time dd if=/dev/zero of=pv1 bs=1024k count=1024

- setup loop devices
[root@dep001 test]# losetup -f /depot/test/pv1

[root@dep001 test]# losetup -f /depot/test/pv2

[root@dep001 test]# losetup -a
/dev/loop0: [fd00]:6029314 (/depot/test/pv1)
/dev/loop1: [fd00]:6029315 (/depot/test/pv2)

- create physical volumes
[root@dep001 test]# pvcreate /dev/loop0
  Writing physical volume data to disk "/dev/loop0"
  Physical volume "/dev/loop0" successfully created

[root@dep001 test]# pvcreate /dev/loop1
  Writing physical volume data to disk "/dev/loop1"
  Physical volume "/dev/loop1" successfully created

- create volume group
[root@dep001 test]# vgcreate vg_test /dev/loop0 /dev/loop1
  /dev/cdrom: open failed: No medium found
  Volume group "vg_test" successfully created

- create striped logical volume
[root@dep001 test]# lvcreate -i 2 -I 64k -n lv_test -l+100%FREE vg_test
  Logical volume "lv_test" created

[root@dep001 test]# lvs -o name,size,stripes,stripesize vg_test/lv_test
  LV      LSize #Str Stripe
  lv_test 1.99G    2 64.00K

- create third pv
[root@dep001 test]# time dd if=/dev/zero of=pvnew bs=1024k count=3076

and setup loop device
[root@dep001 test]# losetup -f /depot/test/pvnew

[root@dep001 test]# losetup -a
/dev/loop0: [fd00]:6029314 (/depot/test/pv1)
/dev/loop1: [fd00]:6029315 (/depot/test/pv2)
/dev/loop2: [fd00]:6029316 (/depot/test/pvnew)

- add new pv to vg
[root@dep001 test]# pvcreate /dev/loop2
[root@dep001 test]# vgextend vg_test /dev/loop2

- current situation
[root@dep001 test]# lvdisplay -m vg_test/lv_test
  --- Logical volume ---
  LV Name                /dev/vg_test/lv_test
  VG Name                vg_test
  LV UUID                0L3Dom-9frG-KeRU-mffe-lQaD-7UA2-AuuhNE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.99 GB
  Current LE             510
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     512
  Block device           253:4

  --- Segments ---
  Logical extent 0 to 509:
    Type striped
    Stripes 2
    Stripe size 64 KB
    Stripe 0:
      Physical volume /dev/loop0
      Physical extents 0 to 254
    Stripe 1:
      Physical volume /dev/loop1
      Physical extents 0 to 254

   [root@dep001 test]# pvs --segments -o+lv_name,seg_start_pe,segtype
/dev/loop0 /dev/loop1
  PV         VG      Fmt  Attr PSize    PFree Start SSize LV      Start Type
  /dev/loop0 vg_test lvm2 a--  1020.00M    0      0   255 lv_test     0 striped
  /dev/loop1 vg_test lvm2 a--  1020.00M    0      0   255 lv_test     0 striped


[root@dep001 test]# vgdisplay vg_test
  --- Volume group ---
  VG Name               vg_test
  System ID
  Format                lvm2
  Metadata Areas        3
  Metadata Sequence No  9
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               0
  Max PV                0
  Cur PV                3
  Act PV                3
  VG Size               3.99 GB
  PE Size               4.00 MB
  Total PE              1021
  Alloc PE / Size       510 / 1.99 GB
  Free  PE / Size       511 / 2.00 GB
  VG UUID               KSX0eT-mrPc-gRLb-w2tI-SOuj-VlaD-SMgFcc

- create mirror with new pv
[root@dep001 test]# lvconvert -m 1 /dev/vg_test/lv_test /dev/loop2
  Insufficient suitable allocatable extents for logical volume : 510
more required
  Unable to allocate extents for mirror(s).

the problem resides on the fact that by default it tries to use
another PV as mirror log
and we have no one...
So we use in memory mirror log with "--mirrorlog core" option


[root@dep001 test]# lvconvert -m 1 --mirrorlog core
/dev/vg_test/lv_test /dev/loop2
  vg_test/lv_test: Converted: 0.2%
...
  vg_test/lv_test: Converted: 92.2%
  vg_test/lv_test: Converted: 93.5%
  vg_test/lv_test: Converted: 100.0%

- keep off the striped leg
[root@dep001 test]# lvconvert -m 0 /dev/vg_test/lv_test /dev/loop0 /dev/loop1
  Logical volume lv_test converted.

- verify new lv that is a linear one
[root@dep001 test]# lvdisplay vg_test/lv_test
  --- Logical volume ---
  LV Name                /dev/vg_test/lv_test
  VG Name                vg_test
  LV UUID                0L3Dom-9frG-KeRU-mffe-lQaD-7UA2-AuuhNE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.99 GB
  Current LE             510
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     512
  Block device           253:4

[root@dep001 test]# lvdisplay -m vg_test/lv_test
  --- Logical volume ---
  LV Name                /dev/vg_test/lv_test
  VG Name                vg_test
  LV UUID                0L3Dom-9frG-KeRU-mffe-lQaD-7UA2-AuuhNE
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                1.99 GB
  Current LE             510
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     512
  Block device           253:4

  --- Segments ---
  Logical extent 0 to 509:
    Type linear
    Physical volume /dev/loop2
    Physical extents 0 to 509

- keep off the old pvs
[root@dep001 test]# vgreduce vg_test /dev/loop0 /dev/loop1
  Removed "/dev/loop0" from volume group "vg_test"
  Removed "/dev/loop1" from volume group "vg_test"
