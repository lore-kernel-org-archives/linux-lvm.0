Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j31J7WO05827
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 14:07:32 -0500
Received: from seeker3.pacific.net.ph (seeker3.pacific.net.ph [210.23.235.106])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j31J7U1c022119
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 14:07:31 -0500
Received: from congo2.pacific.net.ph (congo2.pacific.net.ph [210.23.235.89])
	by seeker3.pacific.net.ph with ESMTP
	id j31J7Qei009388 for <linux-lvm@redhat.com>;
	Sat, 2 Apr 2005 03:07:26 +0800
Received: from [210.1.105.226] (ppp226.dyn1.105.pacific.net.ph [210.1.105.226]
	(may be forged)) by congo2.pacific.net.ph with ESMTP
	id j31J7Phc005764 for <linux-lvm@redhat.com>;
	Sat, 2 Apr 2005 03:07:26 +0800 (PHT)
Message-ID: <424DA811.4040508@nospam.com>
Date: Sat, 02 Apr 2005 03:59:13 +0800
From: Andy Sy <andy@nospam.com>
MIME-Version: 1.0
References: <424CA0D1.5060905@nospam.com>
In-Reply-To: <424CA0D1.5060905@nospam.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: putting lvm autodetect into the kernel ala md
Reply-To: andy@neotitans.com,
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
To: linux-lvm@redhat.com

Luca Berra wrote:

> lilo does not read a partition.  all that lilo needs is to
> be able to create a mapping from a file to the physical sectors
> on the drive, and guess the BIOS id of that drive.

... and use BIOS (?) to load in the sectors containing
the kernel, initrd, etc... before passing off execution to it?

Anyway, now I believe I understand what you were trying to get at
earlier:

> confusion between a boot loader (which is the only limitation
> we have in loading a kernel/initrd/initramfs) and what the kernel
> can do.

In order for things to work if /boot resides in a non-physical (e.g.
RAID1, RAID0, lvm, etc...), LILO itself has to know how to read the
contents of /boot off of that type of partition.  Having lvm/md
autodetect on the kernel will NOT help LILO (it will, however,
eliminate the need for an initrd).


> I insist initrd is not an hassle, it is good programming
> practice.  This means code separation between kernel-space
> and user space, and the linux kernel is moving _that_ way.

Yes, I do find myself agreeing with your general sentiments.  The
primary concern, to do away with the need to have a separate
/boot partition, is not helped at all if the kernel can autodetect
lvm partitions.

Dispensing with the need for an initrd is but a secondary concern,
and fact is, I would also say that it brings a lot of flexiblity to
the table.  So no, having lvm autodetect in the kernel is not
what I'm looking for.  What we're looking for is good lvm support
in LILO.





-- 
reply-to: a n d y @ n e o t i t a n s . c o m
