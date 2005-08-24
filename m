Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7ODumV27265
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:56:48 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7ODulRH019664
	for <linux-lvm@redhat.com>; Wed, 24 Aug 2005 09:56:47 -0400
Subject: Re: [linux-lvm] multiple snapshots
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <430C7AA0.4010000@astral.ro>
References: <4300816B.8060208@astral.ro> <430189C1.8030000@astral.ro>
	<430192F7.5010801@astral.ro> <430B25B9.8060207@astral.ro>
	<20050823171301.GA8612@kaliba.pf.mhnet.de> <430C7AA0.4010000@astral.ro>
Date: Wed, 24 Aug 2005 09:56:43 -0400
Message-Id: <1124891803.5550.50.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
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

lvm snapshot is known to be unstable so far. if u have interest to
search the archival, there are many discussion on this.

lvm people has plan to stabilize it but with a lower priority than other
tasks. so we can only wait and hope it can be done soon or we can
petition to get it faster. :P

ming



On Wed, 2005-08-24 at 16:48 +0300, Imre Gergely wrote:
> Micha Holzmann wrote:
> > Imre Gergely wrote:
> > 
> >>anybody anything? i still have this problem... the main question is: can
> >>one have multiple snapshots of the same LV, without problems? with one
> >>snapshot e ok, but as soon as i create another snapshot, and try to do
> >>something on the origin LV, it hangs, it oops-es.
> > 
> > 
> > Same on my machines, if more than one snapshot the system freezes after
> > a little time totally. Even the shutdown command does not work. I can
> > login via ssh an can see as many shutdown processes in ps list as i
> > issued. At the moment i assume that snapshots are not working as
> > expected or announced in the doku. These are my observations.
> 
> i tried on a real machine, the same thing happened. the only thing
> different is that i don't see any oopses, or any error messages
> indicating that something is wrong...
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
