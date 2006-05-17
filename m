Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HEJg2F010237
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:19:42 -0400
Received: from mta1.adelphia.net (mta1.adelphia.net [68.168.78.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HEJWbd009606
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:19:32 -0400
Received: from web28 ([68.168.75.72]) by mta13.adelphia.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20060517141916.KVXV9479.mta13.adelphia.net@web28>
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 10:19:16 -0400
Message-ID: <29290460.1147875556256.JavaMail.root@web28>
Date: Wed, 17 May 2006 10:19:16 -0400
From: tkb9@adelphia.net
Subject: Re: [linux-lvm] Problem doing basic LVM functions
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

---- Ricardo Sanchez <sanchez.ricardo@gmail.com> wrote: 
> I created a basic volume group named "uservg" and added two PVs to it
> successfully.
> 
> After doing this, I deleted the partitions to the disks...
> Every time I try to do a vgscan or vgremove it gives the following output:
> 
> nbd0: Attempted send on closed socket
> end_request: I/O Error, dev nbd0, sector 0
> printk: 7 messages suppressed.
> Buffer  I/O Error on device nbd0, logical block 0
> Buffer  I/O Error on device nbd0, logical block 1
> Buffer  I/O Error on device nbd0, logical block 2
> nbd0: Attempted send on closed socket
> /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
>  /dev/nb0: read failed after 0 of 4096 at 2199022141440: Input/output error
>   /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
>   /dev/nb1: read failed after 0 of 4096 at 2199022141440: Input/output error

Are you trying to use nbd nodes in LVM?

I had the same problem using nbd & LVM. I first had to destroy & recreate the nbd nodes.  I put each nbd node into a single disk md, & used the md nodes in my pv & vg. 

Been working fine that way for several months now, although running locate to find a file would crash the system, so I removed the slocate rpm.

-Toby
