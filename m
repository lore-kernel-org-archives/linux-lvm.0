Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p95JUZ2M001337
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:30:35 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p95JUT9E019747
	for <linux-lvm@redhat.com>; Wed, 5 Oct 2011 15:30:30 -0400
Received: by wyg34 with SMTP id 34so2901974wyg.33
	for <linux-lvm@redhat.com>; Wed, 05 Oct 2011 12:30:29 -0700 (PDT)
Message-ID: <4E8CB045.7090103@gmail.com>
Date: Wed, 05 Oct 2011 21:30:13 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
In-Reply-To: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] initializing a PV, which was part of an old VG
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
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 5.10.2011 17:20, Alexander Lyakas napsal(a):
> Hello Zdenek,
>
> I am frequently hitting issues when trying to create a new VG on a PV
> that had existing VG. (This PV is usually an MD raid0 or raid1
> device). I am wondering what is the correct procedure to completely
> wipe out any remains of LVM signatures from a PV, and initialize the
> PV afresh?
>

util-linux comes with  wipefs  - to wipe fs & raid signatures
pvremove should wipe label of LVM device - so it should not be recognized as PV.

You may try to use blkid to see how is the device recognized.

> Here is what I do: for each new VG, I use a new GUID as part of its
> name, to avoid VG name conflicts.
>
> To try to handle the old VG, the VG creation code first calls
> lvm_vg_name_from_device(pv_name). If it founds a VG there and succeeds
> to open it, it goes over its LVs, and tries to deactivate them and
> then removes them. Finally, the code removes the old VG itself. In
> some cases, however, the code fails to open the old VG, so it
> proceeds.
>

removal of VG doesn't wipe PV headers


> Next thing I call pvcreate (fork/exec) to initialize the PV (I always
> use --force twice). After this is completed, I do lvm_scan(), because

Using -ff is probably a problem here - it's supposed to only used in case you 
really need it - it's not a 'nice' option.

So first  vgremove  the VG which occupies your PVs - then pvremove should work
without -ff.


> - pvcreate(/dev/md2) output:
> STDOUT:
>   	Physical volume "/dev/md2" successfully created
> STDERR:
> 	Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
> 	Writing physical volume data to disk "/dev/md2"
>
> After lvm_scan(),lvm_vg_create(pool_9644BCB5D4704164976DBD85E471EAAA),
> lvm_vg_extend(), lvm_vg_write(), the syslog shows:
>
> Wiping cache of LVM-capable devices
> get_pv_from_vg_by_id: vg_read_internal failed to read VG
> pool_74C7247AE06F4B7DAC557D9A1842EEBD
> Adding physical volume '/dev/md2' to volume group
> 'pool_9644BCB5D4704164976DBD85E471EAAA'
> Creating directory "/etc/lvm/archive"
> Archiving volume group "pool_9644BCB5D4704164976DBD85E471EAAA"
> metadata (seqno 0).
>
> While pool_74C7247AE06F4B7DAC557D9A1842EEBD is yet some other old VG.
> At this point the VG seems to be created ok. But later, when I try to
> create first LV, syslog shows:
>
> Wiping cache of LVM-capable devices
> Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
> Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
> There are 1 physical volumes missing.
> Cannot change VG pool_9644BCB5D4704164976DBD85E471EAAA while PVs are missing.
> Consider vgreduce --removemissing.

Have you pvremove-d all PV devices ?

Zdenek
