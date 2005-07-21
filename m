Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6L7MAV31684
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2005 03:22:10 -0400
Received: from mail.mhnet.de
	(213-146-240-5.int0b.skypoint_232-41.pforzheim.skytron.de
	[213.146.240.5])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6L7LoXA030164
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2005 03:22:02 -0400
Received: from mail.mhnet.de (idm-06 [127.0.0.1])
	by mail.mhnet.de (Postfix) with ESMTP id 1907E1B863
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2005 09:21:35 +0200 (CEST)
Date: Thu, 21 Jul 2005 09:21:34 +0200
From: Micha Holzmann <holzmann@gmx.de>
Message-ID: <20050721072134.GA17827@mail.mhnet.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2: problems with snapshots
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

Hello all,

i am new with LVM and related topics. After reading the Linux LVM howto
i decided to use lvm an a machine which serves different data for our
users.

After using it for a while i came to this site:

http://c.mills.ctru.auckland.ac.nz/Samba/XfsAclWinAuth.html

Inspired from the details to the "MicroBackups", i intend to do the
same. I customized the script to fit our needs.


I create the directories /mnt/snapshots/{data,home} and want to have that every half
hour from 7am until 7pm a snapshot is created an mounted on a directory
which reflects the date/time of creation.

The directory structe then is:

/mnt/snapshot/data/20070520
 |
 +--0700
 +--0730
 +...
 +...
 +--1830
 +--1900
/mnt/snapshot/data/20070521
 |
 +--0700
 +--0730
 +...
 +...
 +--1830
 +--1900

The same for the other shares and valid for a maximum of three days.
If the snapshot has expired (reached the age of 3 day) it has to be
unmounted and removed (the snapshot and the mount point).

The filesystem on these shares are XFS.

After creating a couple of snapshots and mounting them accordingly the
machine freezes. Samba was unusable, login was able. But also a
"shutdown -r now" does not work. The machine hung. Only reset helps out.


First i thought it is may a problem of XFS. I setup another machine for
testing purposes with ext3. But the same occurs.


The system is:

Debian SID
Kernel 2.6.11
LVM2


Is the snapshot feature not intended for this what i do/want or have i a
fault in thinking?


Any help/hint is much appreciated.

Best regards,
Micha Holzmann

-- 
Der Horizont vieler Menschen ist ein Kreis mit Radius Null,
und das nennen sie ihren Standpunkt
