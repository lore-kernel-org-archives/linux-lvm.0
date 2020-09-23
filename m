Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1956210F026
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2020 20:54:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FC1418AE948
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2020 20:54:49 +0000 (UTC)
MIME-Version: 1.0
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
In-Reply-To: <a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Wed, 23 Sep 2020 15:54:50 -0400
Message-ID: <CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
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

On Wed, Sep 23, 2020 at 2:49 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):
> > On Tue, Sep 22, 2020, 5:02 PM Zdenek Kabelac <zkabelac@redhat.com
> >
> > dmeventd does write its PID file into the correct directory in the
> > post-initramfs root, so whatever's happening is some weird hybrid. I'll debug
> > this further with my distro.
> >
> >     So I think to prevent repeated occurrence of this problem - you'll need
> >     to ensure your system-booting will follow the pattern from distros
> >     like Fedora.
> >
> >
> > I think for now, the easiest solution may be to try to stop dmeventd from
> > being started by dracut.
>
> Basically all you need to do for dracut (with reagards to dmeventd) is to
> setup inside dracut environemnt  'monitoring=0'  in /etc/lvm/lvm.conf there.
> (so when it's copied system's lvm.conf there - replace with sed/awk...)
>
> Also there is   'metadata_read_only=1' setting that can be useful for
> dracut environment.

Thanks for the advice!

> Dracut needs some bigger fixing on its own - but ATM we simply can't
> provide set of features we would like to have.
>
> > I have encountered a further problem in the process of restoring my thin pool
> > to a working state. After using vgcfgrestore to fix the mismatching metadata
> > using the file Zdenek kindly provided privately, when I try to activate my
> > thin LVs, I'm now getting the error message:
> >
> > Thin pool <THIN POOL LONG NAME>-tpool transaction_id (MAJOR:MINOR)
> > transaction_id is XXX, while expected YYY.
> Set the transaction_id to the right number in the ASCII lvm2 metadata file.

I apologize, but I am back with a related, similar problem. After
editing the metadata file and replacing the transaction number, my
system became serviceable again. After making absolutely sure that
dmeventd was running correctly, my next order of business was to
finish backing up before any other tragedy happens. Unfortunately,
taking a snapshot as part of the backup process has once again brought
my system to its knees. The first error message I saw was:

  WARNING: Sum of all thin volume sizes (XXX TiB) exceeds the size of
thin pool <VG>/<THIN POOL LV> and the size of whole volume group (YYY
TiB).
  device-mapper: message ioctl on  (MAJOR:MINOR) failed: File exists
  Failed to process thin pool message "create_snap 11 4".
  Failed to suspend thin snapshot origin <VG>/<THIN LV>.
  Internal error: Writing metadata in critical section.
  Releasing activation in critical section.
  libdevmapper exiting with 1 device(s) still suspended.

There were further error messages as further snapshots were attempted,
but I was unable to capture them as my system went down. Upon reboot,
the "transaction_id" message that I referred to in my previous message
was repeated (but with increased transaction IDs).

I will reply privately with my lvm metadata archive and with my
header. My profuse thanks, again, for assisting me getting my system
back up and running.
--Duncan Townsend
