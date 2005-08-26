Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QGm7V06733
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 12:48:07 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7QGm1qJ030065
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 12:48:06 -0400
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id j7QGm0sg027710
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 18:48:00 +0200
Subject: Re: [linux-lvm] pvmove on broken disk
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <3361914A535DD23CBBC6B90F@dhcp-2-206.wgops.com>
References: <1125062786.2225.34.camel@pc7.dolda2000.com>
	<3361914A535DD23CBBC6B90F@dhcp-2-206.wgops.com>
Date: Fri, 26 Aug 2005 18:47:59 +0200
Message-Id: <1125074879.2225.46.camel@pc7.dolda2000.com>
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

On Fri, 2005-08-26 at 10:13 -0600, Michael Loftis wrote:
> --On August 26, 2005 3:26:26 PM +0200 Fredrik Tolf <fredrik@dolda2000.com> 
> wrote:
> > I've got a related question as well, but it's not really LVM-related.
> > The thing is that there's something strange with either the IDE chipset
> > (a Promise card) or the corresponding driver that this disk is connected
> > to, which causes a kernel panic every time a read from a bad sector is
> > attempted. I figure I can "fix" that by connecting the drives to a
> > different computer while pvmoving, but I wouldn't prefer to do that, as
> > it causes downtime. Does someone on the list know of this problem and
> > how to work around it? I figure that I can attempt to fix the driver
> > bug, but I wouldn't prefer to experiment with that system...
> 
> Actually, if you're having PV errors, it might be the filesystem driver 
> that's panic-ing....you'll need to run the output through ksymoops and find 
> out where it's dieieng.  If you've corrupted filesystem data, that's the 
> much more likely target (although what you're hypothesizing isn't 
> impossible, I've just never seen that).

Thanks for the tip, but the panic message gave enough info for me to
conclude that it's a NULL pointer dereference in ide_timer_expiry.
Unfortunately, I hadn't compiled the kernel with debugging support,
however, so it's hard for me to determine just where in ide_timer_expiry
at this point.

Fredrik Tolf
