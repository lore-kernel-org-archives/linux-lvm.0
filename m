Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i66LHceS014356
	for <linux-lvm@redhat.com>; Tue, 6 Jul 2004 22:17:38 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BhxJq-0000wb-QM
	for linux-lvm@redhat.com; Tue, 06 Jul 2004 22:17:38 +0100
Date: Tue, 6 Jul 2004 22:17:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] dm kernel patch size
Message-ID: <20040706211738.GM30186@agk.surrey.redhat.com>
References: <20040706191502.GL11597@polop.usc.edu>
	<20040706204647.GC1506@chaos.ao.net>
	<20040706205622.GR11597@polop.usc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040706205622.GR11597@polop.usc.edu>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 06, 2004 at 01:56:23PM -0700, Garrick Staples wrote:
> Do the dm targets require the mm patchset?  Is it possible to get _just_ the
> new dm targets?

Yes - instead of applying the entire included -mm patch, take the dm patches 
from the "broken out" version on his website:

  http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/

[Or work from Linus's bk tree, if you just want snapshot and pvmove.]

Alasdair
-- 
agk@redhat.com
