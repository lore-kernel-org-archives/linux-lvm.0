Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p95FKfGn022932
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 11:20:42 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p95FKamx004477
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 11:20:37 -0400
Received: by iakk32 with SMTP id k32so2701069iak.33
	for <linux-lvm@redhat.com>; Wed, 05 Oct 2011 08:20:36 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 5 Oct 2011 17:20:36 +0200
Message-ID: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Subject: [linux-lvm] initializing a PV, which was part of an old VG
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hello Zdenek,

I am frequently hitting issues when trying to create a new VG on a PV
that had existing VG. (This PV is usually an MD raid0 or raid1
device). I am wondering what is the correct procedure to completely
wipe out any remains of LVM signatures from a PV, and initialize the
PV afresh?

Here is what I do: for each new VG, I use a new GUID as part of its
name, to avoid VG name conflicts.

To try to handle the old VG, the VG creation code first calls
lvm_vg_name_from_device(pv_name). If it founds a VG there and succeeds
to open it, it goes over its LVs, and tries to deactivate them and
then removes them. Finally, the code removes the old VG itself. In
some cases, however, the code fails to open the old VG, so it
proceeds.

Next thing I call pvcreate (fork/exec) to initialize the PV (I always
use --force twice). After this is completed, I do lvm_scan(), because
pvcreate ran in a different context, and I want to refresh the LVM
cache of my process (makes sense?). Finally, I do lvm_vg_create,
lvm_vg_extend, lvm_vg_write.

Sometimes I hit problems like following:

- I want to create a VG named pool_9644BCB5D4704164976DBD85E471EAAA
with a single PV (/dev/md2)
- lvm_vg_name_from_device() returns the name of an old VG:
pool_6A5C57F39FFB4C609D5438D1FCCCDDF0
- lvm_vg_open() fails to open this old VG

- pvcreate(/dev/md2) output:
STDOUT:
 	Physical volume "/dev/md2" successfully created
STDERR:
	Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
	Writing physical volume data to disk "/dev/md2"

After lvm_scan(),lvm_vg_create(pool_9644BCB5D4704164976DBD85E471EAAA),
lvm_vg_extend(), lvm_vg_write(), the syslog shows:

Wiping cache of LVM-capable devices
get_pv_from_vg_by_id: vg_read_internal failed to read VG
pool_74C7247AE06F4B7DAC557D9A1842EEBD
Adding physical volume '/dev/md2' to volume group
'pool_9644BCB5D4704164976DBD85E471EAAA'
Creating directory "/etc/lvm/archive"
Archiving volume group "pool_9644BCB5D4704164976DBD85E471EAAA"
metadata (seqno 0).

While pool_74C7247AE06F4B7DAC557D9A1842EEBD is yet some other old VG.
At this point the VG seems to be created ok. But later, when I try to
create first LV, syslog shows:

Wiping cache of LVM-capable devices
Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
There are 1 physical volumes missing.
Cannot change VG pool_9644BCB5D4704164976DBD85E471EAAA while PVs are missing.
Consider vgreduce --removemissing.

Why does LVM think that my new VG has PVs missing? Probably it thinks
that this PV belongs to another VG? But it looks like LVM agreed to
add the PV to the new VG.
Is there anything else I am missing?

Thanks,
  Alex.
