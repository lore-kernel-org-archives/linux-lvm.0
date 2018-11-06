Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C802419751
	for <linux-lvm@redhat.com>; Tue,  6 Nov 2018 14:24:18 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B04D358E3E
	for <linux-lvm@redhat.com>; Tue,  6 Nov 2018 14:24:16 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f19-v6so9059704wmb.0
	for <linux-lvm@redhat.com>; Tue, 06 Nov 2018 06:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20181103035341.16893-1-helen.koike@collabora.com>
	<3624012.MiIzIq7dko@blindfold>
In-Reply-To: <3624012.MiIzIq7dko@blindfold>
From: Will Drewry <wad@chromium.org>
Date: Tue, 6 Nov 2018 08:24:02 -0600
Message-ID: <CAAFS_9F62S_rm2uJDzXJzJyM82-o-xBAnx5Rkk-3iDD53YS72g@mail.gmail.com>
Subject: Re: [linux-lvm] [PATCH v10 0/2] dm: boot a mapped device without an
	initramfs
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
To: richard@nod.at
Cc: Kees Cook <keescook@chromium.org>, Mike Snitzer <snitzer@redhat.com>, linux-doc@vger.kernel.org, device-mapper development <dm-devel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, helen.koike@collabora.com, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, Alasdair G Kergon <agk@redhat.com>

Hi Richard, Helen,

On Sat, Nov 3, 2018 at 4:10 AM Richard Weinberger <richard@nod.at> wrote:
>
> Helen,
>
> Am Samstag, 3. November 2018, 04:53:39 CET schrieb Helen Koike:
> > As mentioned in the discussion from the previous version of this patch, Android
> > and Chrome OS do not use initramfs mostly due to boot time and size liability.
>
> Do you have numbers on that?

Originally, we saved ~200 ms, but I don't think we have recent
numbers.  (Unless Helen has some!) We first authored and posted this
patch in 2010:
- https://marc.info/?l=dm-devel&m=127429492521964&w=2
- https://marc.info/?l=dm-devel&m=127429499422096&w=2
- https://marc.info/?l=dm-devel&m=127429493922000&w=2

Every Chrome OS device uses a variant of this patch as well as
Android devices starting last year (if they use AVB 2.0).

Originally, the intent was the measured latency reduction.  We get a
linear speed
improvement when doing a cryptographic verification of the kernel and
initramfs.
Why? More data == more hashes (sha256 w/compute per block).  There's
additional overhead from bringing up early userspace, but those are the
numbers I don't have.

> I understand that using something like dracut with systemd inside is not what you
> want from a boot time point of view.
> But having an initramfs embedded into the kernel image which contains only a single
> static linked binary can be *very* small and fast.
> If you invest a little more time, you don't even need a libc, just fire up some
> syscalls to setup your dm. I use this technique regularly on deeply embedded systems
> to setup non-trivial UBIFS/crypto stuff.
>
> Want I'm trying to say, before adding ad-hoc a feature to the kernel, we should be
> very sure that there is no other way to solve this in a sane manner.
> We have initramfs support for reasons.

I very much appreciate the perspective, but after 8 years in shipping
devices after
integrating feedback from kernel maintainers over the subsequent years, this
doesn't feel like an "ad-hoc" feature.  It's been effective and fit in
well with the
existing kernel functionality, etc (imho :).  What level of
performance improvement or
other changes might be necessary to make the cut?

Thanks!
will
