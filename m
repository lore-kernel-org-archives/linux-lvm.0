Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2TC2Yhk024800
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2014 08:02:35 -0400
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2TC2Wsk020981
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2014 08:02:32 -0400
Received: by mail-qa0-f41.google.com with SMTP id j5so6344468qaq.14
	for <linux-lvm@redhat.com>; Sat, 29 Mar 2014 05:02:32 -0700 (PDT)
MIME-Version: 1.0
Sender: derek.dongray@gmail.com
In-Reply-To: <CANfzhCZOM3xUdVfG74RtxtDa5tHE6MhnHo=LmNS_G9DR5WwYqQ@mail.gmail.com>
References: <CANfzhCZOM3xUdVfG74RtxtDa5tHE6MhnHo=LmNS_G9DR5WwYqQ@mail.gmail.com>
Date: Sat, 29 Mar 2014 12:02:32 +0000
Message-ID: <CANfzhCax4OKY3FVtaah5XHUudNu=gxs4yjAc5UMOTYDfmK+vfg@mail.gmail.com>
From: Derek Dongray <derek@inverchapel.me.uk>
Content-Type: multipart/alternative; boundary=089e015375a0dc9a8004f5bd9739
Subject: Re: [linux-lvm] How do I remove a locked Logical Volume ([pvmove0])
 left over after a disk error?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--089e015375a0dc9a8004f5bd9739
Content-Type: text/plain; charset=ISO-8859-1

> pvmove --abort has to work - unless you have some ancient version of lvm2 tools?

The first thing I tried, several times, including with '--force', no
effect. The fact that the system allows move on the same LV I was
trying to move when it failed would inidicate that it's not in a state
where a pvmove is considered to be in progress.

> What's the vresion in use ?


# lvm version
  LVM version:     2.02.104(2) (2013-11-13)
  Library version: 1.02.83 (2013-11-13)
  Driver version:  4.26.0


It the current Debian testing version. Kernel 3.12-1-686-pae.

> (You could always hack your lvm2 metadata in 'vi' - if you know what you
> are doing...)


I'm beginning to think that's the only way to get rid of it. Of course, the
other solution is to simply ignore it as it doesn't seem to cause any
problem!

Derek.


On 27 March 2014 11:32, Derek Dongray <derek@inverchapel.me.uk> wrote:

> Following some disk errors while I was moving some extents, I now have a
> hidden locked [pvmove0] which doesn't seem to have any physical extents
> assigned, although it is shown as 4Mb long.
>
>     # lvs -a -o+seg_pe_ranges a/pvmove0
>       LV        VG   Attr       LSize Pool Origin Data%  Move Log Cpy%Sync
> Convert PE Ranges
>       [pvmove0] a    vwC---v--- 4.00m
>
> The simple 'lvremove a/pvmove0' (optionally with '--force') results in the
> message 'Can't remove locked LV pvmove0'.
>
> 'pvmove --abort' does nothing. The presence of this volume doesn't seem to
> affect other moves (which simply use [pvmove1]).
>
> In the config, the LV shows:
>
>                 pvmove0 {
>                         id = "54veYD-hM8r-j214-MOD1-FGnV-3g7t-jRlZ7W"
>                         status = ["READ", "WRITE", "LOCKED"]
>                         flags = []
>                         creation_host = "zotac"
>                         creation_time = 1394764593      # 2014-03-14
> 02:36:33 +0000
>                         allocation_policy = "contiguous"
>                         segment_count = 1
>
>                         segment1 {
>                                 start_extent = 0
>                                 extent_count = 1        # 4 Megabytes
>
>                                 type = "error"
>                         }
>                 }
>
> I noticed there's no physical volume associate with the LV although the
> extent count of 1 explains why it's reported as 4Mb in size.
>
> I suspect that the only fix is to manually edit the config file to remove
> the offending LV and then use `vgcfgrestore` (or possible simply edit the
> config file from a rescue system) but would assume that I'm not the only
> person to have this problem and would think there's a series of (possibly
> undocumented) commands to clean this up.
>
> [FYI: the 'disk errors' were the almost simultaneous failure of 2 out of 3
> disks in a RAID array; fortunately one the drives only had a few bad blocks
> so I was able to recover all but a few megabytes of a 500Gb volume using
> 'ddrescue']
>
> --
> Derek.
>



-- 
Derek.

