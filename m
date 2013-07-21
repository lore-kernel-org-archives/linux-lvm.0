MIME-Version: 1.0
In-Reply-To: <51EBBC47.4040508@redhat.com>
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
	<51EBBC47.4040508@redhat.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Sun, 21 Jul 2013 04:01:54 -0700
Message-ID: <CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7b624d503c09b504e2037f11
Subject: Re: [linux-lvm] thin discards
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

--047d7b624d503c09b504e2037f11
Content-Type: text/plain; charset=UTF-8

Do snapshots behave the same way as thin volumes wrt discards?


On Sun, Jul 21, 2013 at 3:47 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 21.7.2013 09:10, Raymond Jennings napsal(a):
>
>  So can thin volumes support discards independently of the device
>> underneath them?
>>
>> I expected fstrim to free space in the thin pool.
>>
>
> Yes - you are expecting it correctly.
>
> Ignore is mostly usable in case you do not want to free already
> provisioned space - which might be in certain cases better for performance.
>
> But you need to use recent enough kernels and lvm2 tools - since discards
> support required kernel updates.
>

Kernel: 3.10.1-gento
LVM2:  2.02.97

Are these versions recent enough?

Upstream has this:
>
> passdown   TRIM ->  thin-vol -> thin-pool -> PV
> (if the PV doesn't support discard - you get kernel report error report
> and it fallbacks to nopassdown behaviour)
>
> nopassdown TRIM ->  thin-vol -> thin-pool
>
> ignore     TRIM ->  thin-vol
>
>
>
> Zdenek
>
>

--047d7b624d503c09b504e2037f11
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Do snapshots behave the same way as thin volumes wrt disca=
rds?<div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sun, J=
ul 21, 2013 at 3:47 AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:zkabelac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</spa=
n> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Dne 21.7.2013 09:10, Raymond Jennings napsal(a):<div><br>


<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
So can thin volumes support discards independently of the device underneath=
 them?<br>
<br>
I expected fstrim to free space in the thin pool.<br>
</blockquote>
<br></div>
Yes - you are expecting it correctly.<br>
<br>
Ignore is mostly usable in case you do not want to free already provisioned=
 space - which might be in certain cases better for performance.<br>
<br>
But you need to use recent enough kernels and lvm2 tools - since discards s=
upport required kernel updates.<br></blockquote><div><br></div><div>Kernel:=
 3.10.1-gento</div><div>LVM2: =C2=A02.02.97</div><div><br></div><div>Are th=
ese versions recent enough?</div>

<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">
Upstream has this:<br>
<br>
passdown =C2=A0 TRIM -&gt; =C2=A0thin-vol -&gt; thin-pool -&gt; PV<br>
(if the PV doesn&#39;t support discard - you get kernel report error report=
<br>
and it fallbacks to nopassdown behaviour)<br>
<br>
nopassdown TRIM -&gt; =C2=A0thin-vol -&gt; thin-pool<br>
<br>
ignore =C2=A0 =C2=A0 TRIM -&gt; =C2=A0thin-vol<span><font color=3D"#888888"=
><br>
<br>
<br>
<br>
Zdenek<br>
<br>
</font></span></blockquote></div><br></div></div>

--047d7b624d503c09b504e2037f11--
