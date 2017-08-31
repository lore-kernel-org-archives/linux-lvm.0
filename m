MIME-Version: 1.0
In-Reply-To: <20170829162340.GB12503@redhat.com>
References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
	<ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
	<20170829162340.GB12503@redhat.com>
From: Kalyana sundaram <kalyanceg@gmail.com>
Date: Thu, 31 Aug 2017 12:02:11 +0530
Message-ID: <CABWX_dqRON_r+NdkUKT7FKjKbqxYG2gE4J=LbMQc6Mxx4O2Dxw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a114c9f8ef02f81055806cdad"
Subject: Re: [linux-lvm] Distributed Locking of LVM
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

--001a114c9f8ef02f81055806cdad
Content-Type: text/plain; charset="UTF-8"

Thanks all people
I understand reboot/fencing is mandatory
I hope the visibility might be better in external locking tool like redis
With lvmlockd I find no deb available for ubuntu, and documentations for
clvm to handle an issue is difficult to find
Could somebody redirect me for a good documentation on clvm?
Let me compile lvmlockd and give it a shot

On Tue, Aug 29, 2017 at 9:53 PM, David Teigland <teigland@redhat.com> wrote:

> On Tue, Aug 29, 2017 at 11:25:19AM +0200, Zdenek Kabelac wrote:
> > Dne 28.8.2017 v 14:41 Kalyana sundaram napsal(a):
> > > We have a shared iscsi disk at all our boxes, with one vg. We are using
> > > clvm to manage locks to create extend activate delete list.
> > > CLVM is tedious to manage especially especially due to reboot if
> locking
> > > is struck somewhere. Instead we are thinking of modifying
> file_locking.c
> > > to get lock with distributed store like zookeeper or redis and on
> > > success run the above command, on failure backoff and try again
> > > The external ocking code will sit at _file_lock_resource, case LCK_VG.
> > > Do you think its risky. Is there some other way people handle it?
> > >
> >
> > Hi
> >
> > Have you considered  usage of 'lvmlockd' and it's sanlock interface
> > (where locks are maintained on shared storage device).
>
> And lvmlockd can use different lock managers.  Currently it supports
> sanlock (where the locks are kept in the VG's storage and networking is
> not used), or the dlm (which uses the network and requires corosync).  You
> also could try adding another lock manager option to lvmlockd.
>
> See here for more info:
> http://man7.org/linux/man-pages/man8/lvmlockd.8.html
>
> I think people will find lvmlockd works much better than clvm.
> https://www.redhat.com/archives/linux-lvm/2016-November/msg00022.html
>
>


-- 
Kalyanasundaram
http://blogs.eskratch.com/
https://github.com/kalyanceg/

--001a114c9f8ef02f81055806cdad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks all people<br>I understand reboot/fencing is mandat=
ory=C2=A0<br>I hope the visibility might be better in external locking tool=
 like redis<div>With lvmlockd I find no deb available for ubuntu, and docum=
entations for clvm to handle an issue is difficult to find</div><div>Could =
somebody redirect me for a good documentation on clvm?<br>Let me compile lv=
mlockd and give it a shot<br><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Tue, Aug 29, 2017 at 9:53 PM, David Teigland <span dir=3D"lt=
r">&lt;<a href=3D"mailto:teigland@redhat.com" target=3D"_blank">teigland@re=
dhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Tue, Aug 29, 2017 at 11:25:19AM +0200, Zdenek Kabelac wrote:<br=
>
&gt; Dne 28.8.2017 v 14:41 Kalyana sundaram napsal(a):<br>
&gt; &gt; We have a shared iscsi disk at all our boxes, with one vg. We are=
 using<br>
&gt; &gt; clvm to manage locks to create extend activate delete list.<br>
&gt; &gt; CLVM is tedious to manage especially especially due to reboot if =
locking<br>
&gt; &gt; is struck somewhere. Instead we are thinking of modifying file_lo=
cking.c<br>
&gt; &gt; to get lock with distributed store like zookeeper or redis and on=
<br>
&gt; &gt; success run the above command, on failure backoff and try again<b=
r>
&gt; &gt; The external ocking code will sit at _file_lock_resource, case LC=
K_VG.<br>
&gt; &gt; Do you think its risky. Is there some other way people handle it?=
<br>
&gt; &gt;<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; Have you considered=C2=A0 usage of &#39;lvmlockd&#39; and it&#39;s san=
lock interface<br>
&gt; (where locks are maintained on shared storage device).<br>
<br>
</span>And lvmlockd can use different lock managers.=C2=A0 Currently it sup=
ports<br>
sanlock (where the locks are kept in the VG&#39;s storage and networking is=
<br>
not used), or the dlm (which uses the network and requires corosync).=C2=A0=
 You<br>
also could try adding another lock manager option to lvmlockd.<br>
<br>
See here for more info:<br>
<a href=3D"http://man7.org/linux/man-pages/man8/lvmlockd.8.html" rel=3D"nor=
eferrer" target=3D"_blank">http://man7.org/linux/man-<wbr>pages/man8/lvmloc=
kd.8.html</a><br>
<br>
I think people will find lvmlockd works much better than clvm.<br>
<a href=3D"https://www.redhat.com/archives/linux-lvm/2016-November/msg00022=
.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/<wbr>arc=
hives/linux-lvm/2016-<wbr>November/msg00022.html</a><br>
<br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Kalyanasundaram<br>=
<a href=3D"http://blogs.eskratch.com/" target=3D"_blank">http://blogs.eskra=
tch.com/</a><div><a href=3D"https://github.com/kalyanceg/" target=3D"_blank=
">https://github.com/kalyanceg/</a><br></div></div>
</div></div></div>

--001a114c9f8ef02f81055806cdad--
