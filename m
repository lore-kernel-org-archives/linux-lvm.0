Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9OLLVw5012916
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 17:21:31 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9OLLDix011010
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 17:21:13 -0400
Received: by yxe13 with SMTP id 13so8663305yxe.23
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 14:21:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29ae894c0910241354k67768707je61a9d25d3c14f6@mail.gmail.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
	<a5a956f70910241216t4cd9d0d9j6e3ccfa6db4c4137@mail.gmail.com>
	<29ae894c0910241354k67768707je61a9d25d3c14f6@mail.gmail.com>
Date: Sat, 24 Oct 2009 14:21:12 -0700
Message-ID: <a5a956f70910241421h195cf525m59c262ba8c90aeb2@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001636c926cd6f98280476b4e8e7
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

--001636c926cd6f98280476b4e8e7
Content-Type: text/plain; charset=ISO-8859-1

Brem,
I agree. I thought it should be possible. Perhaps someone else can try it
and let us know in a future blog. I just don't have enough experience to
take it farther.

Regards,
Lou.

On Sat, Oct 24, 2009 at 1:54 PM, brem belguebli <brem.belguebli@gmail.com>wrote:

> Hi Lou,
>
> Who is talking about unmounting root ?
>
> I'm just saying shrinking should be possible online as long as some
> conditions are met (FS usage less than X %, reduced fragmentation ...)
>
> Of course, this kind of procedure requiring a max of caution because
> of the high risk of data loss, I'm not sure it'll get implemented in
> the current tools.
>
>
>
> 2009/10/24, Lou Arnold <larnolda1@gmail.com>:
> > Hahaha. Brem, you and I think alike. If you can do it let me know. I
> don't
> > think people can think of a way to keep the system on-line and yet
> dismount
> > root so that LVM commands can work on it. If you can make it work, I'll
> buy
> > you a virtual beer.
> > Regards,
> > Lou.
> >
> > On Sat, Oct 24, 2009 at 10:04 AM, brem belguebli
> > <brem.belguebli@gmail.com>wrote:
> >
> >> It's non sense arguing that LVM is not intended for root due to the
> >> fact that you cannot shrink it  (growing online is operational and
> >> works fine).
> >>
> >> This is the only thing that is not allowed, though technically could
> >> it be possible.
> >>
> >>
> >>
> >> 2009/10/24, Lou Arnold <larnolda1@gmail.com>:
> >>  > Haha, Yes, it would have been nice for someone to have told me about
> >> LVM and
> >> > root. It would have saved literally days of time. But my work is
> >> > experimental and never with production system. In any case, now I know
> >> > better.
> >> >
> >> > As for the LiveCD suggestion, I did not intend to discount it. I had
> in
> >> fact
> >> > tried it several times, but with  some success. It probably just a
> >> > matter
> >> of
> >> > finger problems for the failures. But I truly expected a graceful
> >> > dismantling process without the need of shutting down the system.
> >> >
> >> > This was in fact a good experience. When you have to dig into things
> to
> >> > understand why something works or doesn't work, you are always luckier
> >> than
> >> > if things go perfectly right from the beginning.
> >> >
> >> > Thanks to everyone for your help.
> >> > Lou.
> >> >
> >> >
> >> >
> >> > On Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough <bdmc@bdmcc-us.com>
> >> wrote:
> >> >
> >> >> On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote:
> >> >> > Ryan, Thanks for your suggestion. I know it works, but I had hoped
> to
> >> >> have a
> >> >> > solution that didn't stop the whole system while I fixed it.
> >> >> >
> >> >> > To Drew:
> >> >> > I think you were quite right when you spoke about planning the file
> >> >> system.
> >> >> > I've come to realize that my question is somewhat naive. One simply
> >> >> doesn't
> >> >> > do what I wanted to exactly because there is no easy way to
> dismantle
> >> >> > it.
> >> >> It
> >> >> > would be better to partition off some part of the OS drive and add
> >> that
> >> >> to a
> >> >> > new volume group (or a new logical volume group) and mount that
> under
> >> >> > "/mnt", and then add whatever partitions on new drives to that
> >> >> > logical
> >> >> > volume. That logical volume could be dismounted and worked on,
> >> >> > whereas
> >> >> > whatever is under root cannot be worked on easily.
> >> >>
> >> >>
> >> >> Lou,
> >> >>
> >> >> I'm surprised that you haven't yet been told that one of the first
> >> >> rules
> >> >> of
> >> >> LVM is "don't use it for root!"  Actually, I don't really hold with
> >> that,
> >> >> but it is MUCH more important to plan what you are doing when you do
> >> have
> >> >> an
> >> >> LVM root partition.  As you have found, you can not manipulate an LVM
> >> >> partition while it is mounted. ( I know, there are ways for certain
> >> types
> >> >> of
> >> >> filesystems, but in general, the rule holds. )  That is especially
> true
> >> >> when
> >> >> the partition that you want to manipulate is root ( / ).
> >> >>
> >> >> My general practice is to set up the following list of Logical
> Volumes
> >> >> (
> >> >> the minimum which serves for most general purpose machines ): root,
> >> swap,
> >> >> home, usr, var.  I generally allocate somewhere around 1G for the
> root
> >> >> partition.  The others are sized appropriately for the environment.
> >>  That
> >> >> usually leaves me a lot of free space on modern drives for "data"
> >> >> space.
> >> >>
> >> >> The recommendation that you should find a LiveCD at this point is
> >> probably
> >> >> one that you should respect.  Playing with mounted filesystems,
> >> >> particularly
> >> >> root, can rapidly lead you down a very nasty path.
> >> >>
> >> >>
> >> >> Brian
> >> >>
> >> >> _______________________________________________
> >> >> linux-lvm mailing list
> >> >> linux-lvm@redhat.com
> >> >> https://www.redhat.com/mailman/listinfo/linux-lvm
> >> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >> >>
> >> >
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

