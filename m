Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2VGuhB5024861
	for <linux-lvm@redhat.com>; Sat, 31 Mar 2012 12:56:43 -0400
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q2VGufXr021681
	for <linux-lvm@redhat.com>; Sat, 31 Mar 2012 12:56:42 -0400
Received: by qcqw6 with SMTP id w6so1153855qcq.33
	for <linux-lvm@redhat.com>; Sat, 31 Mar 2012 09:56:41 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 31 Mar 2012 18:56:41 +0200
Message-ID: <CADrrdEUQ0AqB73EHMuLpoFsU8Q0vxnMZ0w7Q5JcpBEwqsbfDQw@mail.gmail.com>
From: Bali Zaci <zaci.bali@gmail.com>
Content-Type: multipart/alternative; boundary=20cf3074b6525c2f6b04bc8cd7f6
Subject: [linux-lvm] lvm + loopback
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

--20cf3074b6525c2f6b04bc8cd7f6
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I have the following setup: pv (/dev/sda2) -> vg (name: vg) -> lv (name:
test)
I would like to create a loopback device on /dev/sda2 (using offset) so the
loopback will be exactly the test logical volume.
It is working with a testfile but somehow It is not working with a "real
device".

So the steps are the following:
1., Clean the lv and create a pattern that I should find at the begin of
the loopback device
# dd if=/dev/zero of=/dev/mapper/vg-test
# echo 'AAAA' > /dev/mapper/vg-test
# sync
# hexdump -C -n 10 /dev/mapper/vg-test
00000000  41 41 41 41 0a 00 00 00  00 00                    |AAAA......|
0000000a

2., Check the PE size (4M)
# pvdisplay |grep 'PE Size'
  PE Size               4.00 MiB

3., Check where is the first PE on the partition (1M)
# pvs -o +pe_start
  PV         VG   Fmt  Attr PSize   PFree 1st PE
  /dev/sda2  vg   lvm2 a--  465.56g    0    1.00m

4., Check where the lv is located on the pv (starting at the 11776 PE)
# lvdisplay -m vg/test
  --- Logical volume ---
  LV Name                /dev/vg/test
  VG Name                vg
  LV UUID                vT5X5z-1CJH-uw4n-Jcs8-DW50-PDDB-N6PlIu
  LV Write Access        read/write
  LV Status              available
  # open                 0
  LV Size                419.56 GiB
  Current LE             107408
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:4

  --- Segments ---
  Logical extent 0 to 107407:
    Type linear
    Physical volume /dev/sda2
    Physical extents 11776 to 119183

5., Create a loopback device on /dev/sda2 (pv) with offset based on the
following calculation: Where is the first PE on the device (1M) + Where is
the firt PE of the test lv (11776)*PE size (4M) = 47105M
# losetup -f -v -o 47105m /dev/sda2
Loop device is /dev/loop0

6., Test it with hexdump (it should give the same result like in the firts
step but id doesn't do it)
# hexdump -C -n 10 /dev/loop0
00000000  00 00 00 00 00 00 00 00  00 00                    |..........|
0000000a



Could somebody give me a hint where is the problem?


Thanks and regards,
B

--20cf3074b6525c2f6b04bc8cd7f6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<div><br></div><div>I have the following setup: pv (/dev/sda2) -&gt;=
 vg (name: vg) -&gt; lv (name: test)</div><div>I would like to create a loo=
pback device on /dev/sda2 (using offset) so the loopback will be exactly th=
e test logical volume.</div>
<div>It is working with a testfile but somehow It is not working with a &qu=
ot;real device&quot;.</div><div><br></div><div>So the steps are the followi=
ng:</div><div>1., Clean the lv and create a pattern that I should find at t=
he begin of the loopback device</div>
<div># dd if=3D/dev/zero of=3D/dev/mapper/vg-test</div><div># echo &#39;AAA=
A&#39; &gt; /dev/mapper/vg-test</div><div># sync</div><div># hexdump -C -n =
10 /dev/mapper/vg-test=A0</div><div>00000000 =A041 41 41 41 0a 00 00 00 =A0=
00 00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|AAAA......|</div>
<div>0000000a</div><div><br></div><div>2., Check the PE size (4M)</div><div=
># pvdisplay |grep &#39;PE Size&#39;</div><div>=A0 PE Size =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 4.00 MiB</div><div><br></div><div>3., Check where is the first =
PE on the partition (1M)</div>
<div># pvs -o +pe_start</div><div>=A0 PV =A0 =A0 =A0 =A0 VG =A0 Fmt =A0Attr=
 PSize =A0 PFree 1st PE=A0</div><div>=A0 /dev/sda2 =A0vg =A0 lvm2 a-- =A046=
5.56g =A0 =A00 =A0 =A01.00m</div><div><br></div><div>4., Check where the lv=
 is located on the pv (starting at the 11776 PE)</div>
<div><div># lvdisplay -m vg/test</div><div>=A0 --- Logical volume ---</div>=
<div>=A0 LV Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/dev/vg/test</div><div>=A0 =
VG Name =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vg</div><div>=A0 LV UUID =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0vT5X5z-1CJH-uw4n-Jcs8-DW50-PDDB-N6PlIu</div>
<div>=A0 LV Write Access =A0 =A0 =A0 =A0read/write</div><div>=A0 LV Status =
=A0 =A0 =A0 =A0 =A0 =A0 =A0available</div><div>=A0 # open =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 0</div><div>=A0 LV Size =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0419.=
56 GiB</div><div>=A0 Current LE =A0 =A0 =A0 =A0 =A0 =A0 107408</div><div>
=A0 Segments =A0 =A0 =A0 =A0 =A0 =A0 =A0 1</div><div>=A0 Allocation =A0 =A0=
 =A0 =A0 =A0 =A0 inherit</div><div>=A0 Read ahead sectors =A0 =A0 auto</div=
><div>=A0 - currently set to =A0 =A0 256</div><div>=A0 Block device =A0 =A0=
 =A0 =A0 =A0 253:4</div><div>=A0 =A0</div><div>=A0 --- Segments ---</div>
<div>=A0 Logical extent 0 to 107407:</div><div>=A0 =A0 Type<span class=3D"A=
pple-tab-span" style=3D"white-space:pre">		</span>linear</div><div>=A0 =A0 =
Physical volume<span class=3D"Apple-tab-span" style=3D"white-space:pre">	</=
span>/dev/sda2</div>
<div>=A0 =A0 Physical extents<span class=3D"Apple-tab-span" style=3D"white-=
space:pre">	</span>11776 to 119183</div></div><div><br></div><div>5., Creat=
e a loopback device on /dev/sda2 (pv) with offset based on the following ca=
lculation: Where is the first PE on the device (1M) + Where is the firt PE =
of the test lv (11776)*PE size (4M) =3D 47105M</div>
<div><div># losetup -f -v -o 47105m /dev/sda2</div><div>Loop device is /dev=
/loop0</div></div><div><br></div><div>6., Test it with hexdump (it should g=
ive the same result like in the firts step but id doesn&#39;t do it)</div>
<div><div># hexdump -C -n 10 /dev/loop0</div><div>00000000 =A000 00 00 00 0=
0 00 00 00 =A000 00 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|..........|</di=
v><div>0000000a</div></div><div><br></div><div><br></div><div><br></div><di=
v>Could somebody give me a hint where is the problem?</div>
<div><br></div><div><br></div><div>Thanks and regards,</div><div>B</div><di=
v><br></div><div><br></div>

--20cf3074b6525c2f6b04bc8cd7f6--
