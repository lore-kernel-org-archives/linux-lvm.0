Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9LMsQBQ023102
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 18:54:26 -0400
Received: from mail-fx0-f217.google.com (mail-fx0-f217.google.com
	[209.85.220.217])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9LMrqnG025838
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 18:54:09 -0400
Received: by mail-fx0-f217.google.com with SMTP id 17so3239977fxm.3
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 15:54:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
Date: Wed, 21 Oct 2009 18:54:08 -0400
Message-ID: <59ac317e0910211554p342c06b2p6d2a17e69fae7364@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: David <dramdayal@gmail.com>
Content-Type: multipart/alternative; boundary=001485f6cff84635ec047679db38
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--001485f6cff84635ec047679db38
Content-Type: text/plain; charset=ISO-8859-1

Is there anyway to recover a lost VolGroup if I have the UUID?


thanks,
David
On Wed, Oct 21, 2009 at 3:03 PM, Lou Arnold <larnolda1@gmail.com> wrote:

> I read the How-To. It doesn't talk about the specific case or being mounted
> at root, so I had to experiment. It is likely that commands were in the
> wrong order, but I don't know what the right order is.
>
> I have attached the terminal session I used. In the end it did not work.
> There was still 66 GB free, and when I rebooted, the file system failed. The
> superblock was too big.
>
> I obviously don't understand the difference between pvresize, lvreduce and
> vgreduce, and how  resize2fs  is related to these commands.
>
> Hope you can help,
> Lou.
>
>
> On 10/21/09, Drew <drew.kay@gmail.com> wrote:
>>
>> > The documentation wasn't specific. I believe the intent was simply to
>> > migrate the data to another logical volume to temporarily allow the
>> source
>> > volume to be reduced and/or removed. But let's assume that has happened
>> or
>> > that doesn't need to happen. So now we need to unmount LogVol00, reduce
>> it
>> > to its original nunber of extents and then remount it (either before or
>> > after remount we remove the physical drive.) I assume you can't try this
>> or
>> > you'll screw up your computer, but I have a system that I screw up and
>> > easily restore from a OS image. So no need to be too cautious.
>>
>> I've done this on several occasions.
>>
>> If you want to play with various scenarios in LVM, I'd recommend
>> reading the LVM How-To @ http://tldp.org/HOWTO/LVM-HOWTO/ . Sections
>> 11 & 13 cover the most common tasks you'll encounter in LVM. Play
>> around, don't be afraid to break things, and if you have questions
>> feel free to give the list a shout.
>>
>>
>> --
>> Drew
>>
>> "Nothing in life is to be feared. It is only to be understood."
>> --Marie Curie
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001485f6cff84635ec047679db38
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Is there anyway to recover a lost VolGroup if I have the UUID?</div>
<div>=A0</div>
<div><br>thanks,</div>
<div>David<br></div>
<div class=3D"gmail_quote">On Wed, Oct 21, 2009 at 3:03 PM, Lou Arnold <spa=
n dir=3D"ltr">&lt;<a href=3D"mailto:larnolda1@gmail.com">larnolda1@gmail.co=
m</a>&gt;</span> wrote:<br>
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">
<div>I read the How-To. It doesn&#39;t talk about the specific case or bein=
g mounted at root, so I had to experiment. It is likely that=A0commands wer=
e=A0in the wrong order, but I don&#39;t know what the right order is.</div>

<div>=A0</div>
<div>I have attached the terminal session I used. In the end it did not wor=
k. There was still 66 GB free, and when I rebooted, the file system failed.=
 The superblock was too big.</div>
<div>=A0</div>
<div>I obviously don&#39;t understand the difference between pvresize, lvre=
duce and vgreduce, and how=A0 resize2fs=A0 is related to these commands.</d=
iv>
<div>=A0</div>
<div>Hope you can help,</div>
<div>Lou.<br><br>=A0</div>
<div><span class=3D"gmail_quote">On 10/21/09, <b class=3D"gmail_sendername"=
>Drew</b> &lt;<a href=3D"mailto:drew.kay@gmail.com" target=3D"_blank">drew.=
kay@gmail.com</a>&gt; wrote:</span>=20
<blockquote style=3D"BORDER-LEFT: #ccc 1px solid; MARGIN: 0px 0px 0px 0.8ex=
; PADDING-LEFT: 1ex" class=3D"gmail_quote">&gt; The documentation wasn&#39;=
t specific. I believe the intent was simply to<br>&gt; migrate the data to =
another logical volume to temporarily allow the source<br>
&gt; volume to be reduced and/or removed. But let&#39;s assume that has hap=
pened or<br>&gt; that doesn&#39;t need to happen. So now we need to unmount=
 LogVol00, reduce it<br>&gt; to its original nunber of extents and then rem=
ount it (either before or<br>
&gt; after remount we remove the physical drive.) I assume you can&#39;t tr=
y this or<br>&gt; you&#39;ll screw up your computer, but I have a system th=
at I screw up and<br>&gt; easily restore from a OS image. So no need to be =
too cautious.<br>
<br>I&#39;ve done this on several occasions.<br><br>If you want to play wit=
h various scenarios in LVM, I&#39;d recommend<br>reading the LVM How-To @ <=
a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.o=
rg/HOWTO/LVM-HOWTO/</a> . Sections<br>
11 &amp; 13 cover the most common tasks you&#39;ll encounter in LVM. Play<b=
r>around, don&#39;t be afraid to break things, and if you have questions<br=
>feel free to give the list a shout.<br><br><br>--<br>Drew<br><br>&quot;Not=
hing in life is to be feared. It is only to be understood.&quot;<br>
--Marie Curie<br></blockquote></div><br><br>_______________________________=
________________<br>linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@r=
edhat.com">linux-lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/ma=
ilman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailman/=
listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--001485f6cff84635ec047679db38--
