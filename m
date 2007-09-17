Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l8HLB7o5009292
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2007 17:11:07 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IXNs3-0005Y6-2m
	for linux-lvm@redhat.com; Mon, 17 Sep 2007 22:11:07 +0100
Date: Mon, 17 Sep 2007 22:11:06 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Any exiisting users of existing LVM2 command line
	library interface (lvm2cmd.h)?
Message-ID: <20070917211106.GS18444@agk.fab.redhat.com>
References: <1189521146.4451.17.camel@linux-cxyg> <46E6A8DB.6040802@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <46E6A8DB.6040802@redhat.com>
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

On Tue, Sep 11, 2007 at 10:40:27AM -0400, James Parsons wrote:
> Dave Wysochanski wrote:
> >A new LVM2 API library is in progress.

> Maintaining compatibility with the current CLI for a few releases of the 
> new CLI would be a nice gift to us!
 
This is about a new *library* (.so) not the command line.

The existing liblvm2cmd will remain.

There are no plans to break the existing command line interface,
though it will continue to evolve and some adjustments might
be needed from time to time.

Alasdair
-- 
agk@redhat.com
