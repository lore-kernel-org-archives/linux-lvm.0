Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBB68OhH021689
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2008 01:08:24 -0500
Received: from smtp-roam.stanford.edu (smtp-roam2.Stanford.EDU [171.67.22.72])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBB68AuP029519
	for <linux-lvm@redhat.com>; Thu, 11 Dec 2008 01:08:10 -0500
Received: from smtp-roam.stanford.edu (localhost.localdomain [127.0.0.1])
	by localhost (Postfix) with SMTP id 4209F38C300
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2008 22:08:10 -0800 (PST)
Received: from [171.64.210.234] (sls-akdt.Stanford.EDU [171.64.210.234])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: alaink)
	by smtp-roam.stanford.edu (Postfix) with ESMTP id E809538C2FD
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2008 22:08:09 -0800 (PST)
From: Alain Kelder <alaink@stanford.edu>
Date: Wed, 10 Dec 2008 22:08:09 -0800
Message-Id: <1228975689.21955.642.camel@sls-akdt.stanford.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM mysteriously dissapeared
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

Hello,

Been using LVM for a while and absolutely love it, but today ran into an
"interesting" problem.

One of the DomU's on my Xen server was displaying unusual behavior so I
rebooted it. It failed to start back up. Furthermore, xend was no longer
running on Dom0, but started up after "/etc/init.d/xend start", then
consoled into the failed DomU only to find that it's unable to boot
because it can't access its / fs. 

My DomU filesystems are logical volumes on Dom0 but LVM on Dom0 has gone
"missing".
        
        bfs:~# lvdisplay 
          No volume groups found
        bfs:~# vgdisplay 
          No volume groups found
        bfs:~# pvdisplay 

The server has four disks.  Two small ones are RAID1 (/dev/md0) and
contain the / fs of the Xen host. Two big disks are also RAID1
(/dev/md1) and contained a single partition which was allocated as a PV
to LVM. RAID volumes are healthy according to /cat/proc/mdstat and
mdadm, however fdisk claims there isn't a valid partition table
on /dev/md1 or /dev/md0. Is it correct to say that might be the root
cause?

In /etc/lvm/backup and /etc/lvm/archive I have info about my LVM setup,
with the latest being from two months ago which was the last time I
created an LV (may I just say that keeping this info is just genius on
part LVM creators?).

All the VMs are running, but are very slow. I've backed up some of the
more critical data, but would really hate to loose them all. Any
suggestions on how to move forward with this investigation and hopefully
repair?

thanks much in advance,
Alain
