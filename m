Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3SGAOBi025334
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 12:10:24 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3SGAHt4011302
	for <linux-lvm@redhat.com>; Fri, 28 Apr 2006 12:10:17 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Date: Fri, 28 Apr 2006 12:10:03 -0400
Message-Id: <1146240603.23548.106.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgchange -ay Killed
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm <linux-lvm@redhat.com>

This is what i get when try to active a VG with 3K LVs. repeatable.

  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2006-01-04)
  Driver version:  4.4.0


[root@dualxeon ~]# vgchange -ay
Killed


seem that "Locking memory" only appear once, and then stuck till killed.

--------some debug output if i use vgchang -ay -vvv--------------
    Found volume group "vg1"
        Getting device info for vg1-v678
        dm info
LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N
[16384]
        Locking LV
8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 (R)
      Finding volume group for uuid
8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
        Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
        Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
    Found volume group "vg1"
        Getting device info for vg1-v679
        dm info
LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 N
[16384]
        Locking LV
8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 (R)
      Finding volume group for uuid
8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
        Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
      /dev/md0: lvm2 label detected
      /dev/md1: lvm2 label detected
        Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
    Found volume group "vg1"
        Getting device info for vg1-v680
        dm info
LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
[16384]
        dm info
8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
[16384]
        dm info vg1-v680  N   [16384]
      Locking memory
