Return-Path: <smcconnell@clark.edu>
Date: Thu, 21 Jun 2001 14:54:41 -0700 (PDT)
From: Sean McConnell <smcconnell@clark.edu>
Message-ID: <Pine.LNX.4.30.0106211447500.2317-100000@cs.clark.edu>
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate fails on alpha 2.4.5
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm running redhat7<scoff scoff> on an Alpha lx164, I
compiled the 2.4.5 kernel for it, which says it has lvm
091b2, and got the utils.  Now when I go to make my pv's
it barfs on me like it can't read what the partition id's
are..check it:

# fdisk -l /dev/sdb

Disk /dev/sdb: 134 heads, 62 sectors, 1019 cylinders
Units = cylinders of 8308 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1      1019   4232895   8e  Linux LVM


# pvcreate -dv /dev/sdb1
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
pvcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
pvcreate -- checking physical volume name "/dev/sdb1"
<1> pv_check_name -- CALLED with "/dev/sdb1"
<22> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- invalid partition type 0x1 for "/dev/sdb1" (must be 0x8e)

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0


it doesn't seem to matter what what the partition type really is
it always comes up sayin it's like fat12 0x1, even went as far
as rebooting to make sure, but to no avail.
Suggestions would be nice, i'd like some lvm since my users
keep takin up more room.


-- 
Sean McConnell, smcconnell@clark.edu
Unix System Administrator
Computer Technology/Science
Clark College
