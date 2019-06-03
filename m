Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F25CC60C91
	for <linux-lvm@redhat.com>; Mon,  3 Jun 2019 23:03:13 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC76F30833C0
	for <linux-lvm@redhat.com>; Mon,  3 Jun 2019 23:03:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id 20so9134374pgr.4
	for <linux-lvm@redhat.com>; Mon, 03 Jun 2019 16:03:01 -0700 (PDT)
Message-ID: <5cf5a724.1c69fb81.1e8f0.08fb@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20190221203334.24504-1-helen.koike@collabora.com>
References: <20190221203334.24504-1-helen.koike@collabora.com>
From: Stephen Boyd <swboyd@chromium.org>
Date: Mon, 03 Jun 2019 16:02:59 -0700
Content-Transfer-Encoding: 8bit
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
To: Helen Koike <helen.koike@collabora.com>, dm-devel@redhat.com
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, richard.weinberger@gmail.com, linux-kernel@vger.kernel.org, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

Quoting Helen Koike (2019-02-21 12:33:34)
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
> 
> ---
> 

I'm trying to boot a mainline linux kernel on a chromeos device with dm
verity and a USB stick but it's not working for me even with this patch.
I've had to hack around two problems:

 1) rootwait isn't considered

 2) verity doesn't seem to accept UUID for <hash_dev> or <dev>

For the first problem, it happens every boot for me because I'm trying
to boot off of a USB stick and it's behind a hub that takes a few
seconds to enumerate. If I hack up the code to call dm_init_init() after
the 'rootdelay' cmdline parameter is used then I can make this work. It
would be much nicer if the whole mechanism didn't use a late initcall
though. If it used a hook from prepare_namespace() and then looped
waiting for devices to create when rootwait was specified it would work.

The second problem is that in chromeos we have the bootloader fill out
the UUID of the kernel partition (%U) and then we have another parameter
that indicates the offset from that kernel partition to add to the
kernel partition (typically 1, i.e. PARTNROFF=1) to find the root
filesystem partition. The way verity seems to work here is that we need
to specify a path like /dev/sda3 or the major:minor number of the device
on the commandline to make this work. It would be better if we could add
in support for the PARTNROFF style that name_to_dev_t() handles so we
can specify the root partition like we're currently doing. I suspect we
should be able to add support for this into the device mapper layer so
that we can specify devices this way.

If it helps, an example commandline I've been using to test out a usb
stick is as follows:

dm-mod.create="vroot,,0,ro, 0 4710400 verity 0 8:19 8:19 4096 4096 588800 588800 sha1 9b0a223aedbf74b06442b0f05fbff33c55edd010 414b21fba60a1901e23aec373e994942e991d6762631e54a39bc42411f244bd2"

Also, the documentation (Documentation/device-mapper/dm-init.txt) says
we can use a way that doesn't specify so many arguments, but dm verity
complains about not enough arguments (10) when following the example:

  vroot,,,ro,
  0 1740800 verity 254:0 254:0 1740800 sha1
  76e9be054b15884a9fa85973e9cb274c93afadb6
  5b3549d54d6c7a3837b9b81ed72e49463a64c03680c47835bef94d768e5646fe;    

So the documentation needs an update?
