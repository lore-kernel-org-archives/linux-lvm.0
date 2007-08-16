Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7GH43sK030105
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 13:04:03 -0400
Received: from probity.mcc.ac.uk (probity.mcc.ac.uk [130.88.200.94])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7GH3xsw019370
	for <linux-lvm@redhat.com>; Thu, 16 Aug 2007 13:04:00 -0400
Received: from gerhayn.mcc.ac.uk ([10.2.18.1])
	by probity.mcc.ac.uk with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.63 (FreeBSD))
	(envelope-from <cs@networkingnewsletter.org.uk>) id 1ILilL-0004HI-CB
	for linux-lvm@redhat.com; Thu, 16 Aug 2007 18:03:59 +0100
Received: from ratty.phy.umist.ac.uk ([130.88.128.163]:54133)
	by gerhayn.mcc.ac.uk with esmtpsa (TLSv1:RC4-MD5:128)
	(Exim 4.67 (FreeBSD))
	(envelope-from <cs@networkingnewsletter.org.uk>) id 1ILilL-0003nG-9d
	for linux-lvm@redhat.com; Thu, 16 Aug 2007 18:03:59 +0100
From: michael <cs@networkingnewsletter.org.uk>
Date: Thu, 16 Aug 2007 18:03:57 +0100
Message-Id: <1187283837.16162.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove problems
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

I'm trying to reduce a logical vol so that I can remove a HD from it.  
However, I get errors with pvmove but I don't know why. I saw some old
postings with a kernel patch but the URL is extinct.

I'm running Fedora: Linux xxx.phy.umist.ac.uk 2.6.22.1-41.fc7 #1 SMP Fri
Jul 27 18:21:43 EDT 2007 x86_64 x86_64 x86_64 GNU/Linux


chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sdb1
Password:
   --- Physical volume ---
   PV Name               /dev/sdb1
   VG Name               VolGroup00
   PV Size               698.64 GB / not usable 10.34 MB
   Allocatable           yes
   PE Size (KByte)       32768
   Total PE              22356
   Free PE               19156
   Allocated PE          3200
   PV UUID               xDWUQB-wdEx-AtEs-YFkh-BKBR-7Jgd-9ik3p0


chris@veri:~$ sudo /usr/sbin/pvdisplay /dev/sda2
   --- Physical volume ---
   PV Name               /dev/sda2
   VG Name               VolGroup00
   PV Size               465.66 GB / not usable 3.56 MB
   Allocatable           yes
   PE Size (KByte)       32768
   Total PE              14901
   Free PE               14839
   Allocated PE          62
   PV UUID               GLGcHf-b3Ga-M61f-okkW-HaAk-Al7P-leVK91


chris@veri:~$ sudo /usr/sbin/pvmove /dev/sdb1
   Failure parsing mirror status fraction: 1 core
   Failure parsing mirror status fraction: 1 core
   ABORTING: Mirror percentage check failed.
