Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0LJJ5gS029733
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 14:19:05 -0500
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0LJImeB021020
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 14:18:49 -0500
Received: by ey-out-2122.google.com with SMTP id 4so424747eyf.39
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 11:18:48 -0800 (PST)
Message-ID: <4977751D.3000906@gmail.com>
Date: Wed, 21 Jan 2009 12:18:53 -0700
From: Colin Faber <cfaber@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Having problems recovering LV
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

So I managed to recover my raid, now I have what I think is a complete 
md0 and md1. However when I pvscan I get different results depending on 
whether md0 is online or not.

Here is an example of what I'm referring to:

# pvscan
  Warning: Volume Group raid is not consistent
  PV /dev/md0   VG raid   lvm2 [1.82 TB / 1.82 TB free]
  Total: 1 [1.82 TB] / in use: 1 [1.82 TB] / in no VG: 0 [0   ]

that is what I get when I have md0 and m1 enabled. However if I disable md0:

# mdadm -S /dev/md0
 mdadm: stopped /dev/md0

# pvscan
  Couldn't find device with uuid 'oI1oXp-NOSk-BJn0-ncEN-HaZr-NwSn-P9De9b'.
  Couldn't find device with uuid 'oI1oXp-NOSk-BJn0-ncEN-HaZr-NwSn-P9De9b'.
  PV unknown device   VG raid   lvm2 [1.82 TB / 0    free]
  PV /dev/md1         VG raid   lvm2 [1.36 TB / 0    free]
  Total: 2 [3.18 TB] / in use: 2 [3.18 TB] / in no VG: 0 [0   ]


So that said md0 exists (temporarily ) across 3 USB mass storage 
devices. After the initial rebuild I suspected that the device order was 
mixed up (yeay for random USB device assignments). I verified that this 
was in fact the case with the first and last 64k of the array containing 
no PV label and the middle one containing the label. I've since 
corrected it so the disks are (should be) in the right order again.

So I guess what I'm asking is what I should do next here, my experience 
with LVM is limited.  Am I hosed here? Is my data recoverable?

-cf
