Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i992aPr16682
	for <linux-lvm@redhat.com>; Fri, 8 Oct 2004 22:36:25 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i992aGrP029261
	for <linux-lvm@redhat.com>; Fri, 8 Oct 2004 22:36:19 -0400
Received: from [216.34.226.122] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1CG75e-0001Wr-00
	for <linux-lvm@redhat.com>; Fri, 08 Oct 2004 19:36:11 -0700
Date: Fri, 8 Oct 2004 19:36:09 -0700
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
Message-Id: <FA3C970D-199B-11D9-BCB4-000A95730E92@spamaps.org>
Subject: [linux-lvm] lvm2 pvmove memory leak?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM development <linux-lvm@redhat.com>

root      3773  0.0 23.5 122764 120816 tty2  D+   14:58   0:10 lvm 
pvmove -i 10 /dev/md2

This has been running for about 5 hours, moving 335GB to a new disk 
array.

2 hours ago it was at 60MB.

Has anyone else seen this?

   LVM version:     2.00.25 (2004-09-29)
   Library version: 1.00.19-ioctl (2004-07-03)
   Driver version:  4.1.0

Kernel version 2.6.8 running on Fedora Core 1.
