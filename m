From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <12282.1051622076.1@basilica.la.naos.co.nz>
Message-Id: <20030429131436.E2443AE4F5@basilica.la.naos.co.nz>
Subject: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
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
Date: Tue Apr 29 08:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

NOTE: This is a rather long message.  I detail why this happens, and what I 
      think should be done about it (see end of message for suggestions).
      If I could find a bug tracking system I'd report this as a bug;
      but I can't see one linked off the LVM website.

On 14 January 2003 Thomas Gebhardt wrote:
>just installed a 2.4.20 Linux box (Debian woody) with a Promise
>FastTrak 100TX2 ATA Raid (2 mirrored disk). I used lvm (1.0.4)
>to create Physical Volumes on /dev/ataraid/d0px (x=1,2), configured
>a volume group, logical volumes and installed some software.
>Everything seems to work fine. But after a reboot I noticed that lvm
>used to write to the raw disk partitions (/dev/hdex (x=1,2)) that
>constituted one of the mirrors of the ATA Raid /dev/ataraid/d0px.
>(vgdisplay, lvdisplay ... displayed /dev/hdex rather than /dev/ataraid/..)
>Obviously vgscan had dedected the lvm signature on the raw disk partititions.

I've just done basically the same thing (Debian Woody install, Promise
TX2000 ATA RAID (PDC 20271), 2 mirrored disks, using Linux ataraid 
support in 2.4.21-pre7), also using LVM 1.0.4.  I've checked the
changelog through 1.0.7, and the source of 1.0.7, and do not see
anything which is obviously different there.

On first setup of the LVM PV, VG, and LV all is well, the 
/dev/ataraid/d0p3 device is used correctly.  

However after rebooting, the /etc/init.d/lvm script runs which performs
"/sbin/vgscan" and "/sbin/vgchange -a y".  And after that LVM uses only
one of the disks that is part of the ataraid mirror (the first of the
disks in the mirror).  From that point onwards the mirror is out of
sync, and essentially useless (for the relevant disk partitions you need
to delete them, and remake them).

The Debian Woody lvm 1.0.4 init.d scripts run vgscan, I assume following
the hint in the vgscan man page, viz:

-=- cut here -=-
Hint
       Put vgscan in one of your system  startup  scripts.   This
       gives you an actual logical volume manager database before
       activating all volume groups by doing a "vgchange -ay".
-=- cut here -=-

