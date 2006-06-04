Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k54J1AFN020284
	for <linux-lvm@redhat.com>; Sun, 4 Jun 2006 15:01:10 -0400
Received: from smtp-vbr7.xs4all.nl (smtp-vbr7.xs4all.nl [194.109.24.27])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k54J18is009449
	for <linux-lvm@redhat.com>; Sun, 4 Jun 2006 15:01:08 -0400
Received: from xs2.xs4all.nl (xs2.xs4all.nl [194.109.21.3])
	by smtp-vbr7.xs4all.nl (8.13.6/8.13.6) with ESMTP id k54J17ol018702
	for <linux-lvm@redhat.com>; Sun, 4 Jun 2006 21:01:07 +0200 (CEST)
	(envelope-from rjoris@xs4all.nl)
Received: from xs2.xs4all.nl (rjoris@localhost [127.0.0.1])
	by xs2.xs4all.nl (8.13.6/8.13.6) with ESMTP id k54J17Nc062320
	for <linux-lvm@redhat.com>; Sun, 4 Jun 2006 21:01:07 +0200 (CEST)
	(envelope-from rjoris@xs4all.nl)
Received: (from rjoris@localhost)
	by xs2.xs4all.nl (8.13.6/8.13.6/Submit) id k54J17j0062319
	for linux-lvm@redhat.com; Sun, 4 Jun 2006 21:01:07 +0200 (CEST)
	(envelope-from rjoris)
Date: Sun, 4 Jun 2006 21:01:07 +0200
From: Joris van Rantwijk <jvrantwijk@xs4all.nl>
Message-ID: <20060604190107.GA60385@xs4all.nl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] lvremove hangs on removing snapshot
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

Hello,

When trying to remove a dm-snapshot device, I see lvremove freezing.
A reboot is then needed to get the system in a usable state again.

I know that previous freezes/segfaults on removing a snapshot
have been traced to a problem with kcopyd, but I am running
linux 2.6.16.16 which should contain the fix for these problems.
So it seems that my problem is different.

The freeze happens consistently, and even if the snapshot and/or
real device have not been accessed. For example, I type:

# lvcreate --size 1G --snapshot --name homesnap vg0/home
# lvremove vg0/home
Are you sure ... ? Y
 [ lvremove now frozen ]

If a filesystem was mounted on the original vg0/home, any attempt
to access the filesystem will freeze as well. Other than that, the
system remains responsive.

After a reboot, I see that vg0/home and vg0/homesnap are both still
present but set to inactive. I can then lvremove vg0/homesnap and
lvchange vg0/home to reactivate it.

If I strace lvremove on its one-way trip, I see that it sends
a few DM_SUSPEND ioctls, then freezes on a DM_TABLE_LOAD ioctl.

Am I doing something wrong with the snapshot, or is this still a bug?
I seem to remember that I had it working correctly some time ago, but
now it fails all the time.
My system is Debian 3.1, linux 2.6.16.16, lvm2 2.01.04.

Thanks,
  Joris.
