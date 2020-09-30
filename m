Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D55211111C9B
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2020 18:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4FC1101A53F
	for <linux-lvm@redhat.com>; Wed, 30 Sep 2020 18:00:38 +0000 (UTC)
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
	<CAODnkUDFj8CB4UwquYmGkdG2O9E+uge-E6SFqu7=htOVECNShA@mail.gmail.com>
	<d572fdec-c2f1-b02a-7697-45ce932f9220@redhat.com>
In-Reply-To: <d572fdec-c2f1-b02a-7697-45ce932f9220@redhat.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Wed, 30 Sep 2020 13:00:21 -0500
Message-ID: <CAODnkUDLbQ12itWB8OaOzbwhem8ozF+L4eq0z+=KhJX6fQ_=eQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000002171005b08baddc"
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

--00000000000002171005b08baddc
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 29, 2020, 10:54 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 29. 09. 20 v 16:33 Duncan Townsend napsal(a):
> > On Sat, Sep 26, 2020, 8:30 AM Duncan Townsend <duncancmt@gmail.com
> > <mailto:duncancmt@gmail.com>> wrote:
> >
> >>      > > There were further error messages as further snapshots were
> attempted,
> >      > > but I was unable to capture them as my system went down. Upon
> reboot,
> >      > > the "transaction_id" message that I referred to in my previous
> message
> >      > > was repeated (but with increased transaction IDs).
> >      >
> >      > For better fix it would need to be better understood what has
> happened
> >      > in parallel while 'lvm' inside dmeventd was resizing pool data.
> >
>
> So the lvm2 has been fixed upstream to report more educative messages to
> the user - although it still does require some experience in managing
> thin-pool kernel metadata and lvm2 metadata.
>

That's good news! However, I believe I lack the requisite experience. Is
there some documentation that I ought to read as a starting point? Or is it
best to just read the source?

>     To the best of my knowledge, no other LVM operations were in flight at
> >     the time. The script that I use issues LVM commands strictly
>
> In your case - dmeventd did 'unlocked' resize - while other command
> was taking a snapshot - and it happened the sequence with 'snapshot' has
> won - so until the reload of thin-pool - lvm2 has not spotted difference.
> (which is simply a bad race cause due to badly working locking on your
> system)
>

After reading more about lvm locking, it looks like the original issue
might have been that the locking directory lives on a lv instead of on a
non-lvm-managed block device. (Although, the locking directory is on a
different vg on a different pv from the one that had the error.)

Is there a way to make dmeventd (or any other lvm program) abort if this
locking fails? Should I switch to using a clustered locking daemon (even
though I have only the single, non-virtualized host)?

>     Would it be reasonable to use vgcfgrestore again on the
> >     manually-repaired metadata I used before? I'm not entirely sure what
>
> You will need to vgcfgrestore - but I think you've misused my passed
> recoverd
> piece, where I've specifically asked to only replace specific segments of
> resized thin-pool within your latest VG metadata - since those likely have
> all the proper mappings to thin LVs.
>

All I did was use vgcfgrestore to apply the metadata file attached to your
previous private email. I had to edit the transaction number, as I noted
previously. That was a single line change. Was that the wrong thing to do?
I lack the experience with lvm/thin metadata, so I am flying a bit blind
here. I apologize if I've made things worse.

While you have taken the metadata from 'resize' moment - you've lost all
> the thinLV lvm2 metadata for later created one.
>
> I'll try to make one for you.
>

Thank you very much. I am extremely grateful that you've helped me so much
in repairing my system.

