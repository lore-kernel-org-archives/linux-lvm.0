Message-ID: <abd460b530b135b8a2c31ea728fc93d4d293ab81.camel@suse.de>
From: Martin Wilck <mwilck@suse.de>
Date: Thu, 12 Sep 2019 15:58:11 +0200
In-Reply-To: <884e9e0c-89ee-803b-78bd-cce7a9686c23@gmail.com>
References: <ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
	<20190905165519.GB30473@redhat.com>
	<faa66217-fc52-5785-1ca9-d73b13727c12@suse.com>
	<b3790725-7a60-6fd7-ab64-8dfd75ce6628@suse.com>
	<8b432efdabc3de82146ea6cb87b27c89556bf72e.camel@suse.de>
	<20190906140351.GB652@redhat.com>
	<c1e8a6d2-d180-03c6-38ab-a402e813e99d@suse.com>
	<20190909140956.GA31823@redhat.com>
	<b17fd5db54c852869c7ad8440f3492c367ced33d.camel@suse.de>
	<20190910152010.GA6789@redhat.com>
	<665159ea-e617-5307-2dfe-bddc1b2fb7b0@gmail.com>
	<d94bc3f8c81e5701c97d4a3b00b88b5b1f01e861.camel@suse.de>
	<884e9e0c-89ee-803b-78bd-cce7a9686c23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>
Cc: Heming Zhao <heming.zhao@suse.com>

On Wed, 2019-09-11 at 11:13 +0200, Zdenek Kabelac wrote:
> Dne 11. 09. 19 v 9:17 Martin Wilck napsal(a):
> > 
> > My idea was not to skip synchronization entirely, but to consider
> > moving it to a separate process / service. I surely don't want to
> > re-
> > invent lvmetad, but Heming's findings show that it's more efficient
> > to
> > do activation in a "single swoop" (like lvm2-activation.service)
> > than
> > with many concurrent pvscan processes.
> > 
> > So instead of activating a VG immediately when it sees all
> > necessary
> > PVs are detected, pvscan could simply spawn a new service which
> > would
> > then take care of the activation, and sync with udev.
> > 
> > Just a thought, I lack in-depth knowledge of LVM2 internals to know
> > if
> > it's possible.
> 
> Well for relatively long time we do want to move 'pvscan' back to be
> processed 
> within udev rules  and activation service being really just a service
> doing  'vgchange -ay'.

That sounds promising (I believe pvscan could well still be called via
'ENV{SYSTEMD_WANTS}+=' rather than being directly called from udev
rules, but that's just a detail). 
But it doesn't sound as if such a solution was imminent, right?

> Another floating idea is to move towards monitoring instead of using
> semaphore
> (since those SysV resources are kind-of limited and a bit problematic
> when there are left in the system).

I'm not sure I understand - are you talking about udev monitoring?

Thanks
Martin
