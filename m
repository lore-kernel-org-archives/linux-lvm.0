Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CGJ9rx006044
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 12:19:09 -0400
Received: from mail3.ucc.ie (mail3.ucc.ie [143.239.128.103])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4CGJ2Zd008251
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 12:19:03 -0400
Received: from morpheus.ucc.ie
	(IDENT:U2FsdGVkX1+73Z+PWifT/maSs9oHOIMSAntJtAh6dic@morpheus.ucc.ie
	[143.239.183.39])
	by mail3.ucc.ie (8.13.6/8.13.6) with ESMTP id k4CGIlXF020049
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 17:18:53 +0100
From: Marcus Claesson <m.claesson@student.ucc.ie>
Date: Fri, 12 May 2006 17:18:48 +0100
Message-Id: <1147450728.8248.127.camel@morpheus.ucc.ie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't reduce lvm2 volume. I get "Volume group mapper
	doesn't exist"
Reply-To: m.claesson@student.ucc.ie,
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

Hi!

I have a problem reducing a logical volume and I'm sure it's just some
silly error, but I can't get my head around it.

I've got lvm2-2.02.01-1.3.RHEL4 installed on kernel-2.6.9-34.ELsmp.

This is what I got mounted:

# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/cciss/c0d0p2      49G   20G   27G  42% /
/dev/cciss/c0d0p1      99M  9.8M   84M  11% /boot
/dev/mapper/Volume00-LogVol00
                       97G   84G  8.1G  92% /home
none                  2.9G     0  2.9G   0% /dev/shm
/dev/mapper/Volume00-LogVol02
                       97G   11G   81G  12% /usr/local
/dev/mapper/Volume00-LogVol01
                       97G   84G  8.3G  91% /var

I want to shrink /dev/mapper/Volume00-LogVol02 from 97G to 20G, and this
is what I tried.

# umount /dev/mapper/Volume00-LogVol02

# e2fsck -f /dev/mapper/Volume00-LogVol02
e2fsck 1.35 (28-Feb-2004)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/mapper/Volume00-LogVol02: 56614/12812288 files (1.5% non-
contiguous), 3099826/25600000 blocks

# resize2fs -p /dev/mapper/Volume00-LogVol02 20G
resize2fs 1.35 (28-Feb-2004)
Resizing the filesystem on /dev/mapper/Volume00-LogVol02 to 5242880 (4k)
blocks.
Begin pass 2 (max = 1787074)
Relocating blocks             XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 3 (max = 782)
Scanning inode table          XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 4 (max = 2690)
Updating inode references     XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXThe
filesystem on /dev/mapper/Volume00-LogVol02 is now 5242880 blocks long.

But here I get error messages:
# lvreduce -L 20G -v /dev/mapper/Volume00-LogVol02
    Finding volume group mapper
    Wiping cache of LVM-capable devices
  Volume group mapper doesn't exist

I also tried:
# lvresize -L 20G -v /dev/mapper/Volume00-LogVol02
    Finding volume group mapper
    Wiping cache of LVM-capable devices
  Volume group mapper doesn't exist

I then mounted the device again and saw it was 20G big. But no more
extra size had been added to the volume group...

What am I doing wrong???

Really appreciate any help!

Regards,
Marcus
