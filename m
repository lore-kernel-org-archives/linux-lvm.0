Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5KJrGj2006275
	for <linux-lvm@redhat.com>; Sun, 20 Jun 2004 20:53:16 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Bc8NQ-0000oo-Gv
	for linux-lvm@redhat.com; Sun, 20 Jun 2004 20:53:16 +0100
Date: Sun, 20 Jun 2004 20:53:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
Message-ID: <20040620195316.GT6302@agk.surrey.redhat.com>
References: <40C86F52.4090500@dgreaves.com>
	<200406101105.47606.StuartHarper@tampabay.rr.com>
	<40C87F8A.7080304@dgreaves.com>
	<1086885029.13087.15.camel@localhost>
	<40D5D4D6.9020307@dgreaves.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40D5D4D6.9020307@dgreaves.com>
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

On Sun, Jun 20, 2004 at 07:17:58PM +0100, David Greaves wrote:
> No-one ever replied as to why blockdev --setra / --getra is not the same 
> as that displayed in lvdisplay
> And it's not documented that I can find. There's a comment: "Not used by 
> device-mapper." And that means.....?

Any LVM read ahead setting is ignored by LVM2 i.e. not passed to the kernel.

If it's demonstrated to be useful it could still be implemented, but
the current development priorities are still correctness and new features 
rather than performance.

Alasdair
-- 
agk@redhat.com
