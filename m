Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8LCWKr21467
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 08:32:20 -0400
Received: from perkamentus (perkamentus.chem.tue.nl [131.155.82.136])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8LCWBLb000860
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 08:32:12 -0400
Received: from esmeets by perkamentus with local (Exim 3.36 #1 (Debian))
	id 1C9joU-0000RR-00
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 14:32:06 +0200
Date: Tue, 21 Sep 2004 14:32:06 +0200
From: lvm@perkamentus.com
Message-ID: <20040921123206.GA1467@perkamentus>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Disk partition required for LVM?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

We have been experiencing strange LVM behaviour on multiple
machines. The situation:

 - Debian 3.1 (Sarge)
 - 2.6.8.1 Kernel
 - LVM2
 - 3 IDE disks (2x80GB, 1x120GB) (All Maxtors)

Creating physical volumes is no problem for two disks, but with the
third disk (it is actually on hdb and already a different disk then
the one originally used) problems begin. pvcreate does not give any
errors, but with pvdisplay the disk is not shown while pvscan gives
"Couldn't find device with uuid
'xAMOJ3-xIGd-AJQK-HN5Q-Q9Yg-Mu2D-UYxn0Y'"

It is possible to create volume groups and logical volumes, but
pvscan, vgscan and lvscan keeping failing with the above error.

Neither of the 3 disks has a partition when starting. When on hdb a
partition is created and then hdb1 is used as physical volume
everything works fine.

Why does the partition need to be created on that disk for LVM to work
(and not on the other two)? Is this a problem with LVM2, the 2.6
kernel? Or could it be hardware not functioning as it should,
e.g. disk or controller?

I would like to know why the creation of a partition is necessary. Has
anyone experienced the same problem/behaviour with LVM? If so, is
there a solution so no partition is needed?

Thanks in advance for the help.
