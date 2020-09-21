Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E781004142
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 13:48:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B9F09858289
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 13:48:08 +0000 (UTC)
MIME-Version: 1.0
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
In-Reply-To: <73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Mon, 21 Sep 2020 09:47:51 -0400
Message-ID: <CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
Subject: Re: [linux-lvm] thin: pool target too small
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 21, 2020 at 5:23 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 21. 09. 20 v 1:48 Duncan Townsend napsal(a):
> > Hello!
> >
> > I think the problem I'm having is a related problem to this thread:
> > https://www.redhat.com/archives/linux-lvm/2016-May/msg00092.html
> > continuation https://www.redhat.com/archives/linux-lvm/2016-June/msg00000.html
> > . In the previous thread, Zdenek Kabelac fixed the problem manually,
> > but there was no information about exactly what or how the problem was
> > fixed. I have also posted about this problem on the #lvm on freenode
> > and on Stack Exchange
> > (https://superuser.com/questions/1587224/lvm2-thin-pool-pool-target-too-small),
> > so my apologies to those of you who are seeing this again.
>
>
> Hi
>
> At first it's worth to remain which version of  kernel, lvm2, thin-tools
> (d-m-p-d package on RHEL/Fedora-   aka  thin_check -V) is this.

Ahh, thank you for the reminder. My apologies for not including this
in my original message. I use Void Linux on aarch64-musl:

# uname -a
Linux (none) 5.7.0_1 #1 SMP Thu Aug 6 20:19:56 UTC 2020 aarch64 GNU/Linux

# lvm version
  LVM version:     2.02.187(2) (2020-03-24)
  Library version: 1.02.170 (2020-03-24)
  Driver version:  4.42.0
  Configuration:   ./configure --prefix=/usr --sysconfdir=/etc
--sbindir=/usr/bin --bindir=/usr/bin --mandir=/usr/share/man
--infodir=/usr/share/info --localstatedir=/var --disable-selinux
--enable-readline --enable-pkgconfig --enable-fsadm --enable-applib
--enable-dmeventd --enable-cmdlib --enable-udev_sync
--enable-udev_rules --enable-lvmetad
--with-udevdir=/usr/lib/udev/rules.d --with-default-pid-dir=/run
--with-default-dm-run-dir=/run --with-default-run-dir=/run/lvm
--with-default-locking-dir=/run/lock/lvm --enable-static_link
--host=x86_64-unknown-linux-musl --build=x86_64-unknown-linux-musl
--host=aarch64-linux-musl --with-sysroot=/usr/aarch64-linux-musl
--with-libtool-sysroot=/usr/aarch64-linux-musl

# thin_check -V
0.8.5

> > I had a problem with a runit script that caused my dmeventd to be
> > killed and restarted every 5 seconds. The script has been fixed, but
>
> Kill dmeventd is always BAD plan.
> Either you do not want monitoring (set to 0 in lvm.conf) - or
> leave it to it jobs - kill dmeventd in the middle of its work
> isn't going to end well...)

Thank you for reinforcing this. My runit script was fighting with
dracut in my initramfs. My runit script saw that there was a dmeventd
not under its control, and so tried to kill the one started by dracut.
I've gone and disabled the runit script and replaced it with a stub
that simply tried to kill the dracut-started dmeventd when it receives
a signal.

> > device-mapper: thin: 253:10: reached low water mark for data device:
> > sending event.
> > lvm[1221]: WARNING: Sum of all thin volume sizes (2.81 TiB) exceeds
> > the size of thin pools and the size of whole volume group (1.86 TiB).
> > lvm[1221]: Size of logical volume
> > nellodee-nvme/nellodee-nvme-thin_tdata changed from 212.64 GiB (13609
> > extents) to <233.91 GiB (14970 extents).
> > device-mapper: thin: 253:10: growing the data device from 13609 to 14970 blocks
> > lvm[1221]: Logical volume nellodee-nvme/nellodee-nvme-thin_tdata
> > successfully resized.
>
> So here was successful resize -
>
> > lvm[1221]: dmeventd received break, scheduling exit.
> > lvm[1221]: dmeventd received break, scheduling exit. > lvm[1221]: WARNING: Thin pool
> > nellodee--nvme-nellodee--nvme--thin-tpool data is now 81.88% full.
> > <SNIP> (lots of repeats of "lvm[1221]: dmeventd received break,
> > scheduling exit.")
> > lvm[1221]: No longer monitoring thin pool
> > nellodee--nvme-nellodee--nvme--thin-tpool.
> > device-mapper: thin: 253:10: pool target (13609 blocks) too small:
> > expected 14970
>
> And now we can see the problem - the thin-pool was already upsized to bigger
> size (13609 -> 14970 as seen above) - yet something has tried to activate
> thin-pool with smaller metadata volume.

I think what happened here is that the dmeventd started by dracut
finally exited, and then the dmeventd started by runit takes over.
Then the started-by-runit dmevent and tries to activate the thin-pool
which is in the process of being resized?

> > device-mapper: table: 253:10: thin-pool: preresume failed, error = -22
>
> This is correct - it's preventing further damage of thin-pool to happen.
>
> > lvm[1221]: dmeventd received break, scheduling exit.
> > (previous message repeats many times)
> >
> > After this, the system became unresponsive, so I power cycled it. Upon
> > boot up, the following message was printed and I was dropped into an
> > emergency shell:
> >
> > device-mapper: thin: 253:10: pool target (13609 blocks) too small:
> > expected 14970
> > device-mapper: table: 253:10: thin-pool: preresume failed, error = -22
>
>
> So the primary question is - how the LVM could have got 'smaller' metadata
> back - have you played with  'vgcfgrestore' ?
>
> So when you submit version of tools - also provide  /etc/lvm/archive
> (eventually lvmdump archive)

Yes, I have tried making significant use of vgcfgrestore. I make
extensive use of snapshots in my backup system, so my /etc/lvm/archive
has many entries. Restoring the one from just before the lvextend call
that triggered this mess has not fixed my problem.

> > I have tried using thin_repair, which reported success and didn't
> > solve the problem. I tried vgcfgrestore (using metadata backups going
> > back quite a ways), which also reported success and did not solve the
> > problem. I tried lvchange --repair. I tried lvextending the thin
>
>
> 'lvconvert --repair' can solve only very basic issues - it's not
> able to resolve badly sized metadata device ATM.
>
> For all other case you need to use manual repair steps.
>
>
> > I am at a loss here about how to proceed with fixing this problem. Is
> > there some flag I've missed or some tool I don't know about that I can
> > apply to fixing this problem? Thank you very much for your attention,
>
> I'd expect in your /etc/lvm/archive   (or in the 1st. 1MiB of your device
> header) there can be seen a history of changes of your lvm2 metadata and you
> should be able ot find when then _tmeta LV was matching your new metadata size
> and maybe see when it's got previous size.

I've replied privately with a tarball of my /etc/lvm/archive and the
lvm header. If I should send them to the broader list, I'll do that
too, but I want to be respectful of the size of what I drop in
people's inboxes.

> Without knowing more detail it's hard to give precise answer - but before you
> will try to do some next steps of your recovery be sure you know what you
> are doing - it's better to ask here the be sorry later.
>
> Regards
>
> Zdenek

Thank you so much for your help. I appreciate it very much!
--Duncan Townsend
