Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m09GeLcX005111
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:40:21 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m09Gdt6D011509
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:39:55 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m09GdmMZ011774
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:39:48 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m09Gdl4j030449
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 11:39:48 -0500
Date: Wed, 9 Jan 2008 11:39:47 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] How to 'copy' a volume?
In-Reply-To: <Pine.GSO.4.58.0801071324210.8567@services.cse.ucsc.edu>
Message-ID: <Pine.LNX.4.44.0801091129390.30292-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 7 Jan 2008, Erich Weiler wrote:

> OK, cool, this worked great!  Was able to dd the contents of one LV to
> another and it worked.
> 
> So the next thing I did was reduce the size of one of the filesystems on
> the Xen VM from 500GB to 5GB.  Then I reduced the size of the Logical
> Volume that the VM was sitting on from 524GB to 30GB.  Again, worked fine,
> still enough space to house all the data in the VM.  The filesystem resize
> worked fine.  Then I rebooted the VM.  Now I'm getting odd error during the
> VM's boot that say something about the disk being not the correct size, or
> something along those lines.
> 
> [root@xenvm ~]# fdisk -l
> 
> Disk /dev/xvda: 32.2 GB, 32212254720 bytes
> 255 heads, 63 sectors/track, 3916 cylinders
> Units = cylinders of 16065 * 512 = 8225280 bytes
> 
>     Device Boot      Start         End      Blocks   Id  System
> /dev/xvda1   *           1          13      104391   83  Linux
> /dev/xvda2              14        1288    10241437+  83  Linux
> /dev/xvda3            1289        2308     8193150   82  Linux swap /
> Solaris
> /dev/xvda4            2309       67620   524618640    5  Extended
> /dev/xvda5            2309       67620   524618608+  83  Linux
> [root@xenvm ~]#
> 
> Notice it says that /dev/xvda is 32.2GB (which is what I want, and is
> correct), but the
> filesystem that I reduced from 500GB to 5GB, /dev/xvda5, is still listed
> as being 524GB, even though it is no longer that big!  Even though the
> filesystem on /dev/xvda5 is just 5GB:

You didn't tell us that the LV you were reducing contained an whole disk
including partition table.  You will need to resize the partition table
also - and I am not aware of any tools to make that easy.  You should
be able to just delete and reallocate the partition from within the VM,
but I haven't tried it.  When resizing the entire disk, you'll need to 
leave plenty of extra room for the other partitions as well.   Sounds
like you did, leaving 25G extra for 18G worth of other partitions.

I generally export an LV for each slice, like this (for xen):

disk       = [ 'phy:mapper/rootvg-USEXP,sda1,w',
               'phy:mapper/rootvg-GENSWAP,sda2,w' ]

As far as I'm concerned, DOS partition tables are obsolete.  I just put
LVM directly onto physical devices and don't bother with partition tables.
The only exception is that most versions of grub in the field still require a 
DOS partition table for a boot partition.  But the latest and greatest
grub understands lvm.  Yay!

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
