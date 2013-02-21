Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r1LA3B7o002091
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2013 05:03:12 -0500
Received: from wblv-ip-smtp-9-1.saix.net (wblv-ip-smtp-9-1.saix.net
	[196.25.240.69])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1LA34xO031658
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2013 05:03:06 -0500
Received: from atlantis.dyndns.uls.co.za (dsl-144-201-163.telkomadsl.co.za
	[41.144.201.163])
	by wblv-ip-smtp-9-1.saix.net (Postfix) with ESMTP id 10AFA801
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2013 12:03:00 +0200 (SAST)
Received: from [192.168.42.142]
	by atlantis.dyndns.uls.co.za with esmtpa (Exim 4.76)
	(envelope-from <jaco@uls.co.za>) id 1U8SzT-0004v2-Up
	for linux-lvm@redhat.com; Thu, 21 Feb 2013 12:03:00 +0200
Message-ID: <5125F0D3.3000200@uls.co.za>
Date: Thu, 21 Feb 2013 12:02:59 +0200
From: Jaco Kroon <jaco@uls.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dmeventd fails to release V_vg lock
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

Hi Guys,

It looks like under some circumstances dmeventd doesn't properly release
a lock it's holding on /var/lock/lvm/V_${vg} ... I suspect it might be
related to snapshots (also see an email from a few hours back). 
However, dmeventd is trying to do *something* with the lock held, or
sleeping, please see below.  Firstly, at the time of testing, dmeventd
is the only process that has the lock file open:

[root@hostjmdb2 proc]# ls -la */fd/* 2>/dev/null | grep -E 'V_vg'
lrwx------ 1 root root 64 Feb 21 11:52 5519/fd/1046 ->
/var/lock/lvm/V_vg_hostdb02
[root@hostjmdb2 proc]#

At this point if I run "lvs" (and then press ^C) I get this:

[root@hostname proc]# lvs
  /dev/vg_hostdb02/snap-lib_mysql-2013-02-20.18: read failed after 0 of
4096 at 536870846464: Input/output error
... bunch of other IO failures on snapshots that has presumably become
invalid
  /dev/vg_hostdb02/snap-lib_mysql-2013-02-21.06: read failed after 0 of
4096 at 4096: Input/output error
^C  CTRL-c detected: giving up waiting for lock
  /var/lock/lvm/V_vg_hostdb02: flock failed: Interrupted system call
  Can't get lock for vg_hostdb02
  Skipping volume group vg_hostdb02
[root@hostname proc]#

So the only logical conclusion is that dmeventd has the lock held.  And
according to wchan in /proc/5519 dmeventd is blocking in
poll_schedule_timeout ... so my suspicion is that under some error
condition dmeventd doesn't release it's lock on V_ ... perhaps an
attempt to extend the snapshot, which then becomes invalid before the
extend is issued or something.

Specific distro in question is Centos 6.5, and lvm2-2.02.95-10.el6.x86_64
-- 
Kind Regards,
Jaco Kroon
 
