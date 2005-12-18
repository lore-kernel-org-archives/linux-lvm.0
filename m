Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBI0R9113722
	for <linux-lvm@redhat.com>; Sat, 17 Dec 2005 19:27:09 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBI0R2dE027140
	for <linux-lvm@redhat.com>; Sat, 17 Dec 2005 19:27:02 -0500
Received: by wproxy.gmail.com with SMTP id i11so1237712wra
	for <linux-lvm@redhat.com>; Sat, 17 Dec 2005 16:27:01 -0800 (PST)
Message-ID: <1cbd6f830512171627u1f823f97l83075e8ee41fbd0b@mail.gmail.com>
Date: Sat, 17 Dec 2005 19:27:01 -0500
From: Mag Gam <magawake@gmail.com>
Subject: Re: [linux-lvm] LVM onFly features
In-Reply-To: <1134679455.24282.18.camel@grandmother.littlebald.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <1cbd6f830512101138t10ec4f77j217ee8830a60a97b@mail.gmail.com>
	<64AE95D76D81F71989D42E79@dhcp-2-206.wgops.com>
	<20051210223139.GI3103@mjk.myfqdn.de>
	<B3E2561C8D66866DCF5FD2D8@dhcp-2-206.wgops.com>
	<208D3DC6840704A034151D63@dhcp-2-206.wgops.com>
	<20051210230341.GJ3103@mjk.myfqdn.de>
	<1cbd6f830512101938g4ec7d36dq4fd9a081658edf47@mail.gmail.com>
	<1134310136.26999.4.camel@pc7.dolda2000.com>
	<1cbd6f830512110732h3e5a666du881f6c4fad593924@mail.gmail.com>
	<1134679455.24282.18.camel@grandmother.littlebald.com>
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

David:

You are right. On AIX, it first runs, extendlv, and then a chfs...





On 12/15/05, David Johnston <david@littlebald.com> wrote:
> On Sun, 2005-12-11 at 10:32 -0500, Mag Gam wrote:
> > I know AIX LVM and FS act usually as one. Thats where I was going at....
> >
> > But, thats everyone for their replies!
>
> Not really.  The AIX configuration tools simplify things for you to the
> point that you might think that they are acting as one, but they work
> exactly the same way under AIX and Linux.  Look at the config tool's
> logs, and you will see that to expand a filesystem, it first calls lvm
> to expand the logical volume, then calls the jfs utility to expand the
> filesystem.  There are internal differences in the two implementations,
> but the division between logical block devices and filesystems is there
> under both AIX and Linux.
>
> -David
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
