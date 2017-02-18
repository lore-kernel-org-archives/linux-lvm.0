Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D4292D5D3
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 16:55:48 +0000 (UTC)
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AEB683F44
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 16:55:46 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u63so7433192wmu.2
	for <linux-lvm@redhat.com>; Sat, 18 Feb 2017 08:55:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1440710475.214.1487405521405.JavaMail.zimbra@karlsbakk.net>
References: <324484744.226.1486803542791.JavaMail.zimbra@karlsbakk.net>
	<1269016789.1015.1487269373950.JavaMail.zimbra@karlsbakk.net>
	<58A64774.10004@tlinx.org>
	<2118934913.869.1487344329807.JavaMail.zimbra@karlsbakk.net>
	<58A78089.7020202@tlinx.org>
	<1440710475.214.1487405521405.JavaMail.zimbra@karlsbakk.net>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Sat, 18 Feb 2017 11:55:43 -0500
Message-ID: <CALm7yL1chR1jAj70AXLiLHG4tuJpx1qadPFXcVH3XaYDo7RSVQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a114431e6ac1f290548d0e6f1
Subject: Re: [linux-lvm] pvmove speed
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

--001a114431e6ac1f290548d0e6f1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

One aspect that has confused me in this discussion, that I was hoping
somebody would address...

I believe I have seen slower than expected pvmove times in the past (but I
only rarely do it, so it has never particularly concerned me). When I saw
it, my first assumption was that the pvmove had to be done "carefully" to
ensure that every segment was safely moved in such a way that it was
definitely in one place, or definitely in the other, and not "neither" or
"both". This is particularly important if the volume is mounted, and is
being actively used, which was my case.

Would these safety checks not reduce overall performance? Sure, it would
transfer one segment at full speed, but then it might pause to do some
book-keeping, making sure to fully synch the data and metadata out to both
physical volumes and ensure that it was still crash-safe?

For SAN speeds - I don't think LVM has ever been proven to be a bottleneck
for me. On our new OpenStack cluster, I am seeing 550+ MByte/s  with iSCSI
backed disks, and 700+ MByte/s with NFS backed disks (with read and write
cached disabled). I don't even look at LVM as a cause of concern here as
there is usually something else at play. In fact, on the same OpenStack
cluster, I am using LVM on NVMe drives, with an XFS LV to back the QCOW2
images, and I can get 2,000+ MByte/s sustained with this setup. Again, LVM
isn't even a performance consideration for me.


On Sat, Feb 18, 2017 at 3:12 AM, Roy Sigurd Karlsbakk <roy@karlsbakk.net>
wrote:

