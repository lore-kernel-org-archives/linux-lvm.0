Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9OGhUD6030690
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 12:43:30 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9OGhCiB023896
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 12:43:12 -0400
Received: by yxe13 with SMTP id 13so8561583yxe.23
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 09:43:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091024000642.GA30974@bdmcc-us.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
Date: Sat, 24 Oct 2009 09:43:11 -0700
Message-ID: <a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001636ed70702e3ddf0476b106a8
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

--001636ed70702e3ddf0476b106a8
Content-Type: text/plain; charset=ISO-8859-1

Haha, Yes, it would have been nice for someone to have told me about LVM and
root. It would have saved literally days of time. But my work is
experimental and never with production system. In any case, now I know
better.

As for the LiveCD suggestion, I did not intend to discount it. I had in fact
tried it several times, but with  some success. It probably just a matter of
finger problems for the failures. But I truly expected a graceful
dismantling process without the need of shutting down the system.

This was in fact a good experience. When you have to dig into things to
understand why something works or doesn't work, you are always luckier than
if things go perfectly right from the beginning.

Thanks to everyone for your help.
Lou.



On Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough <bdmc@bdmcc-us.com> wrote:

> On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote:
> > Ryan, Thanks for your suggestion. I know it works, but I had hoped to
> have a
> > solution that didn't stop the whole system while I fixed it.
> >
> > To Drew:
> > I think you were quite right when you spoke about planning the file
> system.
> > I've come to realize that my question is somewhat naive. One simply
> doesn't
> > do what I wanted to exactly because there is no easy way to dismantle it.
> It
> > would be better to partition off some part of the OS drive and add that
> to a
> > new volume group (or a new logical volume group) and mount that under
> > "/mnt", and then add whatever partitions on new drives to that logical
> > volume. That logical volume could be dismounted and worked on, whereas
> > whatever is under root cannot be worked on easily.
>
>
> Lou,
>
> I'm surprised that you haven't yet been told that one of the first rules of
> LVM is "don't use it for root!"  Actually, I don't really hold with that,
> but it is MUCH more important to plan what you are doing when you do have an
> LVM root partition.  As you have found, you can not manipulate an LVM
> partition while it is mounted. ( I know, there are ways for certain types of
> filesystems, but in general, the rule holds. )  That is especially true when
> the partition that you want to manipulate is root ( / ).
>
> My general practice is to set up the following list of Logical Volumes (
> the minimum which serves for most general purpose machines ): root, swap,
> home, usr, var.  I generally allocate somewhere around 1G for the root
> partition.  The others are sized appropriately for the environment.  That
> usually leaves me a lot of free space on modern drives for "data" space.
>
> The recommendation that you should find a LiveCD at this point is probably
> one that you should respect.  Playing with mounted filesystems, particularly
> root, can rapidly lead you down a very nasty path.
>
>
> Brian
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001636ed70702e3ddf0476b106a8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Haha, Yes, it would have been nice for someone to have told me about L=
VM and root. It would have saved literally days of time. But my work is exp=
erimental and never with production system. In any case, now I know better.=
</div>

<div>=A0</div>
<div>As for the LiveCD suggestion, I did not intend to discount it. I had i=
n fact tried it several times, but with=A0 some success. It probably just a=
 matter of finger problems for the failures. But I truly expected a gracefu=
l dismantling process without the need of shutting down the system.</div>

<div>=A0</div>
<div>This was in fact a good experience. When you have to dig into things t=
o understand why something works or doesn&#39;t work, you are always luckie=
r than if things go perfectly right from the beginning.</div>
<div>=A0</div>
<div>Thanks to everyone for your help.</div>
<div>Lou.</div>
<div>=A0</div>
<div><br>=A0</div>
<div class=3D"gmail_quote">On Fri, Oct 23, 2009 at 5:06 PM, Brian McCulloug=
h <span dir=3D"ltr">&lt;<a href=3D"mailto:bdmc@bdmcc-us.com">bdmc@bdmcc-us.=
com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div class=3D"im">On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrot=
e:<br>&gt; Ryan, Thanks for your suggestion. I know it works, but I had hop=
ed to have a<br>&gt; solution that didn&#39;t stop the whole system while I=
 fixed it.<br>
&gt;<br>&gt; To Drew:<br>&gt; I think you were quite right when you spoke a=
bout planning the file system.<br>&gt; I&#39;ve come to realize that my que=
stion is somewhat naive. One simply doesn&#39;t<br>&gt; do what I wanted to=
 exactly because there is no easy way to dismantle it. It<br>
&gt; would be better to partition off some part of the OS drive and add tha=
t to a<br>&gt; new volume group (or a new logical volume group) and mount t=
hat under<br>&gt; &quot;/mnt&quot;, and then add whatever partitions on new=
 drives to that logical<br>
&gt; volume. That logical volume could be dismounted and worked on, whereas=
<br>&gt; whatever is under root cannot be worked on easily.<br><br><br></di=
v>Lou,<br><br>I&#39;m surprised that you haven&#39;t yet been told that one=
 of the first rules of LVM is &quot;don&#39;t use it for root!&quot; =A0Act=
ually, I don&#39;t really hold with that, but it is MUCH more important to =
plan what you are doing when you do have an LVM root partition. =A0As you h=
ave found, you can not manipulate an LVM partition while it is mounted. ( I=
 know, there are ways for certain types of filesystems, but in general, the=
 rule holds. ) =A0That is especially true when the partition that you want =
to manipulate is root ( / ).<br>
<br>My general practice is to set up the following list of Logical Volumes =
( the minimum which serves for most general purpose machines ): root, swap,=
 home, usr, var. =A0I generally allocate somewhere around 1G for the root p=
artition. =A0The others are sized appropriately for the environment. =A0Tha=
t usually leaves me a lot of free space on modern drives for &quot;data&quo=
t; space.<br>
<br>The recommendation that you should find a LiveCD at this point is proba=
bly one that you should respect. =A0Playing with mounted filesystems, parti=
cularly root, can rapidly lead you down a very nasty path.<br><font color=
=3D"#888888"><br>
<br>Brian<br></font>
<div>
<div></div>
<div class=3D"h5"><br>_______________________________________________<br>li=
nux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@r=
edhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-l=
vm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a>=
<br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></div></div></blockquot=
e></div><br>

--001636ed70702e3ddf0476b106a8--
