Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oASFbhRJ026644
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 10:37:44 -0500
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oASFbVZ2010013
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 10:37:31 -0500
Received: by wwb28 with SMTP id 28so3581703wwb.27
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 07:37:30 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 28 Nov 2010 22:37:30 +0700
Message-ID: <AANLkTim1qSNP4EvhYqaTRb6XuMXkwxBWcgczsUq6NtZk@mail.gmail.com>
From: hansbkk@gmail.com
Subject: [linux-lvm] RAID10 striping vs LVM striping over RAID1 (noob)
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

Sorry if this is double-posted, but apparently I messed up my message
headers and this didn't actually make it to the list when I first
posted it.

-----------

I'm building a filer on a limited budget with two sets of SATAII
disks, one made of 6x500GB, the other 4x2TB and a recent kernel.

I understand that LVM over software RAID is the way to go, but I'm not
clear on which of the following two scenarios would be "better" - data
availability, flexibility in handling future space expansion and ease
of recovery are more important than performance issues for me, but of
course I'd like to optimize for both if possible.

(ASCII art best viewed with a monospaced font)

Scenario A is traditional RAID1 mirroring, letting LVM handling the striping.
 ________________________________________________
|                      LVM VG                    |
|  _____________   _____________   ____________  |
| |   LVM PV1   | |   LVM PV2   | |   LVM PV3  | |
| | ___________ | | ___________ | | ___________| |
| ||   RAID1   || ||   RAID1   || ||   RAID1   | |
| ||  __   __  || ||  __   __  || ||  __   __  | |
| || |__| |__| || || |__| |__| || || |__| |__| | |
| ||___________|| ||___________|| ||___________| |
| |_____________| |_____________| |____________| |
|________________________________________________|



Scenario B is making use of RAID10 (the mdm-specific one, not generic
RAID1+0, probably the ",f2" flavor) to handle the striping, presenting
one physical disk to LVM to use as a PV.
  _______________
 |  LVM PV = VG  |
 |  ___________  |
 | | RAID10,f2 | |
 | |  __   __  | |
 | | |__| |__| | |
 | |  __   __  | |
 | | |__| |__| | |
 | |  __   __  | |
 | | |__| |__| | |
 | |___________| |
 |_______________|


If I should go with A, then my next question is - does LVM
automatically optimize the striping for performance, or should I
"help" it by created multiple PVs by slicing the disks up into
partitions? If the latter, then that seems to sacrifice a lot of A's
simplicity and perhaps greater ease of data recovery.

Any and all feedback welcome, TIA.
