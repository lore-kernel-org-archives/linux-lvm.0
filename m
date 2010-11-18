Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAIM6Sie029894
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 17:06:28 -0500
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAIM6HEb005658
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 17:06:17 -0500
Received: by ewy5 with SMTP id 5so148294ewy.33
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 14:06:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101118213258.GF30435@agk-dp.fab.redhat.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
	<20101118201222.GD30435@agk-dp.fab.redhat.com>
	<AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
	<20101118213258.GF30435@agk-dp.fab.redhat.com>
Date: Thu, 18 Nov 2010 17:06:16 -0500
Message-ID: <AANLkTi=2R_wHqquR1ZhAdRdH3sxke6vg0Auzqy0MDtm_@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with a
 particular use-case for pvmove.
Reply-To: swestrup@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 18, 2010 at 4:32 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> On Thu, Nov 18, 2010 at 03:40:25PM -0500, Stirling Westrup wrote:
>> It mentions checkpointing, but gives no further information. It
>> certainly doesn't say anything about how often they are done, or under
>> what circumstances.
>
> It's in there, but the man page would indeed benefit from more repetition
> and examples. �Patches welcome!
>
> � � � Every logical volume in the volume group is searched for *contiguous
> � � � data* that need moving according to the �command �line �arguments. � For
> � � � each �piece �of �data �found, �a new *segment* is added to the end of the
> � � � pvmove LV. �This segment takes the form of a *temporary mirror* �to �copy
> � � � the data from the original location to a newly-allocated location.
>
> � � � A daemon repeatedly checks progress at the specified time interval.
> � � � When it detects that the first *temporary mirror* is in-sync, �it �breaks
> � � � that �mirror �so that only the new location for that data gets used and
> � � � writes a *checkpoint* into the volume group metadata on �disk.
>
> So checkpoint at first daemon check interval after temp mirror in-sync, and
> one temp mirror per item of contiguous data to be moved.

The interpretation you give is only possible if one knows what the
man-page writer means by 'contiguous data', 'segment' and 'temporary
mirror'. As it was, I didn't and spent some time perusing the man
pages to find anywhere where these terms are defined, with no luck.

So, yes, the man page definitely needs fixing. And that, perhaps,
should be done by someone who has a heck of a lot more familiarity
with the system than I have, or else the resulting man page is likely
to end up BOTH inadequate and erroneous.

Still, I submit that if the man page needs to talk about checkpoints
AT ALL, then there needs to be a user method for determining, the
status of checkpoints during a pvmove.
-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
