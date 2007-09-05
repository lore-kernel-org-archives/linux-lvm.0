Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l85BgMSu007743
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 07:42:23 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.225])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l85BgL9l025027
	for <linux-lvm@redhat.com>; Wed, 5 Sep 2007 07:42:21 -0400
Received: by nz-out-0506.google.com with SMTP id r28so1203459nza
	for <linux-lvm@redhat.com>; Wed, 05 Sep 2007 04:42:21 -0700 (PDT)
Message-ID: <d00698fb0709050442w3f98f7baueeb3550022ce4186@mail.gmail.com>
Date: Wed, 5 Sep 2007 13:42:20 +0200
From: noah <noah123@gmail.com>
Subject: Re: [linux-lvm] pvmove hung on 2.6.22 (ubuntu gutsy)
In-Reply-To: <46DE7FB6.3090203@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <d00698fb0709011019x688e5363q931f16444685ea97@mail.gmail.com>
	<46D9B8B2.3070104@theendofthetunnel.de>
	<d00698fb0709011605h25edefbep1c989c23effe5c55@mail.gmail.com>
	<d00698fb0709050257y220be827ybc88fd680b14f1d4@mail.gmail.com>
	<46DE7FB6.3090203@redhat.com>
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

2007/9/5, Bryn M. Reeves <breeves@redhat.com>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> noah wrote:
> > 2007/9/2, noah <noah123@gmail.com>:
> >> 2007/9/1, Hannes Dorbath <light@theendofthetunnel.de>:
> >>> noah wrote:
> >>>> Pvmove hung and now all commands that access the filesystem hang too,
> >>>> possibly in uninterruptible sleep.
> >>>> Is this a bug or did I do something forbidden, somehow? ;)
> >>> To my knowledge pvmove is broken on 2.6.22. I'd go back to 2.6.21 until
> >>> there is a fix. Maybe there is already a fix, I haven't followed it.
> >> Thanks for a quick reply.
> >> Has this problem been documented elsewhere?
> >> Just curious what the problem is and whether anybody is working on a fix.
> >
> > I'm still curious what the problem is, when it happend, why and
> > whether or not somebody is working on it.
> > Is this a problem with dm, lvm, barriers, userland utilities or something else?
>
> The fix was merged in 2.6.22.2 - file a bug with your distribution to
> have it included.
>
> The patch is here:
>
> http://lkml.org/lkml/2007/8/7/401

This patch is already applied on the kernel i was running.
Also, I'm not sure I'm using dm-raid at all since I don't have one of
these lame software (BIOS) RAID cards. I'm using md and dm-crypt
straight on top of the harddrives.

Could I have hit a different bug?

  -- noah
