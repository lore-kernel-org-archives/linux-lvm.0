Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k19K6d129484
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 15:06:39 -0500
Received: from io.iol.unh.edu (io.iol.unh.edu [132.177.123.82])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k19K6MuA031589
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 15:06:22 -0500
Received: from kraken (d122130.iol.unh.edu [132.177.122.130])
	by io.iol.unh.edu (8.13.4/8.13.4) with SMTP id k19K6Ej9022187
	for <linux-lvm@redhat.com>; Thu, 9 Feb 2006 15:06:14 -0500
From: "Matthew Plante" <maplante@iol.unh.edu>
Subject: RE: [linux-lvm] removing bad PVs
Date: Thu, 9 Feb 2006 15:06:14 -0500
Message-ID: <NNEEKMEDALGMPDKHFPJHOEKPDHAA.maplante@iol.unh.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <NNEEKMEDALGMPDKHFPJHAEENDHAA.maplante@iol.unh.edu>
Reply-To: maplante@iol.unh.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

actually, nevermind, I figured it out :-)

-- Matt

+--
|Matthew Plante
| University of New Hampshire
| InterOperability Lab
| Research & Development
| SMTP: maplante@iol.unh.edu
| Phone: +1-603-862-0203
+-


-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of Matthew Plante
Sent: Wednesday, January 25, 2006 10:33 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] removing bad PVs



I had created an LVM with 3 iscsi drives.  One of the target machines died,
which had 2 of the targets in it.  So my lvm now says it has 2 bad devices,
makes sense:

vgscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
  Found volume group "iol_vg" using metadata type lvm2

pvscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
  PV /dev/sda         VG iol_vg   lvm2 [6.24 GB / 0    free]
  PV unknown device   VG iol_vg   lvm2 [4.16 GB / 0    free]
  PV unknown device   VG iol_vg   lvm2 [1.19 GB / 0    free]
  Total: 3 [11.60 GB] / in use: 3 [11.60 GB] / in no VG: 0 [0   ]

So ofcourse I'd like to remove these bad PVs.  From what I've found, you
need to do this with the vgreduce command:

vgreduce --removemissing -v iol_vg
    Finding volume group "iol_vg"
    Wiping cache of LVM-capable devices
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find all physical volumes for volume group iol_vg.
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find all physical volumes for volume group iol_vg.
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
    Archiving volume group "iol_vg" metadata.
    iol_vg/iol_lv has missing extents: removing (including dependencies)
    Deactivating (if active) logical volume iol_lv
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
    Found volume group "iol_vg"
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
    Found volume group "iol_vg"
    Removing LV iol_lv from VG iol_vg
    iol_vg/iol_lv has missing extents: removing (including dependencies)
    Deactivating (if active) logical volume iol_lv
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
    Found volume group "iol_vg"
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
    Found volume group "iol_vg"
    Removing LV iol_lv from VG iol_vg

However, it doesn't seem to actually remove them!

vgscan -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid 'u1KC7q-D8Bi-qGKp-DJgW-kQ8f-NtB6-GLNuzX'.
  Couldn't find device with uuid 'YPyDqn-HD9z-2TDc-ZNXP-d4z9-BLtV-BdM0eh'.
  Found volume group "iol_vg" using metadata type lvm2

Any idea what's going on here?  I'm out of ideas.

Thanks,

-- Matt

+--
|Matthew Plante
| University of New Hampshire
| InterOperability Lab
| Research & Development
| SMTP: maplante@iol.unh.edu
| Phone: +1-603-862-0203
+-

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
