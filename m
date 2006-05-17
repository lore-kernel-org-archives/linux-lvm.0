Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HFrE3h006556
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 11:53:14 -0400
Received: from wx-out-0102.google.com (wx-out-0102.google.com [66.249.82.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HFqhRh005883
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 11:53:02 -0400
Received: by wx-out-0102.google.com with SMTP id r21so49237wxc
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 08:53:02 -0700 (PDT)
From: "Ricardo Sanchez" <sanchez.ricardo@gmail.com>
Subject: RE: [linux-lvm] Problem doing basic LVM functions
Date: Wed, 17 May 2006 11:52:55 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <29290460.1147875556256.JavaMail.root@web28>
Message-ID: <446b46dd.77df48cd.41ae.27b8@mx.gmail.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Toby

Thanks for the reply. I am not using nbd nodes...the kernel started throwing
out those messages I have never worked with nbd nodes. How can I destroy the
nbd nodes? I just want to start all over again but can't. Every time I try
to do lvm functions, it hangs on those messages.

Thanks

Ricardo

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of tkb9@adelphia.net
Sent: Wednesday, May 17, 2006 10:19 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Problem doing basic LVM functions

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
>  /dev/nb0: read failed after 0 of 4096 at 2199022141440: Input/output
error
>   /dev/nb0: read failed after 0 of 4096 at 0: Input/output error
>   /dev/nb1: read failed after 0 of 4096 at 2199022141440: Input/output
error

Are you trying to use nbd nodes in LVM?

I had the same problem using nbd & LVM. I first had to destroy & recreate
the nbd nodes.  I put each nbd node into a single disk md, & used the md
nodes in my pv & vg. 

Been working fine that way for several months now, although running locate
to find a file would crash the system, so I removed the slocate rpm.

-Toby


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
