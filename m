Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC2F027095
	for <linux-lvm@redhat.com>; Thu, 10 May 2018 19:30:31 +0000 (UTC)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F035F30C76CA
	for <linux-lvm@redhat.com>; Thu, 10 May 2018 19:30:20 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id w123-v6so2769279oia.4
	for <linux-lvm@redhat.com>; Thu, 10 May 2018 12:30:20 -0700 (PDT)
MIME-Version: 1.0
From: John Hamilton <john.l.hamilton@gmail.com>
Date: Thu, 10 May 2018 19:30:09 +0000
Message-ID: <CA+p0dM=1BmTA3LyPwGFMH0gO6G7bVa-FUVs-Z8Z8vcRPqHODMQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cafeaa056bdf0ce3"
Subject: [linux-lvm] inconsistency between thin pool metadata mapped_blocks
	and lvs output
Reply-To: john.l.hamilton@gmail.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

--000000000000cafeaa056bdf0ce3
Content-Type: text/plain; charset="UTF-8"

I saw something today that I don't understand and I'm hoping somebody can
help.  We had a ~2.5TB thin pool that was showing 69% data utilization in
lvs:

# lvs -a
  LV                    VG       Attr       LSize  Pool Origin Data%
Meta%  Move Log Cpy%Sync Convert
  my-pool         myvg twi-aotz--  2.44t             69.04  4.90
  [my-pool_tdata] myvg Twi-ao----  2.44t
  [my-pool_tmeta] myvg ewi-ao---- 15.81g

However, when I dump the thin pool metadata and look at the mapped_blocks
for the 2 devices in the pool, I can only account for about 950GB.  Here is
the superblock and device entries from the metadata xml.  There are no
other devices listed in the metadata:

<superblock uuid="" time="34" transaction="68" flags="0" version="2"
data_block_size="128" nr_data_blocks="0">
  <device dev_id="1" mapped_blocks="258767" transaction="0"
creation_time="0" snap_time="14">
  <device dev_id="8" mapped_blocks="15616093" transaction="27"
creation_time="15" snap_time="34">

That first device looks like it has about 16GB allocated to it and the
second device about 950GB.  So, I would expect lvs to show somewhere
between 950G-966G Is something wrong, or am I misunderstanding how to read
the metadata dump?  Where is the other 700 or so GB that lvs is showing
used?

Thanks,

John

--000000000000cafeaa056bdf0ce3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I saw something today that I don&#39;t understand and I&#3=
9;m hoping somebody can help.=C2=A0 We had a ~2.5TB thin pool that was show=
ing 69% data utilization in lvs:<div><div><br></div><div># lvs -a=C2=A0</di=
v><div>=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 VG=C2=A0 =C2=A0 =C2=A0 =C2=A0Attr=C2=A0 =C2=A0 =C2=A0 =C2=A0LSiz=
e=C2=A0 Pool Origin Data%=C2=A0 Meta%=C2=A0 Move Log Cpy%Sync Convert</div>=
<div>=C2=A0 my-pool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myvg twi-aotz--=C2=A0 =
2.44t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A069.04=C2=A0 4.90<br></=
div><div>=C2=A0 [my-pool_tdata] myvg Twi-ao----=C2=A0 2.44t</div><div>=C2=
=A0 [my-pool_tmeta] myvg ewi-ao---- 15.81g</div></div><div><br></div><div>H=
owever, when I dump the thin pool metadata and look at the mapped_blocks fo=
r the 2 devices in the pool, I can only account for about 950GB.=C2=A0 Here=
 is the superblock and device entries from the metadata xml.=C2=A0 There ar=
e no other devices listed in the metadata:</div><div><br></div><div><div>&l=
t;superblock uuid=3D&quot;&quot; time=3D&quot;34&quot; transaction=3D&quot;=
68&quot; flags=3D&quot;0&quot; version=3D&quot;2&quot; data_block_size=3D&q=
uot;128&quot; nr_data_blocks=3D&quot;0&quot;&gt;</div><div>=C2=A0 &lt;devic=
e dev_id=3D&quot;1&quot; mapped_blocks=3D&quot;258767&quot; transaction=3D&=
quot;0&quot; creation_time=3D&quot;0&quot; snap_time=3D&quot;14&quot;&gt;</=
div></div><div>=C2=A0=C2=A0&lt;device dev_id=3D&quot;8&quot; mapped_blocks=
=3D&quot;15616093&quot; transaction=3D&quot;27&quot; creation_time=3D&quot;=
15&quot; snap_time=3D&quot;34&quot;&gt;</div><div><br></div><div>That first=
 device looks like it has about 16GB allocated to it and the second device =
about 950GB.=C2=A0 So, I would expect lvs to show somewhere between 950G-96=
6G Is something wrong, or am I misunderstanding how to read the metadata du=
mp?=C2=A0 Where is the other 700 or so GB that lvs is showing used?<br></di=
v><div><br></div><div>Thanks,</div><div><br></div><div>John</div></div>

--000000000000cafeaa056bdf0ce3--
