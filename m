Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7IG6G1j001162
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 12:06:16 -0400
Received: from mx2.studentuniverse.com (mx2.studentuniverse.com
	[146.115.12.43])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7IG6CHt020080
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 12:06:12 -0400
Received: from sumail03.studentuniverse.com (sumail03.studentuniverse.com
	[192.168.1.7])
	by mx2.studentuniverse.com (8.13.3/8.13.3/SuSE Linux 0.7) with ESMTP id
	k7IG646d031619
	for <linux-lvm@redhat.com>; Fri, 18 Aug 2006 12:06:06 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 18 Aug 2006 12:06:04 -0400
Message-ID: <D2575519D6CA2840B6D3E26087EA71B6C9E2@sumail03.studentuniverse.com>
From: "Marlier, Ian" <ian.marlier@studentuniverse.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] "inactive Original" / "device-mapper: reload ioctl
	failed: Invalid argument"
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

Hi there --

I've googled around and found other folks reporting this problem, but
haven't seen a solution.  I'm wondering if I'm missing something, or if
it's still an open issue...

I've got LVM2 set up, and am using snapshots.  After a reboot, the
master partition is listed with status "inactive Original", and the
snapshots as "inactive Snapshot".

/dev/mapper/volgrp-master exists, as does
/dev/mapper/volgrp-master-real.

Attempting to do anything with the master partition results in this
message:
"device-mapper: reload ioctl failed: Invalid argument"

Anyone know
1) What the problem might be?
2) What further diagnostics might be useful to figure out what the
problem is?
3) How to fix this?

Machine/version info:
devxen0:~ # uname -a
Linux devxen0 2.6.16.13-4-xen #1 SMP Wed May 3 04:53:23 UTC 2006 x86_64
x86_64 x86_64 GNU/Linux
devxen0:~ # lvm version
  LVM version:     2.02.02 (2006-02-07)
  Library version: 1.02.03 (2006-02-08)
  Driver version:  4.5.0
devxen0:~ # dmsetup version
Library version:   1.02.03 (2006-02-08)
Driver version:    4.5.0
devxen0:~ # lvscan
  inactive Original '/dev/xenmachines/master' [12.00 GB] inherit
  ACTIVE            '/dev/xenmachines/master-swap' [1.00 GB] inherit
  ACTIVE            '/dev/xenmachines/5-8-0-km-swap' [1.00 GB] inherit
  ACTIVE            '/dev/xenmachines/UberTix-swap' [1.00 GB] inherit
  ACTIVE            '/dev/xenmachines/FrancisTest-swap' [1.00 GB]
inherit
  inactive Snapshot '/dev/xenmachines/5-8-0-km' [10.00 GB] inherit
  inactive Snapshot '/dev/xenmachines/UberTix' [10.00 GB] inherit
  inactive Snapshot '/dev/xenmachines/FrancisTest' [10.00 GB] inherit
devxen0:~ #

Thanks!

- Ian
