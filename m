Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i74Exva28533
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 10:59:57 -0400
Received: from hoemail1.lucent.com (hoemail1.lucent.com [192.11.226.161])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i74Exve1014425
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 10:59:57 -0400
Received: from alpo.inse.lucent.com (h152-148-10-6.lucent.com [152.148.10.6])
	by hoemail1.lucent.com (8.12.11/8.12.11) with ESMTP id i74ExtD5017796
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 09:59:55 -0500 (CDT)
Received: from sekrit.inse.lucent.com (sekrit.inse.lucent.com [152.148.90.85])
	by alpo.inse.lucent.com (8.9.1a/8.9.1) with ESMTP id KAA11968
	for <linux-lvm@redhat.com>; Wed, 4 Aug 2004 10:59:54 -0400 (EDT)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <16656.63977.881573.707810@gargle.gargle.HOWL>
Date: Wed, 4 Aug 2004 10:59:53 -0400
From: "John Stoffel" <stoffel@lucent.com>
Subject: [linux-lvm] Problem adding disk back into an array
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi all,

I'm running a Debian system with linux kernel 2.6.8-rc2-mm2, which is
pretty bleeding edge.  I've been playing around getting a
USB2.0/IEEE1394 enclosure working with a 120gb drive.  This matches
the pair of 120gb drives I'm using to hold my /home and /local
volumes.  They're /dev/hde and /dev/hdg respectively.

The system is setup so that both drives have a single partition which
is an LVM type.  So both disks are completely mirrored to each other.
On top of that, I have several LVM volumes.

While mucking around on the system this morning, I noticed that one of
the disks on the array was gone.  I've been trying to get it back and
it's not working at all.  I've rebooted multiple times, re-partitioned
the bad disk, etc.  Nothing.  Here's some info:

   # cat /proc/mdstat
   Personalities : [linear] [raid0] [raid1] [raid5]
   md0 : active raid1 hde1[0]
	 117218176 blocks [2/1] [U_]

   unused devices: <none>

   # mdadm /dev/md0 -a /dev/hdg1
   mdadm: hot add failed for /dev/hdg1: Invalid argument

And in /var/log/messages, I see the following two lines:

   Aug  4 10:54:02 jfsnew kernel: md: trying to hot-add unknown-block(34,1) to md0 ...
   Aug  4 10:54:02 jfsnew kernel: md: error, md_import_device() returned -16


The entries in /dev/hd* look like this:

   # ls -l /dev/hd*
   brw-rw----  1 root cdrom  3, 0 Aug  4 10:52 /dev/hda
   brw-rw----  1 root disk  33, 0 Aug  4 10:52 /dev/hde
   brw-rw----  1 root disk  33, 1 Aug  4 10:52 /dev/hde1
   brw-rw----  1 root disk  34, 0 Aug  4 10:52 /dev/hdg
   brw-rw----  1 root disk  34, 1 Aug  4 10:52 /dev/hdg1

Here's a list of partitions on the system as well:

    # cat /proc/partitions 
    major minor  #blocks  name

      33     0  117220824 hde
      33     1  117218241 hde1
      34     0  117220824 hdg
      34     1  117218241 hdg1
       8     0   17783000 sda
       8     1     248976 sda1
       8     2    4000185 sda2
       8     3     996030 sda3
       8     4          1 sda4
       8     5    4000153 sda5
       8     6    8000338 sda6
       8    16   17782540 sdb
       8    17     248976 sdb1
       8    18     996030 sdb2
       8    19   16530885 sdb3
       9     0  117218176 md0
       8    32  117220824 sdc
       8    33   58593496 sdc1
       8    34   48828024 sdc2
     253     0   53477376 dm-0
     253     1   36700160 dm-1
     253     2  117218241 dm-2
     253     3     248976 dm-3
     253     4     996030 dm-4
     253     5   16530885 dm-5
     253     6   58593496 dm-6
     253     7   48828024 dm-7


Anyone have any ideas what I'm doing wrong here?

Thanks,
John
