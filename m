Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1H9TTCm009014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2016 04:29:29 -0500
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mx1.redhat.com (Postfix) with ESMTPS id A8F8685541
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2016 09:29:28 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id o6so3655759qkc.2
	for <linux-lvm@redhat.com>; Wed, 17 Feb 2016 01:29:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAGU4k=1-U1Z3mhPEt-YW96XaFFjcyO0AE0fUDw6FN4wfV2gB+g@mail.gmail.com>
References: <CAGU4k=1-U1Z3mhPEt-YW96XaFFjcyO0AE0fUDw6FN4wfV2gB+g@mail.gmail.com>
Date: Wed, 17 Feb 2016 17:29:27 +0800
Message-ID: <CAAYit8SCPJNWTJezKUGbLfCydN3q8+-XOV3aUpY72hesAvQXeg@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Content-Type: multipart/alternative; boundary=001a114a8c16f09c5a052bf3e269
Subject: Re: [linux-lvm] Repair thin pool
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

--001a114a8c16f09c5a052bf3e269
Content-Type: text/plain; charset=UTF-8

2016-02-17 10:48 GMT+08:00 Mars <kirapangzi@gmail.com>:
> Hi,
>
> Thank you very much for giving us so many advices.
>
> Here are some progresses based on you guys mail conversations:
>
> 1,check metadata device:
>
> [root@stor14 home]# thin_check
/dev/mapper/vgg145155121036c-pool_nas_tmeta0
> examining superblock
> examining devices tree
> examining mapping tree
>
> 2,dump metadata info:
>
> [root@stor14 home]# thin_dump /dev/mapper/vgg145155121036c-pool_nas_tmeta0
> -o nas_thin_dump.xml -r
> [root@stor14 home]# cat nas_thin_dump.xml
> <superblock uuid="" time="1787" transaction="3545" data_block_size="128"
> nr_data_blocks="249980672">
> </superblock>
>
> Compared with other normal pools, it seems like all device nodes and
mapping
> info in the metadata lv have lost.

Two possibilities: The device details tree was broken, or worse, the data
mapping tree was broken.

> Is there happened to be 'orphan nodes'? and could you give us your
semi-auto
> repair tools so we can repair it?

Sorry, the code is not finished. Please try my binary first (static binary
compiled on Ubuntu 14.04):
https://www.dropbox.com/s/6g8gm1hndxp3rpd/pdata_tools?dl=0

Please provide the output of thin_ll_dump:
./pdata_tools thin_ll_dump /dev/mapper/vgg145155121036c-pool_nas_tmeta0 -o
nas_thin_ll_dump.xml
(it needs some minutes to go, since that it scan through the entire
metadata (16GB!). I'll improve it later.


Ming-Hung Tsai

--001a114a8c16f09c5a052bf3e269
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">2016-02-17 10:48 GMT+08:00 Mars &lt;<a href=3D"mailto:kira=
pangzi@gmail.com">kirapangzi@gmail.com</a>&gt;:<br>&gt; Hi,<br>&gt;<br>&gt;=
 Thank you very much for giving us so many advices.<br>&gt;<br>&gt; Here ar=
e some progresses based on you guys mail conversations:<br>&gt;<br>&gt; 1,c=
heck metadata device:<br>&gt;<br>&gt; [root@stor14 home]# thin_check /dev/m=
apper/vgg145155121036c-pool_nas_tmeta0<br>&gt; examining superblock<br>&gt;=
 examining devices tree<br>&gt; examining mapping tree<br>&gt;<br>&gt; 2,du=
mp metadata info:<br>&gt;<br>&gt; [root@stor14 home]# thin_dump /dev/mapper=
/vgg145155121036c-pool_nas_tmeta0<br>&gt; -o nas_thin_dump.xml -r<br>&gt; [=
root@stor14 home]# cat nas_thin_dump.xml <br>&gt; &lt;superblock uuid=3D&qu=
ot;&quot; time=3D&quot;1787&quot; transaction=3D&quot;3545&quot; data_block=
_size=3D&quot;128&quot;<br>&gt; nr_data_blocks=3D&quot;249980672&quot;&gt;<=
br>&gt; &lt;/superblock&gt;<br>&gt;<br>&gt; Compared with other normal pool=
s, it seems like all device nodes and mapping<br>&gt; info in the metadata =
lv have lost.<br><br>Two possibilities: The device details tree was broken,=
 or worse, the data mapping tree was broken.<br><br>&gt; Is there happened =
to be &#39;orphan nodes&#39;? and could you give us your semi-auto<br>&gt; =
repair tools so we can repair it?<br><div><br></div><div>Sorry, the code is=
 not finished. Please try my binary first (static binary compiled on Ubuntu=
 14.04):<br><a href=3D"https://www.dropbox.com/s/6g8gm1hndxp3rpd/pdata_tool=
s?dl=3D0">https://www.dropbox.com/s/6g8gm1hndxp3rpd/pdata_tools?dl=3D0</a><=
br><br></div><div>Please provide the output of thin_ll_dump:</div><div>./pd=
ata_tools thin_ll_dump /dev/mapper/vgg145155121036c-pool_nas_tmeta0 -o nas_=
thin_ll_dump.xml</div><div>(it needs some minutes to go, since that it scan=
 through the entire metadata (16GB!). I&#39;ll improve it later.<br></div><=
div><br></div><div><br></div><div>Ming-Hung Tsai</div><div><br></div></div>

--001a114a8c16f09c5a052bf3e269--
