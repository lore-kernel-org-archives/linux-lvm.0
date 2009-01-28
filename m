Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n0SH0hIa024529
	for <linux-lvm@redhat.com>; Wed, 28 Jan 2009 12:00:44 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LSDmM-00084W-7l
	for linux-lvm@redhat.com; Wed, 28 Jan 2009 17:00:42 +0000
Date: Wed, 28 Jan 2009 17:00:42 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Size of the mirror log?
Message-ID: <20090128170042.GC23158@agk.fab.redhat.com>
References: <20090128085024.GA14023@lupe-christoph.de>
	<20090128162636.GA12514@us.ibm.com> <49808E4B.7080804@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49808E4B.7080804@redhat.com>
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

On Wed, Jan 28, 2009 at 05:56:43PM +0100, Milan Broz wrote:
> malahal@us.ibm.com wrote:
> > Lupe Christoph [lupe@lupe-christoph.de] wrote:
> >> I presume the size will depend on the number of mirror regions, but how
> >> much log does a region require?

An additional region requires an additional 1 bit.

Alasdair
-- 
agk@redhat.com
