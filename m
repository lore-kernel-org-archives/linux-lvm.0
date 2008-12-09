Message-ID: <493EAC86.6010104@redhat.com>
Date: Tue, 09 Dec 2008 17:36:06 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] shift PV from disk to raid device?
References: <VA.000034ec.0056c987@news.conactive.com>
	<493E48DE.3070705@redhat.com>
	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
> His problem is that sda is one of the mirror of md2.  And he 
> accidentally make sda the PV instead of md2.  So pvmove is only part of
> solution. 

I'd misread that. In that case, there should be no need to copy any 
data. Just re-create the PV on the correct device and restore the VG 
metadata, but this set up sounds a little strange to me - I'm not sure 
how you would get into that situation in the first place since you 
cannot (at least with up-to-date tools) run pvcreate on an MD member:

# mdadm -C /dev/md0 -l1 -n2 /dev/loop{0,1}
mdadm: array /dev/md0 started.
# pvcreate /dev/loop0
   Can't open /dev/loop0 exclusively.  Mounted filesystem?

Afaik, that check has been in there for quite some time. You also can't 
just stop the array and run it on a member or it'll trash the MD superblock:

# pvcreate /dev/loop0
   Wiping software RAID md superblock on /dev/loop0
   Physical volume "/dev/loop0" successfully created

Which will break the array. The only way I could make this happen was by 
creating an array, breaking one member of it (i.e. destroying the 
array), creating a PV on it and then re-creating the array, forcing it 
for the fact that one member already had a valid MD superblock:

# mdadm --run /dev/md0
mdadm: failed to run array /dev/md0: Invalid argument
# mdadm -C /dev/md0 -l1 -n2 /dev/loop{0,1}
mdadm: /dev/loop1 appears to be part of a raid array:
     level=1 devices=2 ctime=Tue Dec  9 11:03:16 2008
Continue creating array? y
mdadm: array /dev/md0 started.

That's quite a lot of forcing/overriding and the system no longer 
recognises the MD member (/dev/loop0 in this case) as an LVM2 PV:

# pvs /dev/loop0
   Failed to read physical volume "/dev/loop0"

I can only get the LVM2 tools to recognise this as a PV at this point by 
manually disabling MD component detection 
(devices/md_component_detection = 0), which has been turned on by 
default since 2.00.13.

At this point, when the array is running I can "see" 3 PVs, but the LVM 
tools chose the MD array and do not complain about duplicates:

# pvs -o+uuid
   PV         VG     Fmt  Attr PSize   PFree   PV UUID 

   /dev/md0          lvm2 --   128.00M 128.00M 
kAa32l-uWS3-8y5b-jXQB-e2tI-xaGy-8akTyc

With the array not running, I do get duplicate warnings for the 2nd side 
of the mirror:

# pvs -o+uuid
   Found duplicate PV kAa32luWS38y5bjXQBe2tIxaGy8akTyc: using /dev/loop1 
not /dev/loop0
   PV         VG     Fmt  Attr PSize   PFree   PV UUID 

   /dev/loop1        lvm2 --   128.00M 128.00M 
kAa32l-uWS3-8y5b-jXQB-e2tI-xaGy-8akTyc

The OP didn't mention the versions of the tools in use, so I'm not sure 
what to conclude here. It seems a little odd that he's been able to get 
into such a position.

> Here are the steps that I see:
> 
> 1) remove sda from md2 array
> 2) use dd or pvremove to clear PV info in md2.  This should not
>    affect sda since sda is removed from md2

But the LVM tools still think that md2 is part of the VG and the same PV 
UUID is going to be visible on both members of the array and the MD device..

> 3) pvcreate md2 as a new PV and add to volume group

In my testing, md2 would already be a PV at this point - if it really 
does contain the same data as sda3/sdb3 then it should show up as a PV 
already.

> 4) pvmove sda -> md2.  The data should physically go on sdb, or whatever the
>    other mirror of md2 is.

It seems a bit pointless moving data around if it's already there.

> 5) check that all LVs are gone from sda, and remove from volume group
> 6) pvremove sda
> 7) add sda to md2 array, and synchronize.
> Did I miss anything?

I'd have thought that you could just take a metadata backup 
(vgcfgbackup), wipe the labels from all devices and then run:

   pvcreate --uuid=$the_uuid --restorefile=/path/to/backup /dev/md2
   vgcfgrestore -f /path/to/backup $vgname

And avoid the need to shovel lots of data around.

This works for me, but I'm not completely convinced that I've re-created 
the same situation the original poster was seeing - I had to play a lot 
of tricks with the tools just to get into that state in the first place.

Regards,
Bryn.
