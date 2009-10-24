Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9OJH484023953
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 15:17:04 -0400
Received: from mail-gx0-f226.google.com (mail-gx0-f226.google.com
	[209.85.217.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9OJGjcq004683
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 15:16:46 -0400
Received: by gxk26 with SMTP id 26so8413240gxk.11
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 12:16:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
Date: Sat, 24 Oct 2009 12:16:45 -0700
Message-ID: <a5a956f70910241216t4cd9d0d9j6e3ccfa6db4c4137@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0050450295385a0b4a0476b32b97
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

--0050450295385a0b4a0476b32b97
Content-Type: text/plain; charset=ISO-8859-1

Hahaha. Brem, you and I think alike. If you can do it let me know. I don't
think people can think of a way to keep the system on-line and yet dismount
root so that LVM commands can work on it. If you can make it work, I'll buy
you a virtual beer.
Regards,
Lou.

On Sat, Oct 24, 2009 at 10:04 AM, brem belguebli
<brem.belguebli@gmail.com>wrote:

> It's non sense arguing that LVM is not intended for root due to the
> fact that you cannot shrink it  (growing online is operational and
> works fine).
>
> This is the only thing that is not allowed, though technically could
> it be possible.
>
>
>
> 2009/10/24, Lou Arnold <larnolda1@gmail.com>:
>  > Haha, Yes, it would have been nice for someone to have told me about
> LVM and
> > root. It would have saved literally days of time. But my work is
> > experimental and never with production system. In any case, now I know
> > better.
> >
> > As for the LiveCD suggestion, I did not intend to discount it. I had in
> fact
> > tried it several times, but with  some success. It probably just a matter
> of
> > finger problems for the failures. But I truly expected a graceful
> > dismantling process without the need of shutting down the system.
> >
> > This was in fact a good experience. When you have to dig into things to
> > understand why something works or doesn't work, you are always luckier
> than
> > if things go perfectly right from the beginning.
> >
> > Thanks to everyone for your help.
> > Lou.
> >
> >
> >
> > On Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough <bdmc@bdmcc-us.com>
> wrote:
> >
> >> On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote:
> >> > Ryan, Thanks for your suggestion. I know it works, but I had hoped to
> >> have a
> >> > solution that didn't stop the whole system while I fixed it.
> >> >
> >> > To Drew:
> >> > I think you were quite right when you spoke about planning the file
> >> system.
> >> > I've come to realize that my question is somewhat naive. One simply
> >> doesn't
> >> > do what I wanted to exactly because there is no easy way to dismantle
> >> > it.
> >> It
> >> > would be better to partition off some part of the OS drive and add
> that
> >> to a
> >> > new volume group (or a new logical volume group) and mount that under
> >> > "/mnt", and then add whatever partitions on new drives to that logical
> >> > volume. That logical volume could be dismounted and worked on, whereas
> >> > whatever is under root cannot be worked on easily.
> >>
> >>
> >> Lou,
> >>
> >> I'm surprised that you haven't yet been told that one of the first rules
> >> of
> >> LVM is "don't use it for root!"  Actually, I don't really hold with
> that,
> >> but it is MUCH more important to plan what you are doing when you do
> have
> >> an
> >> LVM root partition.  As you have found, you can not manipulate an LVM
> >> partition while it is mounted. ( I know, there are ways for certain
> types
> >> of
> >> filesystems, but in general, the rule holds. )  That is especially true
> >> when
> >> the partition that you want to manipulate is root ( / ).
> >>
> >> My general practice is to set up the following list of Logical Volumes (
> >> the minimum which serves for most general purpose machines ): root,
> swap,
> >> home, usr, var.  I generally allocate somewhere around 1G for the root
> >> partition.  The others are sized appropriately for the environment.
>  That
> >> usually leaves me a lot of free space on modern drives for "data" space.
> >>
> >> The recommendation that you should find a LiveCD at this point is
> probably
> >> one that you should respect.  Playing with mounted filesystems,
> >> particularly
> >> root, can rapidly lead you down a very nasty path.
> >>
> >>
> >> Brian
> >>
> >> _______________________________________________
> >> linux-lvm mailing list
> >> linux-lvm@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>
> >
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0050450295385a0b4a0476b32b97
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hahaha. Brem, you and I think alike. If you can do it let me know. I d=
on&#39;t think people can think of a way to keep the system on-line and yet=
 dismount root so that=A0LVM commands=A0can work on it. If you can make it =
work, I&#39;ll buy you a virtual beer.</div>

<div>Regards,</div>
<div>Lou.<br><br></div>
<div class=3D"gmail_quote">On Sat, Oct 24, 2009 at 10:04 AM, brem belguebli=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:brem.belguebli@gmail.com">brem.bel=
guebli@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">It&#39;s non sense arguing that =
LVM is not intended for root due to the<br>fact that you cannot shrink it =
=A0(growing online is operational and<br>
works fine).<br><br>This is the only thing that is not allowed, though tech=
nically could<br>it be possible.<br><br><br><br>2009/10/24, Lou Arnold &lt;=
<a href=3D"mailto:larnolda1@gmail.com">larnolda1@gmail.com</a>&gt;:<br>
<div>
<div></div>
<div class=3D"h5">&gt; Haha, Yes, it would have been nice for someone to ha=
ve told me about LVM and<br>&gt; root. It would have saved literally days o=
f time. But my work is<br>&gt; experimental and never with production syste=
m. In any case, now I know<br>
&gt; better.<br>&gt;<br>&gt; As for the LiveCD suggestion, I did not intend=
 to discount it. I had in fact<br>&gt; tried it several times, but with =A0=
some success. It probably just a matter of<br>&gt; finger problems for the =
failures. But I truly expected a graceful<br>
&gt; dismantling process without the need of shutting down the system.<br>&=
gt;<br>&gt; This was in fact a good experience. When you have to dig into t=
hings to<br>&gt; understand why something works or doesn&#39;t work, you ar=
e always luckier than<br>
&gt; if things go perfectly right from the beginning.<br>&gt;<br>&gt; Thank=
s to everyone for your help.<br>&gt; Lou.<br>&gt;<br>&gt;<br>&gt;<br>&gt; O=
n Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough &lt;<a href=3D"mailto:bdmc=
@bdmcc-us.com">bdmc@bdmcc-us.com</a>&gt; wrote:<br>
&gt;<br>&gt;&gt; On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote=
:<br>&gt;&gt; &gt; Ryan, Thanks for your suggestion. I know it works, but I=
 had hoped to<br>&gt;&gt; have a<br>&gt;&gt; &gt; solution that didn&#39;t =
stop the whole system while I fixed it.<br>
&gt;&gt; &gt;<br>&gt;&gt; &gt; To Drew:<br>&gt;&gt; &gt; I think you were q=
uite right when you spoke about planning the file<br>&gt;&gt; system.<br>&g=
t;&gt; &gt; I&#39;ve come to realize that my question is somewhat naive. On=
e simply<br>
&gt;&gt; doesn&#39;t<br>&gt;&gt; &gt; do what I wanted to exactly because t=
here is no easy way to dismantle<br>&gt;&gt; &gt; it.<br>&gt;&gt; It<br>&gt=
;&gt; &gt; would be better to partition off some part of the OS drive and a=
dd that<br>
&gt;&gt; to a<br>&gt;&gt; &gt; new volume group (or a new logical volume gr=
oup) and mount that under<br>&gt;&gt; &gt; &quot;/mnt&quot;, and then add w=
hatever partitions on new drives to that logical<br>&gt;&gt; &gt; volume. T=
hat logical volume could be dismounted and worked on, whereas<br>
&gt;&gt; &gt; whatever is under root cannot be worked on easily.<br>&gt;&gt=
;<br>&gt;&gt;<br>&gt;&gt; Lou,<br>&gt;&gt;<br>&gt;&gt; I&#39;m surprised th=
at you haven&#39;t yet been told that one of the first rules<br>&gt;&gt; of=
<br>
&gt;&gt; LVM is &quot;don&#39;t use it for root!&quot; =A0Actually, I don&#=
39;t really hold with that,<br>&gt;&gt; but it is MUCH more important to pl=
an what you are doing when you do have<br>&gt;&gt; an<br>&gt;&gt; LVM root =
partition. =A0As you have found, you can not manipulate an LVM<br>
&gt;&gt; partition while it is mounted. ( I know, there are ways for certai=
n types<br>&gt;&gt; of<br>&gt;&gt; filesystems, but in general, the rule ho=
lds. ) =A0That is especially true<br>&gt;&gt; when<br>&gt;&gt; the partitio=
n that you want to manipulate is root ( / ).<br>
&gt;&gt;<br>&gt;&gt; My general practice is to set up the following list of=
 Logical Volumes (<br>&gt;&gt; the minimum which serves for most general pu=
rpose machines ): root, swap,<br>&gt;&gt; home, usr, var. =A0I generally al=
locate somewhere around 1G for the root<br>
&gt;&gt; partition. =A0The others are sized appropriately for the environme=
nt. =A0That<br>&gt;&gt; usually leaves me a lot of free space on modern dri=
ves for &quot;data&quot; space.<br>&gt;&gt;<br>&gt;&gt; The recommendation =
that you should find a LiveCD at this point is probably<br>
&gt;&gt; one that you should respect. =A0Playing with mounted filesystems,<=
br>&gt;&gt; particularly<br>&gt;&gt; root, can rapidly lead you down a very=
 nasty path.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; Brian<br>&gt;&gt;<br>&gt;&=
gt; _______________________________________________<br>
&gt;&gt; linux-lvm mailing list<br>&gt;&gt; <a href=3D"mailto:linux-lvm@red=
hat.com">linux-lvm@redhat.com</a><br>&gt;&gt; <a href=3D"https://www.redhat=
.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/m=
ailman/listinfo/linux-lvm</a><br>
&gt;&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/=
" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>&gt;&gt;<br>&gt=
;<br><br>_______________________________________________<br>linux-lvm maili=
ng list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=
=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">ht=
tps://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO =
at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tl=
dp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--0050450295385a0b4a0476b32b97--
