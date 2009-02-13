Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1DGPkbh031062
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 11:25:46 -0500
Received: from mail.syd.nighthawkrad.net (mail.syd.nighthawkrad.net
	[202.51.251.110])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1DGPMKZ019865
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 11:25:23 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail.syd.nighthawkrad.net (Postfix) with ESMTP id 6B08A10819F
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2009 03:25:21 +1100 (EST)
Received: from mail.syd.nighthawkrad.net ([127.0.0.1])
	by localhost (mail.syd.nighthawkrad.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 616ZySwUeoPN for <linux-lvm@redhat.com>;
	Sat, 14 Feb 2009 03:25:20 +1100 (EST)
Received: from [10.186.13.32] (unknown [10.186.13.32])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.syd.nighthawkrad.net (Postfix) with ESMTP id 216DA10819D
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2009 03:25:18 +1100 (EST)
Message-ID: <49959EEB.60900@nighthawkrad.net>
Date: Fri, 13 Feb 2009 17:25:15 +0100
From: Christopher Smith <csmith@nighthawkrad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using pvmove with a clustered VG
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I want to use pvmove to move some LVs in a clustered VG off some 
specific PVs so those PVs can be removed.

The LVs are used for Xen VMs, running in a cluster of 4 Xen hosts.  The 
PVs are LUNs on a fibre channel attached SAN.

I have constructed a test environment to try out the basic theory before 
moving onto more specific testing on SAN-attached hosts, however, it 
seems that LVs cannot be moved unless they are deactived:

[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:08:11 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 73).
pvmove    Creating logical volume pvmove0
pvmove    Moving 125 extents of logical volume vg00/lv_1
pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: Volume 
is busy on another node
pvmove  Failed to activate lv_1
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# lvchange -an /dev/vg00/lv_1
     Logging initialised at Sat Feb 14 03:08:20 2009
     Set umask to 0077
lvchange    Using logical volume(s) on command line
lvchange    Deactivating logical volume "lv_1"
lvchange    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:08:23 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 73).
pvmove    Creating logical volume pvmove0
pvmove    Moving 125 extents of logical volume vg00/lv_1
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 74).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 45.6%
pvmove  /dev/xvdb: Moved: 95.2%
pvmove  /dev/xvdb: Moved: 100.0%
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 76).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]#


Obviously this is a less than ideal situation, as I would need to shut 
down each VM on an LV I wanted to move, for the duration of the move 
(doable, but I would prefer not to).  I found this situation briefly 
discussed earlier on the list:

https://www.redhat.com/archives/linux-lvm/2008-September/msg00062.html
https://www.redhat.com/archives/linux-lvm/2008-September/msg00063.html

Where the suggestion was made that "basic" pvmove functionality should 
work on a clustered VG.  Does a simple LV move count as "basic", because 
I would assume it does. :)

*Should* this be working ?  Is there some magic switch I need to use to 
convince pvmove to work on active LVs ?  I would even be happy with an 
alternative that required running the pvmove on the node where the LV 
was in use (ie: the Xen host running that particularly VM).  None of the 
LVs are actively shared between the Xen hosts (other than the occasional 
live migration).

I am using CentOS 5.2, fully updated, for both my testing and production 
environments.  My testing environment has 3 nodes and the production has 4.

[root@clustertest01 ~]# cat /etc/redhat-release
CentOS release 5.2 (Final)
[root@clustertest01 ~]# rpm -q lvm2 lvm2-cluster cman
lvm2-2.02.32-4.el5_2.1
lvm2-cluster-2.02.32-4.el5
cman-2.0.84-2.el5_2.3
[root@clustertest01 ~]#



I also found another reply to the earlier thread, that only went to 
linux-cluster:

http://www.mail-archive.com/linux-cluster@redhat.com/msg04365.html

This one seems to indicate a problem with multi-segment LVs, so I tested 
that scenario as well (since some of my LVs have been extended).

[root@clustertest01 ~]# lvchange -van /dev/vg00/lv_1 /dev/vg00/lv_2 
/dev/vg00/lv_3 /dev/vg00/lv_4 /dev/vg00/lv_5
     Logging initialised at Sat Feb 14 03:04:35 2009
     Set umask to 0077
