Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 064892010CAB
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2018 16:36:29 +0000 (UTC)
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6407B2DE3B
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2018 16:36:28 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id z18-v6so1389985ybr.0
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2018 09:36:28 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com.
	[209.85.219.179]) by smtp.gmail.com with ESMTPSA id
	k2-v6sm2760825ywh.52.2018.09.27.09.36.24 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Sep 2018 09:36:25 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id p74-v6so1359454ybc.9
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2018 09:36:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180927142328.GA4074@redhat.com>
References: <cover.1537936397.git.helen.koike@collabora.com>
	<CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
	<20180927142328.GA4074@redhat.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 27 Sep 2018 09:36:23 -0700
Message-ID: <CAGXu5j+Y5e_oTZVCAHa48XgVcvEKGnVW_74oXZOUyLnfYPAjAg@mail.gmail.com>
Subject: Re: [linux-lvm] [PATCH 0/2] boot to a mapped device
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Will Drewry <wad@chromium.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Richard Weinberger <richard.weinberger@gmail.com>, device-mapper development <dm-devel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, helen.koike@collabora.com, linux-lvm@redhat.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>

On Thu, Sep 27, 2018 at 7:23 AM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Wed, Sep 26 2018 at  3:16am -0400,
> Richard Weinberger <richard.weinberger@gmail.com> wrote:
>
>> Helen,
>>
>> On Wed, Sep 26, 2018 at 7:01 AM Helen Koike <helen.koike@collabora.com> wrote:
>> >
>> > This series is reviving an old patchwork.
>> > Booting from a mapped device requires an initramfs. This series is
>> > allows for device-mapper targets to be configured at boot time for
>> > use early in the boot process (as the root device or otherwise).
>>
>> What is the reason for this patch series?
>> Setting up non-trivial root filesystems/storage always requires an
>> initramfs, there is nothing
>> wrong about this.
>
> Exactly.  If phones or whatever would benefit from this patchset then
> say as much.

I think some of the context for the series was lost in commit logs,
but yes, both Android and Chrome OS do not use initramfs. The only
thing that was needed to do this was being able to configure dm
devices on the kernel command line, so the overhead of a full
initramfs was seen as a boot time liability, a boot image size
liability (e.g. Chrome OS has a limited amount of storage available
for the boot image that is covered by the static root of trust
signature), and a complexity risk: everything that is needed for boot
could be specified on the kernel command line, so better to avoid the
whole initramfs dance.

So, instead, this plumbs the dm commands directly instead of bringing
up a full userspace and performing ioctls.

> I will not accept this patchset at this time.
>
>> > Example, the following could be added in the boot parameters.
>> > dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
>>
>> Hmmm, the new dm= parameter is anything but easy to get right.
>
> No, it isn't.. exposes way too much potential for users hanging
> themselves.

IIRC, the changes in syntax were suggested back when I was trying to
drive this series:
https://www.redhat.com/archives/dm-devel/2016-February/msg00199.html

And it matches the "concise" format in dmsetup:
https://sourceware.org/git/?p=lvm2.git;a=commit;h=827be01758ec5adb7b9d5ea75b658092adc65534

What do you feel are next steps?

Thanks!

-Kees

-- 
Kees Cook
Pixel Security
