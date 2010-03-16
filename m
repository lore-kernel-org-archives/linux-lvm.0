Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2GJNnVx022486
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:23:49 -0400
Received: from smtp.iplink.net (smtp.iplink.net [192.139.81.186])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2GJNdim019878
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:23:39 -0400
Received: from [192.168.1.107] (unknown [206.108.5.162])
	by smtp.iplink.net (Postfix) with ESMTP id 88602A8A4C8
	for <linux-lvm@redhat.com>; Tue, 16 Mar 2010 15:23:34 -0400 (EDT)
Message-ID: <4B9FDAB6.3000302@alteeve.com>
Date: Tue, 16 Mar 2010 15:23:34 -0400
From: Digimer <linux@alteeve.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Two questions about cluster support (2 problems,
	actually)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

   Last year, when I last setup an LVM for cluster mode (running on a 
DRBD partition in Primary/Primary mode), I needed to recompile the RPM 
for CentOS 5.4 in order to get the liblvm2clusterlock.so to install. 
This was in reference to an initial error report I saw here: 
http://www.centos.org/modules/newbb/viewtopic.php?forum=37&post_id=28736&topic_id=8449 
in 2007.

   Is this still a problem? I don't see that file still (fully updated 
CentOS 5.4 x86_64). Without that file, I can't try 'locking_type = 2'.

   Further, when I try to use 'locking_type = 3', restart 'cman' and 
then try to run 'pvdisplay', I *only* see the DRBD LVM PV. The 
underlying PV used by Xen's dom0 no longer shows:

# df -hP
Filesystem            Size  Used Avail Use% Mounted on
/dev/mapper/san02-lv01   19G  3.0G   15G  17% /
/dev/sda1             244M   35M  196M  16% /boot
tmpfs                 845M     0  845M   0% /dev/shm
none                  845M  104K  845M   1% /var/lib/xenstored

# pvdisplay
   connect() failed on local socket: Connection refused
   WARNING: Falling back to local file-based locking.
   Volume Groups with the clustered attribute will be inaccessible.
   "/dev/drbd0" is a new physical volume of "399.99 GB"
   --- NEW Physical volume ---
   PV Name               /dev/drbd0
   VG Name
   PV Size               399.99 GB
   Allocatable           NO
   PE Size (KByte)       0
   Total PE              0
   Free PE               0
   Allocated PE          0
   PV UUID               kklTST-D2ta-NRxL-Zaa2-Fa0T-ebkB-KhSq1b

   Resetting 'locking_type=1' and even after a reboot, I still can't see 
the original LVM PV.

-- 
Digimer
E-Mail:         linux@alteeve.com
AN!Whitepapers: http://alteeve.com
Node Assassin:  http://nodeassassin.org
