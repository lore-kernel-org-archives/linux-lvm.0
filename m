Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FEAG21024482
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 10:10:16 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5FEADja029459
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 10:10:14 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1FqsXq-0000bp-Dt
	for linux-lvm@redhat.com; Thu, 15 Jun 2006 16:10:02 +0200
Received: from alcatraz.cendio.se ([193.12.253.67])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 16:10:02 +0200
Received: from forsberg by alcatraz.cendio.se with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 15 Jun 2006 16:10:02 +0200
From: Erik Forsberg <forsberg@cendio.se>
Date: Thu, 15 Jun 2006 16:02:54 +0200
Message-ID: <uoodwu7bzl.fsf@impertigo.lkpg.cendio.se>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Change from one Linux Distro to another,
	keeping data on LVM
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

Hi!

I'm about to change Linux distribution on a NFS file server for a
customer. They are currently running Fedora Core 3/2.6.12, and wants
to run either Suse 9.3 or Suse 10.

The filesystem served resides on an ext3 file system located on a LVM2
LV, with the volume group having two PVs. 

Are there anything special I need to think about when doing this? My
plan is something like this:

1) Make sure I have an updated copy of /etc/lvm available somewhere
   else. 
2) Boot upp the installer for Suse and erase the partitions on the
   first physical disk (well, actually on the first hardware RAID unit) that
   are not used as a PV, and install Suse on that area of the disk. 

Hopefully, the suse partitioner will not do anything stupid with my
PVs, my VG or my LV. It's probably best to create a new VG for the
operating system, and then mount the old LV from the old VG once the
OS is in place.

Any comments/experience on this kind of operation? 

Regards,
\EF
-- 
Erik Forsberg                OpenSource-based Thin Client Technology
Systems Analyst/Developer    Phone: +46-13-21 46 00    
Cendio AB    	             Web: http://www.cendio.com
		             
