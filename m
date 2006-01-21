Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0LI0f107048
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 13:00:41 -0500
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0LI0dgm031837
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 13:00:39 -0500
Received: from davidb by mail.davidb.org with local (Exim 4.54 #1 (Debian))
	id 1F0N2P-00056l-Jq
	for <linux-lvm@redhat.com>; Sat, 21 Jan 2006 10:00:33 -0800
Date: Sat, 21 Jan 2006 10:00:33 -0800
From: David Brown <lvm@davidb.org>
Message-ID: <20060121180033.GA19431@old.davidb.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Interesting snapshot issue.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm having an interesting issue with snapshots.  I'm running the following:

  linux 2.6.14 (gentoo-r5)
    (which I believe contains the DM in the stock 2.6.14 kernel).
  lvm2 2.01.14

My filesystems are xfs, and I'm trying to make backups of snapshots using
xfsdump.

What I do to backup:

  - Make a snapshot: lvcreate -L 2G -s -n homesnap /dev/vg/home
  - Mount it       : mount -t xfs -o nouuid /dev/vg/homesnap /mnt/snap/home
  - Do an md5-type capture on /mnt/snap/home, result in /home/0sure.gz
  - Copy /home/0sure.gz to /mnt/snap/home
  - xfsdump /mnt/snap/home.

I've not had any problems with any of the files in the backup, except for
the integrity files that I copied to the snapshot.  They are frequently
corrupted, but curiously I've only seen it on my 'var' partition.

I was just wondering if this is part of the known issues with snapshots, or
if I should be investigating further to try to figure out what is wrong.

Dave
