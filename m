Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1TKEPgS022323
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 15:14:25 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JVBcf-0006NL-9K
	for linux-lvm@redhat.com; Fri, 29 Feb 2008 20:14:25 +0000
Date: Fri, 29 Feb 2008 20:14:25 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
Message-ID: <20080229201425.GK1788@agk.fab.redhat.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
	<20080229183148.GI1788@agk.fab.redhat.com>
	<1204312265.5850.7.camel@error-messages.mit.edu>
	<47C8589A.7000309@redhat.com>
	<1204313716.5850.12.camel@error-messages.mit.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1204313716.5850.12.camel@error-messages.mit.edu>
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

On Fri, Feb 29, 2008 at 02:35:16PM -0500, Greg Hudson wrote:
> On Fri, 2008-02-29 at 19:10 +0000, Bryn M. Reeves wrote:
> > Greg Hudson wrote:

> Thank you!  Verified that freeing the page cache causes the
> apparently-corrupted file's md5sum to revert to the correct value:

I notice this is ubuntu: Can you eliminate the distribution, by
reproducing on a different distribution, or using a current upstream
development kernel like 2.6.25-rc3?

What is /tmp ?

Alasdair
-- 
agk@redhat.com
