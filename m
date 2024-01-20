Received: from mail.bitfolk.com (use.bitfolk.com [85.119.80.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1E62F
	for <linux-lvm@lists.linux.dev>; Sat, 20 Jan 2024 04:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.119.80.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705725946; cv=none; b=mcQpD4ErY3YRrpt/BWMzkU9n8NI3oRoQGXsDAWxrh1BssUgAmqXtYy6JkFYHFFrPm2D1bYHUANY5k/rwWdCPgCPwlZaCmKIU0AcBNjQlwHucjWLt3umg0R1hffXVmMb1gXmItkoPrKwF5JPyFoEUjbcC2vsglpZXIwso7wZMrbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705725946; c=relaxed/simple;
	bh=w41eNpB982dks8pNgQnXNt5cI9uH1T0j9wQRwsZUSOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JoX2YukU3zZcrdW1f9g7HI0P324O5QJci06zzgWWb2QmonEo71R+lMj4Qix9Nhp8I7b2HNiPgNRpO7mmOqbRQ62+Cv6JvCtfwf8bXP22UW16FYd0AUe19hdVLvcw8rKywNyNJ6mWhXFIatx+a9NHiKaH4lLTbe9hteI0KO64Zak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net; spf=pass smtp.mailfrom=strugglers.net; dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b=qw7BVnIg; arc=none smtp.client-ip=85.119.80.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=strugglers.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strugglers.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=strugglers.net header.i=@strugglers.net header.b="qw7BVnIg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=strugglers.net; s=alpha; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description:Resent-To;
	bh=6CAvLtH408P7oZSL96nZMv0bE/vAhgwCTqvPBgsstPU=; b=qw7BVnIgUyQwgI4T693vf6XQaM
	9Lg9GAvXIrJJcBIsf06o+zBbI9RSXdfTfyd7IfwpZvb2gjEtrJQI3PYzLN0cd0+g2G/Pm0iuzcSSY
	xgZnrxr+WRAx4Cz8nJaff3Kg2mx6taAAccrtq+iFKoRLcBEwYcpD5EXgroamqiPvn85MB8HrQSi7P
	4egNOxYHU5s9dOTtY7zH7znTRuSuP/3Ava9hNcJEXlksw0+S0znTpuBc4nzZKYOSYlzqlJacsZRBo
	Nsn6dYcebAedYRBu4zPLccMLNt6odkYh8+3Nz+/JutDmimubrAD+1EPtGFQBd3H4n6U5/VGS30kzx
	q8u/x1NA==;
Received: from andy by mail.bitfolk.com with local (Exim 4.94.2)
	(envelope-from <andy@strugglers.net>)
	id 1rR3Ed-0008DD-TU; Sat, 20 Jan 2024 04:45:35 +0000
Date: Sat, 20 Jan 2024 04:45:35 +0000
From: Andy Smith <andy@strugglers.net>
To: Phillip Susi <phill@thesusis.net>
Cc: linux-lvm@lists.linux.dev
Subject: Re: Any way in LVM to deal with 512e vs 4Kn physical devices?
Message-ID: <ZatP7wb9k5jzV59y@mail.bitfolk.com>
References: <ZaTfK/aagY+A8C3N@mail.bitfolk.com>
 <87y1cp9lwi.fsf@vps.thesusis.net>
 <ZabjW4HWOSfy8sRN@mail.bitfolk.com>
 <ZaeAJtE+0Gmp2b0E@mail.bitfolk.com>
 <87frywcapk.fsf@vps.thesusis.net>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87frywcapk.fsf@vps.thesusis.net>
OpenPGP: id=BF15490B; url=http://strugglers.net/~andy/pubkey.asc
X-URL: http://strugglers.net/wiki/User:Andy
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: andy@strugglers.net
X-SA-Exim-Scanned: No (on mail.bitfolk.com); SAEximRunCond expanded to false

(Happy to take this off-topic thread off-list if it's bothering
anyone…)

Hi Phillip,

On Wed, Jan 17, 2024 at 09:10:15AM -0500, Phillip Susi wrote:
> Like I said before, as long as the start and length of each partition is
> an even multiple of 8, just divide them by 8 and recreate the partition
> table using those values.

So here's an attempt.

Commands prefixed with "srchost$" done on the source host; those with
"dsthost$" done on the destination host, and I've left bigger gaps
between when transitioning hosts to hopefully make that clearer.

srchost$ sudo lvcreate -L128m -n /dev/slowvg/4ksectortest
  Logical volume "4ksectortest" created.


$ sudo lvcreate -L128m -n /dev/slowvg/4ksectortest
  Logical volume "4ksectortest" created.


srchost$ sudo parted /dev/slowvg/4ksectortest
GNU Parted 3.2
Using /dev/dm-126
Welcome to GNU Parted! Type 'help' to view a list of commands.
(parted) unit s
(parted) mklabel msdos
(parted) mkpart
Partition type?  primary/extended? p
File system type?  [ext2]? ext4
Start? 2048
End? 100%
(parted) p
Model: Linux device-mapper (linear) (dm)
Disk /dev/dm-126: 262144s
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number  Start  End      Size     Type     File system  Flags
 1      2048s  262143s  260096s  primary  ext4         lba
(parted) q
Information: You may need to update /etc/fstab.

srchost$ sudo kpartx -va /dev/slowvg/4ksectortest
add map slowvg-4ksectortest1 (253:127): 0 260096 linear 253:126 2048
srchost$ sudo mkfs.ext4 -L 4ksectortest /dev/mapper/slowvg-4ksectortest1
mke2fs 1.44.5 (15-Dec-2018)
Creating filesystem with 130048 1k blocks and 32512 inodes
Filesystem UUID: c39bf28a-c432-4a2a-9545-5da13b8574f2
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Allocating group tables: done
Writing inode tables: done
Creating journal (4096 blocks): done
Writing superblocks and filesystem accounting information: done

srchost$ sudo sha256sum /dev/mapper/slowvg-4ksectortest1
7e61c1383b3b97db98f1b07022a2a01a926c2f6d98b324b96a83ba9db5eb40b9  /dev/mapper/slowvg-4ksectortest1
srchost$ sudo kpartx -vd /dev/slowvg/4ksectortest
del devmap : slowvg-4ksectortest1
srchost$ sudo fdisk -u -l /dev/slowvg/4ksectortest
Disk /dev/slowvg/4ksectortest: 128 MiB, 134217728 bytes, 262144 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0xa0cd277d

Device                    Boot Start    End Sectors  Size Id Type
/dev/slowvg/4ksectortest1       2048 262143  260096  127M 83 Linux
srchost$ sudo sh -c 'pv < /dev/slowvg/4ksectortest' | sudo ssh root@desthost 'cat > /dev/slowvg/4ksectortest'
 128MiB 0:00:01 [96.0MiB/s] [========================================>] 100%


dsthost$ sudo fdisk -u -l /dev/slowvg/4ksectortest
Disk /dev/slowvg/4ksectortest: 128 MiB, 134217728 bytes, 32768 sectors
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xa0cd277d

Device                    Boot Start    End Sectors  Size Id Type
/dev/slowvg/4ksectortest1       2048 262143  260096 1016M 83 Linux
dsthost$ sudo fdisk -u /dev/slowvg/4ksectortest

Welcome to fdisk (util-linux 2.33.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): d
Selected partition 1
Partition 1 has been deleted.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p):

Using default response p.
Partition number (1-4, default 1):
First sector (256-32767, default 256): 256
Last sector, +/-sectors or +/-size{K,M,G,T,P} (256-32767, default 32767):

Created a new partition 1 of type 'Linux' and of size 127 MiB.
Partition #1 contains a ext4 signature.

Do you want to remove the signature? [Y]es/[N]o: n

Command (m for help): p

Disk /dev/slowvg/4ksectortest: 128 MiB, 134217728 bytes, 32768 sectors
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xa0cd277d

Device                    Boot Start   End Sectors  Size Id Type
/dev/slowvg/4ksectortest1        256 32767   32512  127M 83 Linux
Command (m for help): w
The partition table has been altered.
Failed to remove partition 1 from system: No such device or address
Failed to add partition 1 to system: Invalid argument

The kernel still uses the old partitions. The new table will be used at the next reboot.

Syncing disks.

dsthost$ sudo fdisk -u -l /dev/slowvg/4ksectortest
Disk /dev/slowvg/4ksectortest: 128 MiB, 134217728 bytes, 32768 sectors
Units: sectors of 1 * 4096 = 4096 bytes
Sector size (logical/physical): 4096 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: dos
Disk identifier: 0xa0cd277d

Device                    Boot Start   End Sectors  Size Id Type
/dev/slowvg/4ksectortest1        256 32767   32512  127M 83 Linux
dsthost$ sudo kpartx -v -a /dev/slowvg/4ksectortest
add map slowvg-4ksectortest1 (253:52): 0 260096 linear 253:51 2048
dsthost$ sudo sha256sum /dev/mapper/slowvg-4ksectortest1
7e61c1383b3b97db98f1b07022a2a01a926c2f6d98b324b96a83ba9db5eb40b9  /dev/mapper/slowvg-4ksectortest1
dsthost$ sudo mount /dev/mapper/slowvg-4ksectortest1 /mnt
mount: /mnt: wrong fs type, bad option, bad superblock on /dev/mapper/slowvg-4ksectortest1, missing codepage or helper program, or other error.

So at the end here, despite msdos partition table looking correct,
sha256sum matching and kpartx appearing to work, dsthost can't mount
this filesystem. Did I miss a step or misunderstand?

I wondered if the part about "The kernel still uses the old
partitions" meant that the modified partition table was not being
used, so I tried with a "partprobe /dev/slowvg/4ksectortest" in
there. It did not help. Also, before modifying the partition table
kpartx would not work because it saw a first partition 8x larger
than the drive. After modifying the partition table, kpartx does
work, so from that I conclude that the system is seeing an updated
partition table on that disk image.

Another weird thing:

dsthost$ sudo lvcreate -L128m -n /dev/slowvg/anothertest
  Logical volume "anothertest" created.
dsthost$ sudo sh -c 'pv < /dev/mapper/slowvg-4ksectortest1 > /dev/slowvg/anothertest'
 127MiB 0:00:00 [ 233MiB/s] [========================================>] 100%
dsthost$ sudo mount -v /dev/slowvg/anothertest /mnt
mount: /mnt: wrong fs type, bad option, bad superblock on /dev/mapper/slowvg-anothertest, missing codepage or helper program, or other error.
dsthost$ sudo tune2fs -l /dev/slowvg/anothertest
tune2fs 1.44.5 (15-Dec-2018)
Filesystem volume name:   4ksectortest
Last mounted on:          <not available>
Filesystem UUID:          c39bf28a-c432-4a2a-9545-5da13b8574f2
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype extent 64bit flex_bg sparse_super large_file huge_file dir_nlink extra_isize metadata_csum
Filesystem flags:         signed_directory_hash
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              32512
Block count:              130048
Reserved block count:     6502
Free blocks:              120293
Free inodes:              32501
First block:              1
Block size:               1024
Fragment size:            1024
Group descriptor size:    64
Reserved GDT blocks:      256
Blocks per group:         8192
Fragments per group:      8192
Inodes per group:         2032
Inode blocks per group:   254
Flex block group size:    16
Filesystem created:       Sat Jan 20 04:03:42 2024
Last mount time:          n/a
Last write time:          Sat Jan 20 04:03:42 2024
Mount count:              0
Maximum mount count:      -1
Last checked:             Sat Jan 20 04:03:42 2024
Check interval:           0 (<none>)
Lifetime writes:          4441 kB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:               128
Journal inode:            8
Default directory hash:   half_md4
Directory Hash Seed:      2a074d90-0ade-4dfb-b8f2-3588ffa56cf6
Journal backup:           inode blocks
Checksum type:            crc32c
Checksum:                 0xc7322510

Yet, putting an ext4 fs directly on an LV and shipping that image
across worked when I last tested it, at your suggestion that it
would work.

Thanks,
Andy