--089e015375a0dc9a8004f5bd9739
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"color:rgb(0,0,0);margin:0em">&gt; pvmove --a=
bort has to work - unless you have some ancient version of lvm2 tools?
<br></pre><pre style=3D"color:rgb(0,0,0);margin:0em">The first thing I trie=
d, several times, including with &#39;--force&#39;, no effect. The fact tha=
t the system allows move on the same LV I was trying to move when it failed=
 would inidicate that it&#39;s not in a state where a pvmove is considered =
to be in progress.</pre>
<pre style=3D"color:rgb(0,0,0);margin:0em">&gt; What&#39;s the vresion in u=
se ?</pre><pre style=3D"color:rgb(0,0,0);margin:0em"><br></pre><pre style=
=3D"margin:0em"><font color=3D"#000000"># lvm version
  LVM version:     2.02.104(2) (2013-11-13)
  Library version: 1.02.83 (2013-11-13)
  Driver version:  4.26.0</font></pre><pre style=3D"margin:0em"><font color=
=3D"#000000"><br></font></pre><pre style=3D"margin:0em"><font color=3D"#000=
000">It the current Debian testing version. Kernel 3.12-1-686-pae.

&gt; (You could always hack your lvm2 metadata in &#39;vi&#39; - if you kno=
w what you
&gt; are doing...)
</font></pre><div><br></div><div>I&#39;m beginning to think that&#39;s the =
only way to get rid of it. Of course, the other solution is to simply ignor=
e it as it doesn&#39;t seem to cause any problem!</div><div><br></div>
<div>Derek.</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gma=
il_quote">On 27 March 2014 11:32, Derek Dongray <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:derek@inverchapel.me.uk" target=3D"_blank">derek@inverchapel.m=
e.uk</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Following some disk er=
rors while I was moving some extents, I now have a hidden locked [pvmove0] =
which doesn&#39;t seem to have any physical extents assigned, although it i=
s shown as 4Mb long.</div>
<div>
<br></div><div>=A0 =A0 # lvs -a -o+seg_pe_ranges a/pvmove0</div><div>=A0 =
=A0 =A0 LV =A0 =A0 =A0 =A0VG =A0 Attr =A0 =A0 =A0 LSize Pool Origin Data% =
=A0Move Log Cpy%Sync Convert PE Ranges</div><div>=A0 =A0 =A0 [pvmove0] a =
=A0 =A0vwC---v--- 4.00m</div><div><br>
</div>
<div>The simple &#39;lvremove a/pvmove0&#39; (optionally with &#39;--force&=
#39;) results in the message &#39;Can&#39;t remove locked LV pvmove0&#39;.<=
br></div><div><br></div><div>&#39;pvmove --abort&#39; does nothing. The pre=
sence of this volume doesn&#39;t seem to affect other moves (which simply u=
se [pvmove1]).</div>

<div><br></div><div>In the config, the LV shows:</div><div><br></div><div>=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pvmove0 {</div><div>=A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 id =3D &quot;54veYD-hM8r-j214-MOD1-FGnV-3g7t-jRlZ7=
W&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 status =
=3D [&quot;READ&quot;, &quot;WRITE&quot;, &quot;LOCKED&quot;]</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 flags =3D []</div><div=
>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 creation_host =3D &quot;zo=
tac&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 creatio=
n_time =3D 1394764593 =A0 =A0 =A0# 2014-03-14 02:36:33 +0000</div><div>=A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 allocation_policy =3D &quot;con=
tiguous&quot;</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 segment_count =3D 1</d=
iv><div><br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 segm=
ent1 {</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 start_extent =3D 0</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 extent_count =3D 1 =A0 =A0 =A0 =A0# 4 Megabytes=
</div>

<div><br></div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 type =3D &quot;error&quot;</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 }</div><div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }</div><div=
><br></div><div>I noticed there&#39;s no physical volume associate with the=
 LV although the extent count of 1 explains why it&#39;s reported as 4Mb in=
 size.</div>

<div><br></div><div>I suspect that the only fix is to manually edit the con=
fig file to remove the offending LV and then use `vgcfgrestore` (or possibl=
e simply edit the config file from a rescue system) but would assume that I=
&#39;m not the only person to have this problem and would think there&#39;s=
 a series of (possibly undocumented) commands to clean this up.<br>

</div><div><br></div><div>[FYI: the &#39;disk errors&#39; were the almost s=
imultaneous failure of 2 out of 3 disks in a RAID array; fortunately one th=
e drives only had a few bad blocks so I was able to recover all but a few m=
egabytes of a 500Gb volume using &#39;ddrescue&#39;]</div>
<span class=3D"HOEnZb"><font color=3D"#888888">
<div><br></div>-- <br>Derek.
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>Derek.
</div>

--089e015375a0dc9a8004f5bd9739--
