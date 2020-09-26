Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DEEF4EDC
	for <linux-lvm@redhat.com>; Sat, 26 Sep 2020 14:30:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8E87858298
	for <linux-lvm@redhat.com>; Sat, 26 Sep 2020 14:30:20 +0000 (UTC)
MIME-Version: 1.0
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
	<CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
	<f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
In-Reply-To: <f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Sat, 26 Sep 2020 09:30:24 -0400
Message-ID: <CAODnkUCc6r5kphRs27PE6azH-bDni+pTC02bN5XBhwRcY7+c5A@mail.gmail.com>
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

On Thu, Sep 24, 2020 at 1:54 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Dne 23. 09. 20 v 21:54 Duncan Townsend napsal(a):
> > On Wed, Sep 23, 2020 at 2:49 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
> >> Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):
> > I apologize, but I am back with a related, similar problem. After
> > editing the metadata file and replacing the transaction number, my
> > system became serviceable again. After making absolutely sure that
> > dmeventd was running correctly, my next order of business was to
> > finish backing up before any other tragedy happens. Unfortunately,
> > taking a snapshot as part of the backup process has once again brought
> > my system to its knees. The first error message I saw was:
>
> Hi
>
> And now you've hit an interesting bug inside lvm2 code - I've opened new BZ
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1882483
>
> This actually explains few so far not well understood problems I've
> seen before without good explanation how to hit them.

Ahh! Exciting! Thanks for opening the bugzilla. Is there any
additional information I could supply to make this easier?

> >    WARNING: Sum of all thin volume sizes (XXX TiB) exceeds the size of
> > thin pool <VG>/<THIN POOL LV> and the size of whole volume group (YYY
> > TiB).
> >    device-mapper: message ioctl on  (MAJOR:MINOR) failed: File exists
> >    Failed to process thin pool message "create_snap 11 4".
> >    Failed to suspend thin snapshot origin <VG>/<THIN LV>.
> >    Internal error: Writing metadata in critical section.
> >    Releasing activation in critical section.
> >    libdevmapper exiting with 1 device(s) still suspended.
>
> So I've now quite simple reproducer for unhanded error case.
> It's basically exposing mismatch between kernel (_tmeta) and lvm2
> metadata content.  And lvm2 can handle this discovery better
> than what you see now,
>
> > There were further error messages as further snapshots were attempted,
> > but I was unable to capture them as my system went down. Upon reboot,
> > the "transaction_id" message that I referred to in my previous message
> > was repeated (but with increased transaction IDs).
>
> For better fix it would need to be better understood what has happened
> in parallel while 'lvm' inside dmeventd was resizing pool data.

To the best of my knowledge, no other LVM operations were in flight at
the time. The script that I use issues LVM commands strictly
sequentially and there are no other daemons that make use of LVM
(except dmeventd and lvmetad, of course). Is there something else I
should be looking out for? Is there another log that I can examine?

> It looks like the 'other' lvm managed to create another snapshot
> (and thus the DeviceID appeared to already exists - while it should not
> according to lvm2 metadata before it hit problem with mismatch of
> transaction_id.
>
> > I will reply privately with my lvm metadata archive and with my
> > header. My profuse thanks, again, for assisting me getting my system
> > back up and running.
>
> So the valid fix would be to take 'thin_dump' of kernel metadata
> (aka content of _tmeta device)
> Then check what you have in lvm2 metadata and likely you will
> find some device in kernel - for which you don't have match
> in lvm2 metadata -  these devices would need to be copied
> from your other sequence of lvm2 metadata.

I'll reply privately with the compressed output of thin_dump.

> Other maybe more simple way could be to just remove devices
> from xml thin_dump and thin_restore those metadata that should should
> now match lvm2.
>
> The last issue is then to match 'transaction_id' with the number
> stored in kernel metadata.
>
> So not sure which way you want to go and how important those
> snapshot (that could be dropped) are ?

Would it be reasonable to use vgcfgrestore again on the
manually-repaired metadata I used before? I'm not entirely sure what
to look for while editing the XML from thin_dump, and I would very
much like to avoid causing further damage to my system. (Also, FWIW,
thin_dump appears to segfault when run with musl-libc instead of
glibc. I had to use a glibc recovery image to get this dump. I'm
following up with the void distro maintainers about this.)

I plan to "just" create a new thin pool and copy all the thin LVs over
to the new pool. I'm hoping that that will let me wash my hands of
this matter and restore my system to a stable state. The snapshots
that I create are purely read-only so that the slow-moving backup
process can get an atomic view of the filesystem in use. They contain
no important information that isn't also captured in the origin LV
itself.

Thank you!
--Duncan Townsend
