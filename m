Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35HwR97003807
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:58:27 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k35HwKOX029902
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 13:58:21 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k35HwJc5011683
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 19:58:20 +0200
Subject: Re: [linux-lvm] pvmove to smaller PVs
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <20060405174425.GX4197@agk.surrey.redhat.com>
References: <1144258458.32119.8.camel@pc7.dolda2000.com>
	<20060405174425.GX4197@agk.surrey.redhat.com>
Date: Wed, 05 Apr 2006 19:58:19 +0200
Message-Id: <1144259900.32119.11.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2006-04-05 at 18:44 +0100, Alasdair G Kergon wrote:
> On Wed, Apr 05, 2006 at 07:34:18PM +0200, Fredrik Tolf wrote:
> > Can pvmove not just divide that storage into three "partitions", 
> 
> There's no logic to do that yet.  It can only move complete sets of
> contiguous extents.
> 
> > Is there a way for me to tell it to do so?
> 
> As you found: break up contiguous extents explicitly on
> the command line by telling it to move smaller parts that it
> can handle.

I see. I guess I'll just have to do that then. It's not *that* bad,
after all. :)

However, is there a "canonical" way to check where PEs have been
allocated inside PVs? I think I can check /etc/lvm/backup/vgname. I'm
just getting the feeling that that's kind of ugly.

Thanks for your reply!

Fredrik Tolf
