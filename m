Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R2ps8m032466
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:51:54 -0400
Received: from grunt6.ihug.co.nz (grunt6.ihug.co.nz [203.109.254.46])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R2ppqC017680
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:51:52 -0400
Date: Wed, 27 Sep 2006 14:51:43 +1200
From: Nick Wright <nick@lsd.net.nz>
Message-ID: <20060927025143.GA10619@highgate.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Snapshot removal problem
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,


I don't seem to be able to remove snapshots unless I first deactivate
the snapshot target. Indeed, trying to do brings about a situation
where a reboot is required.

I run the command as follows:

~# lvremove /dev/VolGroup01/backup_vol_snap
Do you really want to remove active logical volume "backup_vol_snap"?
[y/n]: 
  
If I answer no, ok, I return to my prompt. If I answer yes, the
command sits there forever, cannot be killed, and I must reboot my PC
before I can run any further LVM commands. E.g., lvdisplay will block
when trying to display details about backup_vol and backup_vol_snap
but does display info about logical volumes inside a different volume
group. Any command operating on VolGroup01 will block indefinitely.

This is a Debian Sarge box, running a vanilla 2.6.17 kernel.

lvm packages:
ii  lvm-common     1.5.17         The Logical Volume Manager for Linux
ii  lvm2           2.01.04-5      The Linux Logical Volume Manager

ii  dmsetup        1.01.00-4      The Linux Kernel Device Mapper
ii  libdevmapper1. 1.01.00-4      The Linux Kernel Device Mapper

~# lvm version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.6.0

I can deactivate the snapshot target first, remove the snapshot and
reactivate -- thats fine for now, but inconvenient:

# take backup lv offline
lvchange -an /dev/VolGroup01/backup_vol

#delete snapshot
lvremove /dev/VolGroup01/backup_vol_snap

#reactivate backup vol
lvchange -ay /dev/VolGroup01/backup_vol


Any ideas on this? 


Thanks.

Nick
