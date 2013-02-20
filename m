Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1KKQA3K011696
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 15:26:11 -0500
Received: from rrba-ip-smtp-3-4.saix.net (rrba-ip-smtp-3-4.saix.net
	[196.25.240.214])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1KKQ7Ix007218
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 15:26:08 -0500
Received: from atlantis.dyndns.uls.co.za (dsl-144-201-155.telkomadsl.co.za
	[41.144.201.155])
	by rrba-ip-smtp-3-4.saix.net (Postfix) with ESMTP id 2581328A
	for <linux-lvm@redhat.com>; Wed, 20 Feb 2013 22:26:03 +0200 (SAST)
Received: from [192.168.40.204]
	by atlantis.dyndns.uls.co.za with esmtpa (Exim 4.76)
	(envelope-from <jaco@uls.co.za>) id 1U8GEt-0002JI-Bm
	for linux-lvm@redhat.com; Wed, 20 Feb 2013 22:26:03 +0200
Message-ID: <5125315B.1060409@uls.co.za>
Date: Wed, 20 Feb 2013 22:26:03 +0200
From: Jaco Kroon <jaco@uls.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] potential locking issues
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
To: linux-lvm@redhat.com

Hi All,

LVM2 uses a locking scheme, relying on flock to maintain lock files for
volume groups, by default /var/lock/lvm/V_${vgname} - these lock files
are opened, then flock()ed, and eventually either unlocked and later
locked again, or potentially just unlink()ed with the lock held.

The unlink() can potentially cause the lock to desync and cause
problems.  Consider the following scenario with three processes
(ordering is as is, the numbers are process numbers):

1.  open()
2.  open()
1.  flock() <-- succeeds
2.  flock() <-- blocks.
1.  unlink()
1.  close() <--@this point process 2's flock succeeds.
3.  open() <-- note that this ends up being a *different* file.
3.  flock() <-- succeeds.

At this point both 2 and 3 thinks they have the lock and that's wrong.

I actually saw an instance today where dmeventd had a file descriptor
open to a deletect V_vggroup lockfile, so this *does* happen in the
field.  This also explains various lockups i've seen in the past, which
I later figured out usually happened when dmeventd was running (So i put
much effort into ensuring dmeventd never ever started up - which helped
a lot).

Permitting I'm right the fix would be to fix _undo_flock in
lib/locking/file_locking.c to not unlink the lockfile - ever.  Or any
other file that is used for locking purposes anywhere in the codebase
for that matter.
-- 
Kind Regards,
Jaco Kroon
 
