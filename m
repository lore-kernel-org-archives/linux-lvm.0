Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAJ7R6FN031230
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 02:27:06 -0500
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mx1.redhat.com (Postfix) with ESMTPS id 88D6B8F30F
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2015 07:27:04 +0000 (UTC)
Received: by lbbkw15 with SMTP id kw15so38409604lbb.0
	for <linux-lvm@redhat.com>; Wed, 18 Nov 2015 23:27:03 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 19 Nov 2015 09:27:02 +0200
Message-ID: <CANvPVN3ZzNiPsa_H-Lr38Ere1kYKzU2EPK_dFu0wG--cgtsZrA@mail.gmail.com>
From: Ciprian Hacman <ciprian.hacman@sematext.com>
Content-Type: multipart/alternative; boundary=001a11c372f86accbf0524dfaf14
Subject: [linux-lvm] Cache block size warning
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

--001a11c372f86accbf0524dfaf14
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

We are configuring lvm with SSD caching on some of our boxes in AWS. When
the cache is initialised, we see this in logs:

device-mapper*: cache: You have created a cache device with a lot of
individual cache blocks (4915200)*

*               All these mappings can consume a lot of kernel memory, and
take some time to read/write.*

*               Please consider increasing the cache block size to reduce
the overall cache block count.*


Is this something to worry? If so, how can we improve it?

For reference, the output of lsblk is:

NAME                    MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT

xvda                    202:0    0    25G  0 disk

=E2=94=94=E2=94=80xvda1                 202:1    0    25G  0 part  /

xvdb                    202:16   0 152.6G  0 disk

=E2=94=94=E2=94=80md0                     9:0    0 304.9G  0 raid0

  =E2=94=9C=E2=94=80storage-cache_cdata 252:0    0   300G  0 lvm

  =E2=94=82 =E2=94=94=E2=94=80storage-data      252:3    0   1.5T  0 lvm   =
/mnt/local

  =E2=94=94=E2=94=80storage-cache_cmeta 252:1    0     1G  0 lvm

    =E2=94=94=E2=94=80storage-data      252:3    0   1.5T  0 lvm   /mnt/loc=
al

xvdc                    202:32   0 152.6G  0 disk

=E2=94=94=E2=94=80md0                     9:0    0 304.9G  0 raid0

  =E2=94=9C=E2=94=80storage-cache_cdata 252:0    0   300G  0 lvm

  =E2=94=82 =E2=94=94=E2=94=80storage-data      252:3    0   1.5T  0 lvm   =
/mnt/local

  =E2=94=94=E2=94=80storage-cache_cmeta 252:1    0     1G  0 lvm

    =E2=94=94=E2=94=80storage-data      252:3    0   1.5T  0 lvm   /mnt/loc=
al

xvdg                    202:96   0   1.5T  0 disk

=E2=94=94=E2=94=80storage-data_corig    252:2    0   1.5T  0 lvm

  =E2=94=94=E2=94=80storage-data        252:3    0   1.5T  0 lvm   /mnt/loc=
al


Thanks,
Ciprian
--
Performance Monitoring * Log Analytics * Search Analytics
Solr & Elasticsearch Support * http://sematext.com/

--001a11c372f86accbf0524dfaf14
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>We are configuring lvm w=
ith SSD caching on some of our boxes in AWS. When the cache is initialised,=
 we see this in logs:</div><blockquote style=3D"margin:0px 0px 0px 40px;bor=
der:none;padding:0px"><div><p style=3D"margin:0px;font-size:11px;line-heigh=
t:normal;font-family:Menlo"><span style=3D"color:rgb(175,173,36)">device-ma=
pper</span><b>: cache: You have created a cache device with a lot of indivi=
dual cache blocks (4915200)</b></p></div><div><p style=3D"margin:0px;font-s=
ize:11px;line-height:normal;font-family:Menlo"><b>=C2=A0=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 All these mappings can consume a lot of ker=
nel memory, and take some time to read/write.</b></p></div><div><p style=3D=
"margin:0px;font-size:11px;line-height:normal;font-family:Menlo"><b>=C2=A0=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Please consider increasing=
 the cache block size to reduce the overall cache block count.</b></p></div=
