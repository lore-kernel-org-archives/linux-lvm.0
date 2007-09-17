Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l8HLNK7M010784
	for <linux-lvm@redhat.com>; Mon, 17 Sep 2007 17:23:20 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IXO3s-0005ZH-FP
	for linux-lvm@redhat.com; Mon, 17 Sep 2007 22:23:20 +0100
Date: Mon, 17 Sep 2007 22:23:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Can LVM block I/O and hang a system?
Message-ID: <20070917212320.GU18444@agk.fab.redhat.com>
References: <a06240411c30cd5dee72c@[129.98.90.227]>
	<20070912101543.GA10093@barkeeper1.linbit>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20070912101543.GA10093@barkeeper1.linbit>
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

On Wed, Sep 12, 2007 at 12:15:43PM +0200, Lars Ellenberg wrote:
> then, if there are still lockups, these may be caused by lvm, and may be
> due to some similar problem, namely doing synchronous (housekeeping) io
> from within the generic_make_request path within the same "thread".
 
We moved the housekeeping out of the way, but there can still be
problems when an incoming piece of I/O needs to be split between
devices.

Alasdair
-- 
agk@redhat.com
