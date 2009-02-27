Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1RK01cv003370
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2009 15:00:02 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Ld8sK-0002km-Ub
	for linux-lvm@redhat.com; Fri, 27 Feb 2009 20:00:00 +0000
Date: Fri, 27 Feb 2009 20:00:00 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
Message-ID: <20090227200000.GF6714@agk.fab.redhat.com>
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
	<49A814EA.3090902@redhat.com>
	<1235752705.1193.32.camel@pc.interlinx.bc.ca>
	<49A81CA2.7080907@redhat.com>
	<1235755830.1193.40.camel@pc.interlinx.bc.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1235755830.1193.40.camel@pc.interlinx.bc.ca>
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

On Fri, Feb 27, 2009 at 12:30:30PM -0500, Brian J. Murrell wrote:
>     cache_dir = "/etc/lvm/cache"

The cache_dir must be *writeable*.
If you're attempting to use read-only root, then move it somewhere else
(is /var writeable? or make a ramfs) or delete that directory *and*
change

>     write_cache_state = 1
to 0.

(This will slow commands down.)

Or if all devices on your system are the same on every boot, 
place the correct version of that file into your read only image.
This won't work if devices can move about unless you include
all the possible locations in there.

> > Is there any way you can grab a listing of /dev at the moment the
> > vgchange runs during boot?
> Not relevant per above.

-vvvv output provides this information already.

Alasdair
-- 
agk@redhat.com
