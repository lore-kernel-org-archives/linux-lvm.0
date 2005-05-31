Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VAxqO23509
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 06:59:52 -0400
Received: from hermesnew.ex.ac.uk (dot.ex.ac.uk [144.173.6.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4VAxq8b009531
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 06:59:52 -0400
Received: from volt.ex.ac.uk ([144.173.228.65] helo=volt)
	by hermesnew.ex.ac.uk with esmtp (Exim 4.50/mail) id 1Dd4TD-0004p8-Jr
	for linux-lvm@redhat.com; Tue, 31 May 2005 11:59:39 +0100
Received: from rowe by volt with local (Exim 4.43) id 1Dd4Sb-0002Gq-Ch
	for linux-lvm@redhat.com; Tue, 31 May 2005 11:59:01 +0100
From: John Rowe <rowe@excc.ex.ac.uk>
Content-Transfer-Encoding: 7bit
Date: Tue, 31 May 2005 11:59:01 +0100
Message-Id: <1117537141.4018.177.camel@volt>
Mime-Version: 1.0
Sender: John Rowe <rowe@excc.ex.ac.uk>
Subject: [linux-lvm] Lost Volume Group!
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

After upgrading a system from RedHat 9 to Scientific Linux 4 (a RedHat
EL clone) the system can no longer see my Volume Group! This isn't a
system partition but a "user" one. Also, if it's relevant it was an
'upgrade' not a new install.

pvscan gives me:
  /dev/cdrom: open failed: No medium found
  PV /dev/hda4         lvm2 [126.39 GB]
  Total: 1 [126.39 GB] / in use: 0 [0   ] / in no VG: 1 [126.39 GB]

/dev/hda4 was the only PV in volume group Volume00.

vgcfgrestore -n Volume00 /dev/hda4 gives:
  /etc/lvm/backup/hda4: stat failed: No such file or directory
  Couldn't read volume group metadata.
  Restore failed.

The file /etc/lvmtab.d/Volume00 exists, is several months old and
contains optimistic strings like: 

/dev/hda4
Volume00
/dev/Volume00/LogVol00

The directory /etc/lvm/ contains three empty subdirectories:

archive  backup  lvm.conf


Surely, if I have the Physical Volume I must be able to access the data?

Thanks in advance.

John
