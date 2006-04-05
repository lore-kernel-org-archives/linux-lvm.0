Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k35IUBYJ011303
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 14:30:11 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k35IU9Z5027778
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 14:30:10 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k35IUAHL014650
	for <linux-lvm@redhat.com>; Wed, 5 Apr 2006 20:30:10 +0200
Subject: Re: [linux-lvm] pvmove to smaller PVs
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <20060405180351.GY4197@agk.surrey.redhat.com>
References: <1144258458.32119.8.camel@pc7.dolda2000.com>
	<20060405174425.GX4197@agk.surrey.redhat.com>
	<1144259900.32119.11.camel@pc7.dolda2000.com>
	<20060405180351.GY4197@agk.surrey.redhat.com>
Date: Wed, 05 Apr 2006 20:30:08 +0200
Message-Id: <1144261809.32119.13.camel@pc7.dolda2000.com>
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

On Wed, 2006-04-05 at 19:03 +0100, Alasdair G Kergon wrote:
> On Wed, Apr 05, 2006 at 07:58:19PM +0200, Fredrik Tolf wrote:
> > However, is there a "canonical" way to check where PEs have been
> > allocated inside PVs? 
> 
> lvs -o+devices
> gives start PEs in parentheses

Oh, cool. Thanks!

Fredrik Tolf
