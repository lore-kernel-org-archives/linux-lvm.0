Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s910hXZT017496
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 20:43:33 -0400
Received: from mail-yk0-f180.google.com (mail-yk0-f180.google.com
	[209.85.160.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s910hUv6006200
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 20:43:31 -0400
Received: by mail-yk0-f180.google.com with SMTP id q9so26420ykb.25
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 17:43:30 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 30 Sep 2014 17:43:29 -0700
Message-ID: <CAAN_kG3nR8LWs1rwXeOCS76KRhjQ_V1iNMt5_doawOQCquWP_Q@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=20cf300fb307e7aca4050451c986
Subject: [linux-lvm] Thin provisioned pool errors
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

--20cf300fb307e7aca4050451c986
Content-Type: text/plain; charset=UTF-8

Hi all,

We are using LVM thin in EC2 and recently bumped into an error that seems
to indicate metadata corruption. I was hoping someone on the list could
clarify what likely happened and point to what we could do to avoid this in
the future (any recent patches or other work).

The error is the following:
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947135]
device-mapper: thin: dm_thin_insert_block() failed
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947153] Buffer
I/O error on device dm-315, logical block 2430188
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947164] Buffer
I/O error on device dm-315, logical block 2430189
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947169] Buffer
I/O error on device dm-315, logical block 2430190
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947174] Buffer
I/O error on device dm-315, logical block 2430191
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947182] EXT4-fs
warning (device dm-315): ext4_end_bio:317: I/O error writing to inode
1305621 (offset 2429468672 size 16384 starting block 2430188)

The failure in dm_thin_insert_block() repeats 10 times and is followed by
the following message:
Sep 27 20:09:41 magtest-ferenc-307-820-3 kernel: [2076279.600905]
device-mapper: thin: dm_thin_get_highest_mapped_block returned -61

The device mapper error is repeated until the VM was taken offline and the
EBS volumes snapshotted. At this point, running thin_check, produces the
following:
examining superblock
examining devices tree
  missing devices: [159, 277]
    bad checksum in btree node
examining mapping tree
  missing all mappings for devices: [229, 229]
    bad checksum in btree nodeunknown node typeunknown node typeunknown
node typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node typeunknown node
typeunknown node typeunknown node typeunknown node type
  thin device 230 is missing mappings [57251, -]
    invalid key

The missing mappings error is repeated for many devices.

At this point, would going through the steps of thin_dump/thin_repair
remedy this?

Is there any additional information I can get from the system to understand
what happened? I wonder if there was an issue with the underlying EBS
storage, but have no way of confirming that at the moment.

Lastly, this is Ubuntu 12.04 LTS. I did pull in the thin provisioning tools
version 0.3.1, but the kernel is 3.8.0 (3.8.0-32-generic) and LVM2 package
is:
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)

Are there known patches that we may be missing that would remedy some of
these issues?

Thank you,
Timur

--20cf300fb307e7aca4050451c986
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>We are using LVM thin in EC2 an=
d recently bumped into an error that seems to indicate metadata corruption.=
 I was hoping someone on the list could clarify what likely happened and po=
int to what we could do to avoid this in the future (any recent patches or =
other work).</div><div><br></div><div>The error is the following:<br><div>S=
ep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947135] device-map=
per: thin: dm_thin_insert_block() failed</div><div>Sep 27 20:09:37 magtest-=
ferenc-307-820-3 kernel: [2076275.947153] Buffer I/O error on device dm-315=
, logical block 2430188</div><div>Sep 27 20:09:37 magtest-ferenc-307-820-3 =
kernel: [2076275.947164] Buffer I/O error on device dm-315, logical block 2=
430189</div><div>Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.=
947169] Buffer I/O error on device dm-315, logical block 2430190</div><div>=
Sep 27 20:09:37 magtest-ferenc-307-820-3 kernel: [2076275.947174] Buffer I/=
O error on device dm-315, logical block 2430191</div><div>Sep 27 20:09:37 m=
agtest-ferenc-307-820-3 kernel: [2076275.947182] EXT4-fs warning (device dm=
-315): ext4_end_bio:317: I/O error writing to inode 1305621 (offset 2429468=
672 size 16384 starting block 2430188)</div></div><div><br></div><div>The f=
ailure in dm_thin_insert_block() repeats 10 times and is followed by the fo=
llowing message:<br>Sep 27 20:09:41 magtest-ferenc-307-820-3 kernel: [20762=
79.600905] device-mapper: thin: dm_thin_get_highest_mapped_block returned -=
61<br></div><div><br></div><div>The device mapper error is repeated until t=
he VM was taken offline and the EBS volumes snapshotted. At this point, run=
ning thin_check, produces the following:<br><div>examining superblock</div>=
<div>examining devices tree</div><div>=C2=A0 missing devices: [159, 277]</d=
iv><div>=C2=A0 =C2=A0 bad checksum in btree node</div><div>examining mappin=
g tree</div><div>=C2=A0 missing all mappings for devices: [229, 229]</div><=
div>=C2=A0 =C2=A0 bad checksum in btree nodeunknown node typeunknown node t=
ypeunknown node typeunknown node typeunknown node typeunknown node typeunkn=
own node typeunknown node typeunknown node typeunknown node typeunknown nod=
e typeunknown node typeunknown node typeunknown node typeunknown node typeu=
nknown node typeunknown node typeunknown node typeunknown node typeunknown =
node typeunknown node typeunknown node typeunknown node typeunknown node ty=
peunknown node typeunknown node typeunknown node typeunknown node typeunkno=
wn node typeunknown node typeunknown node typeunknown node typeunknown node=
 typeunknown node typeunknown node typeunknown node typeunknown node typeun=
known node typeunknown node typeunknown node typeunknown node typeunknown n=
ode typeunknown node typeunknown node typeunknown node typeunknown node typ=
eunknown node typeunknown node typeunknown node typeunknown node typeunknow=
n node typeunknown node typeunknown node typeunknown node typeunknown node =
typeunknown node typeunknown node typeunknown node typeunknown node typeunk=
nown node typeunknown node typeunknown node type</div><div>=C2=A0 thin devi=
ce 230 is missing mappings [57251, -]</div><div>=C2=A0 =C2=A0 invalid key</=
div></div><div><br></div><div>The missing mappings error is repeated for ma=
ny devices.</div><div><br></div><div>At this point, would going through the=
 steps of thin_dump/thin_repair remedy this?</div><div><br></div><div>Is th=
ere any additional information I can get from the system to understand what=
 happened? I wonder if there was an issue with the underlying EBS storage, =
but have no way of confirming that at the moment.</div><div><br></div><div>=
Lastly, this is Ubuntu 12.04 LTS. I did pull in the thin provisioning tools=
 version 0.3.1, but the kernel is 3.8.0 (3.8.0-32-generic) and LVM2 package=
 is:<br><div>=C2=A0 LVM version: =C2=A0 =C2=A0 2.02.98(2) (2012-10-15)</div=
><div>=C2=A0 Library version: 1.02.77 (2012-10-15)</div></div><div><br></di=
v><div>Are there known patches that we may be missing that would remedy som=
e of these issues?</div><div><br></div><div>Thank you,</div><div>Timur</div=
></div>

--20cf300fb307e7aca4050451c986--
