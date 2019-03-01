Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FB6060C47
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 02:56:47 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 450A531642F4
	for <linux-lvm@redhat.com>; Fri,  1 Mar 2019 02:56:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id h58so18764866edb.5
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 18:56:45 -0800 (PST)
Message-ID: <5c789f6a.1c69fb81.bdd85.c1bb@mx.google.com>
MIME-Version: 1.0
From: Bernd Eckenfels <ecki@zusammenkunft.net>
Date: Fri, 1 Mar 2019 03:56:41 +0100
In-Reply-To: <d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<d60d4e1c-ad67-8f3f-b159-13cb3923447f@gmail.com>
Content-Type: multipart/alternative;
	boundary="_430F1F8F-EFEF-437A-AC80-3DA586F1ADBB_"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a
 PVwith a larger physical block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ingo Franzki <ifranzki@linux.ibm.com>

--_430F1F8F-EFEF-437A-AC80-3DA586F1ADBB_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hello,

I think the filesystems address in Logical blocks, so this is the size whic=
h should match.

However the physical size might be relevant for alignment/sizing decisions =
of mkfs  (but you would expect the to be encoded in the metadata of the fil=
esystem so you can transport them (losing proper alignment which might affe=
ct Performance or robustness).

For ext3/4 I think the mkfs will use -b 4k by Default if your FS is at leas=
t 0,5GB.

BTW: some applications (like SQL Server) also care about the physical size =
to make sure they always write complete sectors in transactions and avoid r=
ead-modify-write scenarios.
=20
Gruss
Bernd
--=20
http://bernd.eckenfels.net

Von: Cesare Leonardi
Gesendet: Freitag, 1. M=C3=A4rz 2019 02:24
An: Ingo Franzki; LVM general discussion and development
Betreff: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PVw=
ith a larger physical block size

On 28/02/19 09:41, Ingo Franzki wrote:
> Well, there are the following 2 commands:
>=20
> Get physical block size:
>   blockdev --getpbsz <device>
> Get logical block size:
>   blockdev --getbsz <device>

I didn't know the blockdev command and, to recap, we have:
--getpbsz: physical sector size
--getss: logical sector size
--getbsz: blocksize used internally by the kernel

getpbsz/getss correspond to physical/logical sector size reported by=20
fdisk, smartctl, etc.

> Filesystems seem to care about the physical block size only, not the logi=
cal block size.
>=20
> So as soon as you have PVs with different physical block sizes (as report=
ed by blockdev --getpbsz) I would be very careful...

I've done the test suggested by Stuart and it seems to contradict this.
I have pvmoved data from a 512/512 (logical/physical) disk to a newly=20
added 512/4096 disk but I had no data corruption. Unfortunately I=20
haven't any native 4k disk to repeat the same test.

Here is what I've done.
/dev/sdb: SSD with 512/512 sector size
/dev/sdc: mechanical disk with 512/4096 sector size

# blockdev -v --getss --getpbsz --getbsz /dev/sdb
get logical block (sector) size: 512
get physical block (sector) size: 512
get blocksize: 4096

# blockdev -v --getss --getpbsz --getbsz /dev/sdc
get logical block (sector) size: 512
get physical block (sector) size: 4096
get blocksize: 4096

# pvcreate /dev/sdb4
# vgcreate vgtest /dev/sdb4
# lvcreate -L 1G vgtest /dev/sdb4
# mkfs.ext4 /dev/mapper/vgtest-lvol0
# mkdir /media/test
# mount /dev/mapper/vgtest-lvol0 /media/test
# cp -a SOMEDATA /media/test/
# umount /media/test
# fsck.ext4 -f /dev/mapper/vgtest-lvol0

Filesystem created and no error on it. Now the disk with different=20
physical size:

# pvcreate /dev/sdc1
# vgextend vgtest /dev/sdc1
# pvmove /dev/sdb4 /dev/sdc1
# fsck.ext4 -f /dev/mapper/vgtest-lvol0
# mount /dev/mapper/vgtest-lvol0 /media/test
# ls /media/test/

The fsck command reports no errors, the filesystem is mountable and the=20
data is there.

Looks like physical sector size didn't matter here. Or I'm missing=20
something?

Cesare.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--_430F1F8F-EFEF-437A-AC80-3DA586F1ADBB_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DDE link=3Dblue vlink=3D"#954F72"><div class=
=3DWordSection1><p class=3DMsoNormal>Hello,</p><p class=3DMsoNormal><o:p>&n=
bsp;</o:p></p><p class=3DMsoNormal>I think the filesystems address in Logic=
al blocks, so this is the size which should match.</p><p class=3DMsoNormal>=
<o:p>&nbsp;</o:p></p><p class=3DMsoNormal>However the physical size might b=
e relevant for alignment/sizing decisions of mkfs =C2=A0(but you would expe=
ct the to be encoded in the metadata of the filesystem so you can transport=
 them (losing proper alignment which might affect Performance or robustness=
).</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>For ex=
t3/4 I think the mkfs will use -b 4k by Default if your FS is at least 0,5G=
B.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>BTW: s=
ome applications (like SQL Server) also care about the physical size to mak=
e sure they always write complete sectors in transactions and avoid read-mo=
dify-write scenarios.</p><p class=3DMsoNormal> </p><p class=3DMsoNormal>Gru=
ss</p><p class=3DMsoNormal>Bernd</p><p class=3DMsoNormal>-- <br>http://bern=
d.eckenfels.net</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><div style=3D'=
mso-element:para-border-div;border:none;border-top:solid #E1E1E1 1.0pt;padd=
ing:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal style=3D'border:none;padding:0c=
m'><b>Von: </b><a href=3D"mailto:celeonar@gmail.com">Cesare Leonardi</a><br=
><b>Gesendet: </b>Freitag, 1. M=C3=A4rz 2019 02:24<br><b>An: </b><a href=3D=
"mailto:ifranzki@linux.ibm.com">Ingo Franzki</a>; <a href=3D"mailto:linux-l=
vm@redhat.com">LVM general discussion and development</a><br><b>Betreff: </=
b>Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PVwith a l=
arger physical block size</p></div><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p><p class=3DMsoNormal>On 28/02/19 09:41, Ingo Franzki wrote:</p><p class=
=3DMsoNormal>&gt; Well, there are the following 2 commands:</p><p class=3DM=
soNormal>&gt; </p><p class=3DMsoNormal>&gt; Get physical block size:</p><p =
class=3DMsoNormal>&gt;=C2=A0=C2=A0 blockdev --getpbsz &lt;device&gt;</p><p =
class=3DMsoNormal>&gt; Get logical block size:</p><p class=3DMsoNormal>&gt;=
=C2=A0=C2=A0 blockdev --getbsz &lt;device&gt;</p><p class=3DMsoNormal><o:p>=
&nbsp;</o:p></p><p class=3DMsoNormal>I didn't know the blockdev command and=
, to recap, we have:</p><p class=3DMsoNormal>--getpbsz: physical sector siz=
e</p><p class=3DMsoNormal>--getss: logical sector size</p><p class=3DMsoNor=
mal>--getbsz: blocksize used internally by the kernel</p><p class=3DMsoNorm=
al><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>getpbsz/getss correspond to ph=
ysical/logical sector size reported by </p><p class=3DMsoNormal>fdisk, smar=
tctl, etc.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNorma=
l>&gt; Filesystems seem to care about the physical block size only, not the=
 logical block size.</p><p class=3DMsoNormal>&gt; </p><p class=3DMsoNormal>=
&gt; So as soon as you have PVs with different physical block sizes (as rep=
orted by blockdev --getpbsz) I would be very careful...</p><p class=3DMsoNo=
rmal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I've done the test suggested=
 by Stuart and it seems to contradict this.</p><p class=3DMsoNormal>I have =
pvmoved data from a 512/512 (logical/physical) disk to a newly </p><p class=
=3DMsoNormal>added 512/4096 disk but I had no data corruption. Unfortunatel=
y I </p><p class=3DMsoNormal>haven't any native 4k disk to repeat the same =
test.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Her=
e is what I've done.</p><p class=3DMsoNormal>/dev/sdb: SSD with 512/512 sec=
tor size</p><p class=3DMsoNormal>/dev/sdc: mechanical disk with 512/4096 se=
ctor size</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal=
># blockdev -v --getss --getpbsz --getbsz /dev/sdb</p><p class=3DMsoNormal>=
get logical block (sector) size: 512</p><p class=3DMsoNormal>get physical b=
lock (sector) size: 512</p><p class=3DMsoNormal>get blocksize: 4096</p><p c=
lass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal># blockdev -v --=
getss --getpbsz --getbsz /dev/sdc</p><p class=3DMsoNormal>get logical block=
 (sector) size: 512</p><p class=3DMsoNormal>get physical block (sector) siz=
e: 4096</p><p class=3DMsoNormal>get blocksize: 4096</p><p class=3DMsoNormal=
><o:p>&nbsp;</o:p></p><p class=3DMsoNormal># pvcreate /dev/sdb4</p><p class=
=3DMsoNormal># vgcreate vgtest /dev/sdb4</p><p class=3DMsoNormal># lvcreate=
 -L 1G vgtest /dev/sdb4</p><p class=3DMsoNormal># mkfs.ext4 /dev/mapper/vgt=
est-lvol0</p><p class=3DMsoNormal># mkdir /media/test</p><p class=3DMsoNorm=
al># mount /dev/mapper/vgtest-lvol0 /media/test</p><p class=3DMsoNormal># c=
p -a SOMEDATA /media/test/</p><p class=3DMsoNormal># umount /media/test</p>=
<p class=3DMsoNormal># fsck.ext4 -f /dev/mapper/vgtest-lvol0</p><p class=3D=
MsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>Filesystem created and =
no error on it. Now the disk with different </p><p class=3DMsoNormal>physic=
al size:</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>=
# pvcreate /dev/sdc1</p><p class=3DMsoNormal># vgextend vgtest /dev/sdc1</p=
><p class=3DMsoNormal># pvmove /dev/sdb4 /dev/sdc1</p><p class=3DMsoNormal>=
# fsck.ext4 -f /dev/mapper/vgtest-lvol0</p><p class=3DMsoNormal># mount /de=
v/mapper/vgtest-lvol0 /media/test</p><p class=3DMsoNormal># ls /media/test/=
</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>The fsck=
 command reports no errors, the filesystem is mountable and the </p><p clas=
s=3DMsoNormal>data is there.</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><=
p class=3DMsoNormal>Looks like physical sector size didn't matter here. Or =
I'm missing </p><p class=3DMsoNormal>something?</p><p class=3DMsoNormal><o:=
p>&nbsp;</o:p></p><p class=3DMsoNormal>Cesare.</p><p class=3DMsoNormal><o:p=
>&nbsp;</o:p></p><p class=3DMsoNormal>_____________________________________=
__________</p><p class=3DMsoNormal>linux-lvm mailing list</p><p class=3DMso=
Normal>linux-lvm@redhat.com</p><p class=3DMsoNormal>https://www.redhat.com/=
mailman/listinfo/linux-lvm</p><p class=3DMsoNormal>read the LVM HOW-TO at h=
ttp://tldp.org/HOWTO/LVM-HOWTO/</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p></div></body></html>=

--_430F1F8F-EFEF-437A-AC80-3DA586F1ADBB_--
