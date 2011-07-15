Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6FN7x9D026787
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 19:07:59 -0400
Received: from new-smtp01.pacifier.net (new-smtp01.pacifier.net
	[64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6FN7wat021025
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 19:07:58 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by new-smtp01.pacifier.net (Postfix) with ESMTPSA id 322952C9FE
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2011 16:07:58 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Fri, 15 Jul 2011 16:07:52 -0700
References: <201107141946.12747.benscott@nwlink.com>
	<201107151301.15551.benscott@nwlink.com>
	<20110715221402.GJ15253@agk-dp.fab.redhat.com>
In-Reply-To: <20110715221402.GJ15253@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201107151607.52297.benscott@nwlink.com>
Subject: Re: [linux-lvm] merging snapshots and lvs bug
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

On July 15 03:14:02 PM Alasdair G Kergon wrote:
> On Fri, Jul 15, 2011 at 01:01:15PM -0700, ben wrote:
> > It isn't a special case. Invalid snaps use capital 'S' in the first
> > column and so do merging snaps. The invalid snap 'S' dates back to old
> > versions of LVM. Here we have three snaps, the first is invalid, the
> > second is merging and the
> 
> > last is normal:
> Oh, yes, I see.  Curiously the man page used to mention that and it got
> replaced with S for merging.
> 
> So do you think we should remove that capitalisation, as per the man page
> I quoted?
> 
> Alasdair

The old meaning seems like unneeded duplication since it is flagged as invalid 
in another column. Also, I actually found it through liblvm2app, so it needs 
to be changed there as well.

Thank you.
