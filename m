Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1S2pf830179
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:51:41 -0500
Received: from ciistr2.ist.utl.pt (ciistr2.ist.utl.pt [193.136.128.2])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1S2peb11973
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 21:51:40 -0500
Received: from mail.ist.utl.pt (mail.ist.utl.pt [193.136.128.8])
	by ciistr2.ist.utl.pt (Postfix) with ESMTP id 9C5674BCB1
	for <linux-lvm@redhat.com>; Sat, 28 Feb 2004 02:51:39 +0000 (WET)
Message-ID: <404001F1.9060707@ist.utl.pt>
From: "=?ISO-8859-1?Q?Miguel_Cabe=E7a?=" <cabeca@ist.utl.pt>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LILO (with Saout's patch) + /boot on LVM2 over Software
 RAID1
References: <403FFCAE.7020300@ist.utl.pt>
In-Reply-To: <403FFCAE.7020300@ist.utl.pt>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 27 21:50:11 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,

> Can LILO with Saout's device mapper patch boot from an LVM2 /boot over 
> software RAID1 ?
>
> I get the following error when runing lilo:
> Fatal: Sorry, don't know how to handle device 0xfe01
>
> Does this mean that LILO can only boot from a RAID1 *OR* device-mapper 
> device, not both? (LVM2 on top of RAID1)


It seems to me that I have some real problem:
I've undone my LVM2 over RAID1 setup and prepared a new one. I've setup 
some LVM2 volumes directly over a /dev/hdc physical  volume instead of a 
/dev/md0 containing /dev/hda1 and hdc1.

Before:
/dev/hda1 (failed-disk)-->
/dev/hdc1 (raid-disk)  -->dev/md0 --> /dev/system/    root    swap    var

After:
/dev/hdc --> /dev/system   root  swap  var

I ran LILO version 22.5.8 (Debian GNU/Linux) with the patches from 
Cristopher Saout:
backup:/mnt/root# lilo -X

CFLAGS =  -O2 -Wall -g -DLILO=0x16c2d41b -DLCF_BDATA -DLCF_DSECS=3 
-DLCF_EVMS -DLCF_IGNORECASE -DLCF_LVM -DLCF_ONE_SHOT -DLCF_PASS160 
-DLCF_REISERFS -DLCF_REWRITE_TABLE -DLCF_SOLO_CHAIN -DLCF_VERSION 
-DLCF_VIRTUAL -DLCF_DEVMAPPER -DLCF_AUTOAUTO -Idebian/kernel-headers

and it gave me the same error!!!!

backup:/mnt/root# lilo -t -C etc/lilo.conf.lvmtest -r .
Fatal: Sorry, don't know how to handle device 0xfe01

If I run lilo from hda2 (no LVM) I get a successful instalation:
backup:/mnt/root# lilo -t -C etc/lilo.conf.lvmtest -r /
Warning: '/proc/partitions' does not match '/dev' directory structure.
    Name change: '/dev/dm-0' -> '/dev/mapper/system-swap'
Warning: The boot sector and map file are on different disks.
Added ramdisk_LVM *
The boot sector and the map file have *NOT* been altered.

Just to be sure I downloaded lilo 22.5.8 tarball and the patch from 
http://www.saout.de/misc/lilo-22.5.8-devmapper.patch, and compiled it 
myself. Again the same error. I have devmapper compiled in my 2.6 
kernel. I have libdevmapper installed on my system. I have lilo patched 
to understand devmapper. What am I doing wrong here? Do you have any clues?

This is my lilo.conf on both roots:

default="ramdisk_LVM"
image=/boot/vmlinuz-2.6.3-4
        label="ramdisk_LVM"
        initrd=/boot/initrd-lvm2-2.6.3-4.gz
        append="root=/dev/ram0 lvm2root=/dev/system/root 
video=aty128fb:1024x768-24@76"
        read-only

Thanks

Miguel
