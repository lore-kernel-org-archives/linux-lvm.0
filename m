Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mB57M6qp015758
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 02:22:06 -0500
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.192])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mB57Jw9s001750
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2008 02:20:12 -0500
Received: from [125.60.243.116] (helo=[10.92.1.100])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.69)
	(envelope-from <echo@echoreply.us>) id 1L8V0P-0000qY-Eu
	for linux-lvm@redhat.com; Fri, 05 Dec 2008 02:21:42 -0500
Subject: Re: [linux-lvm] Limiting i/o bandwith for pvmove?
From: Tim Post <echo@echoreply.us>
In-Reply-To: <20081205022403.GU26097@agk.fab.redhat.com>
References: <20081204212123.GV2700@ppc.in-berlin.de>
	<20081205022403.GU26097@agk.fab.redhat.com>
Date: Fri, 05 Dec 2008 15:19:46 +0800
Message-Id: <1228461586.5919.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Fri, 2008-12-05 at 02:24 +0000, Alasdair G Kergon wrote:
> On Thu, Dec 04, 2008 at 10:21:23PM +0100, Philipp Schmidt wrote:
> > Is there a way to limit the bandwidth usage of pvmove, like it is
> > possible when reconstructing software raid mirris sets?
>  
> I wish there was!  This problem annoys me too but nobody's been bothered 
> enough about it to come up with a workaround yet...
> 
> (Maybe something could even be hacked together using ioband.)
> 
> Alasdair

I have had some success ensuring disk QoS using dm-ioband with XEN
guests, but only on relatively ancient kernels (and versions of
dm-ioband) so my results are inherently questionable.

I think ioband would work for this, the problem is its very difficult to
construct test case scenarios like the one mentioned in this thread.

One would need machines of various architectures, chocked full of disks
and programs to reproduce these types of scenarios. Ideally, you have
half a dozen RAID cards to try, too. 

This is a cause that I really hope to see companies who make storage
solutions pick up, but none (to my knowledge) have.

Cheers,
--Tim
