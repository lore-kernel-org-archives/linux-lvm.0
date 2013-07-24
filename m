MIME-Version: 1.0
In-Reply-To: <51ED0678.1020703@redhat.com>
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
	<51EBBC47.4040508@redhat.com>
	<CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
	<51EC3936.2020607@redhat.com> <51ECFFA6.7010905@redhat.com>
	<CAGDaZ_rkTHaq3dr9BQ50=cOtErYepMb0V96uszjb+gsrp_sqBw@mail.gmail.com>
	<51ED0678.1020703@redhat.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Tue, 23 Jul 2013 20:12:14 -0700
Message-ID: <CAGDaZ_r1Bb9fkwkn6Yb1TPR0ROpFCnXoUbpqt31u1sL+xUk=rA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=bcaec54857c01d5c0204e239499f
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

--bcaec54857c01d5c0204e239499f
Content-Type: text/plain; charset=UTF-8

As a pure matter of opinion, I enjoy "fat provisioning" on my filesystems,
since I run a desktop and in theory it really cuts down on physical
fragmentation.

Snapshots are something I use whenever I need to make a fundamental
reconfiguration to the system as a whole that can't be done live, such as
resizing or reconfiguring the root filesystem.

This would preclude the unquestionable usage of thin volumes.



On Mon, Jul 22, 2013 at 3:16 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 22.7.2013 12:12, Raymond Jennings napsal(a):
>
>  I tried to run a fstrim on a mounted snapshot (regular snapshot, not thin
>> snapshot) and got zip.
>>
>>
> I've been talking about  thin snapshots.
>
> Of course - for old non-thin snapshot - TRIM is not supported.
> (And it doesn't look like anything simple to implement)
>
> Zdenek
>
>
>
>>
>> On Mon, Jul 22, 2013 at 2:47 AM, Zdenek Kabelac <zkabelac@redhat.com
>> <mailto:zkabelac@redhat.com>> wrote:
>>
>>     Dne 21.7.2013 21:40, Zdenek Kabelac napsal(a):
>>
>>         Dne 21.7.2013 13:01, Raymond Jennings napsal(a):
>>
>>             Do snapshots behave the same way as thin volumes wrt discards?
>>
>>
>>     Yes, snapshots are just like any other thin volumes.
>>
>>     Just a side note - until I think 3.9 kernel there used to be
>>     bug, which had wrong ref-counting of shared blocks.
>>
>>     Zdenek
>>
>>
>>
>

--bcaec54857c01d5c0204e239499f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As a pure matter of opinion, I enjoy &quot;fat provisionin=
g&quot; on my filesystems, since I run a desktop and in theory it really cu=
ts down on physical fragmentation.<div><br></div><div>Snapshots are somethi=
ng I use whenever I need to make a fundamental reconfiguration to the syste=
m as a whole that can&#39;t be done live, such as resizing or reconfiguring=
 the root filesystem.</div>


<div><br></div><div>This would preclude the unquestionable usage of thin vo=
lumes.</div><div><br></div></div><div class=3D"gmail_extra"><br><br><div cl=
ass=3D"gmail_quote">On Mon, Jul 22, 2013 at 3:16 AM, Zdenek Kabelac <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zka=
belac@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Dne 22.7.2013 12:12, Raymond Jennings napsal=
(a):<div class=3D"im"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I tried to run a fstrim on a mounted snapshot (regular snapshot, not thin<b=
r>
snapshot) and got zip.<br>
<br>
</blockquote>
<br></div>
I&#39;ve been talking about =C2=A0thin snapshots.<br>
<br>
Of course - for old non-thin snapshot - TRIM is not supported.<br>
(And it doesn&#39;t look like anything simple to implement)<span class=3D"H=
OEnZb"><font color=3D"#888888"><br>
<br>
Zdenek<br>
<br>
<br>
</font></span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><div class=3D"im">
<br>
<br>
On Mon, Jul 22, 2013 at 2:47 AM, Zdenek Kabelac &lt;<a href=3D"mailto:zkabe=
lac@redhat.com" target=3D"_blank">zkabelac@redhat.com</a><br></div><div cla=
ss=3D"im">
&lt;mailto:<a href=3D"mailto:zkabelac@redhat.com" target=3D"_blank">zkabela=
c@redhat.com</a>&gt;&gt; wrote:<br>
<br>
=C2=A0 =C2=A0 Dne 21.7.2013 21:40, Zdenek Kabelac napsal(a):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Dne 21.7.2013 13:01, Raymond Jennings napsal(a)=
:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Do snapshots behave the same way =
as thin volumes wrt discards?<br>
<br>
<br>
=C2=A0 =C2=A0 Yes, snapshots are just like any other thin volumes.<br>
<br>
=C2=A0 =C2=A0 Just a side note - until I think 3.9 kernel there used to be<=
br>
=C2=A0 =C2=A0 bug, which had wrong ref-counting of shared blocks.<br>
<br>
=C2=A0 =C2=A0 Zdenek<br>
<br>
<br>
</div></blockquote>
<br>
</blockquote></div><br></div>

--bcaec54857c01d5c0204e239499f--
