Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KIOESF018940
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 13:24:14 -0500
Received: from mx3-6.spamtrap.magma.ca (mx3-6.spamtrap.magma.ca
	[209.217.78.173])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1KIOAs9019013
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 13:24:10 -0500
Received: from www-webmail1.magma.ca (www-webmail1.internal.magma.ca
	[10.0.10.246])
	by mx3-6.spamtrap.magma.ca (8.13.0/8.13.1) with ESMTP id l1KIO8Eg028348
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 13:24:08 -0500
Received: from www-webmail1.magma.ca (localhost.localdomain [127.0.0.1])
	by www-webmail1.magma.ca (8.13.1/8.13.1) with ESMTP id l1KIO8KK001650
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 13:24:08 -0500
Date: Tue, 20 Feb 2007 13:24:07 -0500
Message-Id: <200702201824.l1KIO73V001649@www-webmail1.magma.ca>
From: "Reid" <lvm@nri.ca>
Mime-Version: 1.0
Subject: [linux-lvm] Restoring LVM configuration
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

Hi,

Through a number of steps in an attempt to upgrade my server I ended up losing the
lvm.conf configuration file and my backup of it.

Part of the problem occured when I moved the disks from one controller to another on my
server.  For some reason the partition information was lost.  This was recovered without
too many troubles leaving me with a boot (ext2) and lvm2 partitions on one drive and a
lvm2 partition on the other.

I noticed on the LVM how-to that you might be able to recreate the configuration using
pvcreate after looking at /etc/lvm/archive/VolumeGroupName_XXXXX.vg but I am unable to in
this case because the root file system was part of the LVM itself.  (If I could mount it
to find out the configuration then I wouldn't be having such a problem!)

Ideally I would like to be able to create a configuration using Knoppix so that I could
mount the drives and write it onto them.  

The next best thing for me would be to find some way to get the files off of the drives
and onto a spare drive (basically recreate my backup) without losing file names/directory
structure.

Thanks.
