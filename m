MIME-Version: 1.0
References: <CABZYMH498m-hNpkbAagiNPmFjFLrMZZZncx6S1ksupRVnPtYqw@mail.gmail.com>
	<20180925164405.GA10635@redhat.com>
	<CABZYMH57cROshtj0YMJ8PNU0Udw7qe0d7evuhc3-aXMYYEit3A@mail.gmail.com>
	<20180927173550.GB2706@redhat.com>
In-Reply-To: <20180927173550.GB2706@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Fri, 28 Sep 2018 11:14:35 +0800
Message-ID: <CABZYMH4eYC-r+wCPyC8r-xqzNbRr-OukRoweNAD2nej6wgDKyA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000967c0d0576e5db2e"
Subject: Re: [linux-lvm] [lvmlockd] recovery lvmlockd after kill_vg
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000967c0d0576e5db2e
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 28, 2018 at 1:35 AM David Teigland <teigland@redhat.com> wrote:
>
> On Thu, Sep 27, 2018 at 10:12:44PM +0800, Damon Wang wrote:
> > Thank you for your reply, I have another question under such
circumstances.
> >
> > I usually run "vgck" to check weather vg is good, but sometimes it
> > seems it stuck, and leave a VGLK on sanlock. (I'm sure io error will
> > cause it, but sometimes not because io error)
> > Then i'll try use sanlock client release -r xxx to release it, but it
> > also sometimes not work.(be stuck)
> > Then I may lvmlockctl -r to drop vg lockspace, but it still may stuck,
> > and I'm io is ok when it stuck
> >
> > This usually happens on multipath storage, I consider multipath will
> > queue some io is blamed, but not sure.
> >
> > Any idea?
>
> First, you might be able to avoid this issue by doing the check using
> something other than an lvm command, or perhaps and lvm command configured
> to avoid taking locks (the --nolocking option in vgs/pvs/lvs).  What's
> appropriate depends on specifically what you want to know from the check.
>

This is how I use sanlock and lvmlockd:


 +------------------+            +---------------------+
 +----------------+
 |                  |            |                     |         |
      |
 |     sanlock      <------------>     lvmlockd        <---------+  lvm
commands  |
 |                  |            |                     |         |
      |
 +------------------+            +---------------------+
 +----------------+
       |
       |
       |
       |      +------------------+
 +-----------------+        +------------+
       |      |                  |                               |
       |        |            |
       +------>     multipath    <- - -  -  -  -   -  -  -  -  - |  lvm
volumes    <--------+    qemu    |
              |                  |                               |
       |        |            |
              +------------------+
 +-----------------+        +------------+
                      |
                      |
                      |
                      |
                      |
              +------------------+
              |                  |
              |   san storage    |
              |                  |
              |                  |
              +------------------+

As I mentioned in first mail, sometimes I found lvm commands failed with
"sanlock lease storage failure", I guess this is because lvmlockd kill_vg
has triggered,
as the manual says, it should deactivate volumes and drop lockspace as
quick as possible, but I can't get a proper alert from a program way.

TTY can get a message, but it's not a good way to listen or monitor, so I
run vgck periodically and parse its stdout and stderr, once "sanlock lease
storage failure" or
something unusual happens, an alert will be triggered and I'll do some
check(I hope all this process can be automatically).

If do not require lock(pvs/lvs/vgs --nolocking), these error wont be
noticed, since lots of san storage configure multipath as queue io as far
as possible(multipath -t | grep queue_if_no_path),
get lvm error@early is pretty difficult, vgck and parse its output a way
with less load(it will get a shared vglk) and better efficiency(it should
take less than 0.1s in usual) after various tried.

As you mentioned, I'll extend io timeout to avoid storage jitter, and I
believe it also resolves some problems from multipath queue io.


