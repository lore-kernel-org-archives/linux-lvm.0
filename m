Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1OGZbK10293
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 11:35:37 -0500
Received: from ns3.linuxquebec.com (ns3.linuxquebec.com [64.40.111.7])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1OGZVKZ021895
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 11:35:32 -0500
Received: from ns2.linuxquebec.com (unknown [64.18.178.21])
	by ns3.linuxquebec.com (Postfix) with ESMTP id 70E2D2B809F
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 11:44:53 -0500 (EST)
Received: from aragorn.intranet (unknown [10.10.1.116])
	by ns2.linuxquebec.com (Postfix) with ESMTP id 22E0813ED8
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2005 11:31:27 -0500 (EST)
Subject: Re: [linux-lvm] lvm liveCD help needed
From: Paul Pianta <pantz@lqt.ca>
In-Reply-To: <1109256193.4695.70.camel@aragorn.intranet>
References: <1109195021.4695.65.camel@aragorn.intranet>
	<20050224083503.GD7705@dogbert>  <20050224093908.GG7705@dogbert>
	<1109256193.4695.70.camel@aragorn.intranet>
Date: Thu, 24 Feb 2005 11:35:22 -0500
Message-Id: <1109262922.4695.74.camel@aragorn.intranet>
Mime-Version: 1.0
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

On Thu, 2005-02-24 at 09:43 -0500, Paul Pianta wrote:
> On Thu, 2005-02-24 at 10:39 +0100, Fred Donck wrote:
> 
> > forgot to mentions few things:
> > 
> > o) make sure you have latest available version of lvm2 from gentoo using
> >    ACCEPT_KEYWORDS="~x86" emerge lvm2
> 
> Thanks for the pointer to the how-to Fred. I am trying the above command
> once booted into the live cd but it is telling me that it can't find
> 'emerge'.
> 
> Is there something that I need to do to enable emerge capability on the
> live cd before being able to use it?
> 
> #ls -l /usr/bin/emerge
> /usr/bin/emerge -> ../lib/portage/bin/emerge
> 
> but when I list /usr/lib/portage there is nothing there!
> 
> Sorry I am a bit of a gentoob ... any ideas how to get emerge working on
> the live cd?

Don't worry about it - I used the version of lvm that comes on the
2004.3 livecd and all went well - only to discover that FC1 doesn't
support lvm2 so when I booted back into FC1 it didn't recognise my lvm
partitions and so didn't boot any further ...

Not to worry - I just learnt lots about software raid and lvm2 from the
gentoo how-to! 

thanks again

pantz
