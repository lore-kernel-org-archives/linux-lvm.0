Message-ID: <3BA0B539.8080809@st-peter.stw.uni-erlangen.de>
Date: Thu, 13 Sep 2001 15:31:37 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM
References: <NBBBJHKIOKPKOGOEPEDPGEEJDNAA.stuart@bh90210.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


IT3 Stuart B. Tener, USNR-R wrote:

>Svetljo:
>
>	I did try ramdisk_size = 8192, perhaps 17,000 is the number to try. Some people told me the parameter was "ramdisk = 8192", you say "ramdisk_size = 8192", do you know which is accurate?
>
>	Also does it go in the append = "ramdisk_size=8192" or "ramdisk=8192"
>	Or is it placed into the lilo.conf as a separate entry underneath the append command (or other lilo entry) ramdisk = 8192
>
well lilo.conf has for each linux entry an append section
thats a part from my
###########################################################
image=/boot/vmlinuz-2.4.10-pre4
    label=2.4.10pre4lvm
    root=/dev/md0
    initrd=/boot/initrd-lvm-2.4.10-pre4-xfs.gz
    append="idebus=66 ramdisk_size=18000 hdd=ide-scsi hdb=ide-floppy"
    vga=788
    read-only
###########################################################
in the lvm how-to it's 8192
but i use 18000 because i use XFS and in the readme for mkinitrd.xfs is 
mentioned 15000
and i had the same problem, upon boot i was seeing a message
trieng to access beyound the end of the ramdisk
it was in your boot log
i think it was 17000 and smth
try it with a bit larger

you can ad it to lilo.conf and rerun lilo or you can tell it on boot prompt
in my case :
lilo: 2.4.10pre4lvm ramdisk_size=18000

