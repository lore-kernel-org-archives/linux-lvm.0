Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAS3uOiD011790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 22:56:24 -0500
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mx1.redhat.com (Postfix) with ESMTPS id 0D14AC0B7AB2
	for <linux-lvm@redhat.com>; Sat, 28 Nov 2015 03:56:23 +0000 (UTC)
Received: by wmuu63 with SMTP id u63so72946825wmu.0
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 19:56:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAKPOGq6dD_UXaP5EoTfuiv3vJ+den4_4VpvhEQcX3-6LNQd7ZQ@mail.gmail.com>
References: <CAKPOGq6dD_UXaP5EoTfuiv3vJ+den4_4VpvhEQcX3-6LNQd7ZQ@mail.gmail.com>
From: Young Yang <afe.young@gmail.com>
Date: Fri, 27 Nov 2015 20:28:32 +0800
Message-ID: <CAKPOGq4moLpBysQ=PenzGj0Xt98eV5ewTgynnfqJJRhVOYHdcw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e0102e3da86e4e6052584d5be
Subject: [linux-lvm] Fwd: Questions about residual data in LVM after delete
	the Logic Volume
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

--089e0102e3da86e4e6052584d5be
Content-Type: text/plain; charset=UTF-8

---------- Forwarded message ----------
From: Young Yang <afe.young@gmail.com>
Date: Thu, Nov 26, 2015 at 4:20 PM
Subject: Questions about residual data in LVM after delete the Logic Volume
To: linux-lvm@redhat.com



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

--089e0102e3da86e4e6052584d5be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote">---------- Forwarded messag=
e ----------<br>From: <b class=3D"gmail_sendername">Young Yang</b> <span di=
r=3D"ltr">&lt;<a href=3D"mailto:afe.young@gmail.com">afe.young@gmail.com</a=
>&gt;</span><br>Date: Thu, Nov 26, 2015 at 4:20 PM<br>Subject: Questions ab=
out residual data in LVM after delete the Logic Volume<br>To: <a href=3D"ma=
ilto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><br><br><div dir=3D"=
ltr"><div><br></div><div>Hi</div><div><br></div><div>This is my LVM version=
</div><div><br></div><div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex">stack@DevStackOSDomU:~$ sudo lvm=
 version<br>=C2=A0 LVM version: =C2=A0 =C2=A0 2.02.98(2) (2012-10-15)<br>=
=C2=A0 Library version: 1.02.77 (2012-10-15)<br>=C2=A0 Driver version: =C2=
=A04.27.0</blockquote></div><div><br></div><div>I created a 1GB physical vo=
lume with a block device setup by losetup, =C2=A0and added it to my volume =
group.</div><div>Then I created a 1GB logic volume =C2=A0A =C2=A0and =C2=A0=
I can find my block device here=C2=A0/dev/stack-volumes-lvmdriver-1/volume-=
e31af77b-1bf4-43e3-ac1f-23e3e825e576.=C2=A0</div><div><br></div><div>I moun=
t this Logic volume and write some data containing a string PATTERN =C2=A0i=
nto it.</div><div>Then I grep the block device with =C2=A0`sudo grep -zbl P=
ATTERN /dev/stack-volumes-lvmdriver-1/volume-e31af77b-1bf4-43e3-ac1f-23e3e8=
25e576` =C2=A0and =C2=A0 It really have found the string =C2=A0PATTERN</div=
><div><br></div><div>Then I deleted this 1GB logic volume A =C2=A0and creat=
ed another =C2=A01GB logic volume.B.</div><div>I expected =C2=A0the residua=
l data containing string PATTERN should appear in the 1GB logic volume B, b=
ecause they both used all the same 1GB physical volume.</div><div>However, =
when I grep the =C2=A01GB logic volume B&#39;s block device directly, =C2=
=A0it return nothing.<br><br></div><div><br></div><div><br></div><div><b>So=
 Here comes the quesions,</b></div><div><br></div><div>Does LVM have any me=
chanism to prevent the residual data in the previously deleted logical volu=
me from =C2=A0appearing in the new logical volume? =C2=A0</div><div>If ther=
e is any, how can I config it?=C2=A0 How =C2=A0does it work , where can I f=
ind the related =C2=A0docs?=C2=A0</div><div><br></div><div><br></div><div><=
br></div><div><br></div><div>Thanks in advances =C2=A0:)</div><div><br></di=
v><div><br></div><div><br></div></div>
</div><br></div>

--089e0102e3da86e4e6052584d5be--
