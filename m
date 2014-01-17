Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0HEaLjh002355
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 09:36:21 -0500
Received: from homiemail-a83.g.dreamhost.com (caibbdcaabde.dreamhost.com
	[208.113.200.134])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0HEaJkq031022
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 09:36:20 -0500
Received: from homiemail-a83.g.dreamhost.com (localhost [127.0.0.1])
	by homiemail-a83.g.dreamhost.com (Postfix) with ESMTP id E836F5E06A
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 06:36:18 -0800 (PST)
Received: from [127.0.0.1] (unknown [159.63.145.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: tanstaafl@libertytrek.org)
	by homiemail-a83.g.dreamhost.com (Postfix) with ESMTPSA id B9E345E060
	for <linux-lvm@redhat.com>; Fri, 17 Jan 2014 06:36:18 -0800 (PST)
Message-ID: <52D93FC2.9080804@libertytrek.org>
Date: Fri, 17 Jan 2014 09:35:46 -0500
From: Tanstaafl <tanstaafl@libertytrek.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Integrating LVM sna[pshots with rsnapshot (rsync based
	backup tool)
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
To: LVM List <linux-lvm@redhat.com>

Hi all,

Just wanted to ask here for confirmation of something.

Rsnapshot is a perl utility, and can be configured to create LVM 
snapshots for performing backups (ie, for backing up email stores, etc).

man rsnapshot contains the following:

linux_lvm_vgpath         /dev
   Path to the LVM Volume Groups.

Considering that my LVM volumes specified in fstab are:

# LVM command paths
#
linux_lvm_cmd_lvcreate  /sbin/lvcreate
linux_lvm_cmd_lvremove  /sbin/lvremove
linux_lvm_snapshotsize  3G
linux_lvm_snapshotname  lvm-snap-host1
linux_lvm_vgpath        /dev/vg
linux_lvm_mountpath     /mnt/lvm-rsnap-host1
linux_lvm_cmd_mount     /bin/mount
linux_lvm_cmd_umount    /bin/umount

So, my question is, what should I use in my rsnapshot config?

/dev

or

/dev/vg

There is obviously a ton of stuff in /dev that has nothing to do with 
LVM, so it seems more logical to me that I would use /dev/vg, but maybe 
LVM is smarter than I give it credit for?
