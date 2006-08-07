Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k77Nqitl004751
	for <linux-lvm@redhat.com>; Mon, 7 Aug 2006 19:52:44 -0400
Received: from alopias.GreenKey.net (alopias.GreenKey.net [209.209.60.60])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k77NqbaH000899
	for <linux-lvm@redhat.com>; Mon, 7 Aug 2006 19:52:38 -0400
Message-Id: <200608072352.k77NqPZ7031383@alopias.GreenKey.net>
Date: Mon, 7 Aug 2006 16:52:25 -0700 (PDT)
From: Curtis Doty <Curtis@GreenKey.net>
MIME-Version: 1.0
Subject: [linux-lvm] duplicate names
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I stuck two drives in a recovery server. Each is a separate default Fedora 
install; with a big monster VolGroup00/LogVol00 root filesystem. However, 
since they were each separate systems the above VG/LV names collide.

I'd like to mount them up simultaneously and move data between them. But I 
would also like to avoid modifying the labels/UUIDs so they will still 
work back in their original systems. Is there a FAQ on this?

Also, to this n00b, the output below seems inconsistent:

# pvdisplay /dev/sdb2
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               233.66 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              7477
  Free PE               1
  Allocated PE          7476
  PV UUID               6kTTcS-jTbH-XN4x-SqUg-fnlS-Et0k-qlmJAC

# pvdisplay /dev/sdc2
  --- Physical volume ---
  PV Name               /dev/sdc2
  VG Name               VolGroup00
  PV Size               69.12 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              2212
  Free PE               1
  Allocated PE          2211
  PV UUID               jkBXwB-OpnB-IefX-LdBK-Hr0m-eDg8-uIIZJD

Which is fine and clear. But look at this: ?!?

# pvdisplay /dev/sd{b,c}2
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               233.66 GB / not usable 0  
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              7477
  Free PE               1
  Allocated PE          7476
  PV UUID               6kTTcS-jTbH-XN4x-SqUg-fnlS-Et0k-qlmJAC
  
  --- NEW Physical volume ---
  PV Name               /dev/sdc2
  VG Name              
  PV Size               69.14 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               jkBXwB-OpnB-IefX-LdBK-Hr0m-eDg8-uIIZJD

Obviously, only the first PV is the one associated with the VolGroup00 in 
the kernel. But how does one address the second PV/VG/LV (possibly with 
temporary names)?

Lastly, pvscan is also annoyingly blind:

# pvscan                          
  PV /dev/sdb2   VG VolGroup00   lvm2 [233.66 GB / 32.00 MB free]
  Total: 1 [233.66 GB] / in use: 1 [233.66 GB] / in no VG: 0 [0   ]

Which is inconsistent with the man page: "scans all supported LVM block 
devices in the system for physical volumes" Maybe it should say "scans 
only those LVM block devices that can be address by the current kernel"?

Or am I overlooking something in the documentation?

../C