> >    200-500... impressive for a SAN... but considering the bandwidth
> > you have to the box (4x1+10), I'd hope for at least 200 (what I get
> > w/just a 10)... so must be some parallel TCP channels there... he..
> > What showed those speeds?  I'm _guessing_, but its likely that pvmove
> > is single threaded.  So could be related to the I/O transfer size as
> > @pattonme was touching on, since multi-threaded I/O can slow things
> > down for local I/O when local I/O is in the .5-1GBps and higher range.
>
> Well, it=E2=80=99s a Compellent thing with net storage of around 350TiB, =
of which
> around 20 is on SSDs, so really, it should be good. Tiering is turned off
> during migration of this data, though (that is, we=E2=80=99re migrating t=
he data
> directly to a low tier, since it=E2=80=99s 40TiB worth of archives).
>
> >    Curious -- do you know your network's cards' MTU size?
> > I know that even w/1Gb cards I got 2-4X speed improvement over
> > standard 1500 packets (run 9000/9014 byte MTU's over local net).
>
> Everything=E2=80=99s using jumboframes (9000) on the SAN (storage network=
), and
> it=E2=80=99s a dedicated network with its own switches and copper/fiber. =
The rest
> of the system works well (at least the Compellent things, EqualLogic has =
a
> bad nervous breakdown on its way to the cemetery, but that=E2=80=99s anot=
her story.
> The Exchange servers running off it, gave us around 400MB/s (that is,
> wirespeed) last backup. That wasn=E2=80=99t raw i/o from vmware, this is,=
 but then
> again, I should at least be able to sustain a gigabit link (the EQL stora=
ge
> is hardly in use anymore, perhaps that=E2=80=99s why it=E2=80=99s depress=
ed), and as shown,
> I=E2=80=99m limited to around half of that.
>
> Vennlig hilsen / Best regards
>
> roy
> --
> Roy Sigurd Karlsbakk
> (+47) 98013356
> http://blogg.karlsbakk.net/
> GPG Public key: http://karlsbakk.net/roysigurdkarlsbakk.pubkey.txt
> --
> Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico
> fricta, ac quassum lactatum coagulatum crassum. Quod me nutrit me destrui=
t.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/




--=20
Mark Mielke <mark.mielke@gmail.com>

--001a114431e6ac1f290548d0e6f1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">One aspect that has confused me in this discussion, that I=
 was hoping somebody would address...<div><br></div><div>I believe I have s=
een slower than expected pvmove times in the past (but I only rarely do it,=
 so it has never particularly concerned me). When I saw it, my first assump=
tion was that the pvmove had to be done &quot;carefully&quot; to ensure tha=
t every segment was safely moved in such a way that it was definitely in on=
e place, or definitely in the other, and not &quot;neither&quot; or &quot;b=
oth&quot;. This is particularly important if the volume is mounted, and is =
being actively used, which was my case.</div><div><br></div><div>Would thes=
e safety checks not reduce overall performance? Sure, it would transfer one=
 segment at full speed, but then it might pause to do some book-keeping, ma=
king sure to fully synch the data and metadata out to both physical volumes=
 and ensure that it was still crash-safe?</div><div><br></div><div>For SAN =
speeds - I don&#39;t think LVM has ever been proven to be a bottleneck for =
me. On our new OpenStack cluster, I am seeing 550+ MByte/s =C2=A0with iSCSI=
 backed disks, and 700+ MByte/s with NFS backed disks (with read and write =
cached disabled). I don&#39;t even look at LVM as a cause of concern here a=
s there is usually something else at play. In fact, on the same OpenStack c=
luster, I am using LVM on NVMe drives, with an XFS LV to back the QCOW2 ima=
ges, and I can get 2,000+ MByte/s sustained with this setup. Again, LVM isn=
&#39;t even a performance consideration for me.</div><div><br></div></div><=
div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sat, Feb 18, 20=
17 at 3:12 AM, Roy Sigurd Karlsbakk <span dir=3D"ltr">&lt;<a href=3D"mailto=
:roy@karlsbakk.net" target=3D"_blank">roy@karlsbakk.net</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">&gt;=C2=A0 =C2=A0 200-500... impressiv=
e for a SAN... but considering the bandwidth<br>
&gt; you have to the box (4x1+10), I&#39;d hope for at least 200 (what I ge=
t<br>
&gt; w/just a 10)... so must be some parallel TCP channels there... he..<br=
>
&gt; What showed those speeds?=C2=A0 I&#39;m _guessing_, but its likely tha=
t pvmove<br>
&gt; is single threaded.=C2=A0 So could be related to the I/O transfer size=
 as<br>
&gt; @pattonme was touching on, since multi-threaded I/O can slow things<br=
>
&gt; down for local I/O when local I/O is in the .5-1GBps and higher range.=
<br>
<br>
Well, it=E2=80=99s a Compellent thing with net storage of around 350TiB, of=
 which around 20 is on SSDs, so really, it should be good. Tiering is turne=
d off during migration of this data, though (that is, we=E2=80=99re migrati=
ng the data directly to a low tier, since it=E2=80=99s 40TiB worth of archi=
ves).<br>
<br>
&gt;=C2=A0 =C2=A0 Curious -- do you know your network&#39;s cards&#39; MTU =
size?<br>
&gt; I know that even w/1Gb cards I got 2-4X speed improvement over<br>
&gt; standard 1500 packets (run 9000/9014 byte MTU&#39;s over local net).<b=
r>
<br>
Everything=E2=80=99s using jumboframes (9000) on the SAN (storage network),=
 and it=E2=80=99s a dedicated network with its own switches and copper/fibe=
r. The rest of the system works well (at least the Compellent things, Equal=
Logic has a bad nervous breakdown on its way to the cemetery, but that=E2=
=80=99s another story. The Exchange servers running off it, gave us around =
400MB/s (that is, wirespeed) last backup. That wasn=E2=80=99t raw i/o from =
vmware, this is, but then again, I should at least be able to sustain a gig=
abit link (the EQL storage is hardly in use anymore, perhaps that=E2=80=99s=
 why it=E2=80=99s depressed), and as shown, I=E2=80=99m limited to around h=
alf of that.<br>
<br>
Vennlig hilsen / Best regards<br>
<br>
roy<br>
--<br>
Roy Sigurd Karlsbakk<br>
(+47) 98013356<br>
<a href=3D"http://blogg.karlsbakk.net/" rel=3D"noreferrer" target=3D"_blank=
">http://blogg.karlsbakk.net/</a><br>
GPG Public key: <a href=3D"http://karlsbakk.net/roysigurdkarlsbakk.pubkey.t=
xt" rel=3D"noreferrer" target=3D"_blank">http://karlsbakk.net/<wbr>roysigur=
dkarlsbakk.pubkey.txt</a><br>
--<br>
Da mihi sis bubulae frustrum assae, solana tuberosa in modo Gallico fricta,=
 ac quassum lactatum coagulatum crassum. Quod me nutrit me destruit.<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/<wbr>mailman/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-<wbr>HOWTO/</a></bl=
ockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=3D"gm=
ail_signature" data-smartmail=3D"gmail_signature">Mark Mielke &lt;<a href=
=3D"mailto:mark.mielke@gmail.com" target=3D"_blank">mark.mielke@gmail.com</=
a>&gt;<br><br></div>
</div>

--001a114431e6ac1f290548d0e6f1--
