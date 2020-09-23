Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AB351006176
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2020 18:13:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CC86101A53F
	for <linux-lvm@redhat.com>; Wed, 23 Sep 2020 18:13:19 +0000 (UTC)
MIME-Version: 1.0
References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
In-Reply-To: <c675a85e-9739-cda9-5588-654337783182@redhat.com>
From: Duncan Townsend <duncancmt@gmail.com>
Date: Wed, 23 Sep 2020 13:13:01 -0500
Message-ID: <CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007095b205afff097f"
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

--0000000000007095b205afff097f
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 22, 2020, 5:02 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 21. 09. 20 v 15:47 Duncan Townsend napsal(a):
> > On Mon, Sep 21, 2020 at 5:23 AM Zdenek Kabelac <zkabelac@redhat.com>
> wrote:
> >>
> >> Dne 21. 09. 20 v 1:48 Duncan Townsend napsal(a):
> >>> Hello!
> >
> > Ahh, thank you for the reminder. My apologies for not including this
> > in my original message. I use Void Linux on aarch64-musl:
> >
> >>> I had a problem with a runit script that caused my dmeventd to be
> >>> killed and restarted every 5 seconds. The script has been fixed, but
> >>
> >> Kill dmeventd is always BAD plan.
> >> Either you do not want monitoring (set to 0 in lvm.conf) - or
> >> leave it to it jobs - kill dmeventd in the middle of its work
> >> isn't going to end well...)
> >
> > Thank you for reinforcing this. My runit script was fighting with
> > dracut in my initramfs. My runit script saw that there was a dmeventd
> > not under its control, and so tried to kill the one started by dracut.
> > I've gone and disabled the runit script and replaced it with a stub
> > that simply tried to kill the dracut-started dmeventd when it receives
> > a signal.
>
> Ok - so from looking at the resulting 'mixture' of metadata you
> have in your archive and what physically present on PV header are
> and now noticing this is some 'not-so-standard' distro - I'm starting to
> suspect the reason of all these troubles.
>

I'm running void linux, and I haven't messed with the initramfs at all from
the defaults. I'll report this to the distro maintainers. Thanks!

Withing 'dracut' you shouldn't be firering dmeventd at all - monitoring
> should be enabled  (by vgchange --monitor y) once you switch to your rootfs
> so dmenventd is execute from your rootfs!
>
> By letting 'dmeventd' running in your 'dracut world' - it lives in its
> own environment and likely its very own locking dir.
>
> That makes it very easy your dmeventd runs in parallel with your other
> lvm2
> commands - and since this way it's completely unprotected
> (as file-locking is what it is) - as the resize is  operation for several
> seconds it has happened your 'admins' command replaced whatever dmeventd
> was
> doing.
>

dmeventd does write its PID file into the correct directory in the
post-initramfs root, so whatever's happening is some weird hybrid. I'll
debug this further with my distro.

So I think to prevent repeated occurrence of this problem - you'll need
> to ensure your system-booting will follow the pattern from distros
> like Fedora.
>

I think for now, the easiest solution may be to try to stop dmeventd from
being started by dracut.

I have encountered a further problem in the process of restoring my thin
pool to a working state. After using vgcfgrestore to fix the mismatching
metadata using the file Zdenek kindly provided privately, when I try to
activate my thin LVs, I'm now getting the error message:

Thin pool <THIN POOL LONG NAME>-tpool transaction_id (MAJOR:MINOR)
transaction_id is XXX, while expected YYY.

where XXX == YYY + 2. Is this indicative of a deeper problem? I'm hesitant
to run any further operations on this volume without advice because I think
I'm in fairly uncharted territory now.

Thank you again for all your help!
--Duncan Townsend

P.S. This was typed on mobile. Please forgive any typos.

>

--0000000000007095b205afff097f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Sep 22, 2020, 5:02 PM Zdenek Kabelac &lt;<a href=3D"ma=
ilto:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Dne 21. 09. 20 v 15:47 Duncan Townsend napsal(a):=
<br>
&gt; On Mon, Sep 21, 2020 at 5:23 AM Zdenek Kabelac &lt;<a href=3D"mailto:z=
kabelac@redhat.com" target=3D"_blank" rel=3D"noreferrer">zkabelac@redhat.co=
m</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Dne 21. 09. 20 v 1:48 Duncan Townsend napsal(a):<br>
&gt;&gt;&gt; Hello!<br>
&gt; <br>
&gt; Ahh, thank you for the reminder. My apologies for not including this<b=
r>
&gt; in my original message. I use Void Linux on aarch64-musl:<br>
&gt; <br>
&gt;&gt;&gt; I had a problem with a runit script that caused my dmeventd to=
 be<br>