lvchange    Using logical volume(s) on command line
lvchange    Deactivating logical volume "lv_1"
lvchange    Deactivating logical volume "lv_2"
lvchange    Deactivating logical volume "lv_3"
lvchange    Deactivating logical volume "lv_4"
lvchange    Deactivating logical volume "lv_5"
lvchange    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:04:40 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 48).
pvmove    Creating logical volume pvmove0
pvmove    Moving 50 extents of logical volume vg00/lv_1
pvmove    Moving 13 extents of logical volume vg00/lv_2
pvmove    Moving 13 extents of logical volume vg00/lv_3
pvmove    Moving 3 extents of logical volume vg00/lv_4
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 49).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 31.6%
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 50).
pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: 
device-mapper: reload ioctl failed: Invalid argument
pvmove  Unable to reactivate logical volume "pvmove0"
pvmove  ABORTING: Segment progression failed.
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 52).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:05:20 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 52).
pvmove    Creating logical volume pvmove0
pvmove    Moving 25 extents of logical volume vg00/lv_1
pvmove    Moving 13 extents of logical volume vg00/lv_2
pvmove    Moving 13 extents of logical volume vg00/lv_3
pvmove    Moving 3 extents of logical volume vg00/lv_4
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 53).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 46.3%
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 54).
pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: 
device-mapper: reload ioctl failed: Invalid argument
pvmove  Unable to reactivate logical volume "pvmove0"
pvmove  ABORTING: Segment progression failed.
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 56).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:05:47 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 56).
pvmove    Creating logical volume pvmove0
pvmove    Moving 13 extents of logical volume vg00/lv_2
pvmove    Moving 13 extents of logical volume vg00/lv_3
pvmove    Moving 3 extents of logical volume vg00/lv_4
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 57).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 44.8%
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 58).
pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: 
device-mapper: reload ioctl failed: Invalid argument
pvmove  Unable to reactivate logical volume "pvmove0"
pvmove  ABORTING: Segment progression failed.
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 60).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:06:05 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 60).
pvmove    Creating logical volume pvmove0
pvmove    Moving 13 extents of logical volume vg00/lv_3
pvmove    Moving 3 extents of logical volume vg00/lv_4
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 61).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 81.2%
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 62).
pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: 
device-mapper: reload ioctl failed: Invalid argument
pvmove  Unable to reactivate logical volume "pvmove0"
pvmove  ABORTING: Segment progression failed.
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 64).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:06:21 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 64).
pvmove    Creating logical volume pvmove0
pvmove    Moving 3 extents of logical volume vg00/lv_4
pvmove    Updating volume group metadata
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 65).
pvmove    Checking progress every 10 seconds
pvmove  /dev/xvdb: Moved: 100.0%
pvmove    Removing temporary pvmove LV
pvmove    Writing out final volume group after pvmove
pvmove    Creating volume group backup "/etc/lvm/backup/vg00" (seqno 67).
pvmove    Wiping internal VG cache
[root@clustertest01 ~]# pvmove -v -i10 /dev/xvdb
     Logging initialised at Sat Feb 14 03:06:37 2009
     Set umask to 0077
pvmove    Wiping cache of LVM-capable devices
pvmove    Finding volume group "vg00"
pvmove    Archiving volume group "vg00" metadata (seqno 67).
pvmove    Creating logical volume pvmove0
pvmove  No data to move for vg00
pvmove    Wiping internal VG cache
[root@clustertest01 ~]#



It seems the 'hanging' problem is gone, but the pvmove still dies after 
every segment.  I can live with that, but first I need to resolve the 
basic problem of even starting. :)


Cheers,
CS

-- 
Christopher Smith

UNIX Team Leader
Nighthawk Radiology Services
Limmatquai 4, 6th Floor
8001 Zurich, Switzerland
http://www.nighthawkrad.net
Sydney Fax:    +61 2 8211 2333
Zurich Fax:    +41 43 497 3301
USA Toll free:  866 241 6635

Email:         csmith@nighthawkrad.net
IP Extension:  8163
Sydney Phone:  +61 2 8211 2363
Sydney Mobile: +61 4 0739 7563
Zurich Phone:  +41 44 267 3363
Zurich Mobile: +41 79 550 2715

All phones forwarded to my current location, however, please consider 
the local time in Zurich before calling from abroad.


CONFIDENTIALITY NOTICE:   This email, including any attachments, 
contains information from NightHawk Radiology Services, which may be 
confidential or privileged. The information is intended to be for the 
use of the individual or entity named above. If you are not the intended 
recipient, be aware that any disclosure, copying, distribution or use of 
the contents of this information is prohibited. If you have received 
this email in error, please notify NightHawk Radiology Services 
immediately by forwarding message to postmaster@nighthawkrad.net and 
destroy all electronic and hard copies of the communication, including 
attachments.
