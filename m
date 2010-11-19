Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAJMPne6018021
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2010 17:25:49 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAJMPd0v016265
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2010 17:25:39 -0500
Received: by eye27 with SMTP id 27so3195912eye.33
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2010 14:25:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1011191651420.11792@bmsred.bmsi.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
	<20101118201222.GD30435@agk-dp.fab.redhat.com>
	<AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
	<Pine.LNX.4.64.1011191651420.11792@bmsred.bmsi.com>
Date: Fri, 19 Nov 2010 17:25:37 -0500
Message-ID: <AANLkTik=bN6A276Ux5CYXVy-WzEQKx1wbPxA1AKJvPAU@mail.gmail.com>
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
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 19, 2010 at 4:56 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:
> On Thu, 18 Nov 2010, Stirling Westrup wrote:
>
>> > The man page explains how pvmove works. �No data is removed until it
>> > is safely available in its new location.
>>
>> pmove's man page leaves a LOT to be desired. It gives the bare syntax
>
> ... lots of valid criticism
>
> In the New Testament, speaking in tongues had to be accompanied by
> an interpretation. �In Open Source, criticism (however valid) should
> be accompanied by a contribution (in this case, an edited man page)!

While I don't necessarily disagree with the point above, there ARE
only so many hours in a day, and the vast majority of Open Source
software that I use has similar problems. In fact, most have far worse
documentation than does LVM. I refuse to let the fact that I cannot
single-handedly supply documentation to the entire open source
community deter me from pointing out deficiencies where they arise.

> Actually, I would be willing to do that, I'm up to the writing, but it will
> take me a while to figure out where to check out the current man page source,
> unless someone gives me a pointer.

I tip my hat to you, sir, for being willing to tackle this task!


-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com
