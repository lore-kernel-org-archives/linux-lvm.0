From: Tony Likhite <tony@likhite.net>
Subject: Re: [linux-lvm] Re: vgimport says "ERROR: wrong number of physical volumes"
References: <200210171053.03775.tony@likhite.net> <200210171115.44653.tony@likhite.net>
In-Reply-To: <200210171115.44653.tony@likhite.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200210171139.50338.tony@likhite.net>
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
Date: Thu Oct 17 10:40:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Fixed.

I found the same problem in the linux-lvm archives, got the tools in the 
LVM_BRANCH_1-0 branch of CVS, and the new vgimport worked just fine.

Sorry to bother.

On Thursday 17 October 2002 11:15, Tony Likhite wrote:
> Ok, after initial spasm of confused panic, here's some possibly relevant
> data:
>
> Kernel 2.4.19-rc3-ac4 (devfs mounted)
>
> LVM tools 1.04 (latest Debian package, pvscan --version says:
> pvscan: Logical Volume Manager 1.0.4
> Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10))
>
> output from 'vgimport -fv rootvg
> /dev/ide/host0/bus1/target0/lun0/part2':
>
> vgimport -- locking logical volume manager
> vgimport -- checking volume group name
> vgimport -- checking volume group "rootvg" existence
> vgimport -- trying to read physical volume
> vgimport -- checking for duplicate physical volumes
> vgimport -- checking physical volume name
> "/dev/ide/host0/bus1/target0/lun0/part2"
> vgimport -- reading data of physical volume
> "/dev/ide/host0/bus1/target0/lun0/part2" from disk
> vgimport -- checking for exported physical volume
> "/dev/ide/host0/bus1/target0/lun0/part2"
> vgimport -- reallocating memory
> vgimport -- checking consistency of physical volume
> "/dev/ide/host0/bus1/target0/lun0/part2"
> vgimport -- ERROR: wrong number of physical volumes to import volume
> group "rootvg"
>
> output from 'pvdata /dev/ide/host0/bus1/target0/lun0/part2':
>
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus1/target0/lun0/part2
> VG Name               rootvgPV_EXP
> PV Size               110.79 GB [232344000 secs] / NOT usable 4.25 MB
> [LVM: 238
> KB]
> PV#                   2
> PV Status             available
> Allocatable           yes
> Cur LV                6
> PE Size (KByte)       4096
> Total PE              28361
> Free PE               17865
> Allocated PE          10496
> PV UUID               z9FKhX-y87k-j6Oj-STF1-C7KR-3HcY-3VFDcI
>
> --- Volume group ---
> VG Name
> VG Access             read/write
> VG Status             NOT available/exported/resizable
> VG #                  1
> MAX LV                255
> Cur LV                6
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                255
> Cur PV                1
> Act PV                1
> VG Size               110.79 GB
> PE Size               4 MB
> Total PE              28361
> Alloc PE / Size       10496 / 41 GB
> Free  PE / Size       17865 / 69.79 GB
> VG UUID               gvQKre-flUe-MkcE-OJvo-ijKM-AWjc-IZo6R9
>
> --- List of logical volumes ---
>
> pvdata -- logical volume "/dev/rootvg/root" at offset   0
> pvdata -- logical volume "/dev/rootvg/usr-local" at offset   1
> pvdata -- logical volume "/dev/rootvg/swap" at offset   2
> pvdata -- logical volume "/dev/rootvg/home" at offset   3
> pvdata -- logical volume "/dev/rootvg/oracle" at offset   4
> pvdata -- logical volume "/dev/rootvg/archive" at offset   5
> pvdata -- logical volume struct at offset   6 is empty
> pvdata -- logical volume struct at offset   7 is empty
> pvdata -- logical volume struct at offset   8 is empty
> pvdata -- logical volume struct at offset   9 is empty
> pvdata -- logical volume struct at offset  10 is empty
> ..etc...
> --- List of physical volume UUIDs ---
>
> 001: z9FKhX-y87k-j6Oj-STF1-C7KR-3HcY-3VFDcI
>
> On Thursday 17 October 2002 10:53, Tony Likhite whined:
> > The boot drive in my dual-drive system was dying, so I pvmoved all its
> > PEs to the other drive and vgreduced it from its VG (rootvg).  During
> > a reboot after completing the vgreduce, the boot drive died.
> >
> > However, when I connected the remaining (good) drive to another
> > system, vgscan reported a duplicate volume group ID (as I recall), and
> > made a VG on the new machine (vg00) inaccessible.  rootvg was fine,
> > and I was able to mount LVs from it, though.
> >
> > To get back vg00, I vgexported rootvg.  However, now when I try to
> > import it again, vgimport fails with "wrong number of physical
> > volumes".
> >
> > How can I fix this?  Is it possible to edit the definition of rootvg
> > and reduce the PV count?  I'm reasonably sure that all the PEs are
> > intact on the remaining drive, and the VG definition is the only thing
> > that's off.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
