Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v070mYU7006151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Fri, 6 Jan 2017 19:48:34 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 280A983F44
	for <linux-lvm@redhat.com>; Sat,  7 Jan 2017 00:48:33 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id B509421909
	for <linux-lvm@redhat.com>; Sat,  7 Jan 2017 01:48:30 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 07 Jan 2017 00:48:30 +0000
From: Xen <list@xenhideout.nl>
Message-ID: <b08533d31b541af265bd284c4dfbad2b@xenhideout.nl>
Subject: [linux-lvm] inner VG inside chroot not visible inside chroot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Linux lvm <linux-lvm@redhat.com>

So I had this script that would check the chain of PVs used for some LV 
if used in an embedded VG.

Meaning an outer PV contains a VG contains a LV that is the PV to 
another VG.

This script fails to work currently inside a chroot.

The reason is that not all VGs and LVs are visible inside the chroot. 
Most importantly currently the PV is not visible.

I have bind mounted /sys/, /proc/, /dev/, and /run/.

Outside of the chroot, this is visible:

   msata-pv coll2 -wi-ao----  28.91g
   raid-pv  coll2 -wi-ao---- 464.36g
   boot     msata rwi-aor-p- 240.00m
   root     msata rwi-aor-p-  14.67g

The chroot is to a mount of /dev/msata/root.

Inside the chroot, to the /mnt of /dev/msata/root,

everything is now visible as well but only because lvmetad works because 
I bind mounted /run.

vgdisplay -v   inside the chroot gives:

   --- Physical volumes ---
   PV Name               unknown device
   PV UUID               aCDiCd-EWYT-eKmE-gMST-KpXG-EJA5-0FWy8Z
   PV Status             allocatable
   Total PE / Free PE    7399 / 3582

vgdisplay -v   outside the chroot gives:

   PV Name               /dev/coll2/msata-pv
   PV UUID               aCDiCd-EWYT-eKmE-gMST-KpXG-EJA5-0FWy8Z
   PV Status             allocatable
   Total PE / Free PE    7399 / 3582

If I remove the bind mount for /run, I get

   msata-pv coll2 -wi-ao----  28.91g
   raid-pv  coll2 -wi-ao---- 464.36g

But not the 2 msata volumes, that are both mounted inside the chroot 
(/mnt and /mnt/boot).

The volumes are fully functional though. LVM just doesn't show me their 
devices. Is this to be expected?

I was using the standard LVM tools to obtain this PV. It would be 
possible to use only dmsetup etc. for it,
for example using dmsetup deps /dev/msata/root, to obtaining the name 
with dmsetup info to see whether it is
conforming to an LVM mapping, but rather hard/impossible to see if it is 
an actual regular LV this way?

Actually the split-name function... does not provide that much help for 
that :p.

Particularly in this way it is not possible to see if something is a 
"hidden" LV (such as a meta or image) or actually a regular LV that's 
being referred to. I really wanted to say PV, but from the perspective 
of the script you're really just looking for regular LVs.

The moment you encounter a non-major-252, I'm no longer interested :p.

But in any case:


Why does it not show the mounted LV in the "lvs" table and why does it 
not show the PV that IS visible in the "lvs" table in the output of 
"vgdisplay -v" ?

So, why is that PV set to "unknown device"? And with /run not 
bind-mounted, pvscan will not see the msata volume group at all!

   PV /dev/sdb4            VG coll2           lvm2 [493.26 GiB / 0    
free]
   PV /dev/coll2/raid-pv   VG raid            lvm2 [464.35 GiB / 8.00 GiB 
free]

---> should also show /dev/coll2/msata-pv.

Maybe this gets a little too complicated,

but the msata volume group that is mounted into the chroot, is not 
actually visible inside the chroot, while everything else is.

Regards, Xen.
