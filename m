Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBCKhbr16591
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 15:43:37 -0500
Received: from merle.it.northwestern.edu (merle.it.northwestern.edu
	[129.105.16.57])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBCKhaH4008412
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 15:43:37 -0500
Message-Id: <200412122043.iBCKhZTK011398@merle.it.northwestern.edu>
Content-Disposition: inline
Content-Transfer-Encoding: binary
MIME-Version: 1.0
From: Semyon Chaichenets <sema@northwestern.edu>
Date: Sun, 12 Dec 2004 14:43:25 -0600
Subject: [linux-lvm] importing PV that wasn't exported
Reply-To: Semyon Chaichenets <sema@northwestern.edu>,
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
To: linux-lvm@redhat.com


Dear LVM gurus,

I was asked to help with the following problem:

A user has reinstalled her system (RHEL 2) without
being aware that her data disk, /dev/hdb, had been 
mounted via LVM, and didn't save any configuration
files. Not surptisingly, now she has problems accessing it.

The disk in question, as the administrator of that machine
claims, was the only one in the VG - although he 
'could not be certain'.

I have tried the following sequence of steps to recover
the data:

1)
The drive is recognised as an LVM physical volume:
[root@sirocco root]# lvmdiskscan
lvmdiskscan -- /dev/hdb   [      74.51 GB] USED LVM whole disk

2)
[root@sirocco root]# vgimport -vf vg01 /dev/hdb
[..]
vgimport -- checking consistency of physical volume "/dev/hdb"
vgimport -- ERROR "pv_check_consistency(): PE size" checking physical volume consistency of "/dev/hdb"
vgimport -- ERROR: no valid physical volumes found to import volume group "vg01"


When debugging, step (2), I found that 
_NO_ physical extents are found on that drive:
3)
[root@sirocco root]# pvdata -E /dev/hdb
 
--- List of physical extents ---
 
 
 
[root@sirocco root]# pvdata -P /dev/hdb
--- NEW Physical volume ---
PV Name               /dev/hdb
VG Name               vg01
PV Size               5.95 MB [12176 secs]
PV#                   1
PV Status             NOT available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               Ypqg4d-P5hv-D83V-EHuN-hQop-Zsjh-GaXxaJ


At this point, my knowledge of LVM reached its limit,
and after searching the web for the error messages
above and failing to find anything relevant, I turn to you.

I would be most grateful for any suggestions or 
specific links to documentation.

-- 
Kind Regards
Semyon Chaichenets

Department of Physics and Astronomy
Northwestern University

++ If they give you lined paper, write the other way ++
