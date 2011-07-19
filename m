Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6JFdIGQ005036
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 11:39:19 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6JFdAW4011131
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 11:39:10 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 4871F86FF0
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2011 17:39:09 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id E-WboGWSoq3C for <linux-lvm@redhat.com>;
	Tue, 19 Jul 2011 17:39:04 +0200 (CEST)
Date: Tue, 19 Jul 2011 17:39:04 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20110719153904.GA20866@maude.comedia.it>
References: <4E1A526F.9090700@tlinx.org>
	<20110711021630.GC7857@agk-dp.fab.redhat.com>
	<20110718055228.GA9037@maude.comedia.it>
	<4E2538E1.9040806@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E2538E1.9040806@tlinx.org>
Subject: Re: [linux-lvm] mount's (&udev's) dirty little naming problem
	--	(was Inconsistent naming...?)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jul 19, 2011 at 12:57:21AM -0700, Linda A. Walsh wrote:
>   (sorry for the length of this, in advance, but I've tried to give
> this some though...(maybe not enough/maybe too much!) ;-) )
>
> Luca Berra wrote:
> > On Mon, Jul 11, 2011 at 03:16:31AM +0100, Alasdair G Kergon wrote:
> >> The canonical name to use is /dev/<vgname>/<lvname>. ...
> >>
> >> [~Other forms - dm-N and /dev/mapper/X-Y are internal and ...
> >> there'll probably be some further changes to workaround other
> >> arbitrary
>   udev restrictions...~]
> >>
> >> Different versions of df and mount haven't always retained this
> >> preferred form for their output.
> >>
> > note that on a freshly installed rhel 6.1 i have this in fstab
> >
> > /dev/mapper/vg_candela--lv_root / ext4 ....
>
> ---
>
>   Why are there two dashes between the VG&LG?


woops, typo, sorry for that
it is :
/dev/mapper/vg_candela-lv_root / ext4 defaults 1 1

L.
-- 
Luca Berra -- bluca@comedia.it
