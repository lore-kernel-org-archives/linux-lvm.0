Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0I1ZZO07099
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2005 20:35:35 -0500
Received: from ramjet.cs.umd.edu (ramjet.cs.umd.edu [128.8.129.57])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0I1ZT5j029189
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2005 20:35:29 -0500
Message-ID: <63588.141.156.32.224.1106012124.squirrel@intranet.cs.umd.edu>
Date: Mon, 17 Jan 2005 20:35:24 -0500 (EST)
From: george@cs.umd.edu
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] couldn't find device with uuid ...
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


Hi,

I have removed a logical volume from VolGroup00, and then added another
physical volume, from another disk, to that same VolGroup00. After reboot,
I can't use VolGroup00 anymore. No matter what I try to do, it says:

Couldn't find device with uuid 'wx....' and VolGroup00 is unusable.

I removed the physical volume that i last added, but i still get:

For example:
> pvscan
Couldn't find device with uuid '.....'
  PV /dev/hda4      VG  VolGroup00   lvm2  [60.28GB/50.31GB free]
  PV unknown device VG  VolGroup00   lvm2  [37.25GB/37.25GB free]
  Total: 2 [97.53GB] / in use: 2 [97.53GB] / in no VG: 0 [0 ]

I might have modified/removed a partition that was part of VolGroup00, but
I am sure it didn't have any data on it. /dev/hda4 was holding all my
data. Is there any chance that I can get VolGroup00 to work again?

I am using:

LVM version:     2.00.25 (2004-09-29)
Library version: 1.00.19 (2004-07-03)
Driver version:  4.1.2

Thank you,

George
