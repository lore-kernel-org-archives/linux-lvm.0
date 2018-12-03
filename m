MIME-Version: 1.0
References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
	<CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
	<efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
	<CAB5m+-GyXYnSPxLszT7sRhLmHm4gwSGixkT2V821wAUCnnhSbA@mail.gmail.com>
	<c40fad2f-09b0-a286-19ce-572b4536c1ed@redhat.com>
In-Reply-To: <c40fad2f-09b0-a286-19ce-572b4536c1ed@redhat.com>
From: Far Had <farhadk.it@gmail.com>
Date: Mon, 3 Dec 2018 15:40:52 +0330
Message-ID: <CAB5m+-EZu1oY=Fsv_p=cOfq4ydhecQtoYa6whB4aXojMz0dQsA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000172cb1057c1d09ec"
Subject: Re: [linux-lvm] lvm.conf backup section
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
To: zkabelac@redhat.com
Cc: linux-lvm@redhat.com

--000000000000172cb1057c1d09ec
Content-Type: text/plain; charset="UTF-8"

Hi, Thank you Zdenek
You used "makes sure" phrase in your sentence:
"this makes sure you should have files at least 10 days back as well"

I was refering to that !

So the whole thing is about PV metadata area and not /etc/lvm , am I
correct?

On Mon, Dec 3, 2018 at 3:03 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 01. 12. 18 v 13:44 Far Had napsal(a):
> > How does it _make sure_ that I've backup files younger than 10 days old?
> What
> > if I delete those files?
>
> Hi
>
> Archives in /etc/lvm/archive subdirs are not 'a must have' - they are
> optional
> and purely for admin's pleasure.
>
> So admin can erase them anytime he wants to - but in that case it's
> probably
> more clever to disable archiving in lvm.conf ;) as archiving eats some
> CPU...
>
> lvm2 itself does *only* care about metadata stored in the 'metadata' area
> in
> PV header - where there is also ring-buffer which typically keeps pretty
> long
> history of all metadata modifications - this buffer has these days ~1MiB
> in
> size. So unless your metadata are pretty big - the history can be
> relatively
> easily extracted also out from this place for i.e. recovery purpose.
>
> I must admit I don't understand the  'make sure' part of your question??
> Are you aiming at some particular issue ??
>
> Regards
>
>
> Zdenek
>

--000000000000172cb1057c1d09ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Thank you Zdenek=C2=A0<div>You used &quot;makes sure&q=
uot; phrase in your sentence:</div><div><font color=3D"#000000">&quot;this =
makes sure you should have=C2=A0files at least 10 days back as well&quot;<b=
r></font></div><div><span style=3D"color:rgb(80,0,80)"><br></span></div><di=
v><font color=3D"#000000">I was refering to that !</font></div><div><font c=
olor=3D"#000000"><br></font></div><div><font color=3D"#000000">So the whole=
 thing is about PV metadata area and not /etc/lvm , am I correct?</font></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Dec 3, 201=
8 at 3:03 PM Zdenek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkab=
elac@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dne =
01. 12. 18 v 13:44 Far Had napsal(a):<br>
&gt; How does it _make sure_=C2=A0that I&#39;ve backup files younger than 1=
0 days old? What <br>
&gt; if I delete those files?<br>
<br>
Hi<br>
<br>
Archives in /etc/lvm/archive subdirs are not &#39;a must have&#39; - they a=
re optional <br>
and purely for admin&#39;s pleasure.<br>
<br>
So admin can erase them anytime he wants to - but in that case it&#39;s pro=
bably <br>
more clever to disable archiving in lvm.conf ;) as archiving eats some CPU.=
..<br>
<br>
lvm2 itself does *only* care about metadata stored in the &#39;metadata&#39=
; area in <br>
PV header - where there is also ring-buffer which typically keeps pretty lo=
ng <br>
history of all metadata modifications - this buffer has these days ~1MiB in=
 <br>
size. So unless your metadata are pretty big - the history can be relativel=
y <br>
easily extracted also out from this place for i.e. recovery purpose.<br>
<br>
I must admit I don&#39;t understand the=C2=A0 &#39;make sure&#39; part of y=
our question??<br>
Are you aiming at some particular issue ??<br>
<br>
Regards<br>
<br>
<br>
Zdenek<br>
</blockquote></div>

--000000000000172cb1057c1d09ec--
