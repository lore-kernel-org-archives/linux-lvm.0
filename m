Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA6G7nW7031503
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 11:08:07 -0500
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA6FthVl022224
	for <linux-lvm@redhat.com>; Thu, 6 Nov 2008 10:56:57 -0500
Received: from soda.linbit (office.linbit [86.59.100.100])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id B527F2E2F913
	for <linux-lvm@redhat.com>; Thu,  6 Nov 2008 16:55:41 +0100 (CET)
Date: Thu, 6 Nov 2008 16:55:41 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Subject: Re: [linux-lvm] LVM Mirror question
Message-ID: <20081106155541.GB20418@soda.linbit>
References: <37752EAC00ED92488874A27A4554C2F301849FAE@lzbs6301.na.lzb.hq>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <37752EAC00ED92488874A27A4554C2F301849FAE@lzbs6301.na.lzb.hq>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Wed, Nov 05, 2008 at 05:06:05PM -0500, Scot Kreienkamp wrote:
> Hi Everyone…
> 
>  
> 
> I have a difficult LVM question that I’m wrestling with.  Hopefully someone can
> help.
> 
>  
> 
> I have two hosts with 50 gigs of local RAID5 storage.  (I am using only local
> storage due to performance problems with our SAN, so shared storage is out of
> the picture.)  I have that divided into three LVM partitions on each host, 5
> gigs for /, 5 gigs for swap, and 40 gigs mounted on /var/lib/pgsql.  I need to
> do a real-time mirror of /var/lib/pgsql (LogVol02) to the second host.  I was
> trying to use LVM to do that via Network Block Device.  So on host2 I exported
> LogVol02 via NBD, and imported it into host1.  I then added that to VolGroup00
> and used lvconvert to establish the mirror.  That all worked great.  The
> problem is that I don’t know how to reverse that process then and mount
> LogVol02 in host2 without destroying the partition, with or without NBD; the
> second host doesn’t have any information on the LVM partition so it wouldn’t
> know how to do anything with it.  That’s where I’m stuck.
> 
>  
> 
> Basically what I’m after is I need to do a real-time mirror of the postgres
> database volume to a second host for recovery in case of an emergency.  If
> there’s a way I can use LVM to do this, or if someone can suggest a better way,
> I’m all ears. 

You heard of DRBD?
 http://www.drbd.org

A year from now (or some such) we may have some successor
of DRBD, better integrated with device-mapper and LVM, and
with some additional features -- at least that is the plan.

But right now, I think that just going with DRBD
is your best bet for this exact purpose.
(though obviously I'm biased.)

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD® and LINBIT® are registered trademarks of LINBIT, Austria.
