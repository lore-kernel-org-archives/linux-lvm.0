Subject: Re: [linux-lvm] Re: LVM writes on raw disk of ATA RAID Mirror
From: Andrew Rechenberg <arechenberg@shermfin.com>
In-Reply-To: <20030430003023.8CC3CAE4F5@basilica.la.naos.co.nz>
References: <20030430003023.8CC3CAE4F5@basilica.la.naos.co.nz>
Content-Transfer-Encoding: 7bit
Message-Id: <1051724087.19901.287.camel@cinshrlnxws01.shermfin.com>
Mime-Version: 1.0
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
Date: Wed Apr 30 12:35:14 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

vgscan has similar problems with MD devices in a software RAID10 (but
not RAID1) configuration.

In software RAID10 one creates a number of software RAID1 devices and
then stripes across those with RAID0.  For example if you have a 4 disk
RAID10 setup you would have /dev/md0 and /dev/md1 as RAID1 devices and
then /dev/md2 would be a stripe across /dev/md[0,1]

The problem occurs when vgcreate adds the LVM metadata to the device. 
When you run 'vgcreate somename0 /dev/md2' it adds the metadata to
/dev/md2, but since /dev/md0 is the first device in the RAID10 array,
the metadata is in the exact same location on /dev/md0 and /dev/md2. 
Upon reboot (or a subsequent vgscan), LVM complains that it can't find
all of the PE's on the volume group created because it's reading the
information from md0 instead of md2

I was trying to hack vgscan to get my setup working but I needed the box
working ASAP so time dictated that I use the KludgeMethod(tm).  Someone
on the list recommended that I move /dev/md0 before I run my vgscan. 
That worked in my case and I hacked my sysint script to move md0, run
vgscan, and then move it back.  Not elegant AT ALL, but it works.

I'm not sure if a similar quick fix could work for you or not.  You
would have to make sure that the ataraid driver "built" the
/dev/ataraid* entries, then move /dev/hd* somewhere, run vgscan, and
then move them back.

Make sure you test first and have a backup (do people still do those? :)
) before trying anything.

HTH,
Andy.


On Tue, 2003-04-29 at 20:30, Ewen McNeill wrote:
> In message <20030429232352.DC21EAE4F5@basilica.la.naos.co.nz>, Ewen McNeill writes:
> >In message <20030430011344.N16789@zealot.blacknet.de>, Goetz Bock writes:
> >>during my last/first/only time i had to deal with ataraid, and IIRC,
> >>the promise IDE driver had a compile time flag where it would not touch
> >>initialised raid arrays.
> >>aktivating this flag would simply remove the offending disks from the
> >>list of ide disks and make it available via ataraid only.
> >
> >It would be nice if it were possible to do this.  Is this perhaps the
> >CONFIG_PDC202XX_FORCE flag (turned off, or on)?  
> 
> According to this message:
> 
> http://groups.google.com/groups?hl=en&lr=&ie=UTF-8&selm=20030405112008%2462da%40gated-at.bofh.it
> 
> from Andre Hedrick (Linux IDE maintainer), the CONFIG_PDC202XX_FORCE
> option is intended to force recognition of the Promise card's IDE
> channels as IDE devices, in order to be able to use the Linux pdcraid
> (ATA-RAID) driver.  (They are apparently semi-disabled in the PCI
> configuration data, by default, so that only the Promise SCSI device
> driver can find them.)  It should be on for using the pdcraid/ata-raid
> support, and off if you are using the Promise "SCSI" device driver.
> (And as I noted earlier, only certain chipsets seem to actually use this
> option; the rest just default to forced on.)
> 
> This tends to confirm my view that if you use the ataraid driver, then
> you'll see both the raw /dev/hd* devices, and also the /dev/ataraid/d0*
> devices, since the ataraid/pdcraid driver appears to search the /dev/hd*
> IDE controllers for likely devices based on partition signatures.
> 
> Which means that LVM needs to deal with the aliasing effects in some
> manner, either by recognising the ataraid devices first and ignoring the
> underlying devices, or by very loudly refusing to work with ataraid at
> all.
> 
> Ewen
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
