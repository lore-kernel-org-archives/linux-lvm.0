Message-Id: <25E4CA13D679FF48BC30769420220971467A39@nd1-clusa.local.bunnings.com.au>
From: Colin Coe <CCoe@bunnings.com.au>
Subject: RE: [linux-lvm] Implementation questions
MIME-Version: 1.0
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
Date: Tue Dec 18 22:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Thanks for the responses.  I didn't properly explain the problem properly.
The real problem is getting the LVM installed on to /dev/md0 where /dev/md0
is /dev/hda1 and /dev/hdc1.  I'm still trying to get the first (test) box up
and going properly.

The wishlist
- make the 2 x 20GB drives into /dev/hd[ac]1 partitioned to use the whole
disk
- make /dev/md0 (RAID1) contain both disks
- use pvcreate /dev/md0
- use vgcreate rootvg /dev/md0
- lvcreate ...
- mkfs.xfs /dev/rootvg/...

I don't mind if the setup procedure for the first (test) machine is dodgy
and convoluted, as pointed out I should be able to use Ghost or some other
method to roll the other machines out after.

TIA

CC

> -----Original Message-----
> From:	mitch@mdmiller.com [SMTP:mitch@mdmiller.com]
> Sent:	Tuesday, December 18, 2001 10:04 PM
> To:	linux-lvm@sistina.com
> Subject:	Re: [linux-lvm] Implementation questions
> 
> Doesn't Ghost support Linux / LILO configurations?  That would allow you
> to configure up one PC, and duplicate it to 129 others, and it's VERY
> quick.  You do, however, still have to make any individualized changes to
> each one after the duplication.
> 
> -- Mitch
> 
> 
> 
> On Tue, 18 Dec 2001, Lewis Bergman wrote:
> 
> > > As I have about 130 of these to do, I am toying with the idea of
> installing
> > > a cut-down Linux system with XFS, LAM, md and ramdisk support and
> making a
> > > bootable CD-ROM which I can then use to configure the system how I
> want it.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

**************************************************************************
Bunnings Legal Disclaimer: 

1) 	This document is confidential and may contain legally privileged 
	information. If you are not the intended recipient you must not 
	read, copy, distribute or act in reliance on it.
	If you have received this document in error, please telephone
	us immediately on (08) 9365-1555. 

2)	All e-mails sent to and sent from Bunnings Building Supplies are
	scanned for content. Any material deemed to contain inappropriate
	subject matter will be reported to the e-mail administrator of
	all parties concerned.

**************************************************************************
