Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24IZtK32148
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 13:35:55 -0500
Received: from dswu26.btconnect.com (dswu26.btconnect.com [193.113.154.27])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j24IZrOo005554
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 13:35:53 -0500
Subject: Re: [linux-lvm] df doesn't display increased available disk space
From: Robert Buick <robert.buick@btconnect.com>
In-Reply-To: <20050303214732.GD4141@pob>
References: <1109885756.6400.16.camel@localhost.localdomain>
	<20050303214732.GD4141@pob>
Date: Fri, 04 Mar 2005 18:35:31 +0000
Message-Id: <1109961331.6079.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: robert.buick@btconnect.com,
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
To: Robin Green <greenrd@greenrd.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

I'm using type 8e, does anyone happen to know if resize2fs is
appropriate for this type; the man page only mentions type2.


On Thu, 2005-03-03 at 21:47 +0000, Robin Green wrote:
> On Thu, Mar 03, 2005 at 09:35:55PM +0000, Robert Buick wrote:
> > I'm running Fedora Core 3 with LVM2, and have added /dev/hda4 (13.09GB)
> > to the VG, however this increase is not reflected if I do a df -h. Have
> > I missed something?
> >
> >[root@stemme mapper]# lvscan
> > ACTIVE            '/dev/VolGroup00/LogVol00' [34.53 GB] inherit
> >  ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
> > [root@stemme mapper]# pvscan
> >  PV /dev/hda2   VG VolGroup00   lvm2 [23.41 GB / 32.00 MB free]
> > PV /dev/hda4   VG VolGroup00   lvm2 [13.09 GB / 0    free]
> > Total: 2 [36.50 GB] / in use: 2 [36.50 GB] / in no VG: 0 [0   ]
> > [root@stemme mapper]# vgscan
> >  Reading all physical volumes.  This may take a while...
> >  Found volume group "VolGroup00" using metadata type lvm2
> > [root@stemme mapper]# df -h
> > Filesystem            Size  Used Avail Use% Mounted on
> > /dev/mapper/VolGroup00-LogVol00
> >                       22G  9.0G   12G  45% /
> > /dev/hda1              99M   22M   73M  23% /boot
> > none                  760M     0  760M   0% /dev/shm

> Yes - you need to resize the filesystem as well.
> 
> If you are using an ext2 or ext3 filesystem you could use resize2fs. If you
> are using reiserfs, you could use resize_reiserfs. I don't know about resize
> tools for other filesystems.
> 
> Please note that resize2fs in Fedora Core 3 is buggy, and may corrupt the
> resize inode. To get a version that works better, I recommend you download and build
> from source e2fsprogs 1.36 from http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.36.tar.gz
> 
> (If you wanted to avoid using resize2fs altogether, you could of course
> backup all your data in /, mke2fs the root filesystem, and copy all the data
> back again. But that would be much slower.)