--001636c926cd6f98280476b4e8e7
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Brem,</div>
<div>I agree. I thought it should be possible. Perhaps someone else can try=
 it and let us know in a future blog. I just don&#39;t have enough experien=
ce to take it farther.</div>
<div>=A0</div>
<div>Regards,</div>
<div>Lou.</div>
<div>=A0</div>
<div class=3D"gmail_quote">On Sat, Oct 24, 2009 at 1:54 PM, brem belguebli =
<span dir=3D"ltr">&lt;<a href=3D"mailto:brem.belguebli@gmail.com">brem.belg=
uebli@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi Lou,<br><br>Who is talking ab=
out unmounting root ?<br><br>I&#39;m just saying shrinking should be possib=
le online as long as some<br>
conditions are met (FS usage less than X %, reduced fragmentation ...)<br><=
br>Of course, this kind of procedure requiring a max of caution because<br>=
of the high risk of data loss, I&#39;m not sure it&#39;ll get implemented i=
n<br>
the current tools.<br>
<div>
<div></div>
<div class=3D"h5"><br><br><br>2009/10/24, Lou Arnold &lt;<a href=3D"mailto:=
larnolda1@gmail.com">larnolda1@gmail.com</a>&gt;:<br>&gt; Hahaha. Brem, you=
 and I think alike. If you can do it let me know. I don&#39;t<br>&gt; think=
 people can think of a way to keep the system on-line and yet dismount<br>
&gt; root so that LVM commands can work on it. If you can make it work, I&#=
39;ll buy<br>&gt; you a virtual beer.<br>&gt; Regards,<br>&gt; Lou.<br>&gt;=
<br>&gt; On Sat, Oct 24, 2009 at 10:04 AM, brem belguebli<br>&gt; &lt;<a hr=
ef=3D"mailto:brem.belguebli@gmail.com">brem.belguebli@gmail.com</a>&gt;wrot=
e:<br>
&gt;<br>&gt;&gt; It&#39;s non sense arguing that LVM is not intended for ro=
ot due to the<br>&gt;&gt; fact that you cannot shrink it =A0(growing online=
 is operational and<br>&gt;&gt; works fine).<br>&gt;&gt;<br>&gt;&gt; This i=
s the only thing that is not allowed, though technically could<br>
&gt;&gt; it be possible.<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; 20=
09/10/24, Lou Arnold &lt;<a href=3D"mailto:larnolda1@gmail.com">larnolda1@g=
mail.com</a>&gt;:<br>&gt;&gt; =A0&gt; Haha, Yes, it would have been nice fo=
r someone to have told me about<br>
&gt;&gt; LVM and<br>&gt;&gt; &gt; root. It would have saved literally days =
of time. But my work is<br>&gt;&gt; &gt; experimental and never with produc=
tion system. In any case, now I know<br>&gt;&gt; &gt; better.<br>&gt;&gt; &=
gt;<br>
&gt;&gt; &gt; As for the LiveCD suggestion, I did not intend to discount it=
. I had in<br>&gt;&gt; fact<br>&gt;&gt; &gt; tried it several times, but wi=
th =A0some success. It probably just a<br>&gt;&gt; &gt; matter<br>&gt;&gt; =
of<br>
&gt;&gt; &gt; finger problems for the failures. But I truly expected a grac=
eful<br>&gt;&gt; &gt; dismantling process without the need of shutting down=
 the system.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; This was in fact a good expe=