vgscan deliberately overwrites the correct information (/dev/ataraid/d0p3)
for the physical volume with the incorrect information (/dev/hde3 in
my case).  I have verified this by checking the /etc/lvmtab.d/* backups:

-=- cut here -=-
pagoda:/etc# strings lvmconf/vg1.conf | egrep "hde|ataraid"
/dev/hde3
goda:/etc# strings lvmconf/vg1.conf.1.old | egrep "hde|ataraid"
/dev/hde3
pagoda:/etc# strings lvmconf/vg1.conf.2.old | egrep "hde|ataraid"
/dev/ataraid/d0p3
pagoda:/etc# ls -l lvmconf/vg* | head -3 
-rw-r-----    1 root     root       279980 Apr 29 20:58 lvmconf/vg1.conf
-rw-r-----    1 root     root       239016 Apr 29 20:57 lvmconf/vg1.conf.1.old
-rw-r-----    1 root     root       198052 Apr 29 17:12 lvmconf/vg1.conf.2.old
-=- cut here -=-

(All the older ones also say /dev/ataraid/d0p3)

The system was rebooted around 20:55 after I'd finished doing the first
part of the LVM setup, when I figured I'd make sure it rebooted cleanly
before copying data onto it.  After that I noticed that the mirrored
drives didn't seem to be getting writes evenly (the benefit of external
disk trays), and investigated, finding that vgscan & vgchange had swapped
the LVM PV device in use underneath me.

The LVM 1.0.2 change log includes the claim:

-=- cut here -=-
o ataraid device support
-=- cut here -=-

(from http://www.sistina.com/lvm_1.0.7_changelog)

However the LVM over ataraid support is dangerously broken; dangerously
in that when run in what appears to be the recommended setup, ie running
"vgscan" and "vgchange -a y" on boot, it silently bypasses the raid mirror
when the system is rebooted.  This will cause data loss in the event that
the raid's mirroring ability is called upon, or even that the supposedly
identical mirrored disks happen to be connected up in the opposite order.

Tracing back through the code the issue seems to be that:
- vgscan.c uses vg_check_exist_all_vg() in tools/lib/vg_check_exist.c 
- which uses pv_read_all_pv() in tools/lib/pv_read_all_pv.c 
- which uses lvm_dir_cache() in tools/lib/lvm_dir_cache.c
- which uses _scan_devs(TRUE) also in tools/lib/lvm_dir_cache.c 
- which uses the _devdir array of possible device prefixes, to control
  scandir looking for suitable devices.

_and_ the _devdir array lists hda/hde before ataraid.  ataraid is in
fact one of the last ones listed.  (There are no comments indicating the
reason for the order chosen in _devdir, and it doesn't appear to be
alphabetical or similar; I assume it's "order we thought of adding
them".)

And thus the /dev/hde partitions are matched first, happen to have the
right magic stuff in them, and thus vg1 is activated on /dev/hde3; and
/dev/ataraid/d0p3 never gets checked (or if it does, it's checked too
late, the vg it contains is already active, and it is skipped).

I am puzzled as to why /dev/hda and /dev/hde are scanned before
/dev/ataraid, given the way that the ataraid support works (it's a thin
wrapper around the hda/hdc/hde/hdg/etc devices to fan out reads and
writes).

I'm also puzzled as to how the md (linux software raid) support manages
to work with LVM, as the md devices are also scanned after the
hda/hdc/hde/etc devices, and with software raid the hda/hdc/etc devices
are visible and you have to avoid using them.  Presumably there's
something which fortuitously means that the md devices don't happen to
have the right signature where vgscan looks...

Now y'all can tell me that the Promise ATA RAID cards suck and I
shouldn't use them, and I should get a hardware RAID card, and so on
(as I saw happened to the person who described this issue in October
2002; see
http://lists.sistina.com/pipermail/linux-lvm/2002-October/012508.html
and
http://lists.sistina.com/pipermail/linux-lvm/2002-October/012516.html).

And I'll happily agree with you, but for two small facts:
- the hardware RAID cards cost more than twice what the drives cost, and
  they're 120GB IDE drives with large caches; let alone SCSI hardware
  RAID (which also increases the cost of the disks a lot too);

- that doesn't change the fact that LVM 1.0.x (x >= 2) claims to support
  ataraid, and appears to support it, but in fact silently stops using
  the raid mirror and causes data corruption, _when_following_the_documention_.

For what I want on this machine (and several of my clients want on various
semi-production machines), namely effectively "software RAID with BIOS
boot support" the Promise ata-raid cards, and Promise on-motherboard
ata-raid chipsets, are basically okay (I've seen about a dozen machines
with on-board promise RAID chipsets supported by ataraid now, and only
in some cases have I been able to talk the client into paying for a
"real" hardware raid card instead of using the onboard one; fortunately
this is the first time I or my clients have tried to mix LVM and ata-raid).

So it would be okay, except that LVM doesn't work properly with them,
in a subtle way that will cause data corruption even when following
the documentation.

It seems to me that there are three reasonable solutions:

- change vgscan to by default validate the existing volume table if one
  is present, and prefer the contents of it to what it can find itself,
  providing the existing volume table makes sense

- change the _devdir array to list the device names in a "logical" order
  so that the md devices, ataraid devices, and the like get matched
  _before_ the underlying physical devices, thus preferring the
  consoldated devices over non-consolidated devices; and document the
  reason for the order of _devdir

- explicitly disclaim any support of ataraid, and include stern warnings
  against using LVM with ataraid because LVM cannot handle the aliasing
  caused by ataraid (a careful check that the same problem doesn't occur
  with md (linux software raid) is probably required), and refuse to
  scan the ataraid devices at all, refuse to run pvcreate on them, etc.

I'd actually recommend doing the first and second of those (both prefer
the current lvmtab values (if present) when running vgscan, _and_ also
scan the devices in a sensible order when forced into looking at the
hardware).

The current situation leads to hidden data corruption, that one typically
finds out about only when it is too late, which is never a good thing
(I was lucky 'cause I got curious as to why the writes seemed to be
spread so unevenly on my "mirror" all of a sudden).  

And since the user has "followed all the LVM instructions" I believe LVM
must take at least some responsibility for causing this data corruption.
(In my case I can recover the data by copying it off the LVM vgscan'd to
/dev/hde3, and removing the LVM, and repartitioning with something else
and putting the data back.  And besides which I'd not done that much
setup on the machine anyway.)

Ewen
