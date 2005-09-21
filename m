Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8LKsJV04020
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 16:54:19 -0400
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8LKsHOP032315
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 16:54:17 -0400
Received: from barkeeper1 (213-229-1-138.sdsl-line.inode.at [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id D55AD14F10
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2005 22:54:02 +0200 (CEST)
Date: Wed, 21 Sep 2005 22:54:02 +0200
From: Lars Ellenberg <Lars.Ellenberg@linbit.com>
Subject: Re: [linux-lvm] Directly using a logical volume
Message-ID: <20050921205402.GG16203@barkeeper1.linbit>
References: <C28DB247D333BC47BBAAFDC914DE39010261F5DE@atlexc07ntms.mckesson.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C28DB247D333BC47BBAAFDC914DE39010261F5DE@atlexc07ntms.mckesson.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

/ 2005-09-21 13:23:40 -0400
\ Allen, Jack:
> From: Lars Ellenberg [mailto:Lars.Ellenberg@linbit.com] 
> Sent: Wednesday, September 21, 2005 8:58 AM
> / 2005-09-20 16:14:25 -0400
> \ Allen, Jack:
> >         I have a system connected to a SAN via Fibre Channel interface.
> > The system sees 3 disk sdb, sdc and sdd. I put them in a volume group
> > and then allocated some logical volumes. If I use the logical volume to
> > read and write to directly for my application, if there is an error on a
> > write, I assume the write system call will return an error. Or does the
> > write give a good return value after putting the data in some system
> > buffer to be written later? Then is the write of the system buffer fails
> > later, my program would not know.
> 
> not exactly a linux-lvm question, is it?
> 
> man 2 write
> man 2 fsync
> man 3 open       (O_SYNC)

> I have read the man pages and that would be "man 2 open". The O_SYNC seems

man 3 open happened to be the open (POSIX) man page here.

> to only work for a regular file not a block device as the logical volume is.

to the best of my knowledge, the O_SYNC works on block devices, too.

> This was part of the reason for my questions. On UNIX systems we use the
> character device name and the O_SYNC does what you think it would there.

there is also O_DIRECT, which might be more what you want to use.
and there is the "raw" interface, too
(which is deprecated, afaik, at least in 2.6 kernels, where you should
use O_DIRECT instead).

> I
> know this is Linux and some things are different. Again the reason for my
> questions. And yes it could be a linux-lvm question if the block device
> presented by LVM works differently than a true SCSI block device. Again the
> reason for the questions.

did not mean to offend you.
this is all abstracted in the generic block device layer,
so it does not make a difference whether it is ide/sata/scsi/lvm.

I'd recommend you use O_DIRECT|O_SYNC, then.
note that this implies buffer allignment restrictions.

this should just work as described by you.
still it probably does not hurt to have fsync in the code where appropriate.

cheers,

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
