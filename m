Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HGaCXK019119
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:36:12 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HGa5P4018886
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:36:05 -0400
Subject: RE: [linux-lvm] Problem doing basic LVM functions
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <446b46dd.77df48cd.41ae.27b8@mx.gmail.com>
References: <446b46dd.77df48cd.41ae.27b8@mx.gmail.com>
Date: Wed, 17 May 2006 12:35:46 -0400
Message-Id: <1147883746.6409.132.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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
To: LVM general discussion and development <linux-lvm@redhat.com>

blind guess, lvm sometime do block device scan and search for metadata,
u happen to have nbd module available or compiled in kernel. so if you
set a skip list for all u nbd devices, or disable the nbd in u kernel, u
might be able to solve this.

but nbd code should check if nbdX is configured or not.

ming


On Wed, 2006-05-17 at 11:52 -0400, Ricardo Sanchez wrote:
> Toby
> 
> Thanks for the reply. I am not using nbd nodes...the kernel started throwing
> out those messages I have never worked with nbd nodes. How can I destroy the
> nbd nodes? I just want to start all over again but can't. Every time I try
> to do lvm functions, it hangs on those messages.
> 
> Thanks
> 
> Ricardo
> 
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
> Behalf Of tkb9@adelphia.net
> Sent: Wednesday, May 17, 2006 10:19 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Problem doing basic LVM functions
> 
> ---- Ricardo Sanchez <sanchez.ricardo@gmail.com> wrote: 
> > I created a basic volume group named "uservg" and added two PVs to it
> > successfully.
> > 
> > After doing this, I deleted the partitions to the disks...
> > Every time I try to do a vgscan or vgremove it gives the following output:
> > 
> > nbd0: Attempted send on closed socket
> > end_request: I/O Error, dev nbd0, sector 0
> > printk: 7 messages suppressed.
> > Buffer  I/O Error on device nbd0, logical block 0
> > Buffer  I/O Error on device nbd0, logical block 1
> > Buffer  I/O Error on device nbd0, logical block 2
> > nbd0: Attempted send on closed socket
> > /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
> >  /dev/nb0: read failed after 0 of 4096 at 2199022141440: Input/output
> error
> >   /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
> >   /dev/nb1: read failed after 0 of 4096 at 2199022141440: Input/output
> error
> 
> Are you trying to use nbd nodes in LVM?
> 
> I had the same problem using nbd & LVM. I first had to destroy & recreate
> the nbd nodes.  I put each nbd node into a single disk md, & used the md
> nodes in my pv & vg. 
> 
> Been working fine that way for several months now, although running locate
> to find a file would crash the system, so I removed the slocate rpm.
> 
> -Toby
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
