Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r558eJZd006499
	for <linux-lvm@redhat.com>; Wed, 5 Jun 2013 04:40:19 -0400
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r558eGYQ011337
	for <linux-lvm@redhat.com>; Wed, 5 Jun 2013 04:40:17 -0400
Received: by mail-oa0-f43.google.com with SMTP id m6so893850oag.16
	for <linux-lvm@redhat.com>; Wed, 05 Jun 2013 01:40:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51A61B9F.4010905@redhat.com>
References: <CAA9cXK679Fwn+Ow4hxVUunkuusa7xoH+qYNj6fUR060pQjwjzA@mail.gmail.com>
	<51A61B9F.4010905@redhat.com>
From: =?ISO-8859-1?Q?Lo=EFc?= <loic@recisio.com>
Date: Wed, 5 Jun 2013 10:39:56 +0200
Message-ID: <CAA9cXK5gK7_dTrqFBe+Natmn4tU83UtFJ5MTz+FDKhUTB1b3tQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e013a0adaa2267004de6425b4
Subject: Re: [linux-lvm] Alert before LVM snapshot becomes full
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--089e013a0adaa2267004de6425b4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you, I will look to try to create my own lvm snapshot dmeventd plugin=
.

My problem is really special. Unfortunately I can not extend my snapshot.

Lo=C3=AFc


On Wed, May 29, 2013 at 5:15 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote=
:

> Dne 29.5.2013 09:56, Lo=C4=8Fc napsal(a):
>
>  Hi all,
>>
>> I would like to raise my problem because I have not found the answer to =
my
>> question by searching on the Internet. Hoping that one of you had
>> experience
>> with this kind of problem.
>>
>> I'm looking for a way to launch a script or disable an LVM snaphot befor=
e
>> it
>> becomes full.
>> For example I would like to launch a script that will umount the LVM
>> snapshot
>> and delete it if it reaches 90%. That is to avoid LVM issue when snapsho=
t
>> is full.
>>
>> Any ideas ?
>>
>
>
> Write dmeventd plugin - similar as you can find in upstream git source
> tree.
>
>
> BTW - what's is the point to delete it 90% and delete it when it's invali=
d
> ?
>
> If you don't need the snapshot you should remove it instantly - since it'=
s
> impact system performance.
>
> And if you need it - it's probably more useful to extend the snapshot.
>
> Zdenek
>
>
>

--089e013a0adaa2267004de6425b4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div style>Thank you,=C2=A0I will look t=
o try to create my own lvm snapshot dmeventd plugin.</div><div style><br></=
div><div style>My problem is really special. Unfortunately I can not extend=
 my snapshot.<br>

</div><div style><br></div><div class=3D"gmail_extra"><div>Lo=C3=AFc</div>
<br><br><div class=3D"gmail_quote">On Wed, May 29, 2013 at 5:15 PM, Zdenek =
Kabelac <span dir=3D"ltr">&lt;<a href=3D"mailto:zkabelac@redhat.com" target=
=3D"_blank">zkabelac@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">

Dne 29.5.2013 09:56, Lo=C4=8Fc napsal(a):<div><div class=3D"h5"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">
Hi all,<br>
<br>
I would like to raise my problem because I have not found the answer to my<=
br>
question by searching on the Internet. Hoping that one of you had experienc=
e<br>
with this kind of problem.<br>
<br>
I&#39;m looking for a way to launch a script or disable an LVM snaphot befo=
re it<br>
becomes full.<br>
For example I would like to launch a script that will umount the LVM snapsh=
ot<br>
and delete it if it reaches 90%. That is to avoid LVM issue when snapshot i=
s full.<br>
<br>
Any ideas ?<br>
</blockquote>
<br>
<br></div></div>
Write dmeventd plugin - similar as you can find in upstream git source tree=
.<br>
<br>
<br>
BTW - what&#39;s is the point to delete it 90% and delete it when it&#39;s =
invalid ?<br>
<br>
If you don&#39;t need the snapshot you should remove it instantly - since i=
t&#39;s impact system performance.<br>
<br>
And if you need it - it&#39;s probably more useful to extend the snapshot.<=
span class=3D""><font color=3D"#888888"><br>
<br>
Zdenek<br>
<br>
<br>
</font></span></blockquote></div><br></div></div>

--089e013a0adaa2267004de6425b4--
