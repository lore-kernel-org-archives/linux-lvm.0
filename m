Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k371xLIB005519
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 21:59:21 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k371xAOF032483
	for <linux-lvm@redhat.com>; Thu, 6 Apr 2006 21:59:11 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.6/8.13.3) with ESMTP id k371xDY3001554
	for <linux-lvm@redhat.com>; Fri, 7 Apr 2006 03:59:13 +0200
Subject: Re: [linux-lvm] Bad disk removal
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <62507cd748c6e6c8706c345a145cf914@redhat.com>
References: <44340F46.5040000@volved.com>
	<1144295496.8145.2.camel@pc7.dolda2000.com>
	<62507cd748c6e6c8706c345a145cf914@redhat.com>
Date: Fri, 07 Apr 2006 03:59:12 +0200
Message-Id: <1144375152.8601.63.camel@pc7.dolda2000.com>
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

On Thu, 2006-04-06 at 09:45 -0500, Jonathan E Brassow wrote:
> pvmove will ignore errors and copy as much as it can.  It will not 
> retry failed sectors though.  pvmove basically mirrors the drives, so 
> you can use the volume while the device is being copied.  When the copy 
> is complete, pvmove breaks the mirror and leaves you with the LV 
> remapped to the new device.

Really? I was sure the manpage said otherwise, but now that I look
again, it doesn't seem to be saying anything at all about it. Should it
not be amended to explain this?

By the way, what happens to the sectors on the new disk that corresponds
to the bad ones on the old disk, and would that affect only that sector
on the new disk, or the entire containing PE?

Fredrik Tolf
