MIME-Version: 1.0
In-Reply-To: <51ECFFA6.7010905@redhat.com>
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
	<51EBBC47.4040508@redhat.com>
	<CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
	<51EC3936.2020607@redhat.com> <51ECFFA6.7010905@redhat.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Mon, 22 Jul 2013 03:12:14 -0700
Message-ID: <CAGDaZ_rkTHaq3dr9BQ50=cOtErYepMb0V96uszjb+gsrp_sqBw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11c250367f09d604e216ebc5
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

--001a11c250367f09d604e216ebc5
Content-Type: text/plain; charset=UTF-8

I tried to run a fstrim on a mounted snapshot (regular snapshot, not thin
snapshot) and got zip.



On Mon, Jul 22, 2013 at 2:47 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 21.7.2013 21:40, Zdenek Kabelac napsal(a):
>
>  Dne 21.7.2013 13:01, Raymond Jennings napsal(a):
>>
>>> Do snapshots behave the same way as thin volumes wrt discards?
>>>
>>>
> Yes, snapshots are just like any other thin volumes.
>
> Just a side note - until I think 3.9 kernel there used to be
> bug, which had wrong ref-counting of shared blocks.
>
> Zdenek
>
>

--001a11c250367f09d604e216ebc5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I tried to run a fstrim on a mounted snapshot (regular sna=
pshot, not thin snapshot) and got zip.<div><br></div></div><div class=3D"gm=
ail_extra"><br><br><div class=3D"gmail_quote">On Mon, Jul 22, 2013 at 2:47 =
AM, Zdenek Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.=
com" target=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 21.7.2013 21:40, Zdenek Kabelac napsal(a=
):<div class=3D"im"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Dne 21.7.2013 13:01, Raymond Jennings napsal(a):<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Do snapshots behave the same way as thin volumes wrt discards?<br>
<br>
</blockquote></blockquote>
<br></div>
Yes, snapshots are just like any other thin volumes.<br>
<br>
Just a side note - until I think 3.9 kernel there used to be<br>
bug, which had wrong ref-counting of shared blocks.<span class=3D"HOEnZb"><=
font color=3D"#888888"><br>
<br>
Zdenek<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c250367f09d604e216ebc5--
