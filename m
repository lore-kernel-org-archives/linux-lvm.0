Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBB2v9r21986
	for <linux-lvm@redhat.com>; Fri, 10 Dec 2004 21:57:09 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBB2v89L008542
	for <linux-lvm@redhat.com>; Fri, 10 Dec 2004 21:57:09 -0500
Received: from [193.11.254.225] (myrium.csbnet.se [193.11.254.225])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 921F53AA5
	for <linux-lvm@redhat.com>; Sat, 11 Dec 2004 03:25:04 +0100 (CET)
Message-ID: <41BA5A7F.1010302@danielroth.se>
Date: Sat, 11 Dec 2004 03:25:03 +0100
From: Daniel Roth <daniel@danielroth.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm lost after debian upgrade
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

Hi all!

I got this nice idea today to do a apt-get update/upgrade on my system. 
when it was done I moved the box, and upon reboot my lvm was gone. I 
think I had lvm1 before, but now it seems like I have
LVM version:     2.00.29 (2004-11-27)
Is this maybe what is causing the problem?

My lvm is at /dev/volume_group/mylv, my lvm consisted of hde,g,i

I noticed from dmesg that
LVM version 1.0.5+(22/07/2002) module loaded
and that devfs wouldn't be started... (no volumes or equiv)

Please advice, I got pretty much schoolwork on it...

Daniel


Some shelldumps
roth:~# lvmdiskscan
  /dev/hda1  [        2.05 GB]
  /dev/hde1  [       76.69 GB]
  /dev/hdg1  [        1.00 KB]
  /dev/hdi1  [      149.05 GB]
  /dev/hda2  [        1.00 KB]
  /dev/hda5  [      346.47 MB]
  /dev/hdg5  [       57.25 GB]
  0 disks
  7 partitions
  0 LVM physical volume whole disks
  0 LVM physical volumes


roth:~# vgcfgrestore -ll -n mylv
  Please specify a *single* volume group to restore.

roth:~# vgcfgrestore -n mylv /dev/hdg
  /etc/lvm/backup/hdg: stat failed: No such file or directory
  Couldn't read volume group metadata.
  Restore failed.
roth:~# vgcfgrestore -n mylv /dev/hdg1
  /etc/lvm/backup/hdg1: stat failed: No such file or directory
  Couldn't read volume group metadata.
  Restore failed.
roth:~# vgcfgrestore -n mylv /dev/hdg5
  /etc/lvm/backup/hdg5: stat failed: No such file or directory
  Couldn't read volume group metadata.
  Restore failed.

roth:~# vgscan
  Reading all physical volumes.  This may take a while...
  /dev/hdf: open failed: No such device or address
  /dev/hdh: open failed: No such device or address
  /dev/hdj: open failed: No such device or address
  /dev/hdb1: open failed: No such device or address
  /dev/hdf1: open failed: No such device or address
 ...
  /dev/hdb20: open failed: No such device or address
  /dev/hdf20: open failed: No such device or address
  /dev/hdh20: open failed: No such device or address
  No volume groups found

roth:~# lvscan
  No volume groups found
