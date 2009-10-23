Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9N0QLFT010142
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:26:21 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9N0Q2qq019065
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 20:26:02 -0400
Received: by yxe13 with SMTP id 13so7234110yxe.23
	for <linux-lvm@redhat.com>; Thu, 22 Oct 2009 17:26:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4ADF5E81.4070609@worldspice.net>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<4ADF5E81.4070609@worldspice.net>
Date: Thu, 22 Oct 2009 20:26:01 -0400
Message-ID: <a5a956f70910221726h589752f1p4d89b1711d0038b9@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001636ed73d0b1090804768f41c3
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

--001636ed73d0b1090804768f41c3
Content-Type: text/plain; charset=ISO-8859-1

No, I'm confortable that I know the distinctions between PVs, VGs, and LVs.
But the command resize2fs doesn't belong with the LVM and that's perhaps
where the trouble is, in part anyway.

The other part of the problem is with the HOW-TO. It has a habit of saying
"to do this, use xyz command", then say "but you may need to do this before
hand". Here is an example from the tldp.org LVM How-To:
11.6. Removing physical volumes from a volume group
Make sure that the physical volume isn't used by any logical volumes by
using then 'pvdisplay' command:
# pvdisplay /dev/hda1

If the physical volume is still used you will have to migrate the data to
another physical volume using pvmove. (But I have nothing to move and no
pladce to move anything to.)

Then use 'vgreduce' to remove the physical volume:
# vgreduce my_volume_group /dev/hda1
-- Result: The message says that the PV is busy.

No where does it say how to make it not busy.

I tried "13.5. Removing an Old Disk" but that tries to move physical
extents. But again, I have nothing to move, and no place to move anything.

And..the examples show how to remove a disk when the LV is not mounted at
root.

So now I have to figure out what to do to make the logical volume not busy
and yet still let the computer operate. That last trial wasn't successful,
and I really don't know where to start.
On 10/21/09, Ryan Anderson <ryan@worldspice.net> wrote:
>
> Lou,
>
> I'm new to this list and have not posted here before, so I am not sure
> if this is the advice you'd eventually get, but it seems like you should
> focus on the basics. You will need to understand the individual
> components before a the more task-oriented parts of a how-to will be of
> use. Following a step-by-step guide will get you a result, but if you
> don't understand the steps the result probably won't be of any use to you.
>
> The how-to has a good breakdown of the anatomy of LVM; that might be the
> best place to start, focusing on the differences between Physical
> Volumes, Volume Groups, Logical Volumes and where in that arrangement a
> filesystem is placed.
>
>
> Lou Arnold wrote:
> > I read the How-To. It doesn't talk about the specific case or being
> > mounted at root, so I had to experiment. It is likely that commands
> > were in the wrong order, but I don't know what the right order is.
> >
> > I have attached the terminal session I used. In the end it did not work.
> > There was still 66 GB free, and when I rebooted, the file system failed.
> > The superblock was too big.
> >
> > I obviously don't understand the difference between pvresize, lvreduce
> > and vgreduce, and how  resize2fs  is related to these commands.
> >
> > Hope you can help,
> > Lou.
> >
> >
> > On 10/21/09, *Drew* <drew.kay@gmail.com <mailto:drew.kay@gmail.com>>
> wrote:
> >
> >     > The documentation wasn't specific. I believe the intent was simply
> to
> >     > migrate the data to another logical volume to temporarily allow
> >     the source
> >     > volume to be reduced and/or removed. But let's assume that has
> >     happened or
> >     > that doesn't need to happen. So now we need to unmount LogVol00,
> >     reduce it
> >     > to its original nunber of extents and then remount it (either
> >     before or
> >     > after remount we remove the physical drive.) I assume you can't
> >     try this or
> >     > you'll screw up your computer, but I have a system that I screw up
> and
> >     > easily restore from a OS image. So no need to be too cautious.
> >
> >     I've done this on several occasions.
> >
> >     If you want to play with various scenarios in LVM, I'd recommend
> >     reading the LVM How-To @ http://tldp.org/HOWTO/LVM-HOWTO/ . Sections
> >     11 & 13 cover the most common tasks you'll encounter in LVM. Play
> >     around, don't be afraid to break things, and if you have questions
> >     feel free to give the list a shout.
> >
> >
> >     --
> >     Drew
> >
> >     "Nothing in life is to be feared. It is only to be understood."
> >     --Marie Curie
> >
> >
> >
> > ------------------------------------------------------------------------
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> --
> Ryan
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>

--001636ed73d0b1090804768f41c3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>No, I&#39;m confortable that I know the distinctions between PVs, VGs,=
 and LVs. But the command resize2fs doesn&#39;t belong with the LVM and tha=
t&#39;s perhaps where the trouble is, in part anyway.</div>
<div>=A0</div>
<div>The other part of the problem is with the HOW-TO. It has a habit of sa=
ying &quot;to do this, use=A0xyz command&quot;, then say &quot;but you may =
need to do this before hand&quot;. Here is an example from the <a href=3D"h=
ttp://tldp.org">tldp.org</a> LVM How-To:</div>

<div>11.6. Removing physical volumes from a volume group<br>Make sure that =
the physical volume isn&#39;t used by any logical volumes by using then &#3=
9;pvdisplay&#39; command:<br># pvdisplay /dev/hda1</div>
<div>
<p>If the physical volume is still used you will have to migrate the data t=
o another physical volume using pvmove. (But I have nothing to move and no =
pladce to move anything to.)</p>
<p>Then use &#39;vgreduce&#39; to remove the physical volume: <br># vgreduc=
e my_volume_group /dev/hda1<br>-- Result: The message says that the PV is b=
usy.</p>
<p>No where does it say how to make it not busy.</p>
<p>I tried &quot;13.5. Removing an Old Disk&quot; but that tries to move ph=
ysical extents. But again, I have nothing to move, and no place to move any=
thing.</p>
<p>And..the examples show how to remove a disk when the=A0LV is not mounted=
 at root.</p>
