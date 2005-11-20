Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAKFmCV14994
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 10:48:12 -0500
Received: from oxtel.com ([195.219.3.158])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAKFm5ix013717
	for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 10:48:05 -0500
Received: from 192.168.14.7 by oxtel.com ([10.96.1.33] running VPOP3) with
	ESMTP for <linux-lvm@redhat.com>; Sun, 20 Nov 2005 15:14:05 -0000
Message-ID: <438093CE.7010603@oxtel.com>
Date: Sun, 20 Nov 2005 15:18:38 +0000
From: Tom Robinson <tom.robinson@oxtel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Rescue from non-striped drives
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
To: linux-lvm@redhat.com


Hi,

Me again - I've got a bit futher with my rescue, To recap I have8 PVs, 1 
died.
the remaining 7 are non-striped and the mapping table for them is intact,
but the mapping for the dead one isnt.

Please read this email through if you have time, Im offering a
small reward of $100 or 60sterling to 1 person who solves it.

I managed to get the uuid for the dead PV with:
cat /dev/hdb | hexdump -C | more
!!!
(where hdb is a working lvm1 PV - well it worked!!)

so i put a NEW drive in the place of the dead one, and did:
pvcreate --uuid "Ok0B2q-d4EZ-qFM0-k71G-CUOx-3Kkl-SUBrMe" --restorefile 
/etc/lvm/archive/vg1_s.vg /dev/hdd

Note that i created vg1_s.vg by replacing the "missing" drives in the 
drive map with "pv7", and adding a pv7 section to the config, as it used 
to be before the drive crash:

        pv7 {
                       id = "Ok0B2q-d4EZ-qFM0-k71G-CUOx-3Kkl-SUBrMe"
                       device = "/dev/hdd"     # Hint only

                       status = ["ALLOCATABLE"]
                       pe_start = 65920
                       pe_count = 1000 #7479 # 233.719 Gigabytes
               }

Anyway, now the drive has the same uuid as the dead one used to, but it 
is not listed as belonging to the volume group.
Where is the info stating which drives belong to which volume groups so 
i can hack it up?
Here pvscan lists the drives inc the new one at the bottom, but doesnt 
have the volume group:

vaus root # pvscan
 7 PV(s) found for VG vg1: expected 8
 Logical volume (lv1) contains an incomplete mapping table.
 PV /dev/hda     VG vg1   lvm1 [233.72 GB / 0    free]
 PV /dev/hdc     VG vg1   lvm1 [233.72 GB / 0    free]
 PV /dev/cdrom   VG vg1   lvm1 [152.62 GB / 0    free]
 PV /dev/hde4    VG vg1   lvm1 [109.56 GB / 0    free]
 PV /dev/hdb     VG vg1   lvm1 [233.72 GB / 0    free]
 PV /dev/hdf     VG vg1   lvm1 [114.44 GB / 0    free]
 PV /dev/hdh     VG vg1   lvm1 [233.72 GB / 0    free]
 PV /dev/hdd              lvm1 [37.27 GB]
 Total: 8 [1.32 TB] / in use: 7 [1.28 TB] / in no VG: 1 [37.27 GB]

Another example:

--- Physical volume ---
 PV Name               /dev/hdh
 VG Name               vg1
 PV Size               233.76 GB / not usable 44.44 MB
 Allocatable           yes (but full)
 PE Size (KByte)       32768
 Total PE              7479
 Free PE               0
 Allocated PE          7479
 PV UUID               lHJQbC-9wQv-ZAC9-w95D-dlE9-ITa7-QK6KrN

 --- NEW Physical volume ---
 PV Name               /dev/hdd
 VG Name
 PV Size               37.27 GB
 Allocatable           NO
 PE Size (KByte)       0
 Total PE              0
 Free PE               0
 Allocated PE          0
 PV UUID               Ok0B2q-d4EZ-qFM0-k71G-CUOx-3Kkl-SUBrMe

I have one further question before I give up, The mapping tables are 
complete for the other drives,  eg:

                      segment1 {
                               start_extent = 0
                               extent_count = 4884     # 152.625 Gigabytes

                               type = "striped"
                               stripe_count = 1        # linear

                               stripes = [
                                       "pv2", 0
                               ]
                       }
                       segment2 {
                               start_extent = 4884
                               extent_count = 3662     # 114.438 Gigabytes

                               type = "striped"
                               stripe_count = 1        # linear

                               stripes = [
                                       "pv5", 0
                               ]
                       }

There are two of them there for example that are complete single stripes 
of ext2...
Is there any way of getting any of this back, as somewhere under this 
LVM is a linear bit of ext2.

its only when it gets to pv7 (the dead one) that there are loads and 
loads of 32meg stripes.

As a final word - im sorry to bother everyone with this and this will be 
my final post,
But if anyone can get me information that will lead to the rescue of 
this stuff,
I will happily deposit $100 or 60sterling reward in your paypal account 
- you have my word.
(only one person though - I cant afford to give that to everyone !)

If any more information is required, or command outputs, please just let 
me know.
I'll answer any email as quick as I can.

Thanks and kind regards,
  Tom Robinson
