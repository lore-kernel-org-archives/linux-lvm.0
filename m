Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r64BhfxW031213
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 07:43:41 -0400
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r64BhdqB008560
	for <linux-lvm@redhat.com>; Thu, 4 Jul 2013 07:43:40 -0400
Received: by mail-lb0-f171.google.com with SMTP id 13so1126618lba.2
	for <linux-lvm@redhat.com>; Thu, 04 Jul 2013 04:43:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130704111817.GA3344@agk-dp.fab.redhat.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<20130704111817.GA3344@agk-dp.fab.redhat.com>
Date: Thu, 4 Jul 2013 13:43:39 +0200
Message-ID: <CAFrGbuVF_F3y0CMazywv8Y2pavYXjUXJk7_3DE_X6-6hZsNf1w@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=14dae9473abfdb24e404e0ae1699
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
 LVM complains "there is no suitable space"
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
To: Alessandro MACUZ <alessandro.macuz@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

--14dae9473abfdb24e404e0ae1699
Content-Type: text/plain; charset=ISO-8859-1

2013/7/4 Alasdair G Kergon <agk@redhat.com>

> On Tue, Jul 02, 2013 at 02:14:01AM +0200, Alessandro MACUZ wrote:
> > Why "*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/root
> > /dev/sdb1*" doesn't work whereas
> > "*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*" does? The space to be
> > allocated differs by just one PE.
>
> Exactly which version of lvm2 are you using?
> Is it 2.02.97 or later?  If not, you should try a newer version.
> To debug, you then need to run the command with -vvvv added to the command
> line.  Post a link to this output if you want others to look.


On Knoppix

root@Microknoppix:/home/knoppix# lvm version
  LVM version:     2.02.95(2) (2012-03-06)
  Library version: 1.02.74 (2012-03-06)
  Driver version:  4.23.0

On Debian Live CD
  LVM version:     2.02.95(2) (2012-03-06)
  Library version: 1.02.74 (2012-03-06)
  Driver version:  4.22.0

The usage of LVM instead of MD raid was not chosen by me and LVM is a
temporary choice  to move VMdisks from local to the NAS (iSCSI)

I'll post the detailed output as I was asked.
I wonder if the problem is only with the creation of the second leg of the
volume and the mirrored mirror_logs. If it so I guess I can use whatever
distro that has LVM version more recent then 2.02.97 and then handle it
with less recent version...

Alex

--14dae9473abfdb24e404e0ae1699
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2013/7/4 Alasdair G Kergon <span dir=3D"ltr">&lt;<a href=3D"mailto:agk@redh=
at.com" target=3D"_blank">agk@redhat.com</a>&gt;</span><br><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">
On Tue, Jul 02, 2013 at 02:14:01AM +0200, Alessandro MACUZ wrote:<br>
&gt; Why &quot;*lvconvert -i 5 -m1 --mirrorlog mirrored /dev/lvgrptstnlvm/r=
oot<br>
&gt; /dev/sdb1*&quot; doesn&#39;t work whereas<br>
&gt; &quot;*lvconvert -m1 /dev/lvgrptstnlvm/root /dev/sdb1*&quot; does? The=
 space to be<br>
<div class=3D"im">&gt; allocated differs by just one PE.<br>
<br>
</div>Exactly which version of lvm2 are you using?<br>
Is it 2.02.97 or later? =A0If not, you should try a newer version.<br>
To debug, you then need to run the command with -vvvv added to the command<=
br>
line. =A0Post a link to this output if you want others to look.</blockquote=
><div><br></div><div>On Knoppix</div><div><br></div><div>root@Microknoppix:=
/home/knoppix# lvm version</div><div>=A0 LVM version: =A0 =A0 2.02.95(2) (2=
012-03-06)</div>
<div>=A0 Library version: 1.02.74 (2012-03-06)</div><div>=A0 Driver version=
: =A04.23.0</div><div><br></div><div>On Debian Live CD</div><div><div>=A0 L=
VM version: =A0 =A0 2.02.95(2) (2012-03-06)</div><div>=A0 Library version: =
1.02.74 (2012-03-06)</div>
<div>=A0 Driver version: =A04.22.0</div></div><div><br></div><div>The usage=
 of LVM instead of MD raid was not chosen by me and LVM is a temporary choi=
ce =A0to move VMdisks from local to the NAS (iSCSI)</div><div><br></div><di=
v>
I&#39;ll post the detailed output as I was asked.</div><div>I wonder if the=
 problem is only with the creation of the second leg of the volume and the =
mirrored mirror_logs. If it so I guess I can use whatever distro that has L=
VM version more recent then=A0<span style=3D"background-color:rgb(255,255,2=
55);color:rgb(34,34,34);font-family:arial,sans-serif;font-size:13px">2.02.9=
7 and then handle it with less recent version...</span></div>
<div><span style=3D"background-color:rgb(255,255,255);color:rgb(34,34,34);f=
ont-family:arial,sans-serif;font-size:13px"><br></span></div><div><font col=
or=3D"#222222" face=3D"arial, sans-serif">Alex</font></div><div><br></div><=
div>
<br></div></div>

--14dae9473abfdb24e404e0ae1699--
