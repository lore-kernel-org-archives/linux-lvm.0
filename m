Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n2DKcD1c018225
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:38:13 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LiE8y-0000rO-8w
	for linux-lvm@redhat.com; Fri, 13 Mar 2009 20:38:12 +0000
Date: Fri, 13 Mar 2009 20:38:12 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] fsync() and LVM
Message-ID: <20090313203812.GK7445@agk.fab.redhat.com>
References: <49BA9BF9.3070507@esiway.net>
	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
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

Let's try to clear up the confusion.

Kernel device-mapper (which lvm uses) does not support write barriers
except in very restricted circumstances (when only one device is
involved and the mapping is trivial).  If dm receives a write barrier
which is not supported it notifies the caller (typically a filesystem)
so appropriate action can be taken if it wishes.

Several kernels releases ago, the implementation of the 'flush device'
operation in the block layer was changed from a simple function call
that dm supported to a mechanism involving barriers that is trickier for
dm to support.  Previously 'flush' could not fail and so callers do not
generally have strategies to handle such a situation.

The latest of several attempts to support barriers is contained in
patches here:
  http://patchwork.kernel.org/project/dm-devel/list/?q=barriers

Please review and test if you are interested!

Alasdair
-- 
agk@redhat.com