></blockquote><div><br></div><div>Is this something to worry? If so, how ca=
n we improve it?</div><div><br></div><div>For reference, the output of lsbl=
k is:</div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px">=
<div><p style=3D"margin:0px;font-size:11px;line-height:normal;font-family:M=
enlo">NAME=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 MAJ:MIN RM =C2=A0 SIZE RO TYPE=C2=A0 MOUNTPOINT</p></div><div><p sty=
le=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">xvda=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 202:0=
=C2=A0 =C2=A0 0=C2=A0 =C2=A0 25G=C2=A0 0 disk =C2=A0</p></div><div><p style=
=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">=E2=94=
=94=E2=94=80xvda1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2=
02:1=C2=A0 =C2=A0 0=C2=A0 =C2=A0 25G=C2=A0 0 part=C2=A0 /</p></div><div><p =
style=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">xv=
db=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 202=
:16 =C2=A0 0 152.6G=C2=A0 0 disk =C2=A0</p></div><div><p style=3D"margin:0p=
x;font-size:11px;line-height:normal;font-family:Menlo">=E2=94=94=E2=94=80md=
0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9:0=
=C2=A0 =C2=A0 0 304.9G=C2=A0 0 raid0=C2=A0</p></div><div><p style=3D"margin=
:0px;font-size:11px;line-height:normal;font-family:Menlo">=C2=A0 =E2=94=9C=
=E2=94=80storage-cache_cdata 252:0=C2=A0 =C2=A0 0 =C2=A0 300G=C2=A0 0 lvm=
=C2=A0 =C2=A0</p></div><div><p style=3D"margin:0px;font-size:11px;line-heig=
ht:normal;font-family:Menlo">=C2=A0 =E2=94=82 =E2=94=94=E2=94=80storage-dat=
a=C2=A0 =C2=A0 =C2=A0 252:3=C2=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 lvm =C2=A0 /=
mnt/local</p></div><div><p style=3D"margin:0px;font-size:11px;line-height:n=
ormal;font-family:Menlo">=C2=A0 =E2=94=94=E2=94=80storage-cache_cmeta 252:1=
=C2=A0 =C2=A0 0 =C2=A0 =C2=A0 1G=C2=A0 0 lvm=C2=A0 =C2=A0</p></div><div><p =
style=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">=
=C2=A0 =C2=A0 =E2=94=94=E2=94=80storage-data=C2=A0 =C2=A0 =C2=A0 252:3=C2=
=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 lvm =C2=A0 /mnt/local</p></div><div><p sty=
le=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">xvdc=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 202:3=
2 =C2=A0 0 152.6G=C2=A0 0 disk =C2=A0</p></div><div><p style=3D"margin:0px;=
font-size:11px;line-height:normal;font-family:Menlo">=E2=94=94=E2=94=80md0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9:0=
=C2=A0 =C2=A0 0 304.9G=C2=A0 0 raid0=C2=A0</p></div><div><p style=3D"margin=
:0px;font-size:11px;line-height:normal;font-family:Menlo">=C2=A0 =E2=94=9C=
=E2=94=80storage-cache_cdata 252:0=C2=A0 =C2=A0 0 =C2=A0 300G=C2=A0 0 lvm=
=C2=A0 =C2=A0</p></div><div><p style=3D"margin:0px;font-size:11px;line-heig=
ht:normal;font-family:Menlo">=C2=A0 =E2=94=82 =E2=94=94=E2=94=80storage-dat=
a=C2=A0 =C2=A0 =C2=A0 252:3=C2=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 lvm =C2=A0 /=
mnt/local</p></div><div><p style=3D"margin:0px;font-size:11px;line-height:n=
ormal;font-family:Menlo">=C2=A0 =E2=94=94=E2=94=80storage-cache_cmeta 252:1=
=C2=A0 =C2=A0 0 =C2=A0 =C2=A0 1G=C2=A0 0 lvm=C2=A0 =C2=A0</p></div><div><p =
style=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">=
=C2=A0 =C2=A0 =E2=94=94=E2=94=80storage-data=C2=A0 =C2=A0 =C2=A0 252:3=C2=
=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 lvm =C2=A0 /mnt/local</p></div><div><p sty=
le=3D"margin:0px;font-size:11px;line-height:normal;font-family:Menlo">xvdg=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 202:9=
6 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 disk =C2=A0</p></div><div><p style=3D"margin=
:0px;font-size:11px;line-height:normal;font-family:Menlo">=E2=94=94=E2=94=
=80storage-data_corig=C2=A0 =C2=A0 252:2=C2=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0=
 lvm=C2=A0 =C2=A0</p></div><div><p style=3D"margin:0px;font-size:11px;line-=
height:normal;font-family:Menlo">=C2=A0 =E2=94=94=E2=94=80storage-data=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 252:3=C2=A0 =C2=A0 0 =C2=A0 1.5T=C2=A0 0 lvm =C2=
=A0 /mnt/local</p></div></blockquote><div><br></div>Thanks,<div>Ciprian<br =
clear=3D"all"><div><div class=3D"gmail_signature"><div dir=3D"ltr"><div><di=
v dir=3D"ltr">--</div><div dir=3D"ltr">Performance Monitoring * Log Analyti=
cs * Search Analytics<br>Solr &amp; Elasticsearch Support *=C2=A0<a href=3D=
"http://sematext.com/" rel=3D"noreferrer" style=3D"color:rgb(17,85,204)" ta=
rget=3D"_blank">http://sematext.com/</a><br></div></div></div></div></div>
</div></div>

--001a11c372f86accbf0524dfaf14--
