MIME-Version: 1.0
In-Reply-To: <CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Sun, 21 Jul 2013 00:10:01 -0700
Message-ID: <CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc9a0200305204e200427e
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

--047d7bdc9a0200305204e200427e
Content-Type: text/plain; charset=UTF-8

So can thin volumes support discards independently of the device underneath
them?

I expected fstrim to free space in the thin pool.


On Tue, Jul 16, 2013 at 4:33 AM, Raymond Jennings <shentino@gmail.com>wrote:

> Gentoo
>
> sys-kernel/gentoo-sources-3.10.1
> sys-fs/lvm2-2.02.97-r1
>
> I don't know if the pool device is capable of trim support.  I do know
> that the underlying device, a seagate hard drive, does not support discard.
>  However one would think that thin volumes have their own discard handling
> to deallocate internally, possibly passing a discard down to the underlying
> block device as needed.
>
>
> On Tue, Jul 16, 2013 at 3:16 AM, Zdenek Kabelac <zkabelac@redhat.com>wrote:
>
>> Dne 15.7.2013 17:32, Raymond Jennings napsal(a):
>>
>>  I tried to run an fstrim on a mounted thin volume, but got FITRIM:
>>>  operation
>>> not supported.
>>>
>>> Did I screw up or something?
>>>
>>
>>
>> Is the pool device capable of TRIM support ?
>>
>> Which version of lvm2 and kernel is in use ?
>>
>>
>> Zdenek
>>
>>
>>
>

--047d7bdc9a0200305204e200427e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So can thin volumes support discards independently of the =
device underneath them?<div><br></div><div>I expected fstrim to free space =
in the thin pool.</div></div><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">

On Tue, Jul 16, 2013 at 4:33 AM, Raymond Jennings <span dir=3D"ltr">&lt;<a =
href=3D"mailto:shentino@gmail.com" target=3D"_blank">shentino@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div dir=3D"ltr">Gentoo<div><br></div><div>sys-kernel/gentoo-sources-3.10.1=
</div><div>sys-fs/lvm2-2.02.97-r1<br></div><div><br></div><div>I don&#39;t =
know if the pool device is capable of trim support. =C2=A0I do know that th=
e underlying device, a seagate hard drive, does not support discard. =C2=A0=
However one would think that thin volumes have their own discard handling t=
o deallocate internally, possibly passing a discard down to the underlying =
block device as needed.</div>


</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">On Tue, Jul 16, 2013 at 3:16 AM, Zdenek Ka=
belac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" target=
=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 15.7.2013 17:32, Raymond Jennings napsal=
(a):<div><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I tried to run an fstrim on a mounted thin volume, but got FITRIM: =C2=A0op=
eration<br>
not supported.<br>
<br>
Did I screw up or something?<br>
</blockquote>
<br>
<br></div>
Is the pool device capable of TRIM support ?<br>
<br>
Which version of lvm2 and kernel is in use ?<span><font color=3D"#888888"><=
br>
<br>
<br>
Zdenek<br>
<br>
<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7bdc9a0200305204e200427e--
