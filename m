Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NJ760s024973
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:07:06 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NJ6mjl025585
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 15:06:48 -0400
Received: by yxe13 with SMTP id 13so7964364yxe.23
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 12:06:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091023065219.GA8733@maude.comedia.it>
References: <c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
	<c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
Date: Fri, 23 Oct 2009 12:06:47 -0700
Message-ID: <a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001636c926cde42d8604769ee91c
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

--001636c926cde42d8604769ee91c
Content-Type: text/plain; charset=ISO-8859-1

Luca, your comments make sense. After my last message I considered just what
you said, but I don't know how to prove it.

I know there is no data on the drive that I added, because I just added the
drive and never put data on it. I am sure "busy" means that it is
mounted. Because it is included in the default group/volume (VolGroup00 -
LogVol00) and because that LV is mounted at root ("/"), I cannot reduce the
filesystem with resize2fs; there is no way to unmount "/", that I know of,
anyway.   Unless of course someone knows how?
On Thu, Oct 22, 2009 at 11:52 PM, Luca Berra <bluca@comedia.it> wrote:

> On Wed, Oct 21, 2009 at 03:03:24PM -0400, Lou Arnold wrote:
>
>> I read the How-To. It doesn't talk about the specific case or being
>> mounted
>>
> I hate how-tos, they are a collection of particular cases and leave the
> luser with a feeling of knowledge. which is not.
>
>
> at root, so I had to experiment. It is likely that commands were in the
>> wrong order, but I don't know what the right order is.
>> I have attached the terminal session I used. In the end it did not work.
>>
>
> the commands were not in the wrong order,
> they were just the wrong commands, unless your aim was reinstalling.
>
>
> There was still 66 GB free, and when I rebooted, the file system failed.
>> The
>> superblock was too big.
>>
>> I obviously don't understand the difference between pvresize, lvreduce and
>> vgreduce, and how  resize2fs  is related to these commands.
>>
>
> I think you need to go over the basics again
> LVM is used to abstract storage management
> it is done by creating layers
> Physical Volumes: which represent disks (or partitions, or whatever
> block device...)
> Volume Group: which is a collection of disks
> Logical Volume: which is a portion of a volume group
>
> LVM allows to add/remove PVs to/from a VG. Add/remove/increase/shrink
> LVs in a VG.
> This is done by dividing each PV in Physical Extents (PE), and then
> mapping those to Logical Extenst (LE) in a LV, so a LV is composed of
> chunks of disk taken from one or more PV in a VG.
>
> When using lvm you create filesystems over logical volumes instead of
> creating them on disk (or partition....)
>
> Lvm has no knowledge of what lays over it, a logical volume
> is just a block device.
>
> The above sentence means that if you use a logical volume to host a
> filesystem and want to resize the lv, you have to deal with the
> filesystem yourself.
> i.e.
> if you enlarge a LV, you have to tell the filesystem that the space
> available has increased.
> if you want to reduce an LV, you have to ensure _before_ doing it that
> the space removed does not contain any data.
> so if you want to reduce an LV containing a filesystem you _have_ to
> tell the filesystem _before_ to let that space alone. if you fail to do
> this you will loose all data that was on the portion of disk you
> removed, and the filesystem will still think it can use that portion of
> data, until it will actually try, then sudden realization will hit like
> a brick. as you just discovered.
>
> btw, let pvresize alone, it is used only in the particular case in which
> you are able to resize the disk underlying a volume group, which is
> impossible for a plain disk.
>
> L.
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--001636c926cde42d8604769ee91c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Luca, your comments make sense. After my last message I considered jus=
t what you said, but I don&#39;t know how to prove it.</div>
<div>=A0</div>
<div>I know there is no data on the drive that I added, because I just adde=
d the drive and never put data on it. I am sure &quot;busy&quot; means that=
 it is mounted.=A0Because it is=A0included in the default group/volume (Vol=
Group00 - LogVol00) and because that LV is mounted at root (&quot;/&quot;),=
 I cannot reduce the filesystem with resize2fs; there is no way to unmount =
&quot;/&quot;, that I know of, anyway.=A0=A0 Unless of course someone knows=
 how?<br>
</div>
<div class=3D"gmail_quote">On Thu, Oct 22, 2009 at 11:52 PM, Luca Berra <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:bluca@comedia.it">bluca@comedia.it</a>=
&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div class=3D"im">On Wed, Oct 21, 2009 at 03:03:24PM -0400, Lou Arnold wrot=
e:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">I read the How-To. It doesn&#39;=
t talk about the specific case or being mounted<br></blockquote></div>I hat=
e how-tos, they are a collection of particular cases and leave the<br>
luser with a feeling of knowledge. which is not.=20
<div class=3D"im"><br><br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">at root, so I had to experiment.=
 It is likely that commands were in the<br>wrong order, but I don&#39;t kno=
w what the right order is.<br>
I have attached the terminal session I used. In the end it did not work.<br=
></blockquote><br></div>the commands were not in the wrong order,<br>they w=
ere just the wrong commands, unless your aim was reinstalling.=20
<div class=3D"im"><br><br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">There was still 66 GB free, and =
when I rebooted, the file system failed. The<br>superblock was too big.<br>
<br>I obviously don&#39;t understand the difference between pvresize, lvred=
uce and<br>vgreduce, and how =A0resize2fs =A0is related to these commands.<=
br></blockquote><br></div>I think you need to go over the basics again<br>L=
VM is used to abstract storage management<br>
it is done by creating layers<br>Physical Volumes: which represent disks (o=
r partitions, or whatever<br>block device...)<br>Volume Group: which is a c=
ollection of disks<br>Logical Volume: which is a portion of a volume group<=
br>
<br>LVM allows to add/remove PVs to/from a VG. Add/remove/increase/shrink<b=
r>LVs in a VG.<br>This is done by dividing each PV in Physical Extents (PE)=
, and then<br>mapping those to Logical Extenst (LE) in a LV, so a LV is com=
posed of<br>
chunks of disk taken from one or more PV in a VG.<br><br>When using lvm you=
 create filesystems over logical volumes instead of<br>creating them on dis=
k (or partition....)<br><br>Lvm has no knowledge of what lays over it, a lo=
gical volume<br>
is just a block device.<br><br>The above sentence means that if you use a l=
ogical volume to host a<br>filesystem and want to resize the lv, you have t=
o deal with the<br>filesystem yourself.<br>i.e.<br>if you enlarge a LV, you=
 have to tell the filesystem that the space<br>
available has increased.<br>if you want to reduce an LV, you have to ensure=
 _before_ doing it that<br>the space removed does not contain any data.<br>=
so if you want to reduce an LV containing a filesystem you _have_ to<br>
tell the filesystem _before_ to let that space alone. if you fail to do<br>=
this you will loose all data that was on the portion of disk you<br>removed=
, and the filesystem will still think it can use that portion of<br>data, u=
ntil it will actually try, then sudden realization will hit like<br>
a brick. as you just discovered.<br><br>btw, let pvresize alone, it is used=
 only in the particular case in which<br>you are able to resize the disk un=
derlying a volume group, which is<br>impossible for a plain disk.<br><br>
L.=20
<div class=3D"im"><br><br><br><br><br>_____________________________________=
__________<br>linux-lvm mailing list<br><a href=3D"mailto:linux-lvm@redhat.=
com" target=3D"_blank">linux-lvm@redhat.com</a><br><a href=3D"https://www.r=
edhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.=
com/mailman/listinfo/linux-lvm</a><br>
</div>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" t=
arget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div=
><br>

--001636c926cde42d8604769ee91c--
