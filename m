From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM on ATA-Raid Working - but Poorly
Message-ID: <20021017135619.A5674@zealot.blacknet.de>
References: <1034830214.3dae418604fe5@mail.dornquast.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1034830214.3dae418604fe5@mail.dornquast.com>; from Nathan@Aberon.Net on Wed, Oct 16, 2002 at 11:50:14PM -0500
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
Date: Thu Oct 17 07:04:41 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Oct 16 '02 at 23:50, Nathan Dornquast wrote:
> After creating LVM Vol Group (VG1) and single Log. Vol (lvol1) on ataraid 
> mirrored drives (/dev/ataraid/d0p3) only one drives seems to get used.
> [ ... ]
> 7. Run pvscan: Reports
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ataraid/d0p3" is in no VG  [109.32 GB]
> pvscan -- inactive PV "/dev/hdc3"         is in no VG  [109.32 GB]
> pvscan -- ACTIVE PV "/dev/hda3"         is in no VG  [109.32 GB]
> pvscan -- total: 3 [327.96 GB] / in use: 3 [327.96 GB] / in no VG: 0 [0] 
That's not an LVM problem, but still ...

You've two options:
- throw away the ataraid card, it is broken by design and get either a
  real RAID card (e.g. 3ware) or use the kernel based MD drivers
- if you want to keep the ataraid card, remove the regular ide drivers
  from your kernel. both drivers access the SAME hardware and make it
  available in two DIFFERENT locations. As the two drives /dev/hda and
  /dev/hdc and as the RAID1 drive /dev/ataraid/d0*
  as you have learned, the /dev/hd[ac] are much prefered and screw up
  your raid setup. OTOH you might be able to change the order the
  devices are tested in the LVM source code.

I'm running 4 boxes with MD based RAID1 discs (and 2 with RAID5) and 2
boxes with 3ware RAID1 (and one with RAID5) all with LVM and did never
have any trouble. 
If you want a cheap hardware RAID1-IDE solution the promise fasttrack
come with their own (I think closed source) driver that emulates a scsi
disk. As the IDE driver ignores the fasttrtack you can have a working,
bootable RAID1 setup with this cards. OTOH the 3ware is only 10-20$ more
expensive and comes with a cool monitoring tool. But if you get a
mainboard with a fasttrack controller it might be an interesting
solution. ... I would still get a 3ware ...
-- 
Goetz Bock       (c) 2002 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
