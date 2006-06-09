Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k598W299008428
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 04:32:02 -0400
Received: from ender.volumehost.net (adsl-69-154-123-202.dsl.fyvlar.swbell.net
	[69.154.123.202])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k598Vujx018333
	for <linux-lvm@redhat.com>; Fri, 9 Jun 2006 04:31:56 -0400
Received: from localhost (localhost [127.0.0.1])
	by ender.volumehost.net (Postfix) with ESMTP id 20A2716487
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 08:31:18 +0000 (UTC)
Received: from ender.volumehost.net ([127.0.0.1])
	by localhost (ender.volumehost.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 08207-02 for <linux-lvm@redhat.com>;
	Fri,  9 Jun 2006 08:31:17 +0000 (UTC)
Received: from ath600.krakrjak.com (ip70-178-219-238.ks.ks.cox.net
	[70.178.219.238])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ender.volumehost.net (Postfix) with ESMTP id B5E4716460
	for <linux-lvm@redhat.com>; Fri,  9 Jun 2006 08:31:15 +0000 (UTC)
From: Zac Slade <krakrjak@volumehost.net>
Subject: Re: [linux-lvm] Is it better to use partitions or entire disk for LVM?
Date: Fri, 9 Jun 2006 03:31:46 -0500
References: <1cbd6f830606040746j5af7c102y75d13748e4d2c627@mail.gmail.com>
	<20060605223153.GA21795@redhat.com>
	<1149547428.14842.502.camel@server.ak.quickcircuit.co.nz>
In-Reply-To: <1149547428.14842.502.camel@server.ak.quickcircuit.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200606090331.46197.krakrjak@volumehost.net>
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

On Monday 05 June 2006 17:43, Mario Becroft (mailing list) wrote:
> On Tue, 2006-06-06 at 00:31 +0200, Heinz Mauelshagen wrote:
> > On Sun, Jun 04, 2006 at 10:46:45AM -0400, Mag Gam wrote:
> > > Is it better to create 1 partition on a disk, and use that into the
> > > LVM, or have a blank disk, and use that in the LVM (if possible)?
I prefer full disks where possible.  Unless you have to boot from it there is 
no need for a partition table.

> Another reason for creating a partition (perhaps a silly one, but I have
> found it useful) is that discs from different vendors (or even the same
> vendor) that are supposedly the same size often vary slightly, so I find
> it useful to create a partition slightly smaller than the total size of
> the disc. This is a little wasteful of space, but means that if I need
> to drop in a replacement disc that is slightly smaller than the original
> one, I can just copy an image of the old disc and it will generally
> work--otherwise I would have to fiddle around with whatever was near the
> end of the old disc.
Yeah it is a little silly.  If the disk is good enough to image it's probably 
good enough to pvmove off of.  If that's the case take the new disk pvcreate 
it, add it to the volume group and pvmove /dev/old /dev/new once that 
completes just vgremove the old one.  Works like a champ.  If you run into 
problems wholesale pvmoving you can go to pvmove by extent.  Like I said 
above, unless you have to boot from the disk there is no need for partition 
tables.

-- 
Zac Slade
krakrjak@volumehost.net
ICQ:1415282 YM:krakrjak AIM:ttyp99
