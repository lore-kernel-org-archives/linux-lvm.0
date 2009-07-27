Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6REq2aT018353
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 10:52:04 -0400
Received: from mail-ew0-f220.google.com (mail-ew0-f220.google.com
	[209.85.219.220])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6REpdGA002369
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 10:51:39 -0400
Received: by ewy20 with SMTP id 20so3139164ewy.3
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 07:51:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090727135628.GA3782@us.ibm.com>
References: <29ae894c0907260312m3b2ffb2ex5cbef456f3c49bee@mail.gmail.com>
	<20090727135628.GA3782@us.ibm.com>
Date: Mon, 27 Jul 2009 16:45:42 +0200
Message-ID: <29ae894c0907270745k3cd922c9lea14d782435c58e6@mail.gmail.com>
Subject: Re: [linux-lvm] Mirroring implementation
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=0016e6d99aaf37e511046fb1025d
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

--0016e6d99aaf37e511046fb1025d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Malahal,


2009/7/27, malahal@us.ibm.com <malahal@us.ibm.com>:
>
> brem belguebli [brem.belguebli@gmail.com] wrote:
> >    Hi,
> >    I have a few questions concerning LVM mirror implementation, and I
> >    couldn't find any suitable design doc
> >    I need to setup a dual site ( a few miles between the 2 sites, around
> 1 ms
> >    RTD) mirror based cluster system.
>
> You need asynchronous mirroring (remote replication module). This is not
> in mainline (not sure if included in the latest RHEL release). The
> following comments apply to dm-mirror module that is already in the
> mainline.


Do you mean a Disk array based replication mechanism (SRDF, CA, etc...)? or
is it system based , and if so do you have any technical document link to
provide me ?


>    - *what is the default behaviour of the mirroring, writing in parallel
> to
> >    both mirror legs or serialized ? what about read requests ?
>
> It writes in parallel. Reads from a single device (switches on a device
> failure only).
>
> >    - for write requests, is the ack returned to the application (thru
> VFS)
> >    when the 2 legs are updated or only when the first is updated ?
>
> When two are updated. (you need 'remote replication' module for the
> latter behaviour)

As I said, I couldn't find suitable doc about this, and in fact that's the
behaviour I'm expecting (acking only when the 2 legs are up to date) . Can
you point me to the good doc ?


>    - Is there a way to control it ?
>
>     I don't think so.
>
> >    - what happens if the log device is lost ?
>
> The mirror stops and a daemon re-allocates the log and the mirror should
> be back to business (this depends on your lvm configuration though).


As the mirrorlog is in my case bound to a given SAN device (let's say
/dev/sdx) and this device belongs to the SAN array located on the datacenter
that experienced a disaster, my mirror won't be able to be brought back
online as long as /dev/sdx is down .

>    I saw a post about LVM mirror vs mdadm where it is about the location
> of
> >    the mirror log
> >    ([1]https://www.redhat.com/archives/linux-lvm/2009-July/msg00012.html
> )
> >    someone gave the answer that when creating the LV's with --alloc
> anywhere
> >    it will auto locate the log on any of the PV's.
> >    According to what I could read, the --alloc doesn't intend for that,
> am I
> >    right ?
>
> Replace your "auto locate" to "allocate the log on any of the PV's".
>
> What is the intention of the "--alloc anywhere" from your reading?


According to the lvm man page, --alloc anywhere, in crontrary to --alloc
strict (default) would allocate "data" LE to any pv forming the VG,
resulting in having striped or mirrored LE on the same PV (sic!).

It doesn't seem to concern log device which is de facto a 3rd device not
necessary belonging to the VG, or the man page is not up2date.


--Malahal.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e6d99aaf37e511046fb1025d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Malahal,</div>
<div>=A0</div>
<div>=A0</div>
<div><span class=3D"gmail_quote">2009/7/27, <a href=3D"mailto:malahal@us.ib=
m.com">malahal@us.ibm.com</a> &lt;<a href=3D"mailto:malahal@us.ibm.com">mal=
ahal@us.ibm.com</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">brem belguebli [<a href=3D"mailt=
o:brem.belguebli@gmail.com">brem.belguebli@gmail.com</a>] wrote:<br>&gt;=A0=
=A0=A0=A0Hi,<br>
&gt;=A0=A0=A0=A0I have a few questions concerning LVM mirror implementation=
, and I<br>&gt;=A0=A0=A0=A0couldn&#39;t find any suitable design doc<br>&gt=
;=A0=A0=A0=A0I need to setup a dual site ( a few miles between the 2 sites,=
 around 1 ms<br>&gt;=A0=A0=A0=A0RTD) mirror based cluster system.<br>
