Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i57IYk007042
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:34:46 -0400
Received: from exch-calgary.int.pason.com (hemlock.pason.com [208.38.1.1])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i57IYeXn007137
	for <linux-lvm@redhat.com>; Mon, 7 Jun 2004 14:34:40 -0400
Date: Mon, 7 Jun 2004 12:34:34 -0600
From: "Donald Murray P.Eng." <donald.murray@pason.com>
Subject: Re: [linux-lvm] LVM snapshot sizes.
Message-Id: <20040607123434.2256e2ab.donald.murray@pason.com>
In-Reply-To: <40C4B1E5.8040801@staff.theuseful.com>
References: <40C4B1E5.8040801@staff.theuseful.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Is your MySQL slave logging to the database partition? Replication
binary logs can grow pretty quickly, which might be the reason your
snapshot overflows.

You could try making your snapshot volumes larger.


On Mon, 07 Jun 2004 14:20:21 -0400
Yaroslav Klyukin <yklyukin@staff.theuseful.com> wrote:

> 
> I have created an LVM logical volume of the size arount 60G and 
> formatted it with reiserfs. After that I put MySQL database onto this 
> partition and made it a replicating slave.
> Using this configuration I took several LVM snapshots, 1G each.
> It did not take long for these snapshots to overflow.
> 
> So here is the question:
> Why would it take so fast to overflow an LVM snapshot?
> In other words, what are the parameters, which affect snapshot fillups?
> Is it possible, that journaling filesystem can contribute to the size of 
> changing data on the logical volume, and would LVM2 be more efficient?
> 
> Thank you!
> 
> -- 
> Systems Administrator, NiuTech.
> Cellular: (561) 843-1552
> AIM: infiniteparticle
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


 ------------------------------------------ 
 Donald Murray, P.Eng.
 Senior Software Engineer
 Pason Systems Corp.
 Direct: (403) 301-3473
