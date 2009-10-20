Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9K0QgmQ009036
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 20:26:42 -0400
Received: from mail-gx0-f226.google.com (mail-gx0-f226.google.com
	[209.85.217.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9K0QWQ5003228
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 20:26:32 -0400
Received: by gxk26 with SMTP id 26so3034635gxk.11
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 17:26:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com>
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com>
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com>
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com>
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com>
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
Date: Mon, 19 Oct 2009 20:26:32 -0400
Message-ID: <a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: Lou Arnold <larnolda1@gmail.com>
Content-Type: multipart/alternative; boundary=001636ed67760325ce047652ea55
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
To: Drew <drew.kay@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--001636ed67760325ce047652ea55
Content-Type: text/plain; charset=ISO-8859-1

Yes, OK, I see the advantage in your examples.

I've tried this (add a drive to VolGroup00/LogVol00) and it certainly works,
but it is much more difficult to undo than 1) creating a new volume group
and new volume, or 2) adding the drive to VolGroup00 and creating a new
volume. I read the documentation, but the file system fails whenever I
reboot. After all, LogVol00 is mounted at root, you can't unmount root
to shrink the volume. If you assume that the drive is empty and so you don't
have any data to migrate, how does one do it?


On 10/19/09, Drew <drew.kay@gmail.com> wrote:
>
> >> > 1) Why would you want several logical volumes in one volume group?
> >>
> >> The same reason(s) you would want to partition a regular hard drive.
> >>
> >> Maybe you only want /home to have 20GB so your kids can't flood the
> >> computer with downloaded music. Maybe you want /var/www to have
> >> restricted permissions so your home web server is less vulnerable to
> >> hackers. Maybe you're running a PVR application like MythTV and want a
> >> high-performance filesystem like XFS for storing recorded shows.
> >>
> >> All of these can be done with logical volumes, and are often easier
> under
> >> LVM.
> >
> >
> > But then if the above is true, then you may as well simply mount the
> > partition as normal and add an entry into the fstab file. You get no
> > advantage one way or the other - is that true?
>
> LVM does this better then regular disk partitioning. The fact that it
> creates a pool of space is it's power.
>
> Two examples.
>
> Let's say you don't have LVM and partitioned your disk with some
> leftover space. What happens if you change your mind and want to
> increase the size of a partition? Now you have to juggle the
> partitions on the disk while you move that free space around to a
> place where the partition can be extended. I've done it before and
> it's messy. LVM? Just use the lvextend command with the right
> parameters and you're done.
>
> Next. Say you have two 80GB disks each partitioned with two partitions
> 60GB & 20GB. Now say you need to add an extra partition 30GB in size.
> How? With regular disks, you pretty much can't. With LVM, you'd have
> 40GB free and can just create the 30GB logical volume without worrying
> about which disk.
>
> As a side note, can you cc: the LVM list when you reply? I don't think
> they're getting your side of this conversation.
>
>
> --
> Drew
>
> "Nothing in life is to be feared. It is only to be understood."
> --Marie Curie
>

--001636ed67760325ce047652ea55
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Yes, OK, I see the advantage in your examples.</div>
<div>=A0</div>
<div>I&#39;ve tried this (add a drive to VolGroup00/LogVol00) and it certai=
nly works, but it is much more difficult to undo than 1) creating a new vol=
ume group and new volume, or 2) adding the drive to VolGroup00 and creating=
 a new volume. I read the documentation, but the file system fails whenever=
 I reboot. After all, LogVol00 is mounted at root, you can&#39;t unmount ro=
ot to=A0shrink the volume. If you assume that the drive is empty and so you=
 don&#39;t have any data to migrate, how does one do it? <br>
<br>=A0</div>
<div><span class=3D"gmail_quote">On 10/19/09, <b class=3D"gmail_sendername"=
>Drew</b> &lt;<a href=3D"mailto:drew.kay@gmail.com">drew.kay@gmail.com</a>&=
gt; wrote:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;&gt; &gt; 1) Why would you w=
ant several logical volumes in one volume group?<br>&gt;&gt;<br>&gt;&gt; Th=
e same reason(s) you would want to partition a regular hard drive.<br>
&gt;&gt;<br>&gt;&gt; Maybe you only want /home to have 20GB so your kids ca=
n&#39;t flood the<br>&gt;&gt; computer with downloaded music. Maybe you wan=
t /var/www to have<br>&gt;&gt; restricted permissions so your home web serv=
er is less vulnerable to<br>
&gt;&gt; hackers. Maybe you&#39;re running a PVR application like MythTV an=
d want a<br>&gt;&gt; high-performance filesystem like XFS for storing recor=
ded shows.<br>&gt;&gt;<br>&gt;&gt; All of these can be done with logical vo=
lumes, and are often easier under<br>
&gt;&gt; LVM.<br>&gt;<br>&gt;<br>&gt; But then if the above is true, then y=
ou may as well simply mount the<br>&gt; partition as normal and add an entr=
y into the fstab file. You get no<br>&gt; advantage one way or the other - =
is that true?<br>
<br>LVM does this better then regular disk partitioning. The fact that it<b=
r>creates a pool of space is it&#39;s power.<br><br>Two examples.<br><br>Le=
t&#39;s say you don&#39;t have LVM and partitioned your disk with some<br>
leftover space. What happens if you change your mind and want to<br>increas=
e the size of a partition? Now you have to juggle the<br>partitions on the =
disk while you move that free space around to a<br>place where the partitio=
n can be extended. I&#39;ve done it before and<br>
it&#39;s messy. LVM? Just use the lvextend command with the right<br>parame=
ters and you&#39;re done.<br><br>Next. Say you have two 80GB disks each par=
titioned with two partitions<br>60GB &amp; 20GB. Now say you need to add an=
 extra partition 30GB in size.<br>
How? With regular disks, you pretty much can&#39;t. With LVM, you&#39;d hav=
e<br>40GB free and can just create the 30GB logical volume without worrying=
<br>about which disk.<br><br>As a side note, can you cc: the LVM list when =
you reply? I don&#39;t think<br>
they&#39;re getting your side of this conversation.<br><br><br>--<br>Drew<b=
r><br>&quot;Nothing in life is to be feared. It is only to be understood.&q=
uot;<br>--Marie Curie<br></blockquote></div><br>

--001636ed67760325ce047652ea55--
