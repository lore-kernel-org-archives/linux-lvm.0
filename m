From: Richard Weinberger <richard@nod.at>
Date: Sat, 03 Nov 2018 10:10:08 +0100
Message-ID: <3624012.MiIzIq7dko@blindfold>
In-Reply-To: <20181103035341.16893-1-helen.koike@collabora.com>
References: <20181103035341.16893-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
To: Helen Koike <helen.koike@collabora.com>, keescook@chromium.org
Cc: wad@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, dm-devel@redhat.com, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

Helen,

Am Samstag, 3. November 2018, 04:53:39 CET schrieb Helen Koike:
> As mentioned in the discussion from the previous version of this patch, Android
> and Chrome OS do not use initramfs mostly due to boot time and size liability.

Do you have numbers on that?

I understand that using something like dracut with systemd inside is not what you
want from a boot time point of view.
But having an initramfs embedded into the kernel image which contains only a single
static linked binary can be *very* small and fast.
If you invest a little more time, you don't even need a libc, just fire up some
syscalls to setup your dm. I use this technique regularly on deeply embedded systems
to setup non-trivial UBIFS/crypto stuff.

Want I'm trying to say, before adding ad-hoc a feature to the kernel, we should be
very sure that there is no other way to solve this in a sane manner.
We have initramfs support for reasons.

Thanks,
//richard
