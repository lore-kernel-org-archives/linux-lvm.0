Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BJ5eO19880
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:05:40 -0500
Received: from ns3.linuxquebec.com (ns3.linuxquebec.com [64.40.111.7])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1BJ5YZK022012
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:05:35 -0500
Received: from ns2.linuxquebec.com (unknown [64.18.178.21])
	by ns3.linuxquebec.com (Postfix) with ESMTP id B3A652B8032
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:13:36 -0500 (EST)
Received: from aragorn.intranet (unknown [10.10.1.116])
	by ns2.linuxquebec.com (Postfix) with ESMTP id 52FDF13ED8
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 14:01:43 -0500 (EST)
From: Paul Pianta <pantz@lqt.ca>
Date: Fri, 11 Feb 2005 14:05:23 -0500
Message-Id: <1108148723.4699.32.camel@aragorn.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] waah waah - disaster recovery
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

hi people

I have a major problem involving lvm and quite possibly software raid.
Here's how it goes ...

I installed a machine with 2 identical 200Gb disks and I set them up
using software RAID (on Fedora Core 2). I made three partitions on each
disk. /boot and / were created on md0 and md1 respectively using ext3.

The third partition was setup as a large volume group on md2 which was
mounted at /data. Within this vg I set up 3 logical volumes lv-backup,
lv-isos, lv-repositories.

The installation and setup went great and all was good for a while until
the first hard disk /dev/hda died. No problem - I had installed grub on
the mirror disk (/dev/hdc) and so was able to boot into the system.

Yet again all was going along fine, running on one disk while waiting
for a replacement disk to come back from Maxtor. I knew this was not
wise to run so long on a single disk but when the boss says to do it - I
thought well he knows what he's doing ...

And then Mr Murphy and his famous law kicked in and the second drive
(the only drive) froze up on me last night!

Rebooting the machine, I was able to fsck my way through the /boot and /
partition errors but the boot process gets stuck when trying to read the
journal for /data/repositories. The /data/backup and /data/isos volumes
mounted ok after they recovered their respective journals, but I don't
ever get past the 'recovering journal' message for /data/repositories.

Needless to say - there is some important data on the /dev/md2 partition
inside of the logical volume group lv-repositories. I have tried several
live cds but none of them seem to understand that I have any LVM volumes
setup.

Does anyone have any ideas on how I might be able to restore/mount
the /dev/md2 partition - even if it is just enough to copy the data
elsewhere??

thanks

pantz
