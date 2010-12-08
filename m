Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB83G1lP003226
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 22:16:01 -0500
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB83FmDT005067
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 22:15:48 -0500
Received: by wyb28 with SMTP id 28so677785wyb.33
	for <linux-lvm@redhat.com>; Tue, 07 Dec 2010 19:15:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTinucge7aLm_jgz1GnM=j1szjJKF8OB=YEA4qqP_@mail.gmail.com>
References: <AANLkTi=EyqkiemX6PRXiTVKGAkXW-L8VoGw0-BQrygv7@mail.gmail.com>
	<4CFD98D2.70609@bmsi.com>
	<AANLkTik0PvB5VOUMuO4sre0tz-r-U41cq8JHXwvFvfx2@mail.gmail.com>
	<AANLkTinucge7aLm_jgz1GnM=j1szjJKF8OB=YEA4qqP_@mail.gmail.com>
Date: Wed, 8 Dec 2010 10:15:47 +0700
Message-ID: <AANLkTikfEH122NrsRzE4-YgDcepf4fgEo6Q5qVCfDZwr@mail.gmail.com>
From: hansbkk@gmail.com
Subject: Re: [linux-lvm] Configuring extent size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Sorry to appear to be talking to myself here, but thought I'd try to
get confirmations/answers on questions outstanding from my OP:

> a 4 MB extent size imposes a logical volume size limitation of 256 Gigabytes
No longer true?

Because this is now true?
> with LVM2, there's no limit on the maximum numbers of extents per PV/LV.

And therefore
> For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.

is a hard upper limit, and is not related to extent size?


I have in the meantime found this:

Max number PVs: 2**32 PVs

but not a statement about any maximum size for PV (nor more importantly for VGs)

I'm guessing the question is academic, and would in any case not be
related to extent size anyway.



On Tue, Dec 7, 2010 at 1:47 PM,  <hansbkk@gmail.com> wrote:
> While I'm at it, I've also come across statements that the performance
> of certain applications (Oracle usually being the one mentioned) can
> be sensitive to LVM extent size.

I'm hoping this is not actually the case, and such ideas are coming
from those who may are using LVM to handle their performance striping
rather than the underlying RAID.


All this is pretty much just one noob's speculation here, some
confirmation would be greatly appreciated.
