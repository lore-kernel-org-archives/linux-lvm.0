Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0OIZxhD019588
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 13:35:59 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0OIZwd7011570
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 13:35:58 -0500
Received: from melissa.gathman.org (ip72-205-26-231.dc.dc.cox.net
	[72.205.26.231]) (authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id r0OIZuLb005371
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 13:35:57 -0500
Message-ID: <51017F0C.20100@bmsi.com>
Date: Thu, 24 Jan 2013 13:35:56 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
In-Reply-To: <20130124180834.GA3122@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Long ago, Nostradamus foresaw that on 01/24/2013 01:08 PM, Alasdair G
Kergon would write:
> If you've got the capacity to test, create one that's quite a bit
> larger and see how much space it actually uses up when full, then use
> that size in future.  There's a header, and then the blocks are written
> sequentially with an index block inserted ahead of each group of
> data blocks.
>
> Or try out thin LVs available in recent LVM releases/kernels for
> an alternative 'sparse' approach.
He doesn't actually want sparse, he wants "instant zero" via copy on
write.  This is useful for virtual machines by preventing information
leaks between customers.   Currently, you can create a "template" LV,
and have a snapshot for each VM.  Since you (almost) never write to the
template, you don't run into the performance issue.   He proposed a new
type of LV that is a normal LV plus a small bitmap (1 bit per chunk)
that tracks which chunks have been written to.  When a chunk is written
to, the remainder of that chunk is set to zero.  Reads from unwritten
chunks always return zeroes.
