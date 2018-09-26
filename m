MIME-Version: 1.0
References: <cover.1537936397.git.helen.koike@collabora.com>
In-Reply-To: <cover.1537936397.git.helen.koike@collabora.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 26 Sep 2018 09:16:57 +0200
Message-ID: <CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
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
To: helen.koike@collabora.com
Cc: Will Drewry <wad@chromium.org>, snitzer@redhat.com, linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, device-mapper development <dm-devel@redhat.com>, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

Helen,

On Wed, Sep 26, 2018 at 7:01 AM Helen Koike <helen.koike@collabora.com> wrote:
>
> This series is reviving an old patchwork.
> Booting from a mapped device requires an initramfs. This series is
> allows for device-mapper targets to be configured at boot time for
> use early in the boot process (as the root device or otherwise).

What is the reason for this patch series?
Setting up non-trivial root filesystems/storage always requires an
initramfs, there is nothing
wrong about this.

> Example, the following could be added in the boot parameters.
> dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0

Hmmm, the new dm= parameter is anything but easy to get right.

-- 
Thanks,
//richard
