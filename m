Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j239nhK27492
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 04:49:43 -0500
Received: from w3f.coventive.coms.coventive.com (202-145-53-92.adsl.ttn.net
	[202.145.53.92])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j239nSWm028449
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 04:49:29 -0500
Received: from [192.168.20.46] (pc46.sa.coventive.com [192.168.20.46])
	by w3f.coventive.coms.coventive.com (8.11.6/8.11.6) with ESMTP id
	j239nMB32668
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 17:49:24 +0800
Message-ID: <4226DDFB.8000801@coventive.com>
Date: Thu, 03 Mar 2005 17:50:51 +0800
From: Chung Hsien Hu <mozo@coventive.com>
MIME-Version: 1.0
References: <e5146c2a050302230579216b77@mail.gmail.com>
In-Reply-To: <e5146c2a050302230579216b77@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot problem when memory size is over 4GB
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,
I got a server with Tyan5350 mainboard and 8GB ECC RAM. And
it seem that snapshot didn't work in either LVM1 or LVM2 when
the memory over 4GB is plugged. We have HIGHMEM64G=y kernel
option been set. Everything is ok when the comination is
"snapshot + 4GB RAM" or "no snapshot + 8GB RAM"...
Any clues?
PS: Hope you could understand my question, english is not my
mother language. :(

1. in linux-2.4.27 + LVM-1.0.8, it failed to activate the VG with
any existed snapshot volume.
bash-2.03# vgchange -ay
vgchange -- ERROR "Bad address" activating volume group "storage"

2. And again, in linux-2.4.27 + LVM-1.0.8, it failed to create snapshot
volume.
bash-2.03# lvcreate -A n -s  -n test_snap -l 16 /dev/storage/test
lvcreate -- WARNING: the snapshot will be automatically disabled once it 
gets full
lvcreate -- INFO: using default snapshot chunk size of 64 KB for 
"/dev/storage/test_snap"
lvcreate -- ERROR "Cannot allocate memory" creating VGDA for 
"/dev/storage/test_snap" in kernel

3. Then I turn to test linux-2.6.10 + LVM2. This time I can create a 
snapshot and it work well until
I reboot the system. The system will crash when I try to make a tarfile 
over the original volume.

bash-2.03# lvm version
  LVM version:     2.00.31 (2004-12-12)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.3.0
bash-2.03# lvm lvscan
  ACTIVE   Original '/dev/storage/test' [1.95 GB] inherit
  ACTIVE            '/dev/storage/xfs' [1.95 GB] inherit
  ACTIVE   Snapshot '/dev/storage/test_snap' [500.00 MB] inherit
  ACTIVE            '/dev/storage/sysvolume' [2.44 GB] inherit
bash-2.03# tar cvf /mnt/xfs/test.tar /mnt/test
a /mnt/test/ directory
a /mnt/test/ACARD101RC3.iso 67534848 bytes, 131904 tape blocks
===>SYSTEM CRASHED!!......
system halt and the last line of messages on screen is:
<0>Kernel panic - not syncing: Fatal execption in interrupt

It's interesting to mention that the snapshot work well before reboot. Seem
it is kind of problem relate to VFS cache, snapshot and HIGHMEM support?

-- 
Mozo Hu. mozo@coventive
R&D Assistant Manager, Coventive Advance Technologies
