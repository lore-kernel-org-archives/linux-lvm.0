Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86ECB183BA
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2017 23:50:58 +0000 (UTC)
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3330C0587CA
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2017 23:50:56 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id m68so22083835ith.1
	for <linux-lvm@redhat.com>; Tue, 27 Jun 2017 16:50:56 -0700 (PDT)
MIME-Version: 1.0
Sender: keescook@google.com
In-Reply-To: <20170519071146.25760-1-enric.balletbo@collabora.com>
References: <20170519071146.25760-1-enric.balletbo@collabora.com>
From: Kees Cook <keescook@chromium.org>
Date: Tue, 27 Jun 2017 16:50:55 -0700
Message-ID: <CAGXu5j+_Bzn-xdaSLOR0bsHMZpngOYw=8CnHDcABk0Xs+T1xqA@mail.gmail.com>
Subject: Re: [linux-lvm] [PATCH v8 0/2] dm: boot a mapped device without an
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
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Mike Snitzer <snitzer@redhat.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, dm-devel@redhat.com, linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>

On Fri, May 19, 2017 at 12:11 AM, Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
> Dear all,
>
> So here is a new version of the patches to be reviewed, this time as
> suggested by Alasdair the patches are reworked to match with the new
> dmsetup bootformat feature [1]. These patches are not reviewed yet but
> the format was discussed in the IRC and was suggested to send the
> kernel patches in parallel.

Just pinging on this thread again. Alasdair, how does this look to you?

Thanks!

-Kees

>
> Changes since v7:
>  - Fix build error due commit
>     e516db4f67 (dm ioctl: add a new DM_DEV_ARM_POLL ioctl)
>
> Changes since v6:
>  - Add a new function to issue the equivalent of a DM ioctl programatically.
>  - Use the new ioctl interface to create the devices.
>  - Use a comma-delimited and semi-colon delimited dmsetup-like commands.
>
> Changes since v5:
>  - https://www.redhat.com/archives/dm-devel/2016-February/msg00112.html
>
> [1] https://www.redhat.com/archives/linux-lvm/2017-May/msg00047.html
>
> Wating for your feedback,
>
> Enric Balletbo i Serra (1):
>   dm ioctl: add a device mapper ioctl function.
>
> Will Drewry (1):
>   init: add support to directly boot to a mapped device
>
>  Documentation/admin-guide/kernel-parameters.rst |   1 +
>  Documentation/admin-guide/kernel-parameters.txt |   3 +
>  Documentation/device-mapper/dm-boot.txt         |  65 ++++
>  drivers/md/dm-ioctl.c                           |  50 +++
>  include/linux/device-mapper.h                   |   6 +
>  init/Makefile                                   |   1 +
>  init/do_mounts.c                                |   1 +
>  init/do_mounts.h                                |  10 +
>  init/do_mounts_dm.c                             | 459 ++++++++++++++++++++++++
>  9 files changed, 596 insertions(+)
>  create mode 100644 Documentation/device-mapper/dm-boot.txt
>  create mode 100644 init/do_mounts_dm.c
>
> --
> 2.9.3
>



-- 
Kees Cook
Pixel Security
