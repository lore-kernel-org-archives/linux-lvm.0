Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Converting my Root file system to LVM
Date: Wed, 23 May 2001 10:56:39 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEMHIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <990547328.1133.1.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

AHA!
you too, huh?
You'll have to add sed to the initial ramdisk.

Its in /boot/initrd<something>.gz
unzip it and mount it with
mount -o loop /boot/initrd<something> /mnt/<somewhere>

then simply 
cp /bin/sed /mnt/<somewhere>/bin/

then unmount it, re-gzip it and away you go!

And what *I'd* like to know is why isn't sed on the 
initrd in the first plade if the scripts need it??


> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Rupert Heesom
> Sent: Wednesday, May 23, 2001 4:02 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Converting my Root file system to LVM
> 
> 
> I've been practicing LVM techniques on a spare 2nd disk which I'm adding
> to my root file system using LVM.  I think I've got the hang of how LVs,
> PVs, and VGs work.
> 
> I've followed the lvm-howto on how to create a root filesystem.
> 
> I've created a partition on the 2nd disk (/dev/sdb1), converted it to a
> PV.
> 
> I've created a VG (/dev/vg) & LV (/dev/vg/root) on that disk.
> 
> I've copied the contents of my non-LVM root partition over to the LV -
> (find / -xdev | cpio -pvmd /mnt/tmp)
> 
> I've moved /etc/lilo.conf to my /boot partition, and created a symlink
> to /boot/lilo.conf in /etc.
> 
> I've created an initial RAMdisk on /boot -  (/boot/initrd-lvm-2.4.3.gz).
> I created one RAM disk initially to see how it worked, then ran the
> "lvmcreate_initrd" again once my LVol was created (and the files copied
> across).
> 
> I've altered my lilo.conf to look like - .....
> 
> [rupert@localhost rupert]$cat /etc/lilo.conf
> boot=/dev/sda
> map=/boot/map
> install=/boot/boot.b
> prompt
> timeout=50
> linear
> default=linux-2_4
> message=/boot/message
> 
> image=/boot/vmlinuz-2.2.16-22
> 	label=linux-2_2
> 	initrd=/boot/initrd-2.2.16-22.img
> 	read-only
> 	root=/dev/sda5
> 	append="mem=384M"
> 
> image=/boot/vmlinuz-2.4.3
> 	label=linux-2_4
> 	read-only
> 	root=/dev/sda5
> 	append="mem=384M"
> 
> image=/boot/vmlinuz-2.4.3
> 	initrd=/boot/initrd-lvm-2.4.3.gz
> 	root=/dev/vg/root
> 	label=lvm
> 	append="mem=384M ramdisk_size=8192"
> 
> #image=/usr/src/linux/arch/i386/boot/bzImage
> #	label=linux_test
> #	read-only
> #	root=/dev/sda5
> #	append="mem=384M"
> 
> 
> ...... And I've run lilo of course.
> 
> 
> 
> Now, when I boot up into the LVM partition, I get the following error
> msgs -
> 
> lvm - Module successfully initialised.
> /sbin/vgscan: sed: command not found.
> /sbin/vgscan: /lib/lvm-iop10/: is a directory
> /sbin/vgscan: exec: /lib/lvm-iop10/: cannot execute:  permission denied.
> 
> /sbin/vgchange:  <same msgs>
> 
> Obviously the kernel can't find the LVM tools.  Would these not be
> included in the lvm initrd?  If they are, and the kernel still can't
> find them, what do I change so that the kernel CAN find the LVM tools?
> 
> Tnx for any help.
> 
> I'M NEARLY THERE!!
> 
> -- 
> regs
> rupert
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
