Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBBE9D130794
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 09:09:13 -0500
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBBE97Bx023385
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 09:09:12 -0500
Received: from pc7.dolda2000.com (pc7.dolda2000.com
	[IPv6:2002:52b6:8514:200:20c:76ff:fe3b:a3f4] (may be forged))
	(authenticated bits=0)
	by pc18.dolda2000.com (8.13.4/8.13.3) with ESMTP id jBBE8u4d003281
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 15:08:56 +0100
Subject: Re: [linux-lvm] LVM onFly features
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<CB9E5AC681BF4CD0966C6872@dhcp-2-206.wgops.com>
	<20051210200646.GF3103@mjk.myfqdn.de>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
	<1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
Date: Sun, 11 Dec 2005 15:08:55 +0100
Message-Id: <1134310136.26999.4.camel@pc7.dolda2000.com>
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

On Sat, 2005-12-10 at 22:38 -0500, Mag Gam wrote:
> thanks everyone for their kind replies.
> 
> So, will LVM and FS (ext2/3 in particular )ever be considered as 1?
> This would be nice for ease of devt.

If they would be considered as one, it wouldn't be LVM anymore. LVM is a
pure block device layer, and as such will always have to FS layered
above.

However, stuff like Solaris ZFS does make sense, too, if you ask me.
Having a filesystem managing several block devices allows for pretty
neat stuff, such as per-file replication or striping, which would be
really sweet.

That said, such a thing would, of course, be completely unrelated to
LVM.

Fredrik Tolf
