Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o563XZ7T011161
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2010 23:33:35 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o563XRg0029979
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2010 23:33:27 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OL6c0-0005l3-20
	for linux-lvm@redhat.com; Sat, 05 Jun 2010 20:33:25 -0700
Date: Sat, 05 Jun 2010 22:33:22 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <4C0AF305.2000807@alteeve.com> (from linux@alteeve.com on Sat
	Jun  5 19:59:49 2010)
Message-Id: <1275795202.3993.30@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Imaged a drive, now kernel panics
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

   You mentioned that the old drive is IDE.  If so,
You may be running into a couple problems I've had.
I take it the new drive is SATA, SAS, or SCSI?
Did you edit /etc/fstab to change hda to sda, hdb
to sdb, etc., before running mkinitrd?

   The existing kernel may not have the needed drivers
compiled in, the drivers for the particular chipset
and whatever SCSI drivers or modules are needed.
Assuming that rescue kernel matches the kernel on
the failed drive, mkinitrd _should_ take care of that
if /etc/fstab is correct.  Might it might look at
mtab?

> I also tried moving the current kernel out of the
> way and using 'mkinitrd' to rebuild the image (after
> chrooting and making sure everything looked fine)

    Be sure to bind /proc, /sys, /dev, and /selinux
into the chroot.  We want to be able to see /dev/sda
it order to set up to boot from it.  Along the same lines,
double check that any other partitions, primarily /boot,
are mounted in the chroot.

    That should pretty much you, but before I figured out
some of the possible failure modes I build modified several
initrd by hand.  You can debug the init script with simple
echo statements much like you would debug any simple
script.

    One last thing - on some motherboards the BIOS can
be set to present a SATA drive as if it were IDE, I
understand.  qemu-kvm can also present a hard drive image
as either SCSI or IDE, regardless of the actual underlying
hardware.  So you could present your SATA or SCSI drive
as an IDE drive in order to make the old initrd and kernel
happy.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 06/05/2010 07:59:49 PM, Digimer wrote:
> Hi all,
> 
>   I am sure this is a fairly common issue, but it's stumping me.
> 
>   I have an old server's drive (IDE) that has CentOS 4 on it. The  
> mainboard fried, so I imaged the drive using 'dd' onto a new drive  
> and tried booting from it. Not surprisingly, it failed to boot.  
> Specifically:
> 
> -------------------------------------------------------------
> Uncompressing Linux... Ok, booting the kernel.
> Red Hat nash version 4.2.1.8 starting
>   Reading all physical volumes.  This may take a while...
>   No volume groups found
>   Volume group "VolGroup00" not found
> ERROR: /bin/lvm exited abnormally! (pid 321)
> mount: error 6 mounting ext3
> mount: error 2 mounting none
> switchroot: mount failed: 22
> umount /initrd/dev failed: 2
> Kernel panic - not syncing: Attempted to kill init!
> -------------------------------------------------------------
> 
>   When I boot off the DVD using 'linux rescue', it successfully finds  
> the partitions and mounts them. I can 'chroot /mnt/sysimage' just  
> fine. I also tried moving the current kernel out of the way and using  
> 'mkinitrd' to rebuild the image (after chrooting and making sure  
> everything looked fine).
> 
>   Any idea what I might be missing?
> 
> Thanks!
> 
>-- 
> Digimer
> E-Mail:         linux@alteeve.com
> AN!Whitepapers: http://alteeve.com
> Node Assassin:  http://nodeassassin.org
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
