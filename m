Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NKfgAv010386
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 16:41:42 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NKfNud014922
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 16:41:24 -0400
Received: by yxe13 with SMTP id 13so8048327yxe.23
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 13:41:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4AE20E43.2060006@worldspice.net>
References: <c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
Date: Fri, 23 Oct 2009 13:41:23 -0700
Message-ID: <a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=0016e64762f22ec9d30476a03cee
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

--0016e64762f22ec9d30476a03cee
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ryan, Thanks for your suggestion. I know it works, but I had hoped to have =
a
solution that didn't stop the whole system while I fixed it.

To Drew:
I think you were quite right when you spoke about planning the file system.
I've come to realize that my question is somewhat naive. One simply doesn't
do what I wanted to exactly because there is no easy way to dismantle it. I=
t
would be better to partition off some part of the OS drive and add that to =
a
new volume group (or a new logical volume group) and mount that under
"/mnt", and then add whatever partitions on new drives to that logical
volume. That logical volume could be dismounted and worked on, whereas
whatever is under root cannot be worked on easily.
Regards,
Lou.

On Fri, Oct 23, 2009 at 1:12 PM, Ryan Anderson <ryan@worldspice.net> wrote:

> Your best bet for resizing the root FS will be to use a LiveCD with LVM2
> support. sysrescuecd works well, but likely your distribution install
> disk can be booted with "linux rescue" or something similar.
>
> Lou Arnold wrote:
> > Luca, your comments make sense. After my last message I considered just
> > what you said, but I don't know how to prove it.
> > =EF=BF=BD
> > I know there is no data on the drive that I added, because I just added
> > the drive and never put data on it. I am sure "busy" means that it is
> > mounted.=EF=BF=BDBecause it is=EF=BF=BDincluded in the default group/vo=
lume (VolGroup00
> > - LogVol00) and because that LV is mounted at root ("/"), I cannot
> > reduce the filesystem with resize2fs; there is no way to unmount "/",
> > that I know of, anyway.=EF=BF=BD=EF=BF=BD Unless of course someone know=
s how?
> > On Thu, Oct 22, 2009 at 11:52 PM, Luca Berra <bluca@comedia.it
>  > <mailto:bluca@comedia.it>> wrote:
> >
> >     On Wed, Oct 21, 2009 at 03:03:24PM -0400, Lou Arnold wrote:
> >
> >         I read the How-To. It doesn't talk about the specific case or
> >         being mounted
> >
> >     I hate how-tos, they are a collection of particular cases and leave
> the
> >     luser with a feeling of knowledge. which is not.
> >
> >
> >         at root, so I had to experiment. It is likely that commands wer=
e
> >         in the
> >         wrong order, but I don't know what the right order is.
> >         I have attached the terminal session I used. In the end it did
> >         not work.
> >
> >
> >     the commands were not in the wrong order,
> >     they were just the wrong commands, unless your aim was reinstalling=
.
> >
> >
> >         There was still 66 GB free, and when I rebooted, the file syste=
m
> >         failed. The
> >         superblock was too big.
> >
> >         I obviously don't understand the difference between pvresize,
> >         lvreduce and
> >         vgreduce, and how =EF=BF=BDresize2fs =EF=BF=BDis related to the=
se commands.
> >
> >
> >     I think you need to go over the basics again
> >     LVM is used to abstract storage management
> >     it is done by creating layers
> >     Physical Volumes: which represent disks (or partitions, or whatever
> >     block device...)
> >     Volume Group: which is a collection of disks
> >     Logical Volume: which is a portion of a volume group
> >
> >     LVM allows to add/remove PVs to/from a VG. Add/remove/increase/shri=
nk
> >     LVs in a VG.
> >     This is done by dividing each PV in Physical Extents (PE), and then
> >     mapping those to Logical Extenst (LE) in a LV, so a LV is composed =
of
> >     chunks of disk taken from one or more PV in a VG.
> >
> >     When using lvm you create filesystems over logical volumes instead =
of
> >     creating them on disk (or partition....)
> >
> >     Lvm has no knowledge of what lays over it, a logical volume
> >     is just a block device.
> >
> >     The above sentence means that if you use a logical volume to host a
> >     filesystem and want to resize the lv, you have to deal with the
> >     filesystem yourself.
> >     i.e.
> >     if you enlarge a LV, you have to tell the filesystem that the space
> >     available has increased.
> >     if you want to reduce an LV, you have to ensure _before_ doing it
> that
> >     the space removed does not contain any data.
> >     so if you want to reduce an LV containing a filesystem you _have_ t=
o
> >     tell the filesystem _before_ to let that space alone. if you fail t=
o
> do
> >     this you will loose all data that was on the portion of disk you
> >     removed, and the filesystem will still think it can use that portio=
n
> of
> >     data, until it will actually try, then sudden realization will hit
> like
> >     a brick. as you just discovered.
> >
> >     btw, let pvresize alone, it is used only in the particular case in
> which
> >     you are able to resize the disk underlying a volume group, which is
> >     impossible for a plain disk.
> >
> >     L.
> >
> >
> >
> >
> >
> >     _______________________________________________
> >     linux-lvm mailing list
> >     linux-lvm@redhat.com <mailto:linux-lvm@redhat.com>
> >     https://www.redhat.com/mailman/listinfo/linux-lvm
> >     read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >
> >
> > -----------------------------------------------------------------------=
-
>  >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> --
> Ryan Anderson
> (901) 843 9300
> Systems Engineer
> WorldSpice Technologies
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e64762f22ec9d30476a03cee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>Ryan, Thanks for your suggestion. I know it works, but I had hoped to =
have a solution that=C2=A0didn&#39;t stop the whole system while I fixed it=
.</div>
<div>=C2=A0</div>
<div>To Drew:</div>
<div>I think you were quite right when you spoke about planning the file sy=
stem. I&#39;ve come to realize that my question is somewhat naive. One simp=
ly doesn&#39;t do what I wanted to exactly because there is no easy way to =
dismantle it. It would be better to partition off some part of the OS drive=
 and add that to a new volume group (or a new logical volume group) and mou=
