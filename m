Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103190633.f2J6XxU01283@webber.adilger.int>
Subject: Re: [linux-lvm] Recovering PV's VG metadata
In-Reply-To: <3AB49365.2020606@inetnow.net> from HopNet at "Mar 18, 2001 07:52:21
 pm"
Date: Sun, 18 Mar 2001 23:33:59 -0700 (MST)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

"Hopnet" writes:
>  OS disk got trashed & system wasn't bootable.
>  Reinstalled OS.  I think at this point, LILO, thinking hda was the
>boot drive, overwrote some of the VG data.
>  no LVMtab or conf files to vgcfgrestore from. :-(
>
>Now:
>  pvdata sees partial data on hda, and everything on hdc
>
>What I'm looking for:
>  Is there anyway to take common data from hdc and write it back to
>hda.  What tools are available for sector editing (LVM or general)?
>
>zeus:~ # pvdata -a /dev/hda
>--- Physical volume ---
>PV Name
>VG Name
>ΦR
>PV Size               12.14 GB / NOT usable 3.21 MB [LVM: 16.09 MB]
>PV#                   0
>PV Status             NOT available
>Allocatable           yes (but full)
>Cur LV                1
>PE Size (KByte)       4096
>Total PE              3106
>Free PE               0
>Allocated PE          3106
>
>Segmentation fault
>zeus:~ # pvdata -N -P /dev/hdc
>--- Physical volume ---
>PV Name               /dev/hdc
>VG Name               vg00
>PV Size               12.14 GB / NOT usable 3.24 MB [LVM: 242 KB]
>PV#                   2
>PV Status             available
>Allocatable           yes (but full)
>Cur LV                1
>PE Size (KByte)       4096
>Total PE              3106
>Free PE               0
>Allocated PE          3106

"pvdata -PP" will show you "pe_on_disk.base" and "pe_on_disk.size", e.g.

# pvdata -PP
...
pe_on_disk.base          184320
pe_on_disk.size          6385664

add numbers "(184320 + 6385664) / 1024 = 6416 kB".  This is the start
of the on-disk data for your LV, and if valid it should be < 1 PE in
size, normally 4MB (my system has 16MB PE size).  You could use "dd"
to back up from disk, for example:

dd if=/dev/hda bs=1k of=/dev/tape skip=6416
dd if=/dev/hdc bs=1k of=/dev/tape skip=6416

YOU SHOULD DO THIS BEFORE YOU DO ANYTHING ELSE, SO YOUR DATA IS SAFE.

If you have a disk or LV that is > 24GB in size, you could even dump the
whole LV into this backup disk, using:

dd if=/dev/hda bs=1k of=/dev/vgbackup/lvbackup skip=6416
dd if=/dev/hdc bs=1k of=/dev/vgbackup/lvbackup skip=6416 seek=(hda size)

The seek in the second "dd" will be the number of blocks written from the
first "dd" step.


You have two things you can try:

If it is LILO that wrote to the disk, it may only be the first 512 bytes
boot sector.  This would only overwrite the PV data on the disk, and not
any of the VG/LV info.  If your disks are both the same, you _could_ try:

dd if=/dev/hdc of=/dev/hda bs=512 count=1

which will copy the PV info over to /dev/hda, but it will be slightly wrong.
You then would need to fix the pv_number to be 0x00000001 (at byte offset
0x1b0), and the pv_uuid, 32 bytes at byte offset 2C.  You should be able
to get the correct UUID with:

pvdata -PU /dev/hdc

to list UUID of /dev/hdc, and UUID of both disks.  To write the correct
data to /dev/hda, you should be able to do this with (I'm assuming there
is "0x00000001" at offset 436, but you can use "od" to find this somewhere
else on the disk):

dd if=/dev/hdc of=/dev/hda bs=1 skip=436 seek=432 count=4
dd if=/dev/hdc of=/dev/hda bs=1 skip=<pv_uuidlist_on_disk.base> seek=44 count=32

This should allow you to use the disks as before.  If not, you can try the
second method, which is to create totally new PV/VG/LV data on the disk,
and then hope that it all works.  It will only work correctly if the first
PV was totally full before the second one was started, otherwise it is NOT
going to work.  IF IT DOESN'T WORK, IT WILL TOTALLY RUIN YOUR LVM CONFIG!!!

dd if=/dev/zero of=/dev/hda bs=1k count=1
dd if=/dev/zero of=/dev/hdc bs=1k count=1

pvcreate /dev/hda /dev/hdc
vgcreate  vgrecover /dev/hda /dev/hdc
lvcreate -n lvrecover -l 6212 vgrecover

You may then be able to mount /dev/vgrecover/lvrecover and access your
data.  If not, there is nothing else easy to do.  Try working with the
data you copied in step 1 above.

Cheers, Andreas

PS - Again and again, people have problems with LVM, and they HAVE NO BACKUP.
     Why, oh why, do people not make backups of their data?  It may be LVM
     that is causing some problems (obviously this is the list to report
     them), but your disk may also fail, you may run "rm -r" in the wrong
     place, you may get a lightening strike near your house, your house
     burns down, etc.  PEOPLE SHOULD MAKE BACKUPS!!!  Give a copy to your
     friend some time (especially one that doesn't know anything about
     Linux), so that they are safe in case of a house fire/flood/etc.  It
     WILL happen to YOU sooner or later, don't kid yourself.
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
