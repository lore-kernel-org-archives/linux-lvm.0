Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LIHTp09879
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 14:17:29 -0400
Received: from beo.doppingen.nu (1-1-1-36a.gml.gbg.bostream.se [82.182.110.42])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3LIHRFe029040
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 14:17:28 -0400
Date: Wed, 21 Apr 2004 20:17:25 +0200 (CEST)
From: Tomas <tomas@doppingen.nu>
Message-ID: <Pine.LNX.4.43.0404212006390.4766-100000@beo.doppingen.nu>
MIME-Version: 1.0
Subject: [linux-lvm] pvscan takes a lot of time
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all LVM:ers... (Hmm .. almost sound like lamers ;-) )

I have upgraded a Mandrake 9.2 system to Mandrake 10.0 Community. The
lvm1 volumes was imported correctly. When I had the volumes imported and
ready I converted them into lvm2

Now pvscan takes a lot of time. I can't remember if it took a long time
to pvscan before I converted the volumes. At least I know for sure pvscan
ran quite fast on MDK 9.2

Still pvscan takes a long time to complete +1 minute and on my other
systems running lvm1 or lvm2 it takes seconds. Have I done something
wrong?
The /dev/md10 and /dev/md20 are soft mirrors.

Also the summary of GB seem to be wrong.

Output from pvscan -v below

Yes I know. I like partitions or at least liked them. ;-)
I will rebuild this to fewer partitions in the future I am in progress of
doing that for the moment.

pvscan -v
    Wiping cache of LVM-capable devices
    Wiping internal cache
    Walking through all physical volumes

->>> Here it takes a LOT of time

  PV /dev/md10   VG mirr_vg01   lvm2 [18,97 GB / 1,84 GB free]
  PV /dev/md20   VG mirr_vg01   lvm2 [24,00 GB / 4,19 GB free]
  PV /dev/hda5   VG work_vg01   lvm2 [29,25 GB / 0    free]
  PV /dev/hdc5   VG work_vg01   lvm2 [8,50 GB / 2,41 GB free]
  PV /dev/hda6   VG work_vg01   lvm2 [8,06 GB / 0    free]
  PV /dev/hdc7   VG work_vg01   lvm2 [3,44 GB / 0    free]
  PV /dev/hdb2   VG work_vg01   lvm2 [24,00 GB / 0    free]
  PV /dev/hdd7   VG work_vg01   lvm2 [7,97 GB / 4,81 GB free]
  PV /dev/hdd8   VG work_vg01   lvm2 [7,97 GB / 1,19 GB free]
  PV /dev/hdd9   VG work_vg01   lvm2 [1,22 GB / 0    free]
  PV /dev/hda2   VG burn_vg01   lvm2 [29,30 GB / 96,00 MB free]
  PV /dev/hdc2                  lvm2 [24,03 GB]
  PV /dev/hda3                  lvm2 [29,30 GB]
  PV /dev/hdc6                  lvm2 [8,55 GB]
  PV /dev/hdd2                  lvm2 [2,49 GB]
  PV /dev/hdb3                  lvm2 [24,03 GB]
  PV /dev/hdd3                  lvm2 [2,49 GB]
  PV /dev/hdb4                  lvm2 [42,93 GB]
  PV /dev/hdd5                  lvm2 [8,00 GB]
  PV /dev/hdd6                  lvm2 [8,00 GB]
  Total: 20 [164,36 GB] / in use: 11 [14,53 GB] / in no VG: 9 [149,83 GB]

Best regards
/Tomas
