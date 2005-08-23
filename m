Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7NJjqV25999
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 15:45:52 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7NJjnhC029685
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 15:45:49 -0400
From: Ming Zhang <mingz@ele.uri.edu>
Date: Tue, 23 Aug 2005 15:45:40 -0400
Message-Id: <1124826340.5544.116.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [Fwd: Re: [Iscsitarget-devel] RE:local mounting of a
	drive formated byan initiator]
Reply-To: mingz@ele.uri.edu,
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
Content-Type: text/plain; charset="us-ascii"
To: LVM <linux-lvm@redhat.com>

previously i asked about how to access a partition in LV.

this is a nice solution from IET user.

Ming


-------- Forwarded Message --------
> From: Dr. Net! - Eugen Rieck <eugen@drnet.at>
> To: iscsitarget-devel@lists.sourceforge.net
> Subject: Re: [Iscsitarget-devel] RE:local mounting of a drive formated
> byan initiator
> Date: Tue, 23 Aug 2005 21:36:41 +0200
> Hi all - solution found.
> 
> > >so u export /dev/sda3 to ini side as a DISK, which is not a partition
> > >any more. then partition it, use it, and disconnect from it.
> > >
> > >but at local side, u can not access a partition in a partition. :P
> 
> Exporting the whole disk sda is not the perfect solution - when you export a 
> raid (mdX) you have the same problem, BUT:
> 
> No need for kpartx. There is an easy solution to this - use a loop device!
> 
> A Partition is nothing else than a continuous part of the underlying block 
> device - so you can touch it with a loop device with offset and size limit.
> 
> I assume you exported /dev/sda3 via IET
> 
> So you:
> 1.) Get the partition geometry - You only need to do this once
> 
> fdisk -lu /dev/sda3
> You see something like
> 
> Disk /dev/sda3: 180.0 GB, 180034928640 bytes
> 255 heads, 63 sectors/track, 21888 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>      Device Boot      Start         End      Blocks   Id  System
> /dev/sda3p1              63   351614654   175807296    7  HPFS/NTFS
> 
> Note the Start (63) and End (351614654 ) Values - they tell you, that inside 
> sda3 your "partition in a partition" starts at sector 63 and ends at sector 
> 351614654
> So:
> Offset=63 Blocks=63*512=32256
> Length=351614654 -63+1=351614592 Blocks=180026671104 Bytes
> 
> If you use the last partition up to the end of the disk, you don't need the 
> length, but I'll take it here for clarity
> 
> 2.) Get a free loop device - you have to do this for every boot (I'll fix up 
> a script to automate it and follow up later)
> 
> Variante 1 (New versions of losetup):
> losetup -a
> You see something like
> /dev/loop0: [0805]:1740 (/var/install/suse93.dvd)
> /dev/loop7: [0805]:2065 (/var/tmp/aoe/volume)
> 
> You now know, that loop devices 0 and 7 are in use, making 1-6 free.
> No output means all loop devices are free
> 
> Variante 2 (if 1 fails on older versions):
> If losetup -a complains, you have an older version that dosesn't understand 
> the -a flag. in this case do
> losetup /dev/loop0
> losetup /dev/loop1
> ...
> until you get "no such device or address" - again you have found a free loop 
> device.
> 
> I now assume that loop1 is free
> 
> 3.) set up the loop device
> 
> losetup -o 32256 -s 180026671104  /dev/loop1 /dev/sdc3
> 
> -o 32256 is offset from 1.)
> -s 180026671104 is length from 1.)
> /dev/loop1 is free loop device from 2.)
> /dev/sdc3 is your exported volume
> 
> 4.) mount the loop device
> 
> mount /dev/loop1 /your/mount/point
> 
> Done!
> 
> I just tried this with my box - this is where the numbers come from
> 
> Have fun!
> 
> Regards, Eugen
> 
> :-) Eugen Rieck (-:
> eugen@drnet.at
> 
> Programmer: Biological device,
> designed to convert coffee into code
> 
> 
> 
> -------------------------------------------------------
> SF.Net email is Sponsored by the Better Software Conference & EXPO
> September 19-22, 2005 * San Francisco, CA * Development Lifecycle Practices
> Agile & Plan-Driven Development * Managing Projects & Teams * Testing & QA
> Security * Process Improvement & Measurement * http://www.sqe.com/bsce5sf
> _______________________________________________
> Iscsitarget-devel mailing list
> Iscsitarget-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/iscsitarget-devel
