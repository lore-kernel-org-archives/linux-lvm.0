Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0KGrI0W023489
	for <linux-lvm@redhat.com>; Thu, 20 Jan 2005 16:53:18 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CrfYc-0005IJ-0y
	for linux-lvm@redhat.com; Thu, 20 Jan 2005 16:53:18 +0000
Date: Thu, 20 Jan 2005 16:53:17 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Data corruption on large, multi-device filesystem
Message-ID: <20050120165317.GA14093@agk.surrey.redhat.com>
References: <20050118091059.GC27553@pcnocjb.dlan.cinetic.de>
	<1106172883.41eedbd386498@www.eiler.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1106172883.41eedbd386498@www.eiler.net>
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

On Wed, Jan 19, 2005 at 02:14:43PM -0800, joe@eiler.net wrote:
> I don't see any corruption on the files unless I specify the -i option to
> lvcreate.  
 
That's a useful observation: different code gets run when -i is used, and
I've taken a look and there are two 32-bit limits in that code.  

One appears to be intentional for performance reasons and can be worked 
around by increasing the chunk size (default 64K), though it really should
detect when the limit is exceeded and tell you!

The other unintentional limit (which is the one affecting you I think) 
leads to wrap-around at striped device offsets beyond ~2^32 sectors
i.e. 2^39 bytes into a PV, or ~2^40 bytes (2TB) into an LV in your
case of 2 stripes.  The fix for that is a basic exercise in C.  
[Ref.  stripe_map() in drivers/md/dm-stripe.c]

Alasdair
-- 
agk@redhat.com
