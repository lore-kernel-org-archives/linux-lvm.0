Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k13IOL102804
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 13:24:21 -0500
Received: from smtp9.poczta.onet.pl (smtp9.poczta.onet.pl [213.180.130.49])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k13INeD0026007
	for <linux-lvm@redhat.com>; Fri, 3 Feb 2006 13:23:40 -0500
Message-ID: <43E39F50.6000106@poczta.onet.pl>
Date: Fri, 03 Feb 2006 19:22:08 +0100
From: =?UTF-8?B?TWFjaWVqIFPFgm9qZXdza2k=?= <mslonik@poczta.onet.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Ubuntu distro with lvm2, raid 1, not booting anymore.
References: <43E254B5.5080107@poczta.onet.pl>
	<20060203073127.GD5971@percy.comedia.it>
In-Reply-To: <20060203073127.GD5971@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Luca Berra wrote:

> On Thu, Feb 02, 2006 at 07:51:33PM +0100, Maciej S?ojewski wrote:
>
>> Welcome!
>>
>> I have the serious problem with booting of my machine. It is run on 
>> Ubuntu distro (5.10), with lvm2 raid 1 on two identical sata hard 
>> disks. Lilo bootloader. The problem is that after small change in 
>> lilo.conf and running /sbin/lilo my system is no longer bootable. I 
>> see 'kernel panic' message. When I try to run lilo again (from Ubuntu 
>> Live! cd) I see some comments somehow related to dev-mapper:
>>
>
> what is exactly that you are doing to reinstall lilo?
> i don't use ubuntu, but generally:
> you should mount your original root fs on, say, /root
> mount --bind /dev /root/dev
> mount --bind /proc /root/proc
> mount --bind /sys /root/sys
> chroot /root /sbin/lilo

Dear Luka,

Thanks a lot for your answer and a clue. Unfortunately it doesn't help 
me :-(

Here you go, what am I doing after system start:

* Ubuntu Live! CD is booting, I hit <ener> key
* system is starting in graphical mode
* I open terminal window

# sudo su
# cd /mnt
# mkdir dev proc boot sys
# mount -v -t ext3 /dev/PV/boot /mnt/boot
dev/mapper/PV-boot on /mnt/boot type ext3 (rw)
# mount -v -t ext3 /dev/PV/root /mnt/root
dev/mapper/PV-root on /mnt/root type ext3 (rw)
#mount -v -t proc none /mnt/proc
none on /mnt/proc type proc (rw)
#mount -v -t sysfs none /mnt/sys
none on /mnt/sys type sysfs (rw)

#chroot /mnt /bin/bash
#lilo

Warning: '/proc/partitions' does not match '/dev' directory structure
Name changes '/dev/cloop0' -> '/tmp/dev.0'
Warning: '/dev' directory structure is incomplete; device (240,0) is missing
Warning: '/dev' directory structure is incomplete; device (254,0) is missing
Warning: '/dev' directory structure is incomplete; device (254,1) is missing
Warning: '/dev' directory structure is incomplete; device (254,2) is missing
Warning: '/dev' directory structure is incomplete; device (254,3) is missing
Warning: '/dev' directory structure is incomplete; device (254,4) is missing
Warning: '/dev' directory structure is incomplete; device (254,5) is missing
Warning: '/dev' directory structure is incomplete; device (254,6) is missing
Fatal: is_primary: Not a valid device 0xFE07

:-((( Please help me, what can I do now?
I have regenerated initrd, (update-initrd command). It did not help too.

Kind regards,
Maciej (mslonik)
