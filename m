Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LIMXa06841
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:22:33 -0400
Received: from volved.com (h0030ab04c826.ne.client2.attbi.com [24.147.129.19])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i6LIMWe1027750
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 14:22:32 -0400
Message-ID: <009701c46f4f$afd72ab0$d301a8c0@monolith>
From: "Barnz" <volve@volved.com>
References: <8CCBDD5583C50E4196F012E79439B45C04C9A463@atl-ms1.megatrends.com>
	<19322.195.50.100.20.1090422741.squirrel@webmail.penguinpowered.org>
Subject: Re: [linux-lvm] Raid 0+1
Date: Wed, 21 Jul 2004 14:22:28 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > The softraid comes with linux does not support resize.
> >
> > Try DM + EVMS. This is much simpler and powerful. You can create Raid
> > over
> > Raid (Any raid level not limited to 0 and 1)
> > The next EVMS release 2.4 scheduled for Aug 2004, has features to
> > resize
> > RAID 1 and 4/5.
> 
> Thanks. I'm replying privately, as I'm not sure if this is relevant to
> the lvm-list :)
> 
> Is there any beta stuff that I can play with now ? If so, where can I
> get hold of it ?
> 

The main EVMS page is: http://evms.sourceforge.net/

and the Device-Mapper Resource page is: http://sources.redhat.com/dm/

Currently there are no v2.4 packages/sources floating around though... :-/

I am very keen to experiment with them too.

-VolVE
