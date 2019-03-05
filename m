Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3472D60C1B
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 16:29:45 +0000 (UTC)
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
	[209.85.217.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0947759452
	for <linux-lvm@redhat.com>; Tue,  5 Mar 2019 16:29:45 +0000 (UTC)
Received: by mail-vs1-f71.google.com with SMTP id g72so163660vsd.18
	for <linux-lvm@redhat.com>; Tue, 05 Mar 2019 08:29:45 -0800 (PST)
MIME-Version: 1.0
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
	<eb3fb7e3-9946-f266-815e-4b49c997e3a4@linux.ibm.com>
	<30346b34-c1e1-f7ba-be4e-a37d8ce8cf03@gmail.com>
	<1576db4f-1d7c-6894-d9b0-69c51852b11c@linux.ibm.com>
	<325bbb01-1b67-eafb-025e-4bfde1b16b54@gmail.com>
	<alpine.LRH.2.21.1903041908110.14821@fairfax.gathman.org>
	<328b148e-61ff-1099-5362-3e799407580c@linux.ibm.com>
	<80ee50b6-4d44-90d1-b38e-4072ebbc7cbf@izyk.ru>
In-Reply-To: <80ee50b6-4d44-90d1-b38e-4072ebbc7cbf@izyk.ru>
From: Nir Soffer <nsoffer@redhat.com>
Date: Tue, 5 Mar 2019 18:29:31 +0200
Message-ID: <CAMRbyyvi=eqOAaj40WGSTS1+125dd+a=u8tyby6CHNpEOGVovw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000074abce05835b61d8"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
Cc: Ingo Franzki <ifranzki@linux.ibm.com>, David Teigland <teigland@redhat.com>

--00000000000074abce05835b61d8
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 5, 2019 at 11:30 AM Ilia Zykov <mail@izyk.ru> wrote:

> Hello.
>
> >> THAT is a crucial observation.  It's not an LVM bug, but the filesystem
> >> trying to read 1024 bytes on a 4096 device.
> > Yes that's probably the reason. Nevertheless, its not really the FS's
> fault, since it was moved by LVM to a 4069 device.
> > The FS does not know anything about the move, so it reads in the block
> size it was created with (1024 in this case).
> >
> > I still think LVM should prevent one from mixing devices with different
> physical block sizes, or at least warn when pvmoving or lvextending onto a
> PV with a larger block size, since this can cause trouble.
> >
>
> In this case, "dd" tool and others should prevent too.
>
> Because after:
>
> dd if=/dev/DiskWith512block bs=4096 of=/dev/DiskWith4Kblock
>
> You couldn't mount the "/dev/DiskWith4Kblock" with the same error ;)
> /dev/DiskWith512block has ext4 fs with 1k block.
>
> P.S.
> LVM,dd .. are low level tools and doesn't know about hi level anything.
> And in the your case and others cases can't know. You should test(if you
> need) the block size with other tools before moving or copying.
> Not a lvm bug.
>

I don't this way of thinking is useful. If we go in this way, then write()
should not
let you write data, and later maybe the disk controller should avoid this?

LVM is not a low level tool like dd. It is high level tool for managing
device mapper,
and providing high level tools to create user level abstractions. We can
expect it
to prevent system administrator from doing the wrong thing.

Maybe LVM should let you mix PVs with different logical block size, but it
should
require --force.

David, what do you think?

--00000000000074abce05835b61d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small;color:#000000"><span style=3D"color:rgb(34,34,34)">On Tue, Mar=
 5, 2019 at 11:30 AM Ilia Zykov &lt;<a href=3D"mailto:mail@izyk.ru">mail@iz=
yk.ru</a>&gt; wrote:</span><br></div></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hello.<br>
<br>
&gt;&gt; THAT is a crucial observation.=C2=A0 It&#39;s not an LVM bug, but =
the filesystem<br>
&gt;&gt; trying to read 1024 bytes on a 4096 device.=C2=A0 <br>
&gt; Yes that&#39;s probably the reason. Nevertheless, its not really the F=
S&#39;s fault, since it was moved by LVM to a 4069 device.<br>
&gt; The FS does not know anything about the move, so it reads in the block=
 size it was created with (1024 in this case).<br>
&gt; <br>
&gt; I still think LVM should prevent one from mixing devices with differen=
t physical block sizes, or at least warn when pvmoving or lvextending onto =
a PV with a larger block size, since this can cause trouble.<br>
&gt; <br>
<br>
In this case, &quot;dd&quot; tool and others should prevent too.<br>
<br>
Because after:<br>
<br>
dd if=3D/dev/DiskWith512block bs=3D4096 of=3D/dev/DiskWith4Kblock<br>
<br>
You couldn&#39;t mount the &quot;/dev/DiskWith4Kblock&quot; with the same e=
rror ;)<br>
/dev/DiskWith512block has ext4 fs with 1k block.<br>
<br>
P.S.<br>
LVM,dd .. are low level tools and doesn&#39;t know about hi level anything.=
<br>
And in the your case and others cases can&#39;t know. You should test(if yo=
u<br>
need) the block size with other tools before moving or copying.<br>
Not a lvm bug.<br></blockquote><div><br></div><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small;color:rgb(0,0,0)">I don&#39;t this way of thi=
nking is useful. If we go in this way, then write() should not</div><div cl=
ass=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">let you wr=
ite data, and later maybe the disk controller should avoid this?</div><div =
class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)"><br></di=
v><div class=3D"gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">L=
VM is not a low level tool like dd. It is high level tool for managing devi=
ce mapper,</div><div class=3D"gmail_default" style=3D"font-size:small;color=
:rgb(0,0,0)">and providing high level tools to create user level abstractio=
ns. We can expect it</div><div class=3D"gmail_default" style=3D"font-size:s=
mall;color:rgb(0,0,0)">to prevent system administrator from doing the wrong=
 thing.</div><div class=3D"gmail_default" style=3D"font-size:small;color:rg=
b(0,0,0)"><br></div><div class=3D"gmail_default" style=3D"font-size:small;c=
olor:rgb(0,0,0)">Maybe LVM should let you mix PVs with different logical bl=
ock size, but it should</div><div class=3D"gmail_default" style=3D"font-siz=
e:small;color:rgb(0,0,0)">require --force.</div></div><div class=3D"gmail_d=
efault" style=3D"font-size:small;color:rgb(0,0,0)"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small;color:rgb(0,0,0)">David, what do yo=
u think?</div></div></div>

--00000000000074abce05835b61d8--
