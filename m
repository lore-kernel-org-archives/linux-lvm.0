Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pBTBwbUe009923
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2011 06:58:37 -0500
Received: from mps1.wohnheimg.uni-frankfurt.de
	(mps1.wohnheimg.uni-frankfurt.de [141.2.118.239])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pBTBwYbK025694
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2011 06:58:35 -0500
Received: from localhost ([127.0.0.1] helo=ssl.verfeiert.org)
	by mps1.wohnheimg.uni-frankfurt.de with esmtp (Exim 4.76)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1RgEcy-0005wp-F6
	for linux-lvm@redhat.com; Thu, 29 Dec 2011 12:58:32 +0100
Message-ID: <8a9cc4935a6213d287ddbb04ccd4a51b.squirrel@ssl.verfeiert.org>
In-Reply-To: <CABYYHWFYi0hzVc6Z8BYVYwhZmyFAFroMTi7aQetc72doQw08cw@mail.gmail.com>
References: <CABYYHWFYi0hzVc6Z8BYVYwhZmyFAFroMTi7aQetc72doQw08cw@mail.gmail.com>
Date: Thu, 29 Dec 2011 12:58:32 +0100
From: "Sven Eschenberg" <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] How to find out the location of PE's
Reply-To: sven@whgl.uni-frankfurt.de,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Assuming you used standard config when creating the LVM, you'll find PV
metadata at the very beginning of the disk (an probably nowhere else).

There is no such thing like per PE markers, all information is stored in
the LVM header. Usually though there should be files in /etc holding the
information of the PVs/VGs/LVs as backup - assuming the rest of the disk
layout is still valid (i.e. PV on partition -> partition still exists)

The LVM Metadata is in the second sector (usually) and you should see
something like the string LVM2 and LABELONE (for LVM 2 metadata)

I don't know of any detailed on disk format description (except the source
probably).

Regards

-Sven


On Wed, December 28, 2011 11:03, peter.bieshaar@gmail.com wrote:
> Due to a hardware mistake (dvd and hdu as IDE-master ??) I lost complete
> disk- and therefor lvm administration on SATA disks.
> - In other words I cannot see the partition- or PV/VG and LV
> administration.
> - So, fdisk or (pv|vg|lv)display can't give information.
>
> lvm was initiated under ubuntu 11.04 or 10.10, a recent lvm2 version was
> installed.
>
> On one disk I tried to create a partition (without creating a filesystem
> of-course :) ) but no pv-information was shown, using pvdisplay. I didn't
> dare to do this on my RAID1 (md) disks.
> I can read the disks with strings and dd, and saw content of scripts and
> documents. So the content/data is still on the disks.
>
> My chosen strategy to recover the LV's, is finding the PE's, pickthem
> up and place them in a blob on another filesystem. So I can mount -o loop
> that blob and restructure the disks.
>
> My problem now is how to find these information. The web gives a lot of
> information how to setup, but almost none on technical issues like this.
>
> Can someone give me a hint on how this (the PE's) technically is being
> organized (pointer -> pointer structures??) and where and how to search
> these on the disk. So I can write a C-thingy to accomplish my strategy. If
> someone already has something like this, or examples,
>
> --
> Regards,
>
> Peter Bieshaar
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
