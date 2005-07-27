Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6RD6PV06735
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 09:06:25 -0400
Received: from aragorn.bbn.com (aragorn.bbn.com [128.33.0.62])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6RD6Hh4026553
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 09:06:22 -0400
Message-ID: <42E786B9.2080400@mattgillen.net>
Date: Wed, 27 Jul 2005 09:06:01 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring a Drive for load-balancing AND failover
References: <ca4f7e300507270144720cef7b@mail.gmail.com>
In-Reply-To: <ca4f7e300507270144720cef7b@mail.gmail.com>
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
To: Fury <furiosod@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Fury wrote:
> I've racked my brain on this one, so hopefully someone will be of some help.
> 
> I'm trying to set up two servers which share a drive and do not have a
> Single Point of Failure.  They are on a local network with each other.
>  The best solution would be to have /dev/sda1 on one server mirrored
> with /dev/sda1 on the second server.
> ...
> A second solution was to use GFS/GNBD.  I can export each drive to the
> other server, and do RAID 1 (on both servers) between the local
> /dev/sda1 and the remote gnbd device.  I then format the raid device
> with GFS so both servers can mount it.
> 
> Surprisingly, this last system works.  Both systems can mount the
> drive and read-write to it.  However, if either server in this
> configuration drops dead, the other server cannot deal with the dead
> gnbd device, and the raid device and mount point are no longer usable.
>  I'm sure there are numerous other problems with this setup, also.
> 
> So I'm looking for ideas.  With two servers, how can I mirror a drive
> in real-time, and allow for failover?

You might want to use something more like iSCSI + RAID:
http://linux-iscsi.sourceforge.net/

--Matt
