Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0RF4tNQ007961
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 10:04:55 -0500
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0RF4noP006360
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 10:04:50 -0500
Received: by mail-ob0-f182.google.com with SMTP id gq1so13778639obb.13
	for <linux-lvm@redhat.com>; Tue, 27 Jan 2015 07:04:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPWkaSV-o0Tf=1yopWbrmKLuEnS6qbp_pEhikgean7M5vitr4w@mail.gmail.com>
References: <CAPWkaSVZEeL6yP+3ax2Z0Z7iMJQezEGUvVOXZ8PUrA7ytEeA=w@mail.gmail.com>
	<20150119222134.GA17599@agk-dp.fab.redhat.com>
	<CAPWkaSV-o0Tf=1yopWbrmKLuEnS6qbp_pEhikgean7M5vitr4w@mail.gmail.com>
Date: Tue, 27 Jan 2015 13:04:49 -0200
Message-ID: <CAPcfVV-KGCWda4fKdtVdo=xGQftCU8kURoqR6PDuLKz15wpKqg@mail.gmail.com>
From: Marcos Dutra <macdutra@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b47291284f03b050da3936a
Subject: Re: [linux-lvm] Slow response from lvs and vgs commands
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--047d7b47291284f03b050da3936a
Content-Type: text/plain; charset=UTF-8

Hi everybody,

I have the same problem when I use vgs command, so I used vgs -vvv command
and it was slow when the output command showed me this "Archiving volume
group "vgoracle" metadata (seqno 3)", I have many vgs with this status,
Archiving volume group xxx, Is it normal? What can I do to solve this?

Thanks

Marcos Dutra

2015-01-19 20:58 GMT-02:00 John Griffith <john.griffith8@gmail.com>:

> On Mon, Jan 19, 2015 at 3:21 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> > On Mon, Jan 19, 2015 at 02:05:39PM -0700, John Griffith wrote:
> >> I'm wondering if there's something I should be looking at more closely
> >> to debug this, or if there's a way to filter the lvs and vgs commands
> >> to make them more efficient?
> >
> > Add -vvvv to the command lines and see if that helps you to see
> > where the slowness is.
> >
> > Alasdair
> >
>
> Thanks Alasdair,
>
> Turns out I got a great suggestion to wrap this up in strace via the
> IRC channel.  Turns out I'm scanning on some devices that are being
> plugged in and out of the system and the failure is due to the fact
> that the raw device gets ripped out from under the vgscan.
>
> Going to try limiting the devices I interact with via lvm.conf, I
> think that will address the issue.
>
> Thanks,
> John
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7b47291284f03b050da3936a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everybody,<div><br></div><div>I have the same problem w=
hen I use vgs command, so I used vgs -vvv command and it was slow when the =
output command showed me this &quot;Archiving volume group &quot;vgoracle&q=
uot; metadata (seqno 3)&quot;, I have many vgs with this status, Archiving =
volume group xxx, Is it normal? What can I do to solve this?</div><div><br>=
</div><div>Thanks</div><div><br></div><div>Marcos Dutra</div></div><div cla=
ss=3D"gmail_extra"><br><div class=3D"gmail_quote">2015-01-19 20:58 GMT-02:0=
0 John Griffith <span dir=3D"ltr">&lt;<a href=3D"mailto:john.griffith8@gmai=
l.com" target=3D"_blank">john.griffith8@gmail.com</a>&gt;</span>:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><span class=3D"">On Mon, Jan 19, 2015 at 3:21 PM, =
Alasdair G Kergon &lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</a>&=
gt; wrote:<br>
&gt; On Mon, Jan 19, 2015 at 02:05:39PM -0700, John Griffith wrote:<br>
&gt;&gt; I&#39;m wondering if there&#39;s something I should be looking at =
more closely<br>
&gt;&gt; to debug this, or if there&#39;s a way to filter the lvs and vgs c=
ommands<br>
&gt;&gt; to make them more efficient?<br>
&gt;<br>
&gt; Add -vvvv to the command lines and see if that helps you to see<br>
&gt; where the slowness is.<br>
&gt;<br>
&gt; Alasdair<br>
&gt;<br>
<br>
</span>Thanks Alasdair,<br>
<br>
Turns out I got a great suggestion to wrap this up in strace via the<br>
IRC channel.=C2=A0 Turns out I&#39;m scanning on some devices that are bein=
g<br>
plugged in and out of the system and the failure is due to the fact<br>
that the raw device gets ripped out from under the vgscan.<br>
<br>
Going to try limiting the devices I interact with via lvm.conf, I<br>
think that will address the issue.<br>
<br>
Thanks,<br>
John<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br></div>

--047d7b47291284f03b050da3936a--
