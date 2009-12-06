Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB6ImB6c001126
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 13:48:12 -0500
Received: from mail-pw0-f52.google.com (mail-pw0-f52.google.com
	[209.85.160.52])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB6Ilu6E022036
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 13:47:56 -0500
Received: by pwi8 with SMTP id 8so2656598pwi.11
	for <linux-lvm@redhat.com>; Sun, 06 Dec 2009 10:47:55 -0800 (PST)
MIME-Version: 1.0
Date: Sun, 6 Dec 2009 19:47:55 +0100
Message-ID: <691e2b620912061047i13bd740eq947dc2a67086e439@mail.gmail.com>
From: Johan Gardell <gardin@gmail.com>
Subject: [linux-lvm] Problems with dissapearing PV when mounting
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

Hi all!

I am having some troubles with mounting a vg consisting of two PVs.
After booting, the partition /dev/sdb5 does not pop up (but 1-3 does
and 4th is a swap). If i issue partprobe -s it does show up though.

partprobe shows:

/dev/sda: msdos partitions 1 2 3
/dev/sdb: msdos partitions 1 2 <5>
/dev/sdc: msdos partitions 1 3 2

I don't know what <> means but that is one of the PVs

If i, after issuing partprobe, use pvscan it shows:
  PV /dev/sdc2   VG Dreamhack   lvm2 [1,23 TiB / 0    free]
  PV /dev/sdb5   VG gardin      lvm2 [465,52 GiB / 0    free]
  PV /dev/sdd    VG gardin      lvm2 [465,76 GiB / 704,00 MiB free]
  Total: 3 [2,14 TiB] / in use: 3 [2,14 TiB] / in no VG: 0 [0   ]

vgscan:
  Reading all physical volumes.  This may take a while...
  Found volume group "Dreamhack" using metadata type lvm2
  Found volume group "gardin" using metadata type lvm2

But the problems appear when:
vgchange -ay gardin
  device-mapper: reload ioctl failed: Invalid argument
  device-mapper: reload ioctl failed: Invalid argument
  2 logical volume(s) in volume group "gardin" now active

Where dmesg shows:
[31936.135588] device-mapper: table: 254:1: linear: dm-linear: Device
lookup failed
[31936.135592] device-mapper: ioctl: error adding target to table
[31936.150572] device-mapper: table: 254:2: linear: dm-linear: Device
lookup failed
[31936.150576] device-mapper: ioctl: error adding target to table
[31940.024525] end_request: I/O error, dev fd0, sector 0

And trying to mount the vg:
mount /dev/mapper/gardin-root /mnt/tmp
  mount: you must specify the filesystem type

I have googled some but can't find much about this issue, does anyone
have any ideas how i can obtain the data stored on the disk? Because i
really need it..

I am running debian squeeze with a 2.6.30-2-686 kernel, the partitions
were originally created under debian lenny (don't know the kernel
version back then though)

lvm version shows:
  LVM version:     2.02.54(1) (2009-10-26)
  Library version: 1.02.39 (2009-10-26)
  Driver version:  4.14.0

Thanks in regards
//Johan