<br>You need asynchronous mirroring (remote replication module). This is no=
t<br>in mainline (not sure if included in the latest RHEL release). The<br>=
following comments apply to dm-mirror module that is already in the<br>
mainline.</blockquote>
<div>=A0</div>
<div>Do you mean a Disk array based replication mechanism (SRDF, CA, etc...=
)? or is it system based , and if so do you have any technical document lin=
k to provide me ?</div>
<div>=A0</div><br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;=A0=A0=A0=A0- *what is the d=
efault behaviour of the mirroring, writing in parallel to<br>&gt;=A0=A0=A0=
=A0both mirror legs or serialized ? what about read requests ?<br>
<br>It writes in parallel. Reads from a single device (switches on a device=
<br>failure only).<br><br>&gt;=A0=A0=A0=A0- for write requests, is the ack =
returned to the application (thru VFS)<br>&gt;=A0=A0=A0=A0when the 2 legs a=
re updated or only when the first is updated ?<br>
<br>When two are updated. (you need &#39;remote replication&#39; module for=
 the<br>latter behaviour)</blockquote>
<div>As I said, I couldn&#39;t find suitable doc about this, and in fact th=
at&#39;s the behaviour I&#39;m expecting (acking only when the 2 legs are u=
p=A0to date) . Can you point me to the good doc ?</div>
<div>=A0</div><br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;=A0=A0=A0=A0- Is there a way=
 to control it ?<br><br>=A0=A0=A0=A0I don&#39;t think so.<br><br>&gt;=A0=A0=
=A0=A0- what happens if the log device is lost ?<br>
<br>The mirror stops and a daemon re-allocates the log and the mirror shoul=
d<br>be back to business (this depends on your lvm configuration though).</=
blockquote>
<div>=A0</div>
<div>As the mirrorlog is in my case bound to a given SAN device (let&#39;s =
say /dev/sdx) and this device belongs to the SAN array located on the datac=
enter that experienced a disaster, my mirror won&#39;t be able to be brough=
t back online as long as /dev/sdx is down .</div>
<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">&gt;=A0=A0=A0=A0I saw a post abo=
ut LVM mirror vs mdadm where it is about the location of<br>&gt;=A0=A0=A0=
=A0the mirror log<br>
&gt;=A0=A0=A0=A0([1]<a href=3D"https://www.redhat.com/archives/linux-lvm/20=
09-July/msg00012.html">https://www.redhat.com/archives/linux-lvm/2009-July/=
msg00012.html</a>)<br>&gt;=A0=A0=A0=A0someone gave the answer that when cre=
ating the LV&#39;s with --alloc anywhere<br>
&gt;=A0=A0=A0=A0it will auto locate the log on any of the PV&#39;s.<br>&gt;=
=A0=A0=A0=A0According to what I could read, the --alloc doesn&#39;t intend =
for that, am I<br>&gt;=A0=A0=A0=A0right ?<br><br>Replace your &quot;auto lo=
cate&quot; to &quot;allocate the log on any of the PV&#39;s&quot;.<br>
<br>What is the intention of the &quot;--alloc anywhere&quot; from your rea=
ding?</blockquote>
<div>=A0</div>
<div>According to the lvm man page, --alloc anywhere, in crontrary to --all=
oc strict (default) would allocate &quot;data&quot; LE to any pv forming th=
e VG, resulting in having striped or mirrored LE on the same PV (sic!).</di=
v>

<div>=A0</div>
<div>It doesn&#39;t seem to concern log device which is de facto a 3rd devi=
ce not necessary belonging to the VG, or the man page is not up2date.</div>
<div>=A0</div><br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">--Malahal.<br><br>______________=
_________________________________<br>linux-lvm mailing list<br><a href=3D"m=
ailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.r=
edhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=
=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a><=
br>
</blockquote></div><br>

--0016e6d99aaf37e511046fb1025d--
