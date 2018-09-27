Date: Thu, 27 Sep 2018 10:23:29 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20180927142328.GA4074@redhat.com>
References: <cover.1537936397.git.helen.koike@collabora.com>
	<CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvzCDOTR4stPmp1TTLkQ39x3e8MQuL=AR754abKc5skhpA@mail.gmail.com>
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
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Will Drewry <wad@chromium.org>, linux-doc@vger.kernel.org, device-mapper development <dm-devel@redhat.com>, LKML <linux-kernel@vger.kernel.org>, helen.koike@collabora.com, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

On Wed, Sep 26 2018 at  3:16am -0400,
Richard Weinberger <richard.weinberger@gmail.com> wrote:

> Helen,
> 
> On Wed, Sep 26, 2018 at 7:01 AM Helen Koike <helen.koike@collabora.com> wrote:
> >
> > This series is reviving an old patchwork.
> > Booting from a mapped device requires an initramfs. This series is
> > allows for device-mapper targets to be configured at boot time for
> > use early in the boot process (as the root device or otherwise).
> 
> What is the reason for this patch series?
> Setting up non-trivial root filesystems/storage always requires an
> initramfs, there is nothing
> wrong about this.

Exactly.  If phones or whatever would benefit from this patchset then
say as much.

I will not accept this patchset at this time.

> > Example, the following could be added in the boot parameters.
> > dm="lroot,,,rw, 0 4096 linear 98:16 0, 4096 4096 linear 98:32 0" root=/dev/dm-0
> 
> Hmmm, the new dm= parameter is anything but easy to get right.

No, it isn't.. exposes way too much potential for users hanging
themselves.
