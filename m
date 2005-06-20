Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KEaJu28001
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:36:19 -0400
Received: from hermesnew.ex.ac.uk (dot.ex.ac.uk [144.173.6.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KEaJLR030638
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 10:36:19 -0400
Received: from volt.ex.ac.uk ([144.173.228.65] helo=volt)
	by hermesnew.ex.ac.uk with esmtp (Exim 4.50/mail) id 1DkNNl-0007TI-Rv
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 15:36:13 +0100
Received: from rowe by volt with local (Exim 4.43) id 1DkNLh-0004x9-I3
	for linux-lvm@redhat.com; Mon, 20 Jun 2005 15:34:05 +0100
Subject: Re: [linux-lvm] Is LVM safe?
From: John Rowe <rowe@excc.ex.ac.uk>
In-Reply-To: <d45c7b521930741fc78fef25d061f74b@anderedomain.de>
References: <1119268975.25392.34.camel@volt>
	<200506201517.01268.krienke@uni-koblenz.de>
	<1119275366.25392.48.camel@volt>
	<d45c7b521930741fc78fef25d061f74b@anderedomain.de>
Content-Transfer-Encoding: 7bit
Date: Mon, 20 Jun 2005 15:34:05 +0100
Message-Id: <1119278045.18965.2.camel@volt>
Mime-Version: 1.0
Sender: John Rowe <rowe@excc.ex.ac.uk>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks, this is more or less what I've been trying:

#vgscan --mknodes -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
      /dev/md0: size is 0 sectors
      /dev/hda1: size is 417627 sectors
      /dev/hda1: No label detected
      /dev/hda2: size is 40965750 sectors
      /dev/hda2: No label detected
      /dev/hda3: size is 6136830 sectors
      /dev/hda3: No label detected
      /dev/hda4: size is 265056435 sectors
      /dev/hda4: lvm2 label detected
  /dev/cdrom: open failed: No medium found
    Finding all logical volumes


# vgchange -ay -vv
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Finding all volume groups
      /dev/hda1: No label detected
      /dev/hda2: No label detected
      /dev/hda3: No label detected
      /dev/hda4: lvm2 label detected


But it doesn't seem to find anything!

John
