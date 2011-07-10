Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6AHePmS024280
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 13:40:25 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6AHeOZ6019610
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 13:40:25 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.tlinx.org (8.14.4/8.14.4/SuSE Linux 0.8) with ESMTP id
	p6AHeDcv031622
	for <linux-lvm@redhat.com>; Sun, 10 Jul 2011 10:40:15 -0700
Message-ID: <4E19E3FD.9000805@tlinx.org>
Date: Sun, 10 Jul 2011 10:40:13 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bug!  lvs shouldn't need 'root' access
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



When I do an lvs to look at he sizes of my devs, I get:
lvm> lvs
  WARNING: Running as a non-root user. Functionality may be unavailable.
  /dev/ram0: open failed: Operation not permitted
  /dev/dm-0: open failed: Operation not permitted
  /dev/ram1: open failed: Operation not permitted
  /dev/sda1: open failed: Operation not permitted
  /dev/dm-1: open failed: Operation not permitted
  /dev/ram2: open failed: Operation not permitted
 ....
  /dev/ram16: open failed: Operation not permitted
  /dev/ram17: open failed: Operation not permitted
...
  /dev/sdb1: open failed: Operation not permitted
  /dev/sdc6: open failed: Operation not permitted
 ...
  No volume groups found.

Thing is, ll '/dev/sd?' show:
brw-rw---- 1 root disk 8,  0 Jul  8 23:52 /dev/sda
brw-rw---- 1 root disk 8, 16 Jul  8 23:52 /dev/sdb
brw-rw---- 1 root disk 8, 32 Jul  8 16:52 /dev/sdc
brw-rw---- 1 root disk 8, 48 Jul  8 16:52 /dev/sdd

and me:
 > groups
tty disk mail wheel games audio SYSGROUP  www squid trusted named
ldap backup unix_users home private powerd ....

Notice 'disk'....

and notice how group disk has same perms has uid 'root'??

I could write to the darn things!, but all I NEED is read (hmmm
maybe I should change the perms on those devs to 640, but besides
the point)....I should be able to read them!  (any WHY is lvm
looking at all the ram disks?   Do that many people use lvm with
ram disks?  (possible, but don't see it as very useful).

So what's going on?  are all the user's associated groups being
dumped somewere?

Shouldn't have to become root just to get status of things (like
running 'top', etc...)
