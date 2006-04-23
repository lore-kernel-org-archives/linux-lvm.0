Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3NH7Sk3020746
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 13:07:28 -0400
Received: from cody.kdinet.com (ns1.kdinet.com [69.56.133.250])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3NH7MEM029006
	for <linux-lvm@redhat.com>; Sun, 23 Apr 2006 13:07:23 -0400
Received: from 71-81-217-205.dhcp.stls.mo.charter.com ([71.81.217.205]
	helo=kdi03xp) by cody.kdinet.com with esmtpa (Exim 4.52)
	id 1FXi3L-0006F9-5Z
	for linux-lvm@redhat.com; Sun, 23 Apr 2006 12:07:19 -0500
From: "Diane Rolland" <drolland@kdinet.com>
Date: Sun, 23 Apr 2006 12:07:19 -0500
Message-ID: <000301c666f8$62cfb5a0$6500a8c0@kdinet.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] help after unsuccessful reduce using e2fsadmin
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

Hi all,
 
I have a development box I am playing around with lvm on.  I had
successfully extended a VG using e2fsadm.  
 
Command was:
e2fsadm -L+24G /dev/vg1/lvol1
 
I then wanted to reduce it by the same amount:
drsvr02:/root# e2fsadm -L-24G /dev/vg1/lvol1
e2fsck 1.32 (09-Nov-2002)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/vg1/lvol1: 818050/11960320 files (13.1% non-contiguous),
15412825/23920640 blocks
resize2fs 1.32 (09-Nov-2002)
Begin pass 2 (max = 49740)
Relocating blocks             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 3 (max = 730)
Scanning inode table          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 4 (max = 37732)
Updating inode references     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXThe
filesystem on /dev/vg1/lvol1 is now 17629184 blocks long.
 
lvreduce -- WARNING: reducing active logical volume to 67.25 GB
lvreduce -- THIS MAY DESTROY YOUR DATA (filesystem etc.)
lvreduce -- ERROR "No such device or address" reducing logical volume
"/dev/vg1/lvol1" in kernel
 
 
After the error, I tried to e2fsck and even mount, but:
 
drsvr02:/root# e2fsck /dev/vg1/lvol1
e2fsck 1.32 (09-Nov-2002)
e2fsck: Attempt to read block from filesystem resulted in short read while
trying to open /dev/vg1/lvol1
Could this be a zero-length partition?
drsvr02:/root# mount /mail
mount: wrong fs type, bad option, bad superblock on /dev/vg1/lvol1,
       or too many mounted file systems

Vgdisplay still gives me the following:

drsvr02:/root# vgdisplay
--- Volume group ---
VG Name               vg1
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               92.19 GB
PE Size               32 MB
Total PE              2950
Alloc PE / Size       2152 / 67.25 GB
Free  PE / Size       798 / 24.94 GB
VG UUID               g4xXEb-TpOU-TNBM-TZSc-fbIm-NPw4-wHKrkM


Is there any recovery possibility?  Or how do I go about blowing everything
away and starting over?

Thanks for any help,
Diane
