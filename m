Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l98EUW1r000964
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 10:30:32 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.226])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l98EUKcJ029003
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 10:30:20 -0400
Received: by wx-out-0506.google.com with SMTP id t16so1159279wxc
	for <linux-lvm@redhat.com>; Mon, 08 Oct 2007 07:30:20 -0700 (PDT)
Message-ID: <95fec8860710080730u71876ca6y5827c86f8c4294ae@mail.gmail.com>
Date: Mon, 8 Oct 2007 16:30:19 +0200
From: "Guillermo Marraco" <guillermo.marraco@gmail.com>
Subject: Re: [linux-lvm] Problem resizing partition
In-Reply-To: <95fec8860710080711i6436ab36o7e4d32a099a95d25@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_1322_16067432.1191853820052"
References: <95fec8860710080629h773abe69i9f5f367f80e2488f@mail.gmail.com>
	<BAY119-W8033C29888F079BA14B57A5A40@phx.gbl>
	<95fec8860710080711i6436ab36o7e4d32a099a95d25@mail.gmail.com>
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

------=_Part_1322_16067432.1191853820052
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

bad... Gparted does not recognize filesysytem, and can't resize tha
partition...

(I have utilized Puppy Linux Live CD. It have a gparted preinstalled)

On 10/8/07, Guillermo Marraco <guillermo.marraco@gmail.com> wrote:
>
> Thanks for your answer!.
>
> I was unaware that That partition was needed unmounted.
>
> =BFI can unmount the main Linux Partition, start gparted, and then remoun=
t
> it?, or I need a Live CD?
>
> I have the Puppy Linux Live CD, and I have burn the Gparted Live CD. I
> gonna try to use them.
>
>
> On 10/8/07, NTOUGHE GUY-SERGE <ntoughe@hotmail.com> wrote:
>
> >
> > hi,
> > According to your  description you want to decrease a partition, so you
> > 'll need to umount your file system an d change the size, with fdisk or
> > gparted.
> > After that remount your partition.
> >
> >
> > ntoughe@hotmail.com
> >
> >
> >  ------------------------------
> > Date: Mon, 8 Oct 2007 10:29:34 -0300
> > From: guillermo.marraco@gmail.com
> > To: linux-lvm@redhat.com
> > Subject: [linux-lvm] Problem resizing partition
> >
> > Hello. I have recently installed a CentOS 5 Linux distribution. Is a
> > free version of Red Hat Enterprise.
> >
> > I are a Linux Newbie.
> >
> > The Linux installer DVD does not liked the 20 Gb ext3 partition I have
> > created (It was saying than now enough space was available), so I tell =
him
> > to automatically configure the partitions and filesystem.
> >
> > The Installer formatted and created a 32 Mb "boot" partition, and a 20
> > Gb "unknown" partition (as is found By gparted software).
> >
> > I need to reduce this "unknown" partition by 8 Mb, (to avoid writing th=
e
> > last 8 Mb, since is probably that the PC vendor, has utilized this spac=
e to
> > hide information, that windows use to recognizing that is "genuine", (d=
on't
> > bash me about windows, I have not purchased that machine, I are utilizi=
ng
> > that machine to experiment and learn Linux, because I want latter to op=
erate
> > a cluster with that OS, and I can't do experiments on the cluster, like
> > learning to resizing partitions)
> >
> > I have not idea what file system is, and what tools allow to resize tha=
t
> > partition. I Have installed gparted (#yum install gparted), since I was=
 told
> > that is the "Partition Magic" of Linux.
> > but It looks like this file system is rare, because is for cluster
> > designed.
> >
> > Looking on Internet, I have found that probably this system utilizes
> > clvm (no idea), so I have found this mail list, and write for help.
> >
> > can you help me?
> >
> > PD:Please, excuse my bad grammar, I never studied English.
> >
> >
> > ------------------------------
> > Explore the seven wonders of the world Learn more!<http://search.msn.co=
m/results.aspx?q=3D7+wonders+world&mkt=3Den-US&form=3DQBRE>
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>

------=_Part_1322_16067432.1191853820052
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

bad... Gparted does not recognize filesysytem, and can&#39;t resize tha par=
tition...<br><br>(I have utilized Puppy Linux Live CD. It have a gparted pr=
einstalled)<br><br><div><span class=3D"gmail_quote">On 10/8/07, <b class=3D=
"gmail_sendername">
Guillermo Marraco</b> &lt;<a href=3D"mailto:guillermo.marraco@gmail.com">gu=
illermo.marraco@gmail.com</a>&gt; wrote:</span><blockquote class=3D"gmail_q=
uote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0=
pt 0.8ex; padding-left: 1ex;">
Thanks for your answer!.<br><br>I was unaware that That partition was neede=
d unmounted.<br><br>=BFI can unmount the main Linux Partition, start gparte=
d, and then remount it?, or I need a Live CD?<br><br>I have the Puppy Linux=
 Live CD, and I have burn the Gparted Live CD. I gonna try to use them.
<br><br><br><div><div><span class=3D"e" id=3D"q_1157ff5252f1b6f3_1"><span c=
lass=3D"gmail_quote">On 10/8/07, <b class=3D"gmail_sendername">NTOUGHE GUY-=
SERGE</b> &lt;<a href=3D"mailto:ntoughe@hotmail.com" target=3D"_blank" oncl=
ick=3D"return top.js.OpenExtLink(window,event,this)">
ntoughe@hotmail.com</a>&gt; wrote:</span></span></div><blockquote class=3D"=
gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0p=
t 0pt 0pt 0.8ex; padding-left: 1ex;"><div><span class=3D"e" id=3D"q_1157ff5=
252f1b6f3_3">





<div>
<br>hi, <br>
According to your&nbsp; description you want to decrease a partition, so yo=
u &#39;ll need to umount your file system an d change the size, with fdisk =
or gparted.<br>
After that remount your partition.<br><br>
<div><br><a href=3D"mailto:ntoughe@hotmail.com" target=3D"_blank" onclick=
=3D"return top.js.OpenExtLink(window,event,this)">ntoughe@hotmail.com</a></=
div><br><br>
<blockquote>
<hr>
Date: Mon, 8 Oct 2007 10:29:34 -0300<br>From: <a href=3D"mailto:guillermo.m=
arraco@gmail.com" target=3D"_blank" onclick=3D"return top.js.OpenExtLink(wi=
ndow,event,this)">guillermo.marraco@gmail.com</a><br>To: <a href=3D"mailto:=
linux-lvm@redhat.com" target=3D"_blank" onclick=3D"return top.js.OpenExtLin=
k(window,event,this)">

linux-lvm@redhat.com</a><br>Subject: [linux-lvm] Problem resizing partition=
<div><span><br><br>Hello. I have recently installed a CentOS 5 Linux distri=
bution. Is a free version of Red Hat Enterprise.
<br><br>I are a Linux Newbie.<br><br>The Linux installer DVD does not liked=
 the 20 Gb ext3 partition I have created (It was saying than now enough spa=
ce was available), so I tell him to automatically configure the partitions =
and filesystem.=20
<br><br>The Installer formatted and created a 32 Mb &quot;boot&quot; partit=
ion, and a 20 Gb &quot;unknown&quot; partition (as is found By gparted soft=
ware).<br><br>I need to reduce this &quot;unknown&quot; partition by 8 Mb, =
(to avoid writing the last 8 Mb, since is probably that the PC vendor, has =
utilized this space to hide information, that windows use to recognizing th=
at is &quot;genuine&quot;, (don&#39;t bash me about windows, I have not pur=
chased that machine, I are utilizing that machine to experiment and learn L=
inux, because I want latter to operate a cluster with that OS, and I can&#3=
9;t do experiments on the cluster, like learning to resizing partitions)=20
<br><br>I have not idea what file system is, and what tools allow to resize=
 that partition. I Have installed gparted (#yum install gparted), since I w=
as told that is the &quot;Partition Magic&quot; of Linux.<br>but It looks l=
ike this file system is rare, because is for cluster designed.=20
<br><br>Looking on Internet, I have found that probably this system utilize=
s clvm (no idea), so I have found this mail list, and write for help.<br><b=
r>can you help me?<br><br>PD:Please, excuse my bad grammar, I never studied=
 English.=20
<br></span></div></blockquote><br><hr>Explore the seven wonders of the worl=
d <a href=3D"http://search.msn.com/results.aspx?q=3D7+wonders+world&amp;mkt=
=3Den-US&amp;form=3DQBRE" target=3D"_blank" onclick=3D"return top.js.OpenEx=
tLink(window,event,this)">

Learn more!</a></div></span></div>
<br>_______________________________________________<br>linux-lvm mailing li=
st<br><a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank" onclick=3D"=
return top.js.OpenExtLink(window,event,this)">linux-lvm@redhat.com</a><br><=
a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bla=
nk" onclick=3D"return top.js.OpenExtLink(window,event,this)">

https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-T=
O at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank" onclick=
=3D"return top.js.OpenExtLink(window,event,this)">http://tldp.org/HOWTO/LVM=
-HOWTO/
</a><br></blockquote></div><br>
</blockquote></div><br>

------=_Part_1322_16067432.1191853820052--
