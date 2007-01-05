Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l05E7DdK007477
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 09:07:14 -0500
Received: from smtp23.kolumbus.fi (smtp23.kolumbus.fi [193.229.0.81])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l05E7CLM017225
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 09:07:13 -0500
Received: from SECN002.acc.master.epnet (sec002.acc.master.epnet
	[172.21.169.114])
	by smtp23.kolumbus.fi (8.13.6/8.13.6) with ESMTP id l05E78K9008876
	for <linux-lvm@redhat.com>; Fri, 5 Jan 2007 16:07:08 +0200 (EET)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Fri, 5 Jan 2007 16:07:00 +0200
Message-ID: <1A25D4A40AE65D4E83D73E457DFB24EA847256@SEMB001.acc.master.epnet>
From: "Sulko Ville" <Ville.Sulko@elisa.fi>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM1 pvmove fails to move PE with read errors
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

I have an old linux server running RH9. The system
has two scsi disks, one of which shows scsi-errors
for a few sectors.

I mapped these disk sectors to one PE, number 00097
on PV sda2 (LE 00097 on vg00/lvol02). I tried to
move this LE to different PV (sdb1), using command:

pvmove -v -i -n lvol02:97 /dev/sda2 /dev/sdb1

However, moving fails with the following errors:

...
pvmove -- /dev/sda2 [PE 97 [lvol02 [LE 97]] -> /dev/sdb1 [PE 1946] [1/1]
/dev/Volume00/group::/dev/Volume00/lvol02: 0802 803200, 0811 15950208
pvmove -- ERROR "Input/output error" copying extent from "/dev/sda2"
pvmove -- ERROR "Input/output error" moving physical extents

and as a result LE was not moved. I would expect this to
work as I used the -i -option (--ignore_read_errors).
pvmove result code is 23 (error moving physical extent(s)).

Moving the PE to working disk would allow me to run fsck
and repair the filesystem. Of course some of the data
would be corrupt, because of the read errors. Well, this
is irrelevant, the point is, that -i -option seems not to
work.

I know this is old LVM1 version, with little or no
maintenance. Kernel and LVM utility versions are as
follows:

kernel-2.4.20-46.9.legacy
lvm-1.0.3-12.1.legacy

Example SCSI error:

scsi0: ERROR on channel 0, id 0, lun 0, CDB: Read (10) 00 00 0f 8d 8b 00 03 c2 00
Info fld=0xf8d8b, Current sd08:02: sense key Medium Error
Additional sense indicates Data synchronization mark error
 I/O error: dev 08:02, sector 810430

BR,
Ville
