Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FMwQr13484
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 18:58:26 -0400
Received: from hotmail.com (bay17-f9.bay17.hotmail.com [64.4.43.59])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9FMwEPI019891
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 18:58:19 -0400
From: "Kai Leibrandt" <k_leibrandt@hotmail.com>
Subject: RE: [linux-lvm] Re: [OxLUG] LVM2 problems
Date: Sat, 16 Oct 2004 00:57:22 +0200
Mime-Version: 1.0
Message-ID: <BAY17-F9oHzGkzMcvsq00073cf9@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

> > > Our primary problem is that creating snapshots occassionally hangs the
> > > machine.
> >
> > Known issue now - unfortunately the fix involves a lot of coding and
> > other things have a higher priority at the moment.
>
>OK - I saw a previous post about this, but from that I wasn't sure that
>it (a) killed the machine and (b) affected ext3 partitions.

It _is_ a problem with LVM2, and for me it's totally reproducible - with 
ext3, ext2 and xfs, but only on / LV's. I am slightly saddened by the fact 
that this has low pri at the moment though :-(
I am more than willing to shoot my testbed down a few times for anyone who's 
willing to help.

Kai.

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.com/
