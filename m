Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0NIDtCj026825
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:13:55 -0500
Received: from ik-out-1112.google.com (ik-out-1112.google.com [66.249.90.178])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0NIDhZI012976
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 13:13:43 -0500
Received: by ik-out-1112.google.com with SMTP id c21so579895ika.3
	for <linux-lvm@redhat.com>; Fri, 23 Jan 2009 10:13:43 -0800 (PST)
Message-ID: <497A08E8.7060303@gmail.com>
Date: Fri, 23 Jan 2009 11:14:00 -0700
From: Colin Faber <cfaber@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Having problems recovering LV
Content-Transfer-Encoding: 7bit
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

Hi,

Re-sending because I'm not sure this ever made it out to the list. 
Hoping someone can give me some advise here.

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
corrected it so the disks are (should be) in the right order again. So I 
guess what I'm asking is what I should do next here, my experience with 
LVM is limited. Am I hosed here? Is my data recoverable?

-cf
