Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARGtwiF032378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 11:55:58 -0500
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mx1.redhat.com (Postfix) with ESMTPS id 8BB2D5BA1F
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 16:55:57 +0000 (UTC)
Received: by wmec201 with SMTP id c201so77861539wme.0
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 08:55:56 -0800 (PST)
MIME-Version: 1.0
From: Young Yang <afe.young@gmail.com>
Date: Thu, 26 Nov 2015 16:20:33 +0800
Message-ID: <CAKPOGq6dD_UXaP5EoTfuiv3vJ+den4_4VpvhEQcX3-6LNQd7ZQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113c9e6cdcb18f05256d4007
Subject: [linux-lvm] Questions about residual data in LVM after delete the
	Logic Volume
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

--001a113c9e6cdcb18f05256d4007
Content-Type: text/plain; charset=UTF-8

Hi

This is my LVM version

stack@DevStackOSDomU:~$ sudo lvm version
>   LVM version:     2.02.98(2) (2012-10-15)
>   Library version: 1.02.77 (2012-10-15)
>   Driver version:  4.27.0


I created a 1GB physical volume with a block device setup by losetup,  and
added it to my volume group.
Then I created a 1GB logic volume  A  and  I can find my block device
here /dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac1f-23e3e825e576.

I mount this Logic volume and write some data containing a string PATTERN
 into it.
Then I grep the block device with  `sudo grep -zbl PATTERN
/dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac1f-23e3e825e576`
 and   It really have found the string  PATTERN

Then I deleted this 1GB logic volume A  and created another  1GB logic
volume.B.
I expected  the residual data containing string PATTERN should appear in
the 1GB logic volume B, because they both used all the same 1GB physical
volume.
However, when I grep the  1GB logic volume B's block device directly,  it
return nothing.



*So Here comes the quesions,*

Does LVM have any mechanism to prevent the residual data in the previously
deleted logical volume from  appearing in the new logical volume?
If there is any, how can I config it?  How  does it work , where can I find
the related  docs?




Thanks in advances  :)

--001a113c9e6cdcb18f05256d4007
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br></div><div>Hi</div><div><br></div><div>This is my=
 LVM version</div><div><br></div><div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex">stack@DevStackOSDomU=
:~$ sudo lvm version<br>=C2=A0 LVM version: =C2=A0 =C2=A0 2.02.98(2) (2012-=
10-15)<br>=C2=A0 Library version: 1.02.77 (2012-10-15)<br>=C2=A0 Driver ver=
sion: =C2=A04.27.0</blockquote></div><div><br></div><div>I created a 1GB ph=
ysical volume with a block device setup by losetup, =C2=A0and added it to m=
y volume group.</div><div>Then I created a 1GB logic volume =C2=A0A =C2=A0a=
nd =C2=A0I can find my block device here=C2=A0/dev/stack-volumes-lvmdriver-=
1/volume-e31af77b-1bf4-43e3-ac1f-23e3e825e576.=C2=A0</div><div><br></div><d=
iv>I mount this Logic volume and write some data containing a string PATTER=
N =C2=A0into it.</div><div>Then I grep the block device with =C2=A0`sudo gr=
ep -zbl PATTERN /dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac=
1f-23e3e825e576` =C2=A0and =C2=A0 It really have found the string =C2=A0PAT=
TERN</div><div><br></div><div>Then I deleted this 1GB logic volume A =C2=A0=
and created another =C2=A01GB logic volume.B.</div><div>I expected =C2=A0th=
e residual data containing string PATTERN should appear in the 1GB logic vo=
lume B, because they both used all the same 1GB physical volume.</div><div>=
However, when I grep the =C2=A01GB logic volume B&#39;s block device direct=
ly, =C2=A0it return nothing.<br><br></div><div><br></div><div><br></div><di=
v><b>So Here comes the quesions,</b></div><div><br></div><div>Does LVM have=
 any mechanism to prevent the residual data in the previously deleted logic=
al volume from =C2=A0appearing in the new logical volume? =C2=A0</div><div>=
If there is any, how can I config it?=C2=A0 How =C2=A0does it work , where =
can I find the related =C2=A0docs?=C2=A0</div><div><br></div><div><br></div=
><div><br></div><div><br></div><div>Thanks in advances =C2=A0:)</div><div><=
br></div><div><br></div><div><br></div></div>

--001a113c9e6cdcb18f05256d4007--
