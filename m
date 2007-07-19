Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6JEqF16026371
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:52:15 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l6JEqDId007929
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:52:14 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l6JEq88j010650
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:52:08 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l6JEq8Bh006686
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 10:52:08 -0400
Date: Thu, 19 Jul 2007 10:52:08 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] snapshots can't be deactivated
In-Reply-To: <200707181337.58651.joachimbanzhaf@compuserve.de>
Message-ID: <Pine.LNX.4.44.0707191047010.6647-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 18 Jul 2007, Joachim Banzhaf wrote:

> > Are my steps right in principle? Did I forget to do something before or
> > after removing?
> 
> I am by no means an expert on lvm, so dont take this too seriously: shouldn't 
> there be an lvchange -an yourlv before lvremove? Maybe this active status is 
> still hanging around somewhere although you can force the remove?

When I try lvchange -an C4_SNAP, it always fails.  So I have had to force
the lvremove in the backup script.  I am nervous about this, and already asked
why this is the case.  When reading about the "active" flag, it seems
to have something to do with shared SAN storage volume groups, so perhaps we
are not supposed to deactivate LVs for simple single machine systems.  But the
error from lvremove is disconcerting.  If I force it, what if there is
a *different* error that I really *don't* want to force?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
