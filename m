Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m493j3Xu016271
	for <linux-lvm@redhat.com>; Thu, 8 May 2008 23:45:03 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.169])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m493iq2d007028
	for <linux-lvm@redhat.com>; Thu, 8 May 2008 23:44:53 -0400
Received: by ug-out-1314.google.com with SMTP id s2so250124uge.6
	for <linux-lvm@redhat.com>; Thu, 08 May 2008 20:44:52 -0700 (PDT)
Message-ID: <fca27a050805082044y71cb1834n1cbd69f9a3e5958f@mail.gmail.com>
Date: Thu, 8 May 2008 22:44:52 -0500
From: "Jason Godfrey" <godfreja@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Help restoring LVM Volumes
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello.

Last night my fingers moved faster then my brain, and I accidently ran
(part of) an fsck on a mounted filesystem. It looks like my LVM2
volume is toast. I cannot activate the logical volume to try to mount
or run fsck. I was hoping someone would have some suggestions on what
I can do to possibly recover it.

Unfortunately I do not have a backup of any of the metadata. (I didn't
know that was possible until I started trying to fix things.)

Here is (what I hope is) some relevant output:

pgdisplay
--- Physical volume ---
  PV Name               /dev/hda2
  VG Name               VolGroup00
  PV Size               114.38 GB / not usable 0
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              3660
  Free PE               0
  Allocated PE          3660
  PV UUID               qp2L1K-IieO-93ep-8BUX-Ukpm-Jt4F-NMwnUc

  --- Physical volume ---
  PV Name               /dev/hdb1
  VG Name               VolGroup00
  PV Size               114.47 GB / not usable 0
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              3663
  Free PE               2
  Allocated PE          3661
  PV UUID               hShYd9-T8pw-pPTo-zHTT-ox6R-JBFT-CR1I0P

   lvscan
  inactive          '/dev/VolGroup00/LogVol00' [227.78 GB] inherit
  inactive          '/dev/VolGroup00/LogVol01' [1.00 GB] inherit

  lvdisplay
  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol00
  VG Name                VolGroup00
  LV UUID                eUxFdx-JdZK-ICqp-SxRW-5nGQ-sQXL-KLuBRN
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                227.78 GB
  Current LE             7289
  Segments               2
  Allocation             inherit
  Read ahead sectors     0

  --- Logical volume ---
  LV Name                /dev/VolGroup00/LogVol01
  VG Name                VolGroup00
  LV UUID                K0nToc-9AiY-KEfc-rbWt-QutC-59NW-9cyW5A
  LV Write Access        read/write
  LV Status              NOT available
  LV Size                1.00 GB
  Current LE             32
  Segments               1
  Allocation             inherit
  Read ahead sectors     0

   vgdisplay:
  --- Volume group ---
  VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               0
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               228.84 GB
  PE Size               32.00 MB
  Total PE              7323
  Alloc PE / Size       7321 / 228.78 GB
  Free  PE / Size       2 / 64.00 MB
  VG UUID               hjp47M-6Ydu-a7ke-n7PB-tMks-WPGK-RoBF7b

   vgchage -a y
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
hjp47M6Ydua7ken7PBtMksWPGKRoBF7beUxFdxJdZKICqpSxRW5nGQsQXLKLuBRN
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
hjp47M6Ydua7ken7PBtMksWPGKRoBF7bK0nToc9AiYKEfcrbWtQutC59NW9cyW5A
  0 logical volume(s) in volume group "VolGroup00" now active

Any help to remedy my stupidity would be appreciated. I'll try to
provide any additional information that is needed.

Thanks
-  Jason
