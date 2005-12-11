Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBBFX6107201
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 10:33:06 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBBFWxHF010211
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 10:32:59 -0500
Received: by wproxy.gmail.com with SMTP id i1so1519305wra
	for <linux-lvm@redhat.com>; Sun, 11 Dec 2005 07:32:59 -0800 (PST)
Message-ID: <1cbd6f830512110732h3e5a666du881f6c4fad593924@mail.gmail.com>
Date: Sun, 11 Dec 2005 10:32:59 -0500
From: Mag Gam <magawake@gmail.com>
Subject: Re: [linux-lvm] LVM onFly features
In-Reply-To: <1134310136.26999.4.camel@pc7.dolda2000.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<A8AB02E392149E55AC45BF7A@dhcp-2-206.wgops.com>
	<20051210202232.GG3103@mjk.myfqdn.de>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
	<1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
	<1134310136.26999.4.camel@pc7.dolda2000.com>
Content-Transfer-Encoding: 8bit
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

I know AIX LVM and FS act usually as one. Thats where I was going at....

But, thats everyone for their replies!

On 12/11/05, Fredrik Tolf <fredrik@dolda2000.com> wrote:
> On Sat, 2005-12-10 at 22:38 -0500, Mag Gam wrote:
> > thanks everyone for their kind replies.
> >
> > So, will LVM and FS (ext2/3 in particular )ever be considered as 1?
> > This would be nice for ease of devt.
>
> If they would be considered as one, it wouldn't be LVM anymore. LVM is a
> pure block device layer, and as such will always have to FS layered
> above.
>
> However, stuff like Solaris ZFS does make sense, too, if you ask me.
> Having a filesystem managing several block devices allows for pretty
> neat stuff, such as per-file replication or striping, which would be
> really sweet.
>
> That said, such a thing would, of course, be completely unrelated to
> LVM.
>
> Fredrik Tolf
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
