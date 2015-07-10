Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6A9jQAP008770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 05:45:26 -0400
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mx1.redhat.com (Postfix) with ESMTPS id 26851347DBE
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 09:45:26 +0000 (UTC)
Received: by oiab3 with SMTP id b3so89509408oia.1
	for <linux-lvm@redhat.com>; Fri, 10 Jul 2015 02:45:24 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 10 Jul 2015 12:45:24 +0300
Message-ID: <CAK9_OPrqjkfNhxtRUT8V6nuqxfB0jrLtRmipB0Q8LpNbxguAuw@mail.gmail.com>
From: Angelo Moreschini <mrangelo.fedora@gmail.com>
Content-Type: multipart/alternative; boundary=089e01537a122c63ad051a823b1c
Subject: [linux-lvm] what is free space in LVM
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

--089e01537a122c63ad051a823b1c
Content-Type: text/plain; charset=UTF-8

Hi,

I am new to LVM and I would like to have an exact answer to the question :

what is the criteria that allows to distinguishes the "free space" on the
all the space in a Volume Group?

or (if you prefer)...

how the command pvscan does  to obtain information about the free space in
LVM ?

------------
According to my current knowledge, I know that the definition of "free
space" concerns with with the set of blocks for which, in the FAT, is not  r
egistered a significant link to access a file.

But I think that in the context of LVM there should be a different criterion to
define the "free space" inside a Volume Group.
----------

Thank you

Regards

Angelo

--089e01537a122c63ad051a823b1c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi,<br><br></div>I am new to=
 LVM and I would like to have an exact answer to the question :<br></div><b=
r></div>what is the criteria <span id=3D"result_box" class=3D"" lang=3D"en"=
><span class=3D"">that allows to</span> <span class=3D"">distinguishes</spa=
n> <span class=3D"">the &quot;free space&quot;</span> <span class=3D"">on t=
he all the space in a Volume Group?</span><span><br><br>or (if you prefer).=
..<br><br></span></span><span tabindex=3D"-1" id=3D"result_box" class=3D"" =
lang=3D"en"><span class=3D"">how</span><span class=3D""></span> <span class=
=3D"">the command</span> <span class=3D"">pvscan does=C2=A0</span> <span cl=
ass=3D"">to</span> <span class=3D"">obtain</span> <span class=3D"">informat=
ion</span> <span class=3D"">about</span> <span class=3D"">the free space</s=
pan> <span class=3D"">in</span> <span class=3D"">LVM</span></span> ?<br><br=
>------------<br><span tabindex=3D"-1" id=3D"result_box" class=3D"" lang=3D=
"en"><span class=3D"">According to my</span> <span class=3D"">current knowl=
edge,</span> <span class=3D"">I know </span><span class=3D"">that the defin=
ition</span> <span class=3D"">of &quot;free space&quot; concerns with with<=
/span><span class=3D""> the set of</span> <span class=3D"">blocks</span> <s=
pan class=3D"">for</span> <span class=3D"">which</span><span class=3D""></s=
pan><span>,</span> <span class=3D"">in the</span> <span class=3D"">FAT</spa=
n><span>,</span> <span class=3D"">is not</span>=C2=A0 r<span>egistered</spa=
n> <span class=3D"">a</span> <span class=3D"">significant</span> <span clas=
s=3D"">link</span> <span class=3D"">to access</span> <span class=3D"">a fil=
e.</span><br><br> <span class=3D"">But I think that</span> <span class=3D""=
>in the context</span> <span class=3D"">of</span> <span class=3D"">LVM</spa=
n> <span class=3D"">there should be</span> <span class=3D"">a</span> <span =
class=3D"">different</span> <span class=3D"">criterion</span> <span class=
=3D"">to define</span> <span class=3D"">the &quot;free space&quot;</span> i=
nside<span class=3D""></span> <span class=3D"">a</span> <span class=3D"">Vo=
lume</span> <span class=3D"">Group</span></span>.<br>----------<br><br></di=
v>Thank you<br><br></div>Regards<br><br></div>Angelo<br></div>

--089e01537a122c63ad051a823b1c--
