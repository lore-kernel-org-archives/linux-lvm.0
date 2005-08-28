Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SMH8V23592
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 18:17:08 -0400
Received: from smtp.unc.edu (smtpsrv0.isis.unc.edu [152.2.1.139])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SMH2lH028129
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 18:17:02 -0400
Received: from laplace.or.unc.edu (laplace.or.unc.edu [152.2.30.59])
	by smtp.unc.edu (8.13.4/8.13.4) with ESMTP id j7SMGTc1020776
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 18:16:29 -0400 (EDT)
Received: from user-0ce2kof.cable.mindspring.com ([24.225.83.15]
	helo=Chrestomanci) by laplace.or.unc.edu with esmtp (Exim 4.50)
	id 1E9VS1-00064Y-My
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 18:16:29 -0400
Received: from faheem (helo=localhost)
	by Chrestomanci with local-esmtp (Exim 4.50) id 1E9VS1-0002zD-Aj
	for linux-lvm@redhat.com; Sun, 28 Aug 2005 18:16:29 -0400
Date: Sun, 28 Aug 2005 18:16:29 -0400 (EDT)
From: Faheem Mitha <faheem@email.unc.edu>
Message-ID: <Pine.LNX.4.62.0508281740530.11178@Chrestomanci>
MIME-Version: 1.0
Subject: [linux-lvm] resizing root filesystem on LVM with live CD?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Dear People,

I have a machine which is running Fedora Core on AMD64. I did not install 
this computer myself. The current setup is that that there are two 
partitions on the disk, one of them /boot and the other is given to a LVM 
volume group. This volume group currently has two logical volumes on it, 
swap and root, both using ext3.

/etc/fstab appears at the bottom of this email. I don't have access to 
this machine at this moment, otherwise I would give output of df.

What I want to do is to shrink the root logical volume, which I assume, 
though I'm not sure at the moment, occupies all the svailable space on in 
the volume group, along with the swap partition.

It is apparently possible to resize logical volumes with root mounted on a 
running system, but this seems a little too adventurous for my taste.

However, it seems possible that a live cd exists which can be used to 
resize logical volumes, and this would of course have no problem with the 
root filesystem of a system that is not running.

Does anyone have any suggestions about this? Note that it will need to run 
a 2.6 kernel, since I need to use lvm2.

I tried Knoppix, but it does not seem to know about LVM. I'm going to try 
the Debian installer, and see if I can get it to do this.

If people have suggestions, I'd be interested to hear about them.

Thanks.                                                         Faheem.

*************************************************************************
# This file is edited by fstab-sync - see 'man fstab-sync' for details
/dev/VolGroup00/LogVol00 /                       ext3    defaults        1 
1
LABEL=/boot             /boot                   ext3    defaults        1 
2
/dev/devpts             /dev/pts                devpts  gid=5,mode=620  0 
0
/dev/shm                /dev/shm                tmpfs   defaults        0 
0
/dev/proc               /proc                   proc    defaults        0 
0
/dev/sys                /sys                    sysfs   defaults        0 
0
/dev/VolGroup00/LogVol01 swap                    swap    defaults        0 
0
/dev/scd0               /media/cdrecorder       auto 
pamconsole,exec,noauto,managed 0 0
/dev/hda                /media/cdrecorder1      auto 
pamconsole,exec,noauto,managed 0 0