nt that under &quot;/mnt&quot;, and then add whatever partitions on new dri=
ves to that logical volume. That logical volume could be dismounted and wor=
ked on, whereas whatever is under root cannot be worked on easily.</div>

<div>Regards,</div>
<div>Lou.</div>
<div>=C2=A0</div>
<div class=3D"gmail_quote">On Fri, Oct 23, 2009 at 1:12 PM, Ryan Anderson <=
span dir=3D"ltr">&lt;<a href=3D"mailto:ryan@worldspice.net">ryan@worldspice=
.net</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Your best bet for resizing the r=
oot FS will be to use a LiveCD with LVM2<br>support. sysrescuecd works well=
, but likely your distribution install<br>
disk can be booted with &quot;linux rescue&quot; or something similar.<br>
<div class=3D"im"><br>Lou Arnold wrote:<br>&gt; Luca, your comments make se=
nse. After my last message I considered just<br>&gt; what you said, but I d=
on&#39;t know how to prove it.<br>&gt; =EF=BF=BD<br>&gt; I know there is no=
 data on the drive that I added, because I just added<br>
&gt; the drive and never put data on it. I am sure &quot;busy&quot; means t=
hat it is<br>&gt; mounted.=EF=BF=BDBecause it is=EF=BF=BDincluded in the de=
fault group/volume (VolGroup00<br>&gt; - LogVol00) and because that LV is m=
ounted at root (&quot;/&quot;), I cannot<br>
&gt; reduce the filesystem with resize2fs; there is no way to unmount &quot=
;/&quot;,<br>&gt; that I know of, anyway.=EF=BF=BD=EF=BF=BD Unless of cours=
e someone knows how?<br>&gt; On Thu, Oct 22, 2009 at 11:52 PM, Luca Berra &=
lt;<a href=3D"mailto:bluca@comedia.it">bluca@comedia.it</a><br>
</div>
<div>
<div></div>
<div class=3D"h5">&gt; &lt;mailto:<a href=3D"mailto:bluca@comedia.it">bluca=
@comedia.it</a>&gt;&gt; wrote:<br>&gt;<br>&gt; =C2=A0 =C2=A0 On Wed, Oct 21=
, 2009 at 03:03:24PM -0400, Lou Arnold wrote:<br>&gt;<br>&gt; =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 I read the How-To. It doesn&#39;t talk about the specific ca=
se or<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 being mounted<br>&gt;<br>&gt; =C2=A0 =C2=
=A0 I hate how-tos, they are a collection of particular cases and leave the=
<br>&gt; =C2=A0 =C2=A0 luser with a feeling of knowledge. which is not.<br>=
&gt;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 at root, so I had to exper=
iment. It is likely that commands were<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 in the<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 wrong order, but I don&#39;t know what the right order is.<br>&gt; =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 I have attached the terminal session I used. In the en=
d it did<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 not work.<br>&gt;<br>&gt;<br>&=
gt; =C2=A0 =C2=A0 the commands were not in the wrong order,<br>
&gt; =C2=A0 =C2=A0 they were just the wrong commands, unless your aim was r=
einstalling.<br>&gt;<br>&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 There was =
still 66 GB free, and when I rebooted, the file system<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 failed. The<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 superbloc=
k was too big.<br>
&gt;<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 I obviously don&#39;t understand t=
he difference between pvresize,<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 lvreduc=
e and<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 vgreduce, and how =EF=BF=BDresize=
2fs =EF=BF=BDis related to these commands.<br>&gt;<br>&gt;<br>&gt; =C2=A0 =
=C2=A0 I think you need to go over the basics again<br>
&gt; =C2=A0 =C2=A0 LVM is used to abstract storage management<br>&gt; =C2=
=A0 =C2=A0 it is done by creating layers<br>&gt; =C2=A0 =C2=A0 Physical Vol=
umes: which represent disks (or partitions, or whatever<br>&gt; =C2=A0 =C2=
=A0 block device...)<br>&gt; =C2=A0 =C2=A0 Volume Group: which is a collect=
ion of disks<br>
&gt; =C2=A0 =C2=A0 Logical Volume: which is a portion of a volume group<br>=
&gt;<br>&gt; =C2=A0 =C2=A0 LVM allows to add/remove PVs to/from a VG. Add/r=
emove/increase/shrink<br>&gt; =C2=A0 =C2=A0 LVs in a VG.<br>&gt; =C2=A0 =C2=
=A0 This is done by dividing each PV in Physical Extents (PE), and then<br>
&gt; =C2=A0 =C2=A0 mapping those to Logical Extenst (LE) in a LV, so a LV i=
s composed of<br>&gt; =C2=A0 =C2=A0 chunks of disk taken from one or more P=
V in a VG.<br>&gt;<br>&gt; =C2=A0 =C2=A0 When using lvm you create filesyst=
ems over logical volumes instead of<br>
&gt; =C2=A0 =C2=A0 creating them on disk (or partition....)<br>&gt;<br>&gt;=
 =C2=A0 =C2=A0 Lvm has no knowledge of what lays over it, a logical volume<=
