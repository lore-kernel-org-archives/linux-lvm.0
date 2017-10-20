MIME-Version: 1.0
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<20171019184916.GB23283@redhat.com>
In-Reply-To: <20171019184916.GB23283@redhat.com>
From: Joe Thornber <joe.thornber@gmail.com>
Date: Fri, 20 Oct 2017 11:07:50 +0000
Message-ID: <CAKBOSnjjfhE4hXt+uP8aaoWJWzYJFpoZrtycz7YwuR4NfRk4Ww@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a114419b06ca111055bf87c62"
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: Mike Snitzer <snitzer@redhat.com>, Oleg Cherkasov <o1e9@member.fsf.org>
Cc: ejt@redhat.com, linux-lvm@redhat.com

--001a114419b06ca111055bf87c62
Content-Type: text/plain; charset="UTF-8"

I can't look at this until Sunday.  But if it's something that only
exhibits in writeback mode rather than writethrough, then I'd guess it's to
do with the list of writeback work that the policy builds.  So check
whether the list is growing endlessly, and check the work object is being
freed once the copy has completed.

On Thu, 19 Oct 2017 at 19:49 Mike Snitzer <snitzer@redhat.com> wrote:

> On Thu, Oct 19 2017 at  1:54pm -0400,
> Oleg Cherkasov <o1e9@member.fsf.org> wrote:
>
> > Hi,
> >
> > Recently I have decided to try out LVM cache feature on one of our
> > Dell NX3100 servers running CentOS 7.4.1708 with 110Tb disk array
> > (hardware RAID5 with H710 and H830 Dell adapters).  Two SSD disks
> > each 256Gb are in hardware RAID1 using H710 adapter with primary and
> > extended partitions so I decided to make ~240Gb LVM cache to see if
> > system I/O may be improved.  The server is running Bareos storage
> > daemon and beside sshd and Dell OpenManage monitoring does not have
> > any other services. Unfortunately testing went not as I expected
> > nonetheless at the end system is up and running with no data
> > corrupted.
> >
> > Initially I have tried the default writethrough mode and after
> > running dd reading test with 250Gb file got system unresponsive for
> > roughly 15min with cache allocation around 50%.  Writing to disks it
> > seems speed up the system however marginally, so around 10% on my
> > tests and I did manage to pull more than 32Tb via backup from
> > different hosts and once system became unresponsive to ssh and icmp
> > requests however for a very short time.
> >
> > I though it may be something with cache mode so switched to
> > writeback via lvconvert and run dd reading test again with 250Gb
> > file however that time everything went completely unexpected.
> > System started to slow responding for simple user interactions like
> > list files and run top. And then became completely unresponsive for
> > about half an hours.  Switching to main console via iLO I saw a lot
> > of OOM messages and kernel tried to survive therefore randomly
> > killed almost all processes.  Eventually I did manage to reboot and
> > immediately uncached the array.
> >
> > My question is about very strange behavior of LVM cache.  Well, I
> > may expect no performance boost or even I/O degradation however I do
> > not expect run out of memory and than OOM kicks in.  That server has
> > only 12Gb RAM however it does run only sshd, bareos SD daemon and
> > OpenManange java based monitoring system so no RAM problems were
> > notices for last few years running with our LVM cache.
> >
> > Any ideas what may be wrong?  I have second NX3200 server with
> > similar hardware setup and it would be switch to FreeBSD 11.1 with
> > ZFS very time soon however I may try to install CentOS 7.4 first and
> > see if the problem may be reproduced.
> >
> > LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.
>
> Your experience is _not_ unique.  It is unfortunate but there would seem
> to be some systemic issues with dm-cache being too resoruce heavy.  Not
> aware of any particular issue(s) yet.
>
> I'm focusing on this now since we've had some internal reports that
> writeback is quite slow (and that tests don't complete).  That IO
> latencies are high.  Etc.
>
> I'll work through it and likely enlist Joe Thornber's help next week.
>
> I'll keep you posted as progress is made though.
>
> Thanks,
> Mike
>

--001a114419b06ca111055bf87c62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can&#39;t look at this until Sunday.=C2=A0 But if it&#39=
;s something that only exhibits in writeback mode rather than writethrough,=
 then I&#39;d guess it&#39;s to do with the list of writeback work that the=
 policy builds.=C2=A0 So check whether the list is growing endlessly, and c=
heck the work object is being freed once the copy has completed.</div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr">On Thu, 19 Oct 2017 at 19:49 Mik=
e Snitzer &lt;<a href=3D"mailto:snitzer@redhat.com">snitzer@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct 19 2017 at=
=C2=A0 1:54pm -0400,<br>
Oleg Cherkasov &lt;<a href=3D"mailto:o1e9@member.fsf.org" target=3D"_blank"=
>o1e9@member.fsf.org</a>&gt; wrote:<br>
<br>
&gt; Hi,<br>
&gt;<br>
&gt; Recently I have decided to try out LVM cache feature on one of our<br>
&gt; Dell NX3100 servers running CentOS 7.4.1708 with 110Tb disk array<br>
&gt; (hardware RAID5 with H710 and H830 Dell adapters).=C2=A0 Two SSD disks=
<br>
&gt; each 256Gb are in hardware RAID1 using H710 adapter with primary and<b=
r>
&gt; extended partitions so I decided to make ~240Gb LVM cache to see if<br=
>
&gt; system I/O may be improved.=C2=A0 The server is running Bareos storage=
<br>
&gt; daemon and beside sshd and Dell OpenManage monitoring does not have<br=
>
&gt; any other services. Unfortunately testing went not as I expected<br>
&gt; nonetheless at the end system is up and running with no data<br>
&gt; corrupted.<br>
&gt;<br>
&gt; Initially I have tried the default writethrough mode and after<br>
&gt; running dd reading test with 250Gb file got system unresponsive for<br=
>
&gt; roughly 15min with cache allocation around 50%.=C2=A0 Writing to disks=
 it<br>
&gt; seems speed up the system however marginally, so around 10% on my<br>
&gt; tests and I did manage to pull more than 32Tb via backup from<br>
&gt; different hosts and once system became unresponsive to ssh and icmp<br=
>
&gt; requests however for a very short time.<br>
&gt;<br>
&gt; I though it may be something with cache mode so switched to<br>
&gt; writeback via lvconvert and run dd reading test again with 250Gb<br>
&gt; file however that time everything went completely unexpected.<br>
&gt; System started to slow responding for simple user interactions like<br=
>
&gt; list files and run top. And then became completely unresponsive for<br=
>
&gt; about half an hours.=C2=A0 Switching to main console via iLO I saw a l=
ot<br>
&gt; of OOM messages and kernel tried to survive therefore randomly<br>
&gt; killed almost all processes.=C2=A0 Eventually I did manage to reboot a=
nd<br>
&gt; immediately uncached the array.<br>
&gt;<br>
&gt; My question is about very strange behavior of LVM cache.=C2=A0 Well, I=
<br>
&gt; may expect no performance boost or even I/O degradation however I do<b=
r>
&gt; not expect run out of memory and than OOM kicks in.=C2=A0 That server =
has<br>
&gt; only 12Gb RAM however it does run only sshd, bareos SD daemon and<br>
&gt; OpenManange java based monitoring system so no RAM problems were<br>
&gt; notices for last few years running with our LVM cache.<br>
&gt;<br>
&gt; Any ideas what may be wrong?=C2=A0 I have second NX3200 server with<br=
>
&gt; similar hardware setup and it would be switch to FreeBSD 11.1 with<br>
&gt; ZFS very time soon however I may try to install CentOS 7.4 first and<b=
r>
&gt; see if the problem may be reproduced.<br>
&gt;<br>
&gt; LVM2 installed is version lvm2-2.02.171-8.el7.x86_64.<br>
<br>
Your experience is _not_ unique.=C2=A0 It is unfortunate but there would se=
em<br>
to be some systemic issues with dm-cache being too resoruce heavy.=C2=A0 No=
t<br>
aware of any particular issue(s) yet.<br>
<br>
I&#39;m focusing on this now since we&#39;ve had some internal reports that=
<br>
writeback is quite slow (and that tests don&#39;t complete).=C2=A0 That IO<=
br>
latencies are high.=C2=A0 Etc.<br>
<br>
I&#39;ll work through it and likely enlist Joe Thornber&#39;s help next wee=
k.<br>
<br>
I&#39;ll keep you posted as progress is made though.<br>
<br>
Thanks,<br>
Mike<br>
</blockquote></div>

--001a114419b06ca111055bf87c62--
