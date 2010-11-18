Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAIKeaUF010534
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:40:36 -0500
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAIKeP08017124
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:40:26 -0500
Received: by ewy5 with SMTP id 5so63558ewy.33
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 12:40:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101118201222.GD30435@agk-dp.fab.redhat.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
	<20101118201222.GD30435@agk-dp.fab.redhat.com>
Date: Thu, 18 Nov 2010 15:40:25 -0500
Message-ID: <AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 18, 2010 at 3:12 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> On Thu, Nov 18, 2010 at 01:30:11PM -0500, Stirling Westrup wrote:
>> I do think the fact that pvmove does no user-visible checkpointing is
>> a bug.
>
> The man page explains how pvmove works. =EF=BF=BDNo data is removed until=
 it
> is safely available in its new location.

pmove's man page leaves a LOT to be desired. It gives the bare syntax
of saying how to move individual extents, or ranges thereof, but gives
no semantic information whatsoever. It doesn't even go so far as to
SAY that the syntax is for moving individual extents.

It mentions checkpointing, but gives no further information. It
certainly doesn't say anything about how often they are done, or under
what circumstances. Nor is there any mention of how one would know
when the last checkpoint was taken. I'm not the first person who's
asked about this either, as I discovered while trying to google for
information that should have been in the man page.

> Checkpoints are done after each contiguous piece of data to move.
> So if your data is contiguous, you'll get no checkpoints.
> The code was designed to handle more-frequent checkpoints in such
> cases, but nobody's seen the need to implement that feature yet.
> (I don't think we even have a bugzilla requesting it.)

Perhaps no one has made a request, because there isn't even enough
information available for someone to KNOW what to request?

--=20
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