rience. When you have to dig into things to<br>
&gt;&gt; &gt; understand why something works or doesn&#39;t work, you are a=
lways luckier<br>&gt;&gt; than<br>&gt;&gt; &gt; if things go perfectly righ=
t from the beginning.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; Thanks to everyone =
for your help.<br>
&gt;&gt; &gt; Lou.<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;<br>&gt;&gt; &gt;<br>&g=
t;&gt; &gt; On Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough &lt;<a href=
=3D"mailto:bdmc@bdmcc-us.com">bdmc@bdmcc-us.com</a>&gt;<br>&gt;&gt; wrote:<=
br>
&gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; On Fri, Oct 23, 2009 at 01:41:23PM -0700=
, Lou Arnold wrote:<br>&gt;&gt; &gt;&gt; &gt; Ryan, Thanks for your suggest=
ion. I know it works, but I had hoped to<br>&gt;&gt; &gt;&gt; have a<br>
&gt;&gt; &gt;&gt; &gt; solution that didn&#39;t stop the whole system while=
 I fixed it.<br>&gt;&gt; &gt;&gt; &gt;<br>&gt;&gt; &gt;&gt; &gt; To Drew:<b=
r>&gt;&gt; &gt;&gt; &gt; I think you were quite right when you spoke about =
planning the file<br>
&gt;&gt; &gt;&gt; system.<br>&gt;&gt; &gt;&gt; &gt; I&#39;ve come to realiz=
e that my question is somewhat naive. One simply<br>&gt;&gt; &gt;&gt; doesn=
&#39;t<br>&gt;&gt; &gt;&gt; &gt; do what I wanted to exactly because there =
is no easy way to dismantle<br>
&gt;&gt; &gt;&gt; &gt; it.<br>&gt;&gt; &gt;&gt; It<br>&gt;&gt; &gt;&gt; &gt=
; would be better to partition off some part of the OS drive and add<br>&gt=
;&gt; that<br>&gt;&gt; &gt;&gt; to a<br>&gt;&gt; &gt;&gt; &gt; new volume g=
roup (or a new logical volume group) and mount that under<br>
&gt;&gt; &gt;&gt; &gt; &quot;/mnt&quot;, and then add whatever partitions o=
n new drives to that<br>&gt;&gt; &gt;&gt; &gt; logical<br>&gt;&gt; &gt;&gt;=
 &gt; volume. That logical volume could be dismounted and worked on,<br>
&gt;&gt; &gt;&gt; &gt; whereas<br>&gt;&gt; &gt;&gt; &gt; whatever is under =
root cannot be worked on easily.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;<=
br>&gt;&gt; &gt;&gt; Lou,<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; I&#39;m=
 surprised that you haven&#39;t yet been told that one of the first<br>
&gt;&gt; &gt;&gt; rules<br>&gt;&gt; &gt;&gt; of<br>&gt;&gt; &gt;&gt; LVM is=
 &quot;don&#39;t use it for root!&quot; =A0Actually, I don&#39;t really hol=
d with<br>&gt;&gt; that,<br>&gt;&gt; &gt;&gt; but it is MUCH more important=
 to plan what you are doing when you do<br>
&gt;&gt; have<br>&gt;&gt; &gt;&gt; an<br>&gt;&gt; &gt;&gt; LVM root partiti=
on. =A0As you have found, you can not manipulate an LVM<br>&gt;&gt; &gt;&gt=
; partition while it is mounted. ( I know, there are ways for certain<br>
&gt;&gt; types<br>&gt;&gt; &gt;&gt; of<br>&gt;&gt; &gt;&gt; filesystems, bu=
t in general, the rule holds. ) =A0That is especially true<br>&gt;&gt; &gt;=
&gt; when<br>&gt;&gt; &gt;&gt; the partition that you want to manipulate is=
 root ( / ).<br>
&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; My general practice is to set up the=
 following list of Logical Volumes<br>&gt;&gt; &gt;&gt; (<br>&gt;&gt; &gt;&=
gt; the minimum which serves for most general purpose machines ): root,<br>
&gt;&gt; swap,<br>&gt;&gt; &gt;&gt; home, usr, var. =A0I generally allocate=
 somewhere around 1G for the root<br>&gt;&gt; &gt;&gt; partition. =A0The ot=
hers are sized appropriately for the environment.<br>&gt;&gt; =A0That<br>&g=
t;&gt; &gt;&gt; usually leaves me a lot of free space on modern drives for =
&quot;data&quot;<br>
&gt;&gt; &gt;&gt; space.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; The reco=
mmendation that you should find a LiveCD at this point is<br>&gt;&gt; proba=
bly<br>&gt;&gt; &gt;&gt; one that you should respect. =A0Playing with mount=
ed filesystems,<br>
&gt;&gt; &gt;&gt; particularly<br>&gt;&gt; &gt;&gt; root, can rapidly lead =
you down a very nasty path.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt;<br>&g=
t;&gt; &gt;&gt; Brian<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt;&gt; ___________=
____________________________________<br>
&gt;&gt; &gt;&gt; linux-lvm mailing list<br>&gt;&gt; &gt;&gt; <a href=3D"ma=
ilto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>&gt;&gt; &gt;&gt; <a=
 href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_blan=
k">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt;&gt; &gt;&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/L=
VM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>&gt;&g=
t; &gt;&gt;<br>&gt;&gt; &gt;<br>&gt;&gt;<br>&gt;&gt; ______________________=
_________________________<br>
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

--001636c926cd6f98280476b4e8e7--
