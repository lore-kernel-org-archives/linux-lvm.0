Date: Thu, 2 Sep 1999 14:16:36 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] More thoughts on Linux LVM+RAID
Message-ID: <19990902141636.A11009@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <H00000fa0c2cec2a@MHS>
Mime-Version: 1.0
In-Reply-To: <H00000fa0c2cec2a@MHS>; from CHUCK_MUNRO@HP-Canada-om1.om.hp.com on Wed, Sep 01, 1999 at 04:00:11PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Sep 01, 1999 at 04:00:11PM -0400, CHUCK_MUNRO@HP-Canada-om1.om.hp.com wrote:
...
> implemented full mirroring of the entire boot process by using a Promise 
> FastTRACK IDE RAID card to boot a tiny mirrored DOS C: drive (the card nicely 
> provides this in its own BIOS).  From there I use loadlin to boot an initrd 
> Linux, which activates a RAID-1 root filesystem, switches to it, and so on 
> ......
> 
> This is soooo UGLY, but it has rescued my firewall twice so far.
> 
> I would like to encourage a merge of LVM and RAID (at least RAID-0 and 1), with 
> the realization that the ease with which HP-UX boots a mirrored root disk would 
> involve a lot of kernel changes in Linux.

as in HPUX the booting process should not involve a lot of kernel
changes.
HPUX dedicates an area at the beginning of the disk to store the
LIF utilities. booting the kernel is done via the HPUX LIF utility
the HPUX utility can read an HFS filesystem and loads the kernel
from the first HFS partition.
it reads the lvm (boot/root/swap/dump) info form the file rootconf
and passes info to the kernel.
Linux has a standard loader (on x86), LILO which is not able to
read a filesystem, so it has to know the list of phisical sectors
on the disk where the kernel is stored. this is why it must be reinstalled
at every kernel build.
Due to MBR size limits lilo is a multi-stage process:
the mbr loads a boot loader (usually boot.b) and info from the
map file.
The problem with LILO is that it needs to know
the physical geometry of the disk. and the md driver does not supply
this info. a proposed solution was to hardcode the geometry info
in the lilo.conf file. another solution would be to use GRUB, which
can read ext2 filesystems from a BIOS recognized partition (no LVM).

Anyway the only thing that is needed to boot from a mirrored disk
is a better tool than lilo/grub, or a modification of what we have.

> One remaining snag would then be to work around the BIOS' inability to 
> recognize a secondary boot path if the primary one fails (which HP machines 
> have been able to do for many years).  I can't think of any solution here 
> except for a Promise-like bit of IDE hardware.  The current crop of SCSI 
> hardware-RAID controllers (AMI, Mylex, DPT, etc.) are just too expensive for my 
> personal budget.
you have three possibilities here:
1) disk 1 is completely failed, the bios does not recognize it,
	disk 2 becomes disk one and all goes well.
2) disk one works, but the kernel is corrupt, if you configured lilo
	correctly you can use fallback=<other disk> or tell it manually
	to boot the other disk.
3) MBR on disk 1 is corrupt, you'll have to manually disable the
	disk from BIOS (scsi controller firmware)

even on HP machines you can find a bootable but broken lif
and you have to manually specify to boot from the altrenate path.

L.
-- 
Luca Berra -- bluca@comedia.it
    Communications Media & Services S.r.l.
