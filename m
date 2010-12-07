Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB76leAs020980
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 01:47:40 -0500
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB76lSju006372
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 01:47:28 -0500
Received: by wwj40 with SMTP id 40so7498845wwj.27
	for <linux-lvm@redhat.com>; Mon, 06 Dec 2010 22:47:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTik0PvB5VOUMuO4sre0tz-r-U41cq8JHXwvFvfx2@mail.gmail.com>
References: <AANLkTi=EyqkiemX6PRXiTVKGAkXW-L8VoGw0-BQrygv7@mail.gmail.com>
	<4CFD98D2.70609@bmsi.com>
	<AANLkTik0PvB5VOUMuO4sre0tz-r-U41cq8JHXwvFvfx2@mail.gmail.com>
Date: Tue, 7 Dec 2010 13:47:27 +0700
Message-ID: <AANLkTinucge7aLm_jgz1GnM=j1szjJKF8OB=YEA4qqP_@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>, Stuart D Gathman <stuart@bmsi.com>

While I'm at it, I've also come across statements that the performance
of certain applications (Oracle usually being the one mentioned) can
be sensitive to LVM extent size.

I'm hoping this is not actually the case, and such ideas are coming
from those who may have tried to use LVM to handle their striping.

Which leads to another question, OT enough to start a new thread. . .

On Tue, Dec 7, 2010 at 1:29 PM,  <hansbkk@gmail.com> wrote:
> I've restated my understanding of your response - please let me know
> if you meant something different.
>
>>> having a large number of extents will slow down the tools
>>
>> I believe only a large number segments (contiguous groups of extents)
>> slows things down. =EF=BF=BDI could be wrong.
>
>
> The total number of extents isn't the factor that could slow down the
> LVM tools, it's the total number of segments (contiguous groups of
> extents) that matters.
>
> So for example, setting up fine-grained LVM striping and leaving empty
> extents in between large numbers of occupied stripes would have more
> of an impact than the total number of extents.
>
>>> leads me to:
>>>
>>> Would there be any negative impact of a very large extent size?
>> The only impact is unused space due to more granular allocation.
>
> So if I had 10GB extents, but needed a bunch of separate LVs that each
> only needed <1GB, that would lead to wasted space. . .
>