> I still haven't fixed the issue you found earlier, which sounds like it
> could be the same or related to what you're describing now.
> https://www.redhat.com/archives/linux-lvm/2018-July/msg00011.html
>
> As for manually cleaning up a stray lock using sanlock client, there may
> be some limits on the situations that works in, I don't recall off hand.
> You should try using the -p <pid> option with client release to match the
> pid of lvmlockd.


yes I added -p to release lock, and I wanna summary up an "Emergency
Procedures" for deal with different storage failure, for me it's still
unclear now.
I'll do more experiment after fix these annoying storage fails, then make
this summary


> Configuring multipath to fail more quickly instead of queueing might give
> you a better chance of cleaning things up.
>
> Dave
>

yeah, I believe multipath queue io should be blamed, I'm negotiating with
storage vendor since they think multipath config is right :-(


Thank you for your patience!

Damon

--000000000000967c0d0576e5db2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br>=
On Fri, Sep 28, 2018 at 1:35 AM David Teigland &lt;<a href=3D"mailto:teigla=
nd@redhat.com">teigland@redhat.com</a>&gt; wrote:<br>&gt;<br>&gt; On Thu, S=
ep 27, 2018 at 10:12:44PM +0800, Damon Wang wrote:<br>&gt; &gt; Thank you f=
or your reply, I have another question under such circumstances.<br>&gt; &g=
t;<br>&gt; &gt; I usually run &quot;vgck&quot; to check weather vg is good,=
 but sometimes it<br>&gt; &gt; seems it stuck, and leave a VGLK on sanlock.=
 (I&#39;m sure io error will<br>&gt; &gt; cause it, but sometimes not becau=
se io error)<br>&gt; &gt; Then i&#39;ll try use sanlock client release -r x=
xx to release it, but it<br>&gt; &gt; also sometimes not work.(be stuck)<br=
>&gt; &gt; Then I may lvmlockctl -r to drop vg lockspace, but it still may =
stuck,<br>&gt; &gt; and I&#39;m io is ok when it stuck<br>&gt; &gt;<br>&gt;=
 &gt; This usually happens on multipath storage, I consider multipath will<=
br>&gt; &gt; queue some io is blamed, but not sure.<br>&gt; &gt;<br>&gt; &g=
t; Any idea?<br>&gt;<br>&gt; First, you might be able to avoid this issue b=
y doing the check using<br>&gt; something other than an lvm command, or per=
haps and lvm command configured<br>&gt; to avoid taking locks (the --nolock=
ing option in vgs/pvs/lvs).=C2=A0 What&#39;s<br>&gt; appropriate depends on=
 specifically what you want to know from the check.<br>&gt;<div><br></div><=
div>This is how I use sanlock and lvmlockd:</div><div><br></div><div><div><=
font face=3D"monospace, monospace"><br></font></div><div><font face=3D"mono=
space, monospace">=C2=A0+------------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +---------------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+------=
----------+</font></div><div><font face=3D"monospace, monospace">=C2=A0|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></div><div><font f=
ace=3D"monospace, monospace">=C2=A0|=C2=A0 =C2=A0 =C2=A0sanlock=C2=A0 =C2=
=A0 =C2=A0 &lt;------------&gt;=C2=A0 =C2=A0 =C2=A0lvmlockd=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &lt;---------+=C2=A0 lvm commands=C2=A0 |</font></div><div><f=
ont face=3D"monospace, monospace">=C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |</font></div><div><font face=3D"monospace, monospace"=
>=C2=A0+------------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +-----=
----------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+----------------+</font=
></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0=
 =C2=A0|</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0=
 =C2=A0 =C2=A0|</font></div><div><font face=3D"monospace, monospace">=C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 +------------------+=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0+-----------------+=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=
------------+</font></div><div><font face=3D"monospace, monospace">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></div><div=
><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0+------&gt;=
=C2=A0 =C2=A0 =C2=A0multipath=C2=A0 =C2=A0 &lt;- - -=C2=A0 -=C2=A0 -=C2=A0 =
-=C2=A0 =C2=A0-=C2=A0 -=C2=A0 -=C2=A0 -=C2=A0 - |=C2=A0 lvm volumes=C2=A0 =
=C2=A0 &lt;--------+=C2=A0 =C2=A0 qemu=C2=A0 =C2=A0 |</font></div><div><fon=
t face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |</font></div><div><font face=3D"monospace, monospace"=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------------------+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+-----------------+=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 +------------+</font></div><div><font face=3D"monospace, monospace">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></di=
v><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></div><div><font face=
=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></div><div><font face=3D"monospace, mon=
ospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |</font></div><div><font face=3D"monospace, monospace">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------------------+</font></div>=
<div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0san storage=C2=A0 =C2=A0 |=
</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |</font></div><div><font face=3D"monospace, monospace">=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |</font></div><div><font face=3D"mon=
ospace, monospace">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +------=
------------+</font></div></div><div><br></div><div>As I mentioned in first=
 mail, sometimes I found lvm commands failed with &quot;sanlock lease stora=
ge failure&quot;, I guess this is because lvmlockd kill_vg has triggered,</=
div><div>as the manual says, it should deactivate volumes and drop lockspac=
e as quick as possible, but I can&#39;t get a proper alert from a program w=
ay.</div><div><br></div><div>TTY can get a message, but it&#39;s not a good=
 way to listen or monitor, so I run vgck periodically and parse its stdout =
and stderr, once &quot;sanlock lease storage failure&quot; or=C2=A0</div><d=
iv>something unusual happens, an alert will be triggered and I&#39;ll do so=
me check(I hope all this process can be automatically).</div><div><br></div=
><div>If do not require lock(pvs/lvs/vgs --nolocking), these error wont be =
noticed, since lots of san storage configure multipath as queue io as far a=
s possible(multipath -t | grep queue_if_no_path),=C2=A0</div><div>get lvm e=
rror at early is pretty difficult, vgck and parse its output a way with les=
s load(it will get a shared vglk) and better efficiency(it should take less=
 than 0.1s in usual) after various=C2=A0tried.</div><div><br></div><div>As =
you mentioned, I&#39;ll extend io timeout to avoid storage jitter, and I be=
lieve it also resolves some problems from multipath queue io.</div><div><br=
></div><div><br>&gt; I still haven&#39;t fixed the issue you found earlier,=
 which sounds like it<br>&gt; could be the same or related to what you&#39;=
re describing now.<br>&gt; <a href=3D"https://www.redhat.com/archives/linux=
-lvm/2018-July/msg00011.html">https://www.redhat.com/archives/linux-lvm/201=
8-July/msg00011.html</a><br>&gt;</div><div>&gt; As for manually cleaning up=
 a stray lock using sanlock client, there may<br>&gt; be some limits on the=
 situations that works in, I don&#39;t recall off hand.<br>&gt; You should =
try using the -p &lt;pid&gt; option with client release to match the<br>&gt=
; pid of lvmlockd.</div><div><br></div><div><br></div><div>yes I added -p t=
o release lock, and I wanna summary up an &quot;Emergency Procedures&quot; =
for deal with different storage failure, for me it&#39;s still unclear now.=
</div><div>I&#39;ll do more experiment after fix these annoying storage fai=
ls, then make this summary</div><div><br></div><div><br>&gt; Configuring mu=
ltipath to fail more quickly instead of queueing might give<br>&gt; you a b=
etter chance of cleaning things up.<br>&gt;<br>&gt; Dave<br>&gt;<br></div><=
div><br></div><div>yeah, I believe multipath queue io should be blamed, I&#=
39;m=C2=A0negotiating with storage vendor since they think multipath config=
 is right :-(</div><div><br></div><div><br></div><div>Thank you for your pa=
tience!</div><div><br></div><div>Damon</div></div></div></div></div></div><=
/div></div></div></div></div></div></div></div>

--000000000000967c0d0576e5db2e--
