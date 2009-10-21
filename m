Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9LF2Vux027416
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 11:02:31 -0400
Received: from mail-gx0-f226.google.com (mail-gx0-f226.google.com
	[209.85.217.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9LF2LuV032504
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 11:02:21 -0400
Received: by gxk26 with SMTP id 26so4606042gxk.11
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 08:02:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
Date: Wed, 21 Oct 2009 08:02:17 -0700
Message-ID: <a5a956f70910210802h355ce6dfr9c35ca59e12327d0@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6d3cf14ce3cb404767343bb
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0016e6d3cf14ce3cb404767343bb
Content-Type: text/plain; charset=ISO-8859-1

Somehow this message didn't get to the list, so here it is this time

On Tue, Oct 20, 2009 at 10:44 AM, Lou Arnold <larnolda1@gmail.com> wrote:

>
>
>  On 10/19/09, Drew <drew.kay@gmail.com> wrote:
>
>> When you say migrate, are you meaning migrating to a larger drive? Or
>> do you mean migrate portions of the filesystem to a new logical volume
>> with free space?
>> --
>> Drew
>
>
> The documentation wasn't specific. I believe the intent was simply to
> migrate the data to another logical volume to temporarily allow the source
> volume to be reduced and/or removed. But let's assume that has happened or
> that doesn't need to happen. So now we need to unmount LogVol00, reduce it
> to its original nunber of extents and then remount it (either before or
> after remount we remove the physical drive.) I assume you can't try this or
> you'll screw up your computer, but I have a system that I screw up and
> easily restore from a OS image. So no need to be too cautious.
>
Lou.

--0016e6d3cf14ce3cb404767343bb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Somehow this message didn&#39;t get to the list, so here it is this time<br=
><br>
<div class=3D"gmail_quote">On Tue, Oct 20, 2009 at 10:44 AM, Lou Arnold <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:larnolda1@gmail.com">larnolda1@gmail.c=
om</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid"><br><br>
<div>
<div class=3D"im"><span class=3D"gmail_quote">On 10/19/09, <b class=3D"gmai=
l_sendername">Drew</b> &lt;<a href=3D"mailto:drew.kay@gmail.com" target=3D"=
_blank">drew.kay@gmail.com</a>&gt; wrote:</span> </div>
<div class=3D"im">
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">When you say migrate, are you me=
aning migrating to a larger drive? Or<br>do you mean migrate portions of th=
e filesystem to a new logical volume<br>
with free space?<br>--<br>Drew</blockquote>
<div>=A0</div></div>
<div>The documentation wasn&#39;t specific. I believe the intent was simply=
 to migrate the data to another logical volume to temporarily allow the sou=
rce volume to be reduced and/or removed. But let&#39;s assume that has happ=
ened or that doesn&#39;t need to happen. So now we need to unmount LogVol00=
, reduce it to its original nunber of extents and then remount it (either b=
efore or after remount we remove the physical drive.) I assume you can&#39;=
t try this or you&#39;ll screw up your computer, but I have a system that I=
 screw=A0up and easily restore from a OS image. So no need to be too cautio=
us.</div>
</div></blockquote>
<div>Lou.</div></div>

--0016e6d3cf14ce3cb404767343bb--
