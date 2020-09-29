Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C0142156A39
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2020 14:33:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8CBF803523
	for <linux-lvm@redhat.com>; Tue, 29 Sep 2020 14:33:54 +0000 (UTC)
MIME-Version: 1.0
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
	<CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
	<f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
	<CAODnkUCc6r5kphRs27PE6azH-bDni+pTC02bN5XBhwRcY7+c5A@mail.gmail.com>
In-Reply-To: <CAODnkUCc6r5kphRs27PE6azH-bDni+pTC02bN5XBhwRcY7+c5A@mail.gmail.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Tue, 29 Sep 2020 09:33:38 -0500
Message-ID: <CAODnkUDFj8CB4UwquYmGkdG2O9E+uge-E6SFqu7=htOVECNShA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cf7de905b074ab36"
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000cf7de905b074ab36
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 26, 2020, 8:30 AM Duncan Townsend <duncancmt@gmail.com> wrote:

> On Thu, Sep 24, 2020 at 1:54 PM Zdenek Kabelac <zkabelac@redhat.com>
> wrote:
> > Dne 23. 09. 20 v 21:54 Duncan Townsend napsal(a):
> > > On Wed, Sep 23, 2020 at 2:49 PM Zdenek Kabelac <zkabelac@redhat.com>
> wrote:
> > >> Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):
> > > I apologize, but I am back with a related, similar problem. After
> > > editing the metadata file and replacing the transaction number, my
> > > system became serviceable again. After making absolutely sure that
> > > dmeventd was running correctly, my next order of business was to
> > > finish backing up before any other tragedy happens. Unfortunately,
> > > taking a snapshot as part of the backup process has once again brought
> > > my system to its knees. The first error message I saw was:
> >
> > Hi
> >
> > And now you've hit an interesting bug inside lvm2 code - I've opened new
> BZ
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=1882483
> >
> > This actually explains few so far not well understood problems I've
> > seen before without good explanation how to hit them.
>
> Ahh! Exciting! Thanks for opening the bugzilla. Is there any
> additional information I could supply to make this easier?
>
> > >    WARNING: Sum of all thin volume sizes (XXX TiB) exceeds the size of
> > > thin pool <VG>/<THIN POOL LV> and the size of whole volume group (YYY
> > > TiB).
> > >    device-mapper: message ioctl on  (MAJOR:MINOR) failed: File exists
> > >    Failed to process thin pool message "create_snap 11 4".
> > >    Failed to suspend thin snapshot origin <VG>/<THIN LV>.
> > >    Internal error: Writing metadata in critical section.
> > >    Releasing activation in critical section.
> > >    libdevmapper exiting with 1 device(s) still suspended.
> >
> > So I've now quite simple reproducer for unhanded error case.
> > It's basically exposing mismatch between kernel (_tmeta) and lvm2
> > metadata content.  And lvm2 can handle this discovery better
> > than what you see now,
> >
> > > There were further error messages as further snapshots were attempted,
> > > but I was unable to capture them as my system went down. Upon reboot,
> > > the "transaction_id" message that I referred to in my previous message
> > > was repeated (but with increased transaction IDs).
> >
> > For better fix it would need to be better understood what has happened
> > in parallel while 'lvm' inside dmeventd was resizing pool data.
>
> To the best of my knowledge, no other LVM operations were in flight at
> the time. The script that I use issues LVM commands strictly
> sequentially and there are no other daemons that make use of LVM
> (except dmeventd and lvmetad, of course). Is there something else I
> should be looking out for? Is there another log that I can examine?
>
> > It looks like the 'other' lvm managed to create another snapshot
> > (and thus the DeviceID appeared to already exists - while it should not
> > according to lvm2 metadata before it hit problem with mismatch of
> > transaction_id.
> >
> > > I will reply privately with my lvm metadata archive and with my
> > > header. My profuse thanks, again, for assisting me getting my system
> > > back up and running.
> >
> > So the valid fix would be to take 'thin_dump' of kernel metadata
> > (aka content of _tmeta device)
> > Then check what you have in lvm2 metadata and likely you will
> > find some device in kernel - for which you don't have match
> > in lvm2 metadata -  these devices would need to be copied
> > from your other sequence of lvm2 metadata.
>
> I'll reply privately with the compressed output of thin_dump.
>
> > Other maybe more simple way could be to just remove devices
> > from xml thin_dump and thin_restore those metadata that should should
> > now match lvm2.
> >
> > The last issue is then to match 'transaction_id' with the number
> > stored in kernel metadata.
> >
> > So not sure which way you want to go and how important those
> > snapshot (that could be dropped) are ?
>
> Would it be reasonable to use vgcfgrestore again on the
> manually-repaired metadata I used before? I'm not entirely sure what
> to look for while editing the XML from thin_dump, and I would very
> much like to avoid causing further damage to my system. (Also, FWIW,
> thin_dump appears to segfault when run with musl-libc instead of
> glibc. I had to use a glibc recovery image to get this dump. I'm
> following up with the void distro maintainers about this.)
>
> I plan to "just" create a new thin pool and copy all the thin LVs over
> to the new pool. I'm hoping that that will let me wash my hands of
> this matter and restore my system to a stable state. The snapshots
> that I create are purely read-only so that the slow-moving backup
> process can get an atomic view of the filesystem in use. They contain
> no important information that isn't also captured in the origin LV
> itself.
>

Hello again!

Could someone advise whether the above strategy (restoring my metadata with
vgcfgrestore, making a new thin pool, and copying the contents of my thin
LVs over at the filesystem level) is likely to cause data loss? Is it
likely to solve my ongoing problem with this frustrating thin pool?

Thank you for your advice!
--Duncan Townsend

P.S. This was written on mobile. Please forgive my typos.

>

--000000000000cf7de905b074ab36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Sep 26, 2020, 8:30 AM Duncan Townsend &lt;<a href=3D"m=
ailto:duncancmt@gmail.com">duncancmt@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">On Thu, Sep 24, 2020 at 1:54 PM Zdenek Kabelac &=
lt;<a href=3D"mailto:zkabelac@redhat.com" target=3D"_blank" rel=3D"noreferr=
er">zkabelac@redhat.com</a>&gt; wrote:<br>
&gt; Dne 23. 09. 20 v 21:54 Duncan Townsend napsal(a):<br>
&gt; &gt; On Wed, Sep 23, 2020 at 2:49 PM Zdenek Kabelac &lt;<a href=3D"mai=
lto:zkabelac@redhat.com" target=3D"_blank" rel=3D"noreferrer">zkabelac@redh=
at.com</a>&gt; wrote:<br>
&gt; &gt;&gt; Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):<br>
&gt; &gt; I apologize, but I am back with a related, similar problem. After=
<br>
&gt; &gt; editing the metadata file and replacing the transaction number, m=
y<br>
&gt; &gt; system became serviceable again. After making absolutely sure tha=
t<br>
&gt; &gt; dmeventd was running correctly, my next order of business was to<=
br>
&gt; &gt; finish backing up before any other tragedy happens. Unfortunately=
,<br>
&gt; &gt; taking a snapshot as part of the backup process has once again br=
ought<br>
&gt; &gt; my system to its knees. The first error message I saw was:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; And now you&#39;ve hit an interesting bug inside lvm2 code - I&#39;ve =
opened new BZ<br>
&gt;<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1882483" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://bugzilla.redhat.com/sh=
ow_bug.cgi?id=3D1882483</a><br>
&gt;<br>
&gt; This actually explains few so far not well understood problems I&#39;v=
e<br>
&gt; seen before without good explanation how to hit them.<br>
<br>
Ahh! Exciting! Thanks for opening the bugzilla. Is there any<br>
additional information I could supply to make this easier?<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 WARNING: Sum of all thin volume sizes (XXX TiB) exce=
eds the size of<br>
&gt; &gt; thin pool &lt;VG&gt;/&lt;THIN POOL LV&gt; and the size of whole v=
olume group (YYY<br>
&gt; &gt; TiB).<br>
&gt; &gt;=C2=A0 =C2=A0 device-mapper: message ioctl on=C2=A0 (MAJOR:MINOR) =
failed: File exists<br>
&gt; &gt;=C2=A0 =C2=A0 Failed to process thin pool message &quot;create_sna=
p 11 4&quot;.<br>
&gt; &gt;=C2=A0 =C2=A0 Failed to suspend thin snapshot origin &lt;VG&gt;/&l=
t;THIN LV&gt;.<br>
&gt; &gt;=C2=A0 =C2=A0 Internal error: Writing metadata in critical section=
.<br>
&gt; &gt;=C2=A0 =C2=A0 Releasing activation in critical section.<br>
&gt; &gt;=C2=A0 =C2=A0 libdevmapper exiting with 1 device(s) still suspende=
d.<br>
&gt;<br>
&gt; So I&#39;ve now quite simple reproducer for unhanded error case.<br>
&gt; It&#39;s basically exposing mismatch between kernel (_tmeta) and lvm2<=
br>
&gt; metadata content.=C2=A0 And lvm2 can handle this discovery better<br>
&gt; than what you see now,<br>
&gt;<br>
&gt; &gt; There were further error messages as further snapshots were attem=
pted,<br>
&gt; &gt; but I was unable to capture them as my system went down. Upon reb=
oot,<br>
&gt; &gt; the &quot;transaction_id&quot; message that I referred to in my p=
revious message<br>
&gt; &gt; was repeated (but with increased transaction IDs).<br>
&gt;<br>
&gt; For better fix it would need to be better understood what has happened=
<br>
&gt; in parallel while &#39;lvm&#39; inside dmeventd was resizing pool data=
.<br>
<br>
To the best of my knowledge, no other LVM operations were in flight at<br>
the time. The script that I use issues LVM commands strictly<br>
sequentially and there are no other daemons that make use of LVM<br>
(except dmeventd and lvmetad, of course). Is there something else I<br>
should be looking out for? Is there another log that I can examine?<br>
<br>
&gt; It looks like the &#39;other&#39; lvm managed to create another snapsh=
ot<br>
&gt; (and thus the DeviceID appeared to already exists - while it should no=
t<br>
&gt; according to lvm2 metadata before it hit problem with mismatch of<br>
&gt; transaction_id.<br>
&gt;<br>
&gt; &gt; I will reply privately with my lvm metadata archive and with my<b=
r>
&gt; &gt; header. My profuse thanks, again, for assisting me getting my sys=
tem<br>
&gt; &gt; back up and running.<br>
&gt;<br>
&gt; So the valid fix would be to take &#39;thin_dump&#39; of kernel metada=
ta<br>
&gt; (aka content of _tmeta device)<br>
&gt; Then check what you have in lvm2 metadata and likely you will<br>
&gt; find some device in kernel - for which you don&#39;t have match<br>
&gt; in lvm2 metadata -=C2=A0 these devices would need to be copied<br>
&gt; from your other sequence of lvm2 metadata.<br>
<br>
I&#39;ll reply privately with the compressed output of thin_dump.<br>
<br>
&gt; Other maybe more simple way could be to just remove devices<br>
&gt; from xml thin_dump and thin_restore those metadata that should should<=
br>
&gt; now match lvm2.<br>
&gt;<br>
&gt; The last issue is then to match &#39;transaction_id&#39; with the numb=
er<br>
&gt; stored in kernel metadata.<br>
&gt;<br>
&gt; So not sure which way you want to go and how important those<br>
&gt; snapshot (that could be dropped) are ?<br>
<br>
Would it be reasonable to use vgcfgrestore again on the<br>
manually-repaired metadata I used before? I&#39;m not entirely sure what<br=
>
to look for while editing the XML from thin_dump, and I would very<br>
much like to avoid causing further damage to my system. (Also, FWIW,<br>
thin_dump appears to segfault when run with musl-libc instead of<br>
glibc. I had to use a glibc recovery image to get this dump. I&#39;m<br>
following up with the void distro maintainers about this.)<br>
<br>
I plan to &quot;just&quot; create a new thin pool and copy all the thin LVs=
 over<br>
to the new pool. I&#39;m hoping that that will let me wash my hands of<br>
this matter and restore my system to a stable state. The snapshots<br>
that I create are purely read-only so that the slow-moving backup<br>
process can get an atomic view of the filesystem in use. They contain<br>
no important information that isn&#39;t also captured in the origin LV<br>
itself.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Hello again!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Coul=
d someone advise whether the above strategy (restoring my metadata with vgc=
fgrestore, making a new thin pool, and copying the contents of my thin LVs =
over at the filesystem level) is likely to cause data loss? Is it likely to=
 solve my ongoing problem with this frustrating thin pool?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Thank you for your advice!</div><div dir=
=3D"auto">--Duncan Townsend</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">P.S. This was written on mobile. Please forgive my typos.</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000cf7de905b074ab36--