br>&gt; =C2=A0 =C2=A0 is just a block device.<br>&gt;<br>&gt; =C2=A0 =C2=A0=
 The above sentence means that if you use a logical volume to host a<br>
&gt; =C2=A0 =C2=A0 filesystem and want to resize the lv, you have to deal w=
ith the<br>&gt; =C2=A0 =C2=A0 filesystem yourself.<br>&gt; =C2=A0 =C2=A0 i.=
e.<br>&gt; =C2=A0 =C2=A0 if you enlarge a LV, you have to tell the filesyst=
em that the space<br>&gt; =C2=A0 =C2=A0 available has increased.<br>
&gt; =C2=A0 =C2=A0 if you want to reduce an LV, you have to ensure _before_=
 doing it that<br>&gt; =C2=A0 =C2=A0 the space removed does not contain any=
 data.<br>&gt; =C2=A0 =C2=A0 so if you want to reduce an LV containing a fi=
lesystem you _have_ to<br>
&gt; =C2=A0 =C2=A0 tell the filesystem _before_ to let that space alone. if=
 you fail to do<br>&gt; =C2=A0 =C2=A0 this you will loose all data that was=
 on the portion of disk you<br>&gt; =C2=A0 =C2=A0 removed, and the filesyst=
em will still think it can use that portion of<br>
&gt; =C2=A0 =C2=A0 data, until it will actually try, then sudden realizatio=
n will hit like<br>&gt; =C2=A0 =C2=A0 a brick. as you just discovered.<br>&=
gt;<br>&gt; =C2=A0 =C2=A0 btw, let pvresize alone, it is used only in the p=
articular case in which<br>
&gt; =C2=A0 =C2=A0 you are able to resize the disk underlying a volume grou=
p, which is<br>&gt; =C2=A0 =C2=A0 impossible for a plain disk.<br>&gt;<br>&=
gt; =C2=A0 =C2=A0 L.<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt;<br>&gt; =C2=A0=
 =C2=A0 _______________________________________________<br>
&gt; =C2=A0 =C2=A0 linux-lvm mailing list<br></div></div>&gt; =C2=A0 =C2=A0=
 <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a> &lt;mailt=
o:<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a>&gt;<br>
<div class=3D"im">&gt; =C2=A0 =C2=A0 <a href=3D"https://www.redhat.com/mail=
man/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailman/li=
stinfo/linux-lvm</a><br>&gt; =C2=A0 =C2=A0 read the LVM HOW-TO at <a href=
=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOW=
TO/LVM-HOWTO/</a><br>
&gt;<br>&gt;<br>&gt;<br></div>&gt; ----------------------------------------=
--------------------------------<br>
<div>
<div></div>
<div class=3D"h5">&gt;<br>&gt; ____________________________________________=
___<br>&gt; linux-lvm mailing list<br>&gt; <a href=3D"mailto:linux-lvm@redh=
at.com">linux-lvm@redhat.com</a><br>&gt; <a href=3D"https://www.redhat.com/=
mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailma=
n/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br><br></div></div=
><font color=3D"#888888">--<br>Ryan Anderson<br>(901) 843 9300<br>Systems E=
ngineer<br>
WorldSpice Technologies<br><br></font><br>_________________________________=
______________<br>linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@red=
hat.com">linux-lvm@redhat.com</a><br><a href=3D"https://www.redhat.com/mail=
man/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.com/mailman/li=
stinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0016e64762f22ec9d30476a03cee--
