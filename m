Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7I1NbV24950
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 21:23:38 -0400
Received: from eastrmmtao05.cox.net (eastrmmtao05.cox.net [68.230.240.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7I1NaWW025632
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 21:23:36 -0400
Received: from localhost ([24.250.31.7]) by eastrmmtao05.cox.net
	(InterMail vM.6.01.04.00 201-2131-118-20041027) with ESMTP
	id <20050818012330.TXBS3579.eastrmmtao05.cox.net@localhost>
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 21:23:30 -0400
Received: from chris by localhost with local (Exim 4.43) id 1E5Z9t-0005Mb-Ns
	for linux-lvm@redhat.com; Wed, 17 Aug 2005 21:25:29 -0400
Date: Wed, 17 Aug 2005 21:25:29 -0400
From: Chris Shoemaker <c.shoemaker@cox.net>
Subject: Re: [linux-lvm] 2.00 TB of PV "not usable"?
Message-ID: <20050818012529.GA20615@pe.Belkin>
References: <20050816172537.GA17428@pe.Belkin>
	<20050816173129.GI29587@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050816173129.GI29587@agk.surrey.redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Aug 16, 2005 at 06:31:29PM +0100, Alasdair G Kergon wrote:
> On Tue, Aug 16, 2005 at 01:25:37PM -0400, Chris Shoemaker wrote:
> > My question is: should I be concerned about the "not usable 2.00 TB" part?
> 
> Yes.
> It's probably an indication you're using an old version of the lvm tools
> that doesn't support large devices properly: upgrade!
> IIRC unpatched 2.6.9 also has data corruption issues with large devices.

Ok.  After upgrading the lvm2 tools, it now shows "not usable 0".
That makes me feel a bit better.  Thanks for the advice.

-chris

> 
> Alasdair
> -- 
> agk@redhat.com
