Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1IEHQ128963
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 09:17:26 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1IEHPwQ021013
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 09:17:25 -0500
Received: from wolverine (wolverine.planbit.co.uk [192.168.0.104])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 650BF12EC9
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2006 14:16:58 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Booting into LVM - RESOLVED
Date: Sat, 18 Feb 2006 14:17:20 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: 
Message-Id: <20060218141658.650BF12EC9@bluewhale.planbit.co.uk>
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

Thought I'd post my solution.  Well, it isn't mine at all really.  Thanks go
to Miguel Cabeca and Jeffrey Layton for it.

http://poochiereds.net/svn/lvm2/lvm2create_initrd

The above link is to an "initrd" creation script that worked perfectly on my
Debian box.  This resolves the whole "no devfs" problem.

Thanks also to the people on the LVM mailing list for their very quick help
which directed me to the above solution.

> -----Original Message-----
> From: Roger Lucas [mailto:roger@planbit.co.uk]
> Sent: 17 February 2006 14:51
> To: 'LVM general discussion and development'
> Subject: RE: [linux-lvm] Booting into LVM
> 
> Hi Graham,
> 
> Thanks for the quick reply.  I had missed the whole "no devfs if >=
> 2.6.14" problem, although significant Google-ing had already been done :-)
> 
> I'm following through everything now.
> 
> Thanks again,
> 
> Roger
> 
> > -----Original Message-----
> > From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> > On Behalf Of Graham Wood
> > Sent: 17 February 2006 14:12
> > To: LVM general discussion and development
> > Subject: Re: [linux-lvm] Booting into LVM
> >
> > Roger Lucas wrote:
> > > My guess is that LVM isn't being loaded/started/configured correctly
> at
> > boot
> > > time or that there is some problem with "/dev"...
> > >
> > > Can anyone shed any light on this?
> > >
> > I believe that 2.6.14 is after devfs stopped being supported, so you're
> > going to have to go with udev instead - which also means that mkinitrd
> > isn't going to work either.  (I think there's lvm2 compatability issues
> > as well, but I just went for Sid instead of trying to get sarge working
> > with a new kernel)
> >
> > If you google for 'debian sarge udev' there are quite a few pages that
> > give details about what needs to be done - although they may not be
> > exactly what you're after...
> >
> > If that isn't the answer then I'm sure we can help you work through it
> :)
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