<p>So now I have to figure out what to do to make the logical volume not bu=
sy and yet still let the computer operate. That last trial wasn&#39;t succe=
ssful, and I really don&#39;t know where to start.</p></div>
<div><span class=3D"gmail_quote">On 10/21/09, <b class=3D"gmail_sendername"=
>Ryan Anderson</b> &lt;<a href=3D"mailto:ryan@worldspice.net">ryan@worldspi=
ce.net</a>&gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Lou,<br><br>I&#39;m new to this =
list and have not posted here before, so I am not sure<br>if this is the ad=
vice you&#39;d eventually get, but it seems like you should<br>
focus on the basics. You will need to understand the individual<br>componen=
ts before a the more task-oriented parts of a how-to will be of<br>use. Fol=
lowing a step-by-step guide will get you a result, but if you<br>don&#39;t =
understand the steps the result probably won&#39;t be of any use to you.<br=
>
<br>The how-to has a good breakdown of the anatomy of LVM; that might be th=
e<br>best place to start, focusing on the differences between Physical<br>V=
olumes, Volume Groups, Logical Volumes and where in that arrangement a<br>
filesystem is placed.<br><br><br>Lou Arnold wrote:<br>&gt; I read the How-T=
o. It doesn&#39;t talk about the specific case or being<br>&gt; mounted at =
root, so I had to experiment. It is likely that commands<br>&gt; were in th=
e wrong order, but I don&#39;t know what the right order is.<br>
&gt;<br>&gt; I have attached the terminal session I used. In the end it did=
 not work.<br>&gt; There was still 66 GB free, and when I rebooted, the fil=
e system failed.<br>&gt; The superblock was too big.<br>&gt;<br>&gt; I obvi=
ously don&#39;t understand the difference between pvresize, lvreduce<br>
&gt; and vgreduce, and how=A0=A0resize2fs=A0=A0is related to these commands=
.<br>&gt;<br>&gt; Hope you can help,<br>&gt; Lou.<br>&gt;<br>&gt;<br>&gt; O=
n 10/21/09, *Drew* &lt;<a href=3D"mailto:drew.kay@gmail.com">drew.kay@gmail=
.com</a> &lt;mailto:<a href=3D"mailto:drew.kay@gmail.com">drew.kay@gmail.co=
m</a>&gt;&gt; wrote:<br>
&gt;<br>&gt;=A0=A0=A0=A0 &gt; The documentation wasn&#39;t specific. I beli=
eve the intent was simply to<br>&gt;=A0=A0=A0=A0 &gt; migrate the data to a=
nother logical volume to temporarily allow<br>&gt;=A0=A0=A0=A0 the source<b=
r>&gt;=A0=A0=A0=A0 &gt; volume to be reduced and/or removed. But let&#39;s =
assume that has<br>
&gt;=A0=A0=A0=A0 happened or<br>&gt;=A0=A0=A0=A0 &gt; that doesn&#39;t need=
 to happen. So now we need to unmount LogVol00,<br>&gt;=A0=A0=A0=A0 reduce =
it<br>&gt;=A0=A0=A0=A0 &gt; to its original nunber of extents and then remo=
unt it (either<br>&gt;=A0=A0=A0=A0 before or<br>
&gt;=A0=A0=A0=A0 &gt; after remount we remove the physical drive.) I assume=
 you can&#39;t<br>&gt;=A0=A0=A0=A0 try this or<br>&gt;=A0=A0=A0=A0 &gt; you=
&#39;ll screw up your computer, but I have a system that I screw up and<br>=
&gt;=A0=A0=A0=A0 &gt; easily restore from a OS image. So no need to be too =
cautious.<br>
&gt;<br>&gt;=A0=A0=A0=A0 I&#39;ve done this on several occasions.<br>&gt;<b=
r>&gt;=A0=A0=A0=A0 If you want to play with various scenarios in LVM, I&#39=
;d recommend<br>&gt;=A0=A0=A0=A0 reading the LVM How-To @ <a href=3D"http:/=
/tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a> . Sections=
<br>
&gt;=A0=A0=A0=A0 11 &amp; 13 cover the most common tasks you&#39;ll encount=
er in LVM. Play<br>&gt;=A0=A0=A0=A0 around, don&#39;t be afraid to break th=
ings, and if you have questions<br>&gt;=A0=A0=A0=A0 feel free to give the l=
ist a shout.<br>&gt;<br>
&gt;<br>&gt;=A0=A0=A0=A0 --<br>&gt;=A0=A0=A0=A0 Drew<br>&gt;<br>&gt;=A0=A0=
=A0=A0 &quot;Nothing in life is to be feared. It is only to be understood.&=
quot;<br>&gt;=A0=A0=A0=A0 --Marie Curie<br>&gt;<br>&gt;<br>&gt;<br>&gt; ---=
---------------------------------------------------------------------<br>
&gt;<br>&gt; _______________________________________________<br>&gt; linux-=
lvm mailing list<br>&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@=
redhat.com</a><br>&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/l=
inux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">ht=
tp://tldp.org/HOWTO/LVM-HOWTO/</a><br><br><br>--<br>Ryan<br><br><br>_______=
________________________________________<br>linux-lvm mailing list<br><a hr=
ef=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=
=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><=
br>
<br></blockquote></div><br>

--001636ed73d0b1090804768f41c3--
