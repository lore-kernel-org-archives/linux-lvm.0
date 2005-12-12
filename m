Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id jBCHDrBM026993
	for <linux-lvm@redhat.com>; Mon, 12 Dec 2005 17:13:53 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ElrFJ-0003Ig-IE
	for linux-lvm@redhat.com; Mon, 12 Dec 2005 17:13:53 +0000
Date: Mon, 12 Dec 2005 17:13:53 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] cannot compile LVM2
Message-ID: <20051212171353.GC25866@agk.surrey.redhat.com>
References: <BAY102-F742936F0CFC6C5232220FEF460@phx.gbl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY102-F742936F0CFC6C5232220FEF460@phx.gbl>
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

On Mon, Dec 12, 2005 at 05:06:06PM +0000, Christopher Probst wrote:
> cache/lvmcache.c:178: error: `dm_hash_iterate_fn' undeclared (first use in 
> this function)
 
> What am I doing wrong?
 
make install device-mapper 1.02.01 first

Alasdair
-- 
agk@redhat.com
