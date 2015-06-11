Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5BB5A2p013468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2015 07:05:10 -0400
Received: from mail.thomas-krenn.com (mail.thomas-krenn.com [80.154.222.2])
	by mx1.redhat.com (Postfix) with ESMTPS id 9012AB5E9B
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2015 11:05:08 +0000 (UTC)
From: Christoph Mitasch <cmitasch@thomas-krenn.com>
Date: Thu, 11 Jun 2015 11:04:56 +0000
Message-ID: <5d7b188de2ef4b03a1118bdbe820f19a@exchangembx1.intern.thomas-krenn.com>
Content-Language: de-DE
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Snapshot creation and removal hangs
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hello,

we are using a DRBD handler that is removing and creating LVM snaphots on a Ubuntu 12.04 with kernel 3.2.0-84.

We found out that both lvmremove and lvmcreate hangs for  about 1min most of the times. It seems to be related to udev.

root@server:~# bash -x lvmsnaploop.sh 
+ i=0
+ '[' 0 -lt 100 ']'
+ i=1
+ lvcreate -s -n test -L 1000k local/r1-U
  Rounding up size to full physical extent 4,00 MiB
  Logical volume "test" created

real	0m0.515s
user	0m0.008s
sys	0m0.024s
+ lvremove -f /dev/local/test
  Logical volume "test" successfully removed

real	1m0.991s
user	0m0.012s
sys	0m0.020s
+ '[' 1 -lt 100 ']'
+ i=2
+ lvcreate -s -n test -L 1000k local/r1-U
  Rounding up size to full physical extent 4,00 MiB
  Logical volume "test" created

real	1m1.059s
user	0m0.004s
sys	0m0.028s
---

The log also shows the watershed process calling vgscan and vgchange is getting killed after a timeout.

Jun 11 12:51:45 server udevd[22866]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25071]
Jun 11 12:51:45 server udevd[22867]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25079]
Jun 11 12:51:45 server udevd[22867]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25079] terminated by signal 9 (Killed)
Jun 11 12:51:45 server udevd[22866]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25071] terminated by signal 9 (Killed)
Jun 11 12:51:45 server udevd[23202]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25109]
Jun 11 12:51:45 server udevd[23202]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25109] terminated by signal 9 (Killed)
Jun 11 12:51:45 server udevd[23202]: inotify_add_watch(6, /dev/dm-0, 10) failed: No such file or directory
Jun 11 12:51:45 server udevd[23200]: inotify_add_watch(6, /dev/dm-0, 10) failed: No such file or directory
Jun 11 12:51:45 server udevd[23200]: inotify_add_watch(6, /dev/dm-0, 10) failed: No such file or directory
Jun 11 12:52:46 server udevd[22866]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25122]
Jun 11 12:52:46 server udevd[22867]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25126]
Jun 11 12:52:46 server udevd[22867]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25126] terminated by signal 9 (Killed)
Jun 11 12:52:46 server udevd[22866]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25122] terminated by signal 9 (Killed)
Jun 11 12:53:47 server udevd[22866]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25169]
Jun 11 12:53:47 server udevd[22866]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25169] terminated by signal 9 (Killed)
Jun 11 12:53:47 server udevd[22867]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25177]
Jun 11 12:53:47 server udevd[22867]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25177] terminated by signal 9 (Killed)
Jun 11 12:53:47 server udevd[23250]: timeout: killing 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25201]
Jun 11 12:53:47 server udevd[23250]: 'watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'' [25201] terminated by signal 9 (Killed)

If we add "--noudevsync" to the lvcreate/-remove command everything wents smooth.

The following udev rules seems to cause the issue.
root@server:/lib/udev/rules.d# cat 85-lvm2.rules
# This file causes block devices with LVM signatures to be automatically
# added to their volume group.
# See udev(8) for syntax

SUBSYSTEM=="block", ACTION=="add|change", ENV{ID_FS_TYPE}=="lvm*|LVM*", \
	RUN+="watershed sh -c '/sbin/lvm vgscan; /sbin/lvm vgchange -a y'"

Is calling "noudevsync" an option or is there any other way to fix that problem?

Thank you,
Christoph
