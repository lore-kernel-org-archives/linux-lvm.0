Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1MGAH108476
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 11:10:17 -0500
Received: from smtp802.mail.ukl.yahoo.com (smtp802.mail.ukl.yahoo.com
	[217.12.12.139])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k1MGAEKZ031588
	for <linux-lvm@redhat.com>; Wed, 22 Feb 2006 11:10:15 -0500
Date: Wed, 22 Feb 2006 15:01:04 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Message-ID: <20060222150104.GA17161@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] PV Status NOT available
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

I have used "pvcreate: Logical Volume Manager 1.0.7(mp-v6)" to create a
PV and then added it to an LVM1 VG. A pvdisplay on the old partition
shows this:

--- Physical volume ---
PV Name               /dev/hdg8
VG Name               vg7
PV Size               16.01 GB [33566337 secs] / NOT usable 5.81 MB [LVM: 123 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                9
PE Size (KByte)       32768
Total PE              512
Free PE               0
Allocated PE          512
PV UUID               0AIqms-2VVA-Ced6-Nmz1-KOja-qmjN-XaXhjk

whereas the newly added one looks like this:

--- Physical volume ---
PV Name               /dev/hdg9
VG Name               vg7
PV Size               16.01 GB [33566337 secs] / NOT usable 32.18 MB [LVM: 125 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       32768
Total PE              511
Free PE               511
Allocated PE          0
PV UUID               nI9z7g-oPfz-hSFw-ks0S-abNJ-raMI-dyLP2d

I have two questions:

1) Do I need to worry about the "NOT available"?

2) Why do I have "NOT usable 32.18 MB" on the latter and "NOT usable
5.81 MB" on the former, when they are both exactly the same size
(according to cfdisk) and both have PE size of 32 MB?

I have several versions of Linux running, and all should be able to
access the LVMs.

Regards,

Gunther
