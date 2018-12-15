Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 918C15D70A
	for <linux-lvm@redhat.com>; Sat, 15 Dec 2018 17:59:57 +0000 (UTC)
Received: from sender-pp-o92.zoho.eu (sender-pp-o92.zoho.eu [31.186.226.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39992C04958C
	for <linux-lvm@redhat.com>; Sat, 15 Dec 2018 17:59:56 +0000 (UTC)
Date: Sat, 15 Dec 2018 18:59:51 +0100
From: Giuseppe Vacanti <giuseppe@vacanti.org>
Message-ID: <167b30557b8.d471a29712958.970233558882873666@vacanti.org>
In-Reply-To: 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] PV not found
Reply-To: giuseppe@vacanti.org,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm <linux-lvm@redhat.com>

Hello,

after a reboot after a maintenance power interruption of a few hours, one of my LVs is not coming back (Ubuntu 18.04). The situation I am at is the following:

- the physical disk is an iSCSI and it is seen by the kernel as /dev/sdc

- lvmdiskscan -v sees the PV on /dev/sdc
  /dev/sdc              [      72.76 TiB] LVM physical volume

- blkid returns the UUID that I can also find in the LVM configuration
 /dev/sdc: UUID="fvUXXf-pVOF-EPnn-c8eg-tZ5S-iMVW-wsSFDy" TYPE="LVM2_member"

- this entry lacks a PARTUUID entry that other LVs on the system have. Is this a clue? I could not quite connect this piece of info with anything.

- pvscan does not report /dev/sdc

- pvdisplay does not seem to know about this PV
  pvdisplay /dev/sdc
  Failed to find physical volume "/dev/sdc"

Reading man pages and searching the web does not really bring me closer to understanding what is happening. This machine has its OS on LVs and those have all come back, and of course it is not the first time that I reboot. Probably I lack the correct terms to describe the problem so that I can find a solution. Anybody here on this list who can point me in the right direction?

Regards, Giuseppe

--
Giuseppe Vacanti
