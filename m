Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p968ljct007147
	for <linux-lvm@redhat.com>; Thu, 6 Oct 2011 04:47:45 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p968leoX018862
	for <linux-lvm@redhat.com>; Thu, 6 Oct 2011 04:47:40 -0400
Received: by iakk32 with SMTP id k32so4000538iak.33
	for <linux-lvm@redhat.com>; Thu, 06 Oct 2011 01:47:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E8CB045.7090103@gmail.com>
References: <CAGRgLy4AHJV9yFncX--aoSXbNg40LMJHtCqwMk=Y-L5RPe_dcQ@mail.gmail.com>
	<4E8CB045.7090103@gmail.com>
Date: Thu, 6 Oct 2011 10:47:39 +0200
Message-ID: <CAGRgLy6czUA01Pn8BUVh5QdLp+0HNRChcNyvAjDVCW73jJdnoA@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek,

yes, I only had a single PV, and I did pvcreate on it, and then
lvm_scan() from my process.

So you suggest to use first pvremove and then pvcreate? Because
pvcreate I do in any case. So pvcreate alone is not similar to
pvremove followed by pvcreate?

If I use -ff, does it do things differently, than if I would call
pvremove/pvcreate without -ff? Should I do first without -ff and use
-ff only if the former fails?

Thanks,
  Alex.


On Wed, Oct 5, 2011 at 9:30 PM, Zdenek Kabelac <zdenek.kabelac@gmail.com> wrote:
> Dne 5.10.2011 17:20, Alexander Lyakas napsal(a):
>>
>> Hello Zdenek,
>>
>> I am frequently hitting issues when trying to create a new VG on a PV
>> that had existing VG. (This PV is usually an MD raid0 or raid1
>> device). I am wondering what is the correct procedure to completely
>> wipe out any remains of LVM signatures from a PV, and initialize the
>> PV afresh?
>>
>
> util-linux comes with �wipefs �- to wipe fs & raid signatures
> pvremove should wipe label of LVM device - so it should not be recognized as
> PV.
>
> You may try to use blkid to see how is the device recognized.
>
>> Here is what I do: for each new VG, I use a new GUID as part of its
>> name, to avoid VG name conflicts.
>>
>> To try to handle the old VG, the VG creation code first calls
>> lvm_vg_name_from_device(pv_name). If it founds a VG there and succeeds
>> to open it, it goes over its LVs, and tries to deactivate them and
>> then removes them. Finally, the code removes the old VG itself. In
>> some cases, however, the code fails to open the old VG, so it
>> proceeds.
>>
>
> removal of VG doesn't wipe PV headers
>
>
>> Next thing I call pvcreate (fork/exec) to initialize the PV (I always
>> use --force twice). After this is completed, I do lvm_scan(), because
>
> Using -ff is probably a problem here - it's supposed to only used in case
> you really need it - it's not a 'nice' option.
>
> So first �vgremove �the VG which occupies your PVs - then pvremove should
> work
> without -ff.
>
>
>> - pvcreate(/dev/md2) output:
>> STDOUT:
>> � � � �Physical volume "/dev/md2" successfully created
>> STDERR:
>> � � � �Couldn't find device with uuid
>> NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
>> � � � �Writing physical volume data to disk "/dev/md2"
>>
>> After lvm_scan(),lvm_vg_create(pool_9644BCB5D4704164976DBD85E471EAAA),
>> lvm_vg_extend(), lvm_vg_write(), the syslog shows:
>>
>> Wiping cache of LVM-capable devices
>> get_pv_from_vg_by_id: vg_read_internal failed to read VG
>> pool_74C7247AE06F4B7DAC557D9A1842EEBD
>> Adding physical volume '/dev/md2' to volume group
>> 'pool_9644BCB5D4704164976DBD85E471EAAA'
>> Creating directory "/etc/lvm/archive"
>> Archiving volume group "pool_9644BCB5D4704164976DBD85E471EAAA"
>> metadata (seqno 0).
>>
>> While pool_74C7247AE06F4B7DAC557D9A1842EEBD is yet some other old VG.
>> At this point the VG seems to be created ok. But later, when I try to
>> create first LV, syslog shows:
>>
>> Wiping cache of LVM-capable devices
>> Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
>> Couldn't find device with uuid NCtRLE-1ffs-GLaH-MYNS-d1hk-ikAt-7dbhm0.
>> There are 1 physical volumes missing.
>> Cannot change VG pool_9644BCB5D4704164976DBD85E471EAAA while PVs are
>> missing.
>> Consider vgreduce --removemissing.
>
> Have you pvremove-d all PV devices ?
>
> Zdenek
>
