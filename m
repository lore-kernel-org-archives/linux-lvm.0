Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with SMTP id iAFD8Cf18781
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 08:08:13 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.12.11/8.12.11) with SMTP id iAFDDPL5022881
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 08:13:26 -0500
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CTgAS-0006KX-00
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 13:41:12 +0100
Received: from pd95fd51c.dip.t-dialin.net ([217.95.213.28])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 13:41:12 +0100
Received: from mlist by pd95fd51c.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2004 13:41:12 +0100
From: Markus Meissner <mlist@meissner.it>
Date: Mon, 15 Nov 2004 13:28:48 +0100
Message-ID: <cna7e1$j0u$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] lvm on raid, vgcreate doesn't create vg
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
To: linux-lvm@redhat.com

Hi,

I have successfully setup lvm on top of my software raid 1 (two ide-disks, 
hda, hdb, two raid1 on top, md0 and md1, one as root and one for the first 
volume group, vg0). Everything works as expected, no problems at all. 

Now I want to put two more disks (hdc/hdd) in the machine. For simplicity 
reasons (the data is on the second disk) I describe the problem with one 
harddisk:

/etc/raidtab
[...]
raiddev /dev/md3
 raid-level 1
 nr-raid-disks 2
 nr-spare-disks 0
 persistent-superblock 1
 device  /dev/hdc1
 raid-disk 0
 device  /dev/hdd1
 failed-disk 1

root@fs:~# mkraid /dev/md3
handling MD device /dev/md3
analyzing super-block
disk 0: /dev/hdc1, 100522768kB, raid superblock at 100522688kB
disk 1: /dev/hdd1, failed
root@fs:~# pvcreate /dev/md3
  Physical volume "/dev/md3" successfully created
root@fs:~# vgcreate -v vgnew /dev/md3
    Adding physical volume '/dev/md3' to volume group 'vgnew'
    Archiving volume group "vgnew" metadata.
    Creating volume group backup "/etc/lvm/backup/vgnew"
  Volume group "vgnew" successfully created
root@fs:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vg0" using metadata type lvm2
root@fs:~# lvcreate -L 83G -n smb2 vgnew
  Volume group "vgnew" doesn't exist

Uah. Whats that? Creating a filesystem on md3 is no problem, data can be 
written and read, mounted, unmounted. So, I decided to test without md:

root@fs:~# pvremove /dev/md3
  Labels on physical volume "/dev/md3" successfully wiped
root@fs:~# raidstop /dev/md3
root@fs:~# pvcreate /dev/hdc1
  Physical volume "/dev/hdc1" successfully created
root@fs:~# vgcreate -v vgnew /dev/hdc1
    Adding physical volume '/dev/hdc1' to volume group 'vgnew'
    Archiving volume group "vgnew" metadata.
    Creating volume group backup "/etc/lvm/backup/vgnew"
  Volume group "vgnew" successfully created
root@fs:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found volume group "vgnew" using metadata type lvm2
  Found volume group "vg0" using metadata type lvm2
root@fs:~# lvcreate -L 83G -n smb2 vgnew
  Logical volume "smb2" created
root@fs:~# ls -al /dev/vgnew/
total 32
drwx------   2 root root  4096 Nov  8 12:59 .
drwxr-xr-x  16 root root 28672 Nov  8 12:59 ..
lrwxrwxrwx   1 root root    22 Nov  8 12:59 smb2 -> /dev/mapper/vgnew-smb2

Hmm, this works. Whats up with creating lvm on top of raid? On the same 
machine this works (vg0) without problems. There a no strange messages in 
syslog, no dmessages etc. I have put the lvm2.log (with the requested 
config-parameters from http://www.tldp.org/HOWTO/LVM-HOWTO/reportbug.html) 
here: http://www.meissner.it/lvm2.log.gz

Some machine-data:

Debian testing/sarge
AMD Athlon(TM) XP 1900+
Linux fs 2.6.8-1-k7 #1 Thu Oct 7 02:47:47 EDT 2004 i686 GNU/Linux
ii  lvm-common  1.5.17
ii  lvm2        2.00.24-1 
ii  raidtools2  1.00.3-15

How can I trace the problem? Any hints?

-- 
Beste Gruesse / Best regards Markus Meissner
