Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p7G8eijK019314
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 04:40:44 -0400
Received: from mail-iy0-f170.google.com (mail-iy0-f170.google.com
	[209.85.210.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7G8ei32003892
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 04:40:44 -0400
Received: by iye16 with SMTP id 16so8714586iye.29
	for <linux-lvm@redhat.com>; Tue, 16 Aug 2011 01:40:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110813225330.GA6019@agk-dp.fab.redhat.com>
References: <CAA-yEOLgSqD7N5C773M=54CmVy8=aYybkw1AWOhWmZgc+ET68Q@mail.gmail.com>
	<20110813225330.GA6019@agk-dp.fab.redhat.com>
Date: Tue, 16 Aug 2011 11:40:43 +0300
Message-ID: <CAA-yEOLqMid+-TDwRfQqbcg9ubZw6XNNYPJqks776Q79P2YXcQ@mail.gmail.com>
From: Pasha Z <free.lan.c2.718r@gmail.com>
Content-Type: multipart/alternative; boundary=90e6ba6e8bacd93f7d04aa9b5557
Subject: Re: [linux-lvm] lvm hangup on snapshot overflow
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
To: Pasha Z <free.lan.c2.718r@gmail.com>, linux-lvm@redhat.com

--90e6ba6e8bacd93f7d04aa9b5557
Content-Type: text/plain; charset=UTF-8

Thanks for the reply!

> What exactly are you trying to do with lvconvert rather than lvcreate?
Sorry, I'm not sure I understand the question.

> Never let snapshots fill up - use dmeventd instead and intervene in
> a controlled way before they are full.

Thanks for the idea. The only obstacle, preventing from using dmeventd right
away, is that it can unmount/extend full snapshots, while I need to have
them switched to read-only.

And the final question: is it planned to integrate control over snapshots to
lvm itself and how soon if yes?

2011/8/14 Alasdair G Kergon <agk@redhat.com>

> On Fri, Aug 12, 2011 at 07:05:31PM +0300, Pasha Z wrote:
> > lvconvert device-mapper: suspend ioctl failed: Input/output error
> > lvconvert Unable to suspend VG-sn_x (252:3)
> > lvconvert Failed to suspend origin lv
>
> What exactly are you trying to do with lvconvert rather than lvcreate?
>
> Never let snapshots fill up - use dmeventd instead and intervene in
> a controlled way before they are full.
>
> The lvconvert -s man page is too subtle and needs improving.
>
> Alasdair
>
>

--90e6ba6e8bacd93f7d04aa9b5557
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Thanks for the reply!</div><div><br></div><div>&gt;=C2=A0<span class=
=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; font-size: 1=
3px; background-color: rgb(255, 255, 255); ">What exactly are you trying to=
 do with lvconvert rather than lvcreate?</span></div>
<div><span class=3D"Apple-style-span" style=3D"font-family: arial, sans-ser=
if; ">Sorry, I&#39;m not sure I understand the question.</span></div><div><=
span class=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; ">=
<br>
</span></div><div><span class=3D"Apple-style-span" style=3D"font-family: ar=
ial, sans-serif; "><span class=3D"Apple-style-span" style=3D"font-size: 13p=
x; background-color: rgb(255, 255, 255); ">&gt; Never let snapshots fill up=
 - use dmeventd instead and intervene in<br>
&gt; a controlled way before they are full.</span></span></div><div><span c=
lass=3D"Apple-style-span" style=3D"font-family: arial, sans-serif; "><span =
class=3D"Apple-style-span" style=3D"font-size: 13px; background-color: rgb(=
255, 255, 255); "><br>
</span></span></div><div><span class=3D"Apple-style-span" style=3D"font-fam=
ily: arial, sans-serif; "><span class=3D"Apple-style-span" style=3D"font-si=
ze: 13px; background-color: rgb(255, 255, 255); ">Thanks for the idea. The =
only obstacle, preventing from using dmeventd right away, is that it can un=
mount/extend full snapshots, while I need to have them switched to read-onl=
y.</span></span></div>
<div><span class=3D"Apple-style-span" style=3D"font-family: arial, sans-ser=
if; "><span class=3D"Apple-style-span" style=3D"font-size: 13px; background=
-color: rgb(255, 255, 255); "><br></span></span></div><div><span class=3D"A=
pple-style-span" style=3D"font-family: arial, sans-serif; "><span class=3D"=
Apple-style-span" style=3D"font-size: 13px; background-color: rgb(255, 255,=
 255); ">And the final question: is it planned to integrate control over sn=
apshots to lvm itself and how soon if yes?</span></span></div>
<div><br><div class=3D"gmail_quote">2011/8/14 Alasdair G Kergon <span dir=
=3D"ltr">&lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</a>&gt;</span=
><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Fri, Aug 12, 2011 at 07:05:31PM +0300, Pasha Z wrote:<=
br>
&gt; lvconvert device-mapper: suspend ioctl failed: Input/output error<br>
&gt; lvconvert Unable to suspend VG-sn_x (252:3)<br>
&gt; lvconvert Failed to suspend origin lv<br>
<br>
</div>What exactly are you trying to do with lvconvert rather than lvcreate=
?<br>
<br>
Never let snapshots fill up - use dmeventd instead and intervene in<br>
a controlled way before they are full.<br>
<br>
The lvconvert -s man page is too subtle and needs improving.<br>
<font color=3D"#888888"><br>
Alasdair<br>
<br>
</font></blockquote></div><br></div>

--90e6ba6e8bacd93f7d04aa9b5557--
