Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1HEpA117874
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:51:10 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1HEp90q024205
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 09:51:09 -0500
Received: from wolverine (wolverine.planbit.co.uk [192.168.0.104])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 9354312EC7
	for <linux-lvm@redhat.com>; Fri, 17 Feb 2006 14:50:37 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Booting into LVM
Date: Fri, 17 Feb 2006 14:50:58 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <43F5D9A6.5000008@dragonhold.org>
Message-Id: <20060217145037.9354312EC7@bluewhale.planbit.co.uk>
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

Hi Graham,

Thanks for the quick reply.  I had missed the whole "no devfs if >= 2.6.14"
problem, although significant Google-ing had already been done :-)

I'm following through everything now.

Thanks again,

Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Graham Wood
> Sent: 17 February 2006 14:12
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Booting into LVM
> 
> Roger Lucas wrote:
> > My guess is that LVM isn't being loaded/started/configured correctly at
> boot
> > time or that there is some problem with "/dev"...
> >
> > Can anyone shed any light on this?
> >
> I believe that 2.6.14 is after devfs stopped being supported, so you're
> going to have to go with udev instead - which also means that mkinitrd
> isn't going to work either.  (I think there's lvm2 compatability issues
> as well, but I just went for Sid instead of trying to get sarge working
> with a new kernel)
> 
> If you google for 'debian sarge udev' there are quite a few pages that
> give details about what needs to be done - although they may not be
> exactly what you're after...
> 
> If that isn't the answer then I'm sure we can help you work through it :)
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
