Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLHMkr09940
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 12:22:47 -0500
Received: from ln-bas07.csfb.com (mx-1.csfb.com [198.240.128.80])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBLHMfRj031143
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 12:22:46 -0500
Received: from slon11p30740.csfb.cs-group.com (slon11p30740.csfb.mail
	[166.12.210.47])
	by ln-bas07.csfb.com (Postfix) with ESMTP id B8D912AF2
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 17:22:35 +0000 (GMT)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF01B8@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] lvm/fs issue
Date: Tue, 21 Dec 2004 17:22:23 -0000
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> -----Original Message-----
> From: linux-lvm-bounces@redhat.com
> [mailto:linux-lvm-bounces@redhat.com]On Behalf Of Kevin P. Fleming
> Sent: Tuesday, December 21, 2004 12:11 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] lvm/fs issue
> 
> 
> Rosenstrauch, David wrote:
> 
> > Although I currently have only 1 logical volume, and all my 
> PV's are currently
> > a part of it, that's not necessarily how things will always be.  I
> > intentionally partitioned most of my disk into ~2GB chunks 
> like this, so that
> > I can have a pool of 2GB PV's which I can throw at 
> whichever LV needs it, and
> > thereby rid myself of future space constraint issues I've 
> run into in the past
> > with traditional partitioning.
> 
> But that's the whole point of LVM in the first place!
> 
> If you make a single PV, with a VG including it, you can 
> carve it up and 
> re-carve it up however you like, for whatever LVs you have or 
> create in 
> the future. You can even _shrink_ LVs and make the space available to 
> other LVs, which you cannot do with partitions.


Hmm.  I guess I didn't quite understand that then.  I knew that you could have
a LV that spans multiple PV's (which is what I figured was the whole point of
LVM - you could just keep throwing more PV's at an LV as your space needs
grew), but I didn't know that you could have a PV that gets split across
multiple LV's.  I guess I just assumed (don't know why) that each PV had to be
dedicated to 1 and only 1 LV.

Thanks for setting me straight then.  No real big problem for me the way I
have it now, though.  I guess I might suffer a little bit performance-wise,
but this is my desktop development machine, not a server, so no huge loss.
Good to have my facts straight for the future, though.

Thanks again,

DR

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================