>
>Very Respectfully, 
>
>Stuart Blake Tener, IT3, USNR-R, N3GWG 
>Beverly Hills, California
>VTU 1904G (Volunteer Training Unit) 
>stuart@bh90210.net 
>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043 
>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859 
>
>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!) 
>
>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL. 
>
>Thursday, September 13, 2001 2:36 AM
>
>-----Original Message-----
>From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On Behalf Of svetljo
>Sent: Thursday, September 13, 2001 12:32 AM
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] LVM
>
>
>Hi
>
>have you tried to pass to lilo : linux ramdisk_size=8192 or
>ramdisk_size=17000
>after the lvm How-to you have to have in lilo.conf in the append section
>" ramdisk_size=8192 "
>
>>NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
>>RAMDISK: Compressed image found at block 0
>>Uncompressing.................................................................................................................................................................................................................................................................................done.
>>Freeing initrd memory: 869k freed
>>VFS: Mounted root (ext2 filesystem).
>>attempt to access beyond end of device
>>01:00: rw=0, want=8198 x(=0x), limit=8198
>>EXT2-fs error (device ramdisk(1,0)): ext2_read_inode: unable to read inode block - inode=8199, block=8197
>>attempt to access beyond end of device
>>01:00: rw=0, want=16390 x(=0x), limit=16390
>>EXT2-fs error (device ramdisk(1,0)): ext2_read_inode: unable to read inode block - inode=16387, block=16389
>>attempt to access beyond end of device
>>01:00: rw=0, want=8198 x(=0x), limit=8198
>>EXT2-fs error (device ramdisk(1,0)): ext2_read_inode: unable to read inode block - inode=8194, block=8197
>>reiserfs: checking transaction log (device 03:01) ...
>>Using r5 hash to sort names
>>ReiserFS version 3.6.25
>>VFS: Mounted root (reiserfs filesystem) readonly.
>>change_root: old root has d_count=2
>>Trying to unmount old root ... okay
>>Freeing unused kernel memory: 216k freed
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17519 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17519 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>LVM version 0.9.1_beta3  by Heinz Mauelshagen  (25/01/2001)
>>lvm -- Module successfully initialized
>>clm-6005: writing inode 17393 on readonly FS
>>clm-6005: writing inode 17519 on readonly FS
>>hdc: hdc1 hdc2 hdc3 hdc4
>>hdc: hdc1 hdc2 hdc3 hdc4
>>ide-floppy: hdc: I/O error, pc = 28, key =  5, asc = 21, ascq =  0
>>end_request: I/O error, dev 16:01 (hdc), sector 0
>>hdc: hdc1 hdc2 hdc3 hdc4
>>ide-floppy: hdc: I/O error, pc = 28, key =  5, asc = 21, ascq =  0
>>end_request: I/O error, dev 16:02 (hdc), sector 0
>>hdc: hdc1 hdc2 hdc3 hdc4
>>ide-floppy: hdc: I/O error, pc = 28, key =  5, asc = 21, ascq =  0
>>end_request: I/O error, dev 16:03 (hdc), sector 0
>>hdc: hdc1 hdc2 hdc3 hdc4
>>ide-floppy: hdc: I/O error, pc = 28, key =  5, asc = 21, ascq =  0
>>end_request: I/O error, dev 16:04 (hdc), sector 0
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6005: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6006: writing inode 17393 on readonly FS
>>clm-6005: writing inode 17393 on readonly FS
>>SCSI subsystem driver Revision: 1.00
>>scsi0 : SCSI host adapter emulation for IDE ATAPI devices
>> Vendor: TOSHIBA   Model: DVD-ROM SD-R2002  Rev: 1D26
>> Type:   CD-ROM                             ANSI SCSI revision: 02
>>md: md driver 0.90.0 MAX_MD_DEVS=256, MD_SB_DISKS=27
>>Linux Kernel Card Services 3.1.22
>> options:  [pci] [cardbus] [pm]
>>PCI: Found IRQ 11 for device 02:0f.0
>>PCI: Sharing IRQ 11 with 00:1f.2
>>PCI: Sharing IRQ 11 with 02:0f.1
>>PCI: Sharing IRQ 11 with 02:0f.2
>>PCI: Found IRQ 11 for device 02:0f.1
>>PCI: Sharing IRQ 11 with 00:1f.2
>>PCI: Sharing IRQ 11 with 02:0f.0
>>PCI: Sharing IRQ 11 with 02:0f.2
>>Yenta IRQ list 06d8, PCI irq11
>>Socket status: 30000006
>>Yenta IRQ list 06d8, PCI irq11
>>Socket status: 30000006
>>cs: IO port probe 0x0c00-0x0cff: clean.
>>cs: IO port probe 0x0100-0x04ff: excluding 0x280-0x287 0x378-0x37f 0x4d0-0x4d7
>>cs: IO port probe 0x0a00-0x0aff: clean.
>>eepro100.c:v1.09j-t 9/29/99 Donald Becker http://cesdis.gsfc.nasa.gov/linux/drivers/eepro100.html
>>eepro100.c: $Revision: 1.36 $ 2000/11/17 Modified by Andrey V. Savochkin <saw@saw.sw.com.sg> and others
>>eth0: OEM i82557/i82558 10/100 Ethernet, 00:20:E0:66:C5:8A, I/O at 0xecc0, IRQ 11.
>> Receiver lock-up bug exists -- enabling work-around.
>> Board assembly 727095-002, Physical connectors present: RJ45
>> Primary interface chip i82555 PHY #1.
>> General self-test: passed.
>> Serial sub-system self-test: passed.
>> Internal registers self-test: passed.
>> ROM checksum self-test: passed (0x04f4518b).
>> Receiver lock-up workaround activated.
>>Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
>>Winbond Super-IO detection, now testing ports 3F0,370,250,4E,2E ...
>>SMSC Super-IO detection, now testing Ports 2F0, 370 ...
>>PnPBIOS: Parport found PNPBIOS PNP0401 at io=0378,0778 irq=7 dma=1
>>0x378: FIFO is 16 bytes
>>0x378: writeIntrThreshold is 8
>>0x378: readIntrThreshold is 8
>>0x378: PWord is 8 bits
>>0x378: Interrupts are ISA-Pulses
>>0x378: ECP port cfgA=0x10 cfgB=0x00
>>0x378: ECP settings irq=<none or set by other means> dma=<none or set by other means>
>>parport0: PC-style at 0x378 (0x778), irq 7, dma 1 [PCSPP,TRISTATE,COMPAT,ECP,DMA]
>>parport0: cpp_daisy: aa5500ff(38)
>>parport0: assign_addrs: aa5500ff(38)
>>parport0: cpp_daisy: aa5500ff(38)
>>parport0: assign_addrs: aa5500ff(38)
>>lp0: using parport0 (interrupt-driven).
>>
>>
>>
>>Very Respectfully,
>>
>>Stuart Blake Tener, IT3, USNR-R, N3GWG
>>Beverly Hills, California
>>VTU 1904G (Volunteer Training Unit)
>>stuart@bh90210.net
>>west coast: (310)-358-0202 P.O. Box 16043, Beverly Hills, CA 90209-2043
>>east coast: (215)-338-6005 P.O. Box 45859, Philadelphia, PA 19149-5859
>>
>>Telecopier: (419)-715-6073 fax to email gateway via www.efax.com (it's free!)
>>
>>JOIN THE US NAVY RESERVE, SERVE YOUR COUNTRY, AND BENEFIT FROM IT ALL.
>>
>>Wednesday, September 12, 2001 7:00 PM
>>
>>-----Original Message-----
>>From: Jason Edgecombe [mailto:jedgecombe@carolina.rr.com]
>>Sent: Wednesday, September 12, 2001 6:02 PM
>>To: stuart@bh90210.net
>>Cc: linux-lvm@sistina.com
>>Subject: Re: [linux-lvm] LVM
>>
>>hi,
>>
>> according to reiserfs's FAQ:
>>http://www.reiserfs.org/faq.html#ReiserFS-as-root
>>
>>you need the notail option on the /boot partition.
>>the fstab might look as follows:
>>/dev/hda1    /boot   reiserfs    defaults,notail  0 0
>>/dev/hda2    /   reiserfs    defaults  0 0
>>
>>if there isn't the word "notail" in the fourth column of your root fstab
>>entry, then you ARE booting with tails.
>>
>>according the lilo changelog:
>>ftp://brun.dyndns.org/pub/linux/lilo/CHANGES
>>
>>lilo has been able to boot from a reiserfs partition with tail support
>>since version 21.6 (Oct. 1, 2000)
>>
>>*under an rpm-based distro such as redhat or mandrake, "rpm -qi lilo"
>>should give you the version. (assuming you haven't downloaded lilo as a
>>tarball and compiled it.)
>>
>>Both were last modified in August 2001, I don't know which to believe.
>>For safety sake, I made my /boot ext2. Most recent computers (within the
>>past two years) can boot from a partition after the 1024 boundary. I
>>just like to make a separate /boot at the beginning of the drive as a
>>precaution.
>>
>>as for the matter of initrd's, this is the way that I understand it:
>>in a non-lvm root fs, your root fs type must either be compiled in or in
>>the initrd image.
>>in a lvm root, you MUST have an initrd even if lvm is compiled into the
>>kernel (not as a module) because you need to run a vgchange -ay and you
>>need your lvm config files in the initrd.
>>
>>as for having /boot (booting the kernel) straight in an lvm fs, I have
>>no idea.
>>
>>
>>If I am wrong, someone please correct me.
>>
>>Sincerely,
>>Jason Edgecombe
>>
>>"IT3 Stuart B. Tener, USNR-R" wrote:
>>
>>>       I am curious what version of lilo in fact supports ReiserFS tails. I am running Mandrake 8.0, and using the lilo supplied therewith, and have been booting a / partition as ReiserFS (with tails I believe, how do I check?).
>>>
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>
