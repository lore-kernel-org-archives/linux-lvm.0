Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0KBFv119438
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 06:15:57 -0500
Received: from smtp2.rz.tu-harburg.de (smtp2.rz.tu-harburg.de [134.28.205.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0KBFurP013751
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 06:15:56 -0500
Received: from mail2.rz.tu-harburg.de (mail2.rz.tu-harburg.de [134.28.202.179])
	by smtp2.rz.tu-harburg.de (8.13.1/8.13.1) with ESMTP id k0KBFs6R019153
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 12:15:54 +0100
Received: from [134.28.41.43] (copenhagen.ti1.tu-harburg.de [134.28.41.43])
	(user=ti1fw mech=PLAIN bits=0)
	by mail2.rz.tu-harburg.de (8.13.1/8.13.1) with ESMTP id k0KBFqWE009289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 20 Jan 2006 12:15:53 +0100
Message-ID: <43D0C66C.3040609@gmx.net>
Date: Fri, 20 Jan 2006 12:15:56 +0100
From: Fabian Wenzel <f.wenzel@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on Raid-5 woes...
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

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hello there!

Currently I am trying to set up LVM on top of RAID-5. I am using Kernel
2.6.12.2, device-mapper 1.01.04-r2 and lvm2 2.01.15-r1 on an NSLU2 (big
endian ARM) with three USB hard disks connected (two via a hub).

My problem is that I cannot create any volume groups; even physical
volumes cause trouble: After typing

root@platon:/etc# pvcreate /dev/md0

the messages of "pvscan" randomly change without doing anything in
between - sometimes two error messages appear, sometimes there are three
(see attachment 1).

Similar things happen when trying to set up a volume group with

root@platon:/etc# vgcreate -s 64M data /dev/md0
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group "data" successfully created


When scanning for volume groups using "vgscan", error messages change,
but the volume group is never found (see attachment 2).


I set up the device-filter in lvm.conf correctly such that only
md-devices are detected: When increasing the loglevel, it can be seen
that the errors are indeed related to the md-device (see attachment 3).

The weird thing is the fact that errors change from call to call. So
this must be a timing problem (I don't have another explanation for
it)?! However, I could write an ext3-file system to /dev/md0 and mount
it afterwards without any problems.

If anyone could help me, that'd be great!

	Fabian


- -----------------------------------------------------------------------
Attachment 1:

root@platon:/etc# pvscan /dev/md0
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  PV /dev/md0         lvm2 [372.28 GB]
  Total: 1 [372.28 GB] / in use: 0 [0   ] / in no VG: 1 [372.28 GB]
root@platon:/etc# pvscan /dev/md0
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  PV /dev/md0         lvm2 [372.28 GB]
  Total: 1 [372.28 GB] / in use: 0 [0   ] / in no VG: 1 [372.28 GB]

- -----------------------------------------------------------------------
Attachment 2:

root@platon:/etc# vgscan
  Reading all physical volumes.  This may take a while...
  Incorrect metadata area header checksum
root@platon:/etc# vgscan
  Reading all physical volumes.  This may take a while...
  No volume groups found
root@platon:/etc# vgscan
  Reading all physical volumes.  This may take a while...
  Incorrect metadata area header checksum

- -----------------------------------------------------------------------
Attachment 2:

#label/label.c:168       /dev/md0: lvm2 label detected
#device/dev-io.c:484         Closed /dev/md0
#device/dev-io.c:438         Opened /dev/md0 RO O_DIRECT
#device/dev-io.c:134         /dev/md0: block size is 4096 bytes
#format_text/format-text.c:136   Incorrect metadata area header checksum
#format_text/format-text.c:838         <backtrace>
#device/dev-io.c:484         Closed /dev/md0
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFD0MZsbJzYO4mghQIRAhYlAJ0RdWYmBfv0XTP0bJVrItwYwtoGfACfejc9
x0CRv9U3gNtZANXEQXP5yVs=
=Z1NP
-----END PGP SIGNATURE-----
