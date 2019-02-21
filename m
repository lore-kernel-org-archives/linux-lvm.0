Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CBF36017E
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 17:13:52 +0000 (UTC)
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 753C93091753
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 17:13:51 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id c5so8024322uaq.7
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 09:13:51 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com.
	[209.85.222.54])
	by smtp.gmail.com with ESMTPSA id c6sm6683401vkf.45.2019.02.21.09.13.47
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 09:13:48 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id d21so9929829uap.9
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 09:13:47 -0800 (PST)
MIME-Version: 1.0
References: <20190218181819.20524-1-helen.koike@collabora.com>
	<20190221155032.GA3155@redhat.com>
In-Reply-To: <20190221155032.GA3155@redhat.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 21 Feb 2019 09:13:34 -0800
Message-ID: <CAGXu5jKiEmmpVE0f_9r4Wop8c11skcsgAruGr2UbOiAof8T7DA@mail.gmail.com>
Subject: Re: [linux-lvm] [PATCH v11] dm: add support to directly boot to a
	mapped device
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
Cc: Will Drewry <wad@chromium.org>, device-mapper development <dm-devel@redhat.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, richard -rw- weinberger <richard.weinberger@gmail.com>, David Zeuthen <zeuthen@google.com>, LKML <linux-kernel@vger.kernel.org>, Helen Koike <helen.koike@collabora.com>, linux-lvm@redhat.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>

On Thu, Feb 21, 2019 at 7:50 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Mon, Feb 18 2019 at  1:18pm -0500,
> Helen Koike <helen.koike@collabora.com> wrote:
>
> > Add a dm-mod.create= kernel module parameter.
> > It allows device-mapper targets to be configured at boot time for use early
> > in the boot process (as the root device or otherwise).
> >
> > Signed-off-by: Will Drewry <wad@chromium.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > [rework to use dm_ioctl calls]
> > Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > [refactored for upstream]
> > Signed-off-by: Helen Koike <helen.koike@collabora.com>
>
> Can I get confirmation from Will and Kees that this v11 is safe to carry
> their Signed-off-by?  Are you guys "happy" with this patch?

I think those should be "Co-developed-by:" to more correctly capture
the intent. At this point I think Helen is the primary author. Or at
least, Will and I aren't anymore. :)

At first pass, yes, this patch does what's needed for Chrome OS and
Android, but I'll take a closer look shortly (and I've added David who
has looked at this most recently).

Thanks!

-- 
Kees Cook
