Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 901995D704
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 22:43:06 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDF3D81F10
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 22:43:03 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id z24so226328ual.8
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 14:43:03 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com.
	[209.85.221.180])
	by smtp.gmail.com with ESMTPSA id c63sm38534vke.16.2019.02.21.14.43.00
	for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Feb 2019 14:43:00 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 89so65093vkq.7
	for <linux-lvm@redhat.com>; Thu, 21 Feb 2019 14:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20190221203334.24504-1-helen.koike@collabora.com>
In-Reply-To: <20190221203334.24504-1-helen.koike@collabora.com>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 21 Feb 2019 14:42:47 -0800
Message-ID: <CAGXu5jL2xQL9rgwQsqfraGQwzOd2+yr-2qkKvZYNwXYGTV8TZA@mail.gmail.com>
Subject: Re: [linux-lvm] [PATCH v12] dm: add support to directly boot to a
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
To: Helen Koike <helen.koike@collabora.com>
Cc: Will Drewry <wad@chromium.org>, Mike Snitzer <snitzer@redhat.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, richard -rw- weinberger <richard.weinberger@gmail.com>, LKML <linux-kernel@vger.kernel.org>, device-mapper development <dm-devel@redhat.com>, linux-lvm@redhat.com, Enric Balletbo i Serra <enric.balletbo@collabora.com>, kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>

On Thu, Feb 21, 2019 at 12:33 PM Helen Koike <helen.koike@collabora.com> wrote:
>
> Add a "create" module parameter, which allows device-mapper targets to be
> configured at boot time. This enables early use of dm targets in the boot
> process (as the root device or otherwise) without the need of an initramfs.
>
> The syntax used in the boot param is based on the concise format from the
> dmsetup tool to follow the rule of least surprise:
>
>         sudo dmsetup table --concise /dev/mapper/lroot
>
> Which is:
>         dm-mod.create=<name>,<uuid>,<minor>,<flags>,<table>[,<table>+][;<name>,<uuid>,<minor>,<flags>,<table>[,<table>+]+]
>
> Where,
>         <name>          ::= The device name.
>         <uuid>          ::= xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx | ""
>         <minor>         ::= The device minor number | ""
>         <flags>         ::= "ro" | "rw"
>         <table>         ::= <start_sector> <num_sectors> <target_type> <target_args>
>         <target_type>   ::= "verity" | "linear" | ...
>
> For example, the following could be added in the boot parameters:
> dm-mod.create="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
>
> Only the targets that were tested are allowed and the ones that doesn't
> change any block device when the dm is create as read-only. For example,
> mirror and cache targets are not allowed. The rationale behind this is
> that if the user makes a mistake, choosing the wrong device to be the
> mirror or the cache can corrupt data.
>
> The only targets allowed are:
> * crypt
> * delay
> * linear
> * snapshot-origin
> * striped
> * verity
>
> Co-developed-by: Will Drewry <wad@chromium.org>
> Co-developed-by: Kees Cook <keescook@chromium.org>
> Co-developed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Thanks! This appears to have everything Chrome OS needs. I've asked a
few other folks to look at it too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
