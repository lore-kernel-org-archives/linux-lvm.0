Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5JFF8e9002347
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 11:15:09 -0400
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mx1.redhat.com (Postfix) with ESMTPS id B516D389D94
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 15:15:07 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1Z5y0W-0006TY-Rx
	for linux-lvm@redhat.com; Fri, 19 Jun 2015 17:15:04 +0200
Received: from 199-142-85-95.dynamic.stcable.net ([95.85.142.199])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 17:15:04 +0200
Received: from csanyipal by 199-142-85-95.dynamic.stcable.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2015 17:15:04 +0200
From: csanyipal@gmail.com
Date: Fri, 19 Jun 2015 17:02:02 +0200
Message-ID: <87lhff4u8l.fsf@gmail.com>
Mime-Version: 1.0
Subject: [linux-lvm] lvcreate - device not cleared Aborting. Failed to wipe
	start of new LV.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

Hello,

on my Debian Jessie system I want to create a LV with command:
lvcreate --size 10.10G -n var bubba
 Rounding up size to full physical extent 10.10 GiB
 /dev/bubba/var: not found: device not cleared
 Aborting. Failed to wipe start of new LV.
 semid 1212424: semop failed for cookie 0xd4d132f: incorrect
  semaphore state
 Failed to set a proper state for notification semaphore
  identified by cookie value 223154991 (0xd4d132f) to initialize
  waiting for incoming notifications.

pvdisplay
 --- Physical volume ---
 PV Name               /dev/sda2
 VG Name               bubba
 PV Size               455.43 GiB / not usable 3.65 MiB
 Allocatable           yes
 PE Size               4.00 MiB
 Total PE              116588
 Free PE               108856
 Allocated PE          7732
 PV UUID               SMvR2K-6Z3c-xCgd-jSR2-kb1A-15a2-3RiS6V

The lvm version is:
lvm version
 LVM version:     2.02.111(2) (2014-09-01)
 Library version: 1.02.90 (2014-09-01)
 Driver version:  4.22.0

I'm not sure whether was on this system created the VG 'bubba' with lvm
version 1, so maybe this issue is related to that fact that it was
really created with lvm version 1?

What is the solution for my problem?

-- 
Regards from Pal
