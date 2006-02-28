Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1SFpc101294
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 10:51:38 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1SFpbSW029855
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 10:51:37 -0500
Received: from wolverine (unknown [192.168.0.5])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id 05C3212ED4
	for <linux-lvm@redhat.com>; Tue, 28 Feb 2006 15:51:32 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Situation with PVRESIZE command
Date: Tue, 28 Feb 2006 15:51:30 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <440455E5.4060302@redhat.com>
Message-Id: <20060228155132.05C3212ED4@bluewhale.planbit.co.uk>
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

Hi Patrick,

Thanks for the reply.

Are the different tool releases interchangable and compatible then?  If they
are, it would be a massive advantage.

- Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Patrick Caulfield
> Sent: 28 February 2006 13:54
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Situation with PVRESIZE command
> 
> Roger Lucas wrote:
> > Hi,
> 
> 
> > - Is it possible to re-size a PV whilst the system is online using the
> > 2.01.15 tools?
> >
> > - Is it possible to re-size a PV whilst the system is online using the
> > 2.02.02 tools?
> >
> > - How "stable" are the 2.02.02 tools, and are there any specific bugs in
> > them that may cause problems during typical usage.
> >
> 
> If you're wary of the 2.0.2 tools, then why not resize the pv using 2.02
> but
> leave your existing tools in place ?
> 
> 
> --
> 
> patrick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
