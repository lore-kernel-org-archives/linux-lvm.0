Message-ID: <3E39BCA9.3020103@wanadoo.fr>
From: Francis SOUYRI <francis.souyri@wanadoo.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM rootfs and cramfs as ramdisk
References: <E18dzcw-0003aS-00@gw.pe1mhp.ampr.org>
In-Reply-To: <E18dzcw-0003aS-00@gw.pe1mhp.ampr.org>
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
Date: Thu Jan 30 18:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi Jan,

You need "/etc" in rw for this you can mount "/etc" in the "linuxrc" 
script using a tmpfs filesystem like this:

/#!/bin/sh
...
mount -t tmpfs none /etc
mount -t proc none /proc
echo "Scanning for Volume Groups..."
/sbin/vgscan
echo "Activating Volume Groups"
/sbin/vgchange -a y
...
umount /proc
umount /etc
/
I used "romfs" for the "initrd" ramdisk.

Best regards.

Francis

Jan H. van Gils wrote:

>	Hi,
>
>First some thinks I found out.
>
>When you create with lvmcreate_initrd the /boot/initrd-lvm-<kernel> file
>the file is an ext2 filesystem. On a debian distro that wil give you problems
>because the kernel expects a cramfs as ramdisk file.
>
>Here is a work around I found :
>
>mount the /boot/initrd-lvm-<kernel> file
>mount -t ext2 -o loop /boot/initrd-lvm-<kernel> /mnt
>
>copy the file to temporary working directory
>cd /mnt; find . -print | cpio -udmp /var/tmp/lvm
>
>dismount the /mnt file system and mount the kernel original
>mount -t cramfs -o loop /boot/initrd.img-<kernel>
>cd /mnt; find . -print | cpio -udmp /var/tmp/lvm
>
>now create the new cramfs initrd file
>cd /var/tmp; mkcramfs lvm/ initrd.cramfs
>make sure the owner and group member are root <chown -R root:root initrd.cramfs)
>
>To be sure you can check the initrd.cramfs with cramfsck -v initrd.cramfs.
>
>Now I am wondering about one thing ? cramfs is a readonly filesystem
>when the system boot it executes a vgscan and that creates a
>"/etc/lvmtab" and "/etc/lvmtab.d" successfully created".
>
>But because the cramfs is readonly, wil this not be an impossibility,
>and is the cramfs ramdisk file not possible at all !!
>
>Please responce on this subject.
>
>Greetz, Jan
>
>
>  
>
