Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1RLQw5F023627
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 16:26:59 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LdAET-0002oF-TK
	for linux-lvm@redhat.com; Fri, 27 Feb 2009 21:26:57 +0000
Date: Fri, 27 Feb 2009 21:26:57 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
Message-ID: <20090227212657.GH6714@agk.fab.redhat.com>
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
	<49A814EA.3090902@redhat.com>
	<1235752705.1193.32.camel@pc.interlinx.bc.ca>
	<49A81CA2.7080907@redhat.com>
	<1235755830.1193.40.camel@pc.interlinx.bc.ca>
	<20090227200000.GF6714@agk.fab.redhat.com>
	<1235765985.1193.49.camel@pc.interlinx.bc.ca>
	<1235766712.1193.60.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1235766712.1193.60.camel@pc.interlinx.bc.ca>
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

You wrote:
  my root filesystem (/) is read-only.  

That's what I was reacting to.
With a read-only root, if /etc/lvm/cache/ is being used and is
wrong it will be unable to correct itself.
You must either make the cache file writeable or delete it.

vgchange -ay
and
vgchange -ay XXX

behave differently.
The first activates all VGs it sees, respecting the cache file
if it exists.
But with the second, if after doing that (and unless trustcache is set) it
can't find XXX, it considers the cache file might be wrong and tries again
without it, updating it afterwards iff write_cache_file is set.

Whether or not to preserve that file across boot depends on your system,
but typically vgscan will be run each time to regenerate it.

Alasdair
-- 
agk@redhat.com