>     to look for while editing the XML from thin_dump, and I would very
> >     much like to avoid causing further damage to my system. (Also, FWIW,
> >     thin_dump appears to segfault when run with musl-libc instead of
>
> Well - lvm2 is glibc oriented project - so users of those 'esoteric'
> distribution need to be expert on its own.
>
> If you can provide coredump or even better patch for crash - we might
> replace the code with something better usable - but there is zero testing
> with anything else then glibc...
>

Noted. I believe I'll be switching to glibc because there are a number of
other packages that are broken for this distro.

If you have an interest, this is the issue I've opened with my distro about
the crash: https://github.com/void-linux/void-packages/issues/25125 . I
despair that this will receive much attention, given that not even gdb
works properly.

Thanks again!
--Duncan Townsend

P.S. This was written on mobile. Please forgive my typos.

--00000000000002171005b08baddc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Tue, Sep 29, 2020, 10:54 AM Zdenek Kabelac &lt=
;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Dne 29. 09. 20 v 16:33 Duncan Towns=
end napsal(a):<br>
&gt; On Sat, Sep 26, 2020, 8:30 AM Duncan Townsend &lt;<a href=3D"mailto:du=
ncancmt@gmail.com" target=3D"_blank" rel=3D"noreferrer">duncancmt@gmail.com=
</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:duncancmt@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">duncancmt@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; There were further error messages as=
 further snapshots were attempted,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; but I was unable to capture them as my s=
ystem went down. Upon reboot,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; the &quot;transaction_id&quot; message t=
hat I referred to in my previous message<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; was repeated (but with increased transac=
tion IDs).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; For better fix it would need to be better und=
erstood what has happened<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; in parallel while &#39;lvm&#39; inside dmeven=
td was resizing pool data.<br>
&gt; <br>
<br>
So the lvm2 has been fixed upstream to report more educative messages to<br=
>
the user - although it still does require some experience in managing<br>
thin-pool kernel metadata and lvm2 metadata.<br></blockquote></div></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">That&#39;s good news! However, =
I believe I lack the requisite experience. Is there some documentation that=
 I ought to read as a starting point? Or is it best to just read the source=
?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0To the best of my knowledge, no other LVM operation=
s were in flight at<br>
&gt;=C2=A0 =C2=A0 =C2=A0the time. The script that I use issues LVM commands=
 strictly<br>
<br>
In your case - dmeventd did &#39;unlocked&#39; resize - while other command=
<br>
was taking a snapshot - and it happened the sequence with &#39;snapshot&#39=
; has<br>
won - so until the reload of thin-pool - lvm2 has not spotted difference.<b=
r>
(which is simply a bad race cause due to badly working locking on your syst=
em)<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">After reading more about lvm locking, it looks like the original issue m=
ight have been that the locking directory lives on a lv instead of on a non=
-lvm-managed block device. (Although, the locking directory is on a differe=
nt vg on a different pv from the one that had the error.)</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Is there a way to make dmeventd (or any o=
ther lvm program) abort if this locking fails? Should I switch to using a c=
lustered locking daemon (even though I have only the single, non-virtualize=
d host)?</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0Would it be reasonable to use vgcfgrestore again on=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0manually-repaired metadata I used before? I&#39;m n=
ot entirely sure what<br>
<br>
You will need to vgcfgrestore - but I think you&#39;ve misused my passed re=
coverd <br>
piece, where I&#39;ve specifically asked to only replace specific segments =
of <br>
resized thin-pool within your latest VG metadata - since those likely have<=
br>
all the proper mappings to thin LVs.<br></blockquote></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">All I did was use vgcfgrestore to app=
ly the metadata file attached to your previous private email. I had to edit=
 the transaction number, as I noted previously. That was a single line chan=
ge. Was that the wrong thing to do? I lack the experience with lvm/thin met=
adata, so I am flying a bit blind here. I apologize if I&#39;ve made things=
 worse.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
While you have taken the metadata from &#39;resize&#39; moment - you&#39;ve=
 lost all<br>
the thinLV lvm2 metadata for later created one.<br>
<br>
I&#39;ll try to make one for you.<br></blockquote></div></div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thank you very much. I am extremely gratef=
ul that you&#39;ve helped me so much in repairing my system.</div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0to look for while editing the XML from thin_dump, a=
nd I would very<br>
&gt;=C2=A0 =C2=A0 =C2=A0much like to avoid causing further damage to my sys=
tem. (Also, FWIW,<br>
&gt;=C2=A0 =C2=A0 =C2=A0thin_dump appears to segfault when run with musl-li=
bc instead of<br>
<br>
Well - lvm2 is glibc oriented project - so users of those &#39;esoteric&#39=
;<br>
distribution need to be expert on its own.<br>
<br>
If you can provide coredump or even better patch for crash - we might<br>
replace the code with something better usable - but there is zero testing<b=
r>
with anything else then glibc...<br></blockquote></div></div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Noted. I believe I&#39;ll be switching to g=
libc because there are a number of other packages that are broken for this =
distro.</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you have an i=
nterest, this is the issue I&#39;ve opened with my distro about the crash:=
=C2=A0<a href=3D"https://github.com/void-linux/void-packages/issues/25125">=
https://github.com/void-linux/void-packages/issues/25125</a> . I despair th=
at this will receive much attention, given that not even gdb works properly=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks again!</div><di=
v dir=3D"auto">--Duncan Townsend</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">P.S. This was written on mobile. Please forgive my typos.</div></=
div>

--00000000000002171005b08baddc--
