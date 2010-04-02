Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o32KUH8O026547
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2010 16:30:17 -0400
Received: from kyoto.noir.com (m209-5.dsl.rawbw.com [198.144.209.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o32KTvoL023296
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2010 16:29:57 -0400
Message-ID: <4BB653C3.6080106@noir.com>
Date: Fri, 02 Apr 2010 13:29:55 -0700
From: "K. Richard Pixley" <rich@noir.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------070502010200080503060709"
Subject: [linux-lvm] confusing error message from lvm2
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------070502010200080503060709
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm confused about an error message I'm seeing from LVM2.  The message is:

+ /usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator 
: -o 
name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count 
v4c
  Path /dev/ACTION=_change_ no longer valid for device(252,7)
  Path /dev/DEVTYPE=_disk_ no longer valid for device(252,7)
  Path /dev/PWD=_/_ no longer valid for device(252,7)
  Path /dev/DM_STATE_ACTIVE=_1_ no longer valid for device(252,7)
  v4c:8.00:4.00:0.00:2047:1023:0:4:2

I'll attach a copy of a script that exhibits the problem consistently 
and in only a few seconds.  The script presupposes that a volume group 
named "v4c" exists.  Mine is 8G and is located on a physical disk.  
(Well, really a vmware virtual disk, but I doubt that the kernel running 
in the virtual machine really cares.)

I'm seeing this on amd64 ubuntu-9.10 updated current as of this posting.

Can anyone explain to me what this means or why I'm getting it?

--rich

--------------070502010200080503060709
Content-Type: text/plain; x-mac-type="0"; x-mac-creator="0";
 name="fail.sh"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="fail.sh"

#!/bin/sh

### This script presumes that a volume group named "v4c" exists.  Mine is 8G.

set -x

/usr/bin/sudo /sbin/lvremove -f v4c
/usr/bin/sudo /sbin/lvremove -f v4c
/usr/bin/sudo /sbin/lvremove -f v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvcreate --size 1.0g --name lv-test.0 v4c
/usr/bin/sudo /sbin/mkfs -t ext4 -L lv-test.0 /dev/v4c/lv-test.0
/usr/bin/sudo /sbin/tune2fs -c 0 /dev/v4c/lv-test.0
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvcreate --snapshot --size 1.0g --name ss-test.0.0 v4c/lv-test.0
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvremove -f v4c/ss-test.0.0
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvcreate --snapshot --size 1.0g --name ss-test.0.1 v4c/lv-test.0
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvremove -f v4c/ss-test.0.1
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvremove -f v4c/lv-test.0
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvcreate --size 1.0g --name lv-test.1 v4c
/usr/bin/sudo /sbin/mkfs -t ext4 -L lv-test.1 /dev/v4c/lv-test.1
/usr/bin/sudo /sbin/tune2fs -c 0 /dev/v4c/lv-test.1
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c
/usr/bin/sudo /sbin/lvs --noheadings --units g --nosuffix --separator : -o name,origin,size,snap_percent,copy_percent v4c
/usr/bin/sudo /sbin/lvcreate --snapshot --size 1.0g --name ss-test.1.0 v4c/lv-test.1
/usr/bin/sudo /sbin/vgs --noheadings --units g --nosuffix --separator : -o name,size,free,extent_size,extent_count,free_count,max_lv,lv_count,snap_count v4c

--------------070502010200080503060709--
