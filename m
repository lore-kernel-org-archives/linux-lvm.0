Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22L65GX004355
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 16:06:05 -0500
Received: from lnx130.hrz.tu-darmstadt.de (root@lnx130.hrz.tu-darmstadt.de
	[130.83.174.24])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l22L3sfW004735
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 16:03:55 -0500
Received: from iss1.vlsi.informatik.tu-darmstadt.de
	(iss1.vlsi.informatik.tu-darmstadt.de [130.83.164.1])
	by lnx130.hrz.tu-darmstadt.de (8.13.4/8.12.10) with ESMTP id
	l22L3ahJ020637
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 22:03:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	DE6DC8007
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 22:03:36 +0100 (CET)
Received: from iss1.vlsi.informatik.tu-darmstadt.de ([127.0.0.1])
	by localhost (iss1 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 02233-07 for <linux-lvm@redhat.com>;
	Fri, 2 Mar 2007 22:03:36 +0100 (CET)
Received: from iss17.vlsi.informatik.tu-darmstadt.de
	(iss17.vlsi.informatik.tu-darmstadt.de [130.83.164.17])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	BC2028006
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 22:03:36 +0100 (CET)
Date: Fri, 2 Mar 2007 22:02:41 +0100
From: Tom Assmuth <ml-lvm@iss.tu-darmstadt.de>
Message-ID: <20070302210230.GA10659@iss.tu-darmstadt.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] severe problems to remove invalid/full snapshots with
	debian-etch
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

hi,

i gave up using lvm2 with debian sarge cause to a lot of problems
concerning stability but now i gave it another try with my debian-etch
box. but here problems with snapshots are still severe.

--
used system:
kernel: 2.6.18-3-686 (normal kernel version in etch)
lvm version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.7.0
--

problem: 

if a snapshot runs full (having attributes like this calling
lvs: Swi-I- ) I of course try to remove it with lvremove:

this will throw something like this on all consoles:

 kernel BUG at mm/slab.c:595!
 invalid opcode: 0000 [#1]
 EIP is at kmem_cache_free+0x29/0x6d
 esi: daa2f28c   edi: d9439a88   ebp: 00036c68   esp: c593fdb0
 Process lvremove (pid: 25402, ti=c593e000 task=c533aaa0 task.ti=c593e000)
 Stack: 15f529ae daa2f28c dd08dc68 dc86c94e dbf84220 00006d8d 00008000 daa2f240
 ...
 EIP: [<c0156f55>] kmem_cache_free+0x29/0x6d SS:ESP 0068:c593fdb0
 ...

afterwards the snapshot is not removed but has the attributes sri---
when it is lvremoved a second time it seems to be away using "lvs"

BUT a new snapshot with the same name fails:
  device-mapper: create ioctl failed: Device or resource busy
  device-mapper: reload ioctl failed: No such device or address
  Failed to suspend origin lvsanyback

lvs gives for this recreated snapshot the attributes -wi-d- 

reboot of the maschine is the only way to help me out.

------

playing around with "dmsetup table" I learned that a snapshot normally
has two entries (the normal name and the name-cow)

when removing the invalid snapshot dmsetup table still shows the -cow
snapshot entry and found no way to get rid of it without reboot.  even
dmsetup remove vgnam-snapshotname-cow only gave a "Device or resource
busy"

Btw reboot mostly did not work. the box has to be resetted and after
start a manual fsck becomes necessary.

---

question: 

Is this a "normal/known" behaviour?? Are there any workarounds besides
reboot?  kernel-issue? Should I try a vanilla kernel and if yes which
one?

---

p.s.:
i have been using lvm1 for many years and I am somehow disappointed
with lvm2 as there are a lot of stability problems and restrictions I
never experienced in lvm1. And lvm1 seems to be not present in debian
etch <sigh>!  (sorry 4 nagging)

-- 
___________  __  ____          ___    
 / _   __   /_/ ( (   /|/| / / /  /_/ 
/ (_) ///  / / __)_) /   |/_/ /  / /  
