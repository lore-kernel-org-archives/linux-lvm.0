Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6R5mWa26319
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 01:48:32 -0400
Received: from webmail.datafx.com.au (mail03.datafx.com.au [203.149.65.13]
	(may be forged))
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6R5mPXn019007
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 01:48:25 -0400
MIME-Version: 1.0
Content-class: urn:content-classes:message
Subject: RE: [linux-lvm] Change PV size?
Date: Tue, 27 Jul 2004 15:50:55 +1000
Message-ID: <7B5E506659A5D344A505F0F27972D87549CE12@datafx-sbs.DataFX.local>
From: "Michael Bellears" <MBellears@staff.datafx.com.au>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> 
> On Tue, Jul 27, 2004 at 03:21:50PM +1000, Michael Bellears wrote:
> >- Turn off server, add new HD's, boot into HP Top Tools and 
> add the new 
> >drives to the array (Giving additional space).
> you should be able to do this online with the psp
> 
> >- cfdisk(or fdisk), delete the data partition(Making note of the 
> >starting cylinder), then recreate the data partition with the same 
> >starting cylinder, but incorporate the new free space.
> no, just create one more partition with the free space
> >- pvresize? (I do not seem to have this utility?)
> blockdev --rereadpt /dev/cciss/c0d0
> vgextend the volume group with the newly created partition 
> lvextend the logical volume.
> >- xfs_growfs

Excellent!

Thanks very much.

Regards,
MB
