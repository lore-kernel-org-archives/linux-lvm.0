Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB55jUDR023102
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 00:45:30 -0500
Received: from goliath.broudy.net (dsl093-123-200.den1.dsl.speakeasy.net
	[66.93.123.200])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB55jTEU010256
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 00:45:29 -0500
Received: from [10.222.3.226] (birtha.dyn.arl.broudy.net [10.222.3.226])
	by goliath.broudy.net (Postfix) with ESMTP id 69AC81C69E
	for <linux-lvm@redhat.com>; Mon,  4 Dec 2006 22:45:15 -0700 (MST)
Message-ID: <4575076A.8010505@broudy.net>
Date: Mon, 04 Dec 2006 22:45:14 -0700
From: Dave Broudy <dave@broudy.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvrename hanging on snapshots
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

When I try to run "lvrename vg00 usr_p0 usr_p1" the command hangs, the 
CPU goes to 100% utilization in wait state, and the whole system pretty 
much hangs (not completely, but enough that I can't do a clean shutdown 
and have to power cycle).

Prior to running this command vg00/usr_p0 exists and is a snapshot. 
vg00/usr_p1 does not exist.

All the other LVM operations I try work fine, including creating and 
removing snapshots. lvrename -t works, but obviously doesn't do anything.

I have managed to capture a strace as well as run lvm_dump.sh -a, and 
the results are here: http://www.broudy.net/lvrename/. The lvm_dump is 
not from when the system is hung.

The last thing in the strace is a couple of ioctls on 
/dev/mapper/control, DM_DEV_SUSPEND being the last.

Kernel is stock Debian Sarge 2.6.8-2-k7

LVM VERSION:
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.1.0
DEVICE MAPPER VERSION:
Library version:   1.01.00-ioctl (2005-01-17)
Driver version:    4.1.0

I'm more that will to debug this problem, try patches, etc, I reproduced 
this on a machine that isn't very critical. But I'm not sure what steps 
to take.

Thanks,
Dave

-- 
Dave Broudy
dave@broudy.net
Phone: 303.278.0908      Mobile: 703.401.5955        Fax: 303.674.6840
http://www.broudy.net/
AIM/YIM: dbroudy