&gt;&gt;&gt; killed and restarted every 5 seconds. The script has been fixe=
d, but<br>
&gt;&gt;<br>
&gt;&gt; Kill dmeventd is always BAD plan.<br>
&gt;&gt; Either you do not want monitoring (set to 0 in lvm.conf) - or<br>
&gt;&gt; leave it to it jobs - kill dmeventd in the middle of its work<br>
&gt;&gt; isn&#39;t going to end well...)<br>
&gt; <br>
&gt; Thank you for reinforcing this. My runit script was fighting with<br>
&gt; dracut in my initramfs. My runit script saw that there was a dmeventd<=
br>
&gt; not under its control, and so tried to kill the one started by dracut.=
<br>
&gt; I&#39;ve gone and disabled the runit script and replaced it with a stu=
b<br>
&gt; that simply tried to kill the dracut-started dmeventd when it receives=
<br>
&gt; a signal.<br>
<br>
Ok - so from looking at the resulting &#39;mixture&#39; of metadata you<br>
have in your archive and what physically present on PV header are<br>
and now noticing this is some &#39;not-so-standard&#39; distro - I&#39;m st=
arting to <br>
suspect the reason of all these troubles.<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m running void linux, and I =
haven&#39;t messed with the initramfs at all from the defaults. I&#39;ll re=
port this to the distro maintainers. Thanks!</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
Withing &#39;dracut&#39; you shouldn&#39;t be firering dmeventd at all - mo=
nitoring<br>
should be enabled=C2=A0 (by vgchange --monitor y) once you switch to your r=
ootfs<br>
so dmenventd is execute from your rootfs!<br>
<br>
By letting &#39;dmeventd&#39; running in your &#39;dracut world&#39; - it l=
ives in its<br>
own environment and likely its very own locking dir.<br>
<br>
That makes it very easy your dmeventd runs in parallel with your other lvm2=
 <br>
commands - and since this way it&#39;s completely unprotected<br>
(as file-locking is what it is) - as the resize is=C2=A0 operation for seve=
ral<br>
seconds it has happened your &#39;admins&#39; command replaced whatever dme=
ventd was<br>
doing.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">dmeventd does write its PID file into the correct directory in the po=
st-initramfs root, so whatever&#39;s happening is some weird hybrid. I&#39;=
ll debug this further with my distro.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
So I think to prevent repeated occurrence of this problem - you&#39;ll need=
<br>
to ensure your system-booting will follow the pattern from distros<br>
like Fedora.<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I think for now, the easiest solution may be to try to stop dme=
ventd from being started by dracut.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">I have encountered a further problem in the process of restorin=
g my thin pool to a working state. After using vgcfgrestore to fix the mism=
atching metadata using the file=C2=A0<span style=3D"font-family:sans-serif"=
>Zdenek kindly provided privately, when I try to activate my thin LVs, I&#3=
9;m now getting the error message:</span></div><div dir=3D"auto"><span styl=
e=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto"><span style=
=3D"font-family:sans-serif">Thin pool &lt;THIN POOL LONG NAME&gt;-tpool tra=
nsaction_id (MAJOR:MINOR) transaction_id is XXX, while expected YYY.</span>=
</div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><br></span><=
/div><div dir=3D"auto"><span style=3D"font-family:sans-serif">where XXX =3D=
=3D YYY + 2. Is this indicative of a deeper problem? I&#39;m hesitant to ru=
n any further operations on this volume without advice because I think I&#3=
9;m in fairly uncharted territory now.</span></div><div dir=3D"auto"><span =
style=3D"font-family:sans-serif"><br></span></div><div dir=3D"auto"><span s=
tyle=3D"font-family:sans-serif">Thank you again for all your help!</span></=
div><div dir=3D"auto"><span style=3D"font-family:sans-serif">--Duncan Towns=
end</span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><b=
r></span></div><div dir=3D"auto"><span style=3D"font-family:sans-serif">P.S=
. This was typed on mobile. Please forgive any typos.</span></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
</blockquote></div></div></div>

--0000000000007095b205afff097f--
