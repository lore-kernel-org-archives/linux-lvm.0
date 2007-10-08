Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l98DYihj001504
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 09:34:44 -0400
Received: from bay0-omc2-s41.bay0.hotmail.com (bay0-omc2-s41.bay0.hotmail.com
	[65.54.246.177])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l98DYWAl026384
	for <linux-lvm@redhat.com>; Mon, 8 Oct 2007 09:34:33 -0400
Message-ID: <BAY119-W8033C29888F079BA14B57A5A40@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_326b20e3-49ea-403b-aab0-6e3ee7d03a27_"
From: NTOUGHE GUY-SERGE <ntoughe@hotmail.com>
Subject: RE: [linux-lvm] Problem resizing partition
Date: Mon, 8 Oct 2007 13:34:27 +0000
In-Reply-To: <95fec8860710080629h773abe69i9f5f367f80e2488f@mail.gmail.com>
References: <95fec8860710080629h773abe69i9f5f367f80e2488f@mail.gmail.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--_326b20e3-49ea-403b-aab0-6e3ee7d03a27_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


hi,=20
According to your  description you want to decrease a partition, so you 'll=
 need to umount your file system an d change the size, with fdisk or gparte=
d.
After that remount your partition.
ntoughe@hotmail.com


Date: Mon, 8 Oct 2007 10:29:34 -0300From: guillermo.marraco@gmail.comTo: li=
nux-lvm@redhat.comSubject: [linux-lvm] Problem resizing partitionHello. I h=
ave recently installed a CentOS 5 Linux distribution. Is a free version of =
Red Hat Enterprise.I are a Linux Newbie.The Linux installer DVD does not li=
ked the 20 Gb ext3 partition I have created (It was saying than now enough =
space was available), so I tell him to automatically configure the partitio=
ns and filesystem. The Installer formatted and created a 32 Mb "boot" parti=
tion, and a 20 Gb "unknown" partition (as is found By gparted software).I n=
eed to reduce this "unknown" partition by 8 Mb, (to avoid writing the last =
8 Mb, since is probably that the PC vendor, has utilized this space to hide=
 information, that windows use to recognizing that is "genuine", (don't bas=
h me about windows, I have not purchased that machine, I are utilizing that=
 machine to experiment and learn Linux, because I want latter to operate a =
cluster with that OS, and I can't do experiments on the cluster, like learn=
ing to resizing partitions) I have not idea what file system is, and what t=
ools allow to resize that partition. I Have installed gparted (#yum install=
 gparted), since I was told that is the "Partition Magic" of Linux.but It l=
ooks like this file system is rare, because is for cluster designed. Lookin=
g on Internet, I have found that probably this system utilizes clvm (no ide=
a), so I have found this mail list, and write for help.can you help me?PD:P=
lease, excuse my bad grammar, I never studied English.=20
_________________________________________________________________
Explore the seven wonders of the world
http://search.msn.com/results.aspx?q=3D7+wonders+world&mkt=3Den-US&form=3DQ=
BRE=

--_326b20e3-49ea-403b-aab0-6e3ee7d03a27_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
.hmmessage P
{
margin:0px;
padding:0px
}
body.hmmessage
{
FONT-SIZE: 10pt;
FONT-FAMILY:Tahoma
}
</style>
</head>
<body class=3D'hmmessage'>
<BR>hi, <BR>
According to your&nbsp; description you want to decrease a partition, so yo=
u 'll need to umount your file system an d change the size, with fdisk or g=
parted.<BR>
After that remount your partition.<BR><BR>
<DIV><BR>ntoughe@hotmail.com</DIV><BR><BR>
<BLOCKQUOTE>
<HR>
Date: Mon, 8 Oct 2007 10:29:34 -0300<BR>From: guillermo.marraco@gmail.com<B=
R>To: linux-lvm@redhat.com<BR>Subject: [linux-lvm] Problem resizing partiti=
on<BR><BR>Hello. I have recently installed a CentOS 5 Linux distribution. I=
s a free version of Red Hat Enterprise.<BR><BR>I are a Linux Newbie.<BR><BR=
>The Linux installer DVD does not liked the 20 Gb ext3 partition I have cre=
ated (It was saying than now enough space was available), so I tell him to =
automatically configure the partitions and filesystem. <BR><BR>The Installe=
r formatted and created a 32 Mb "boot" partition, and a 20 Gb "unknown" par=
tition (as is found By gparted software).<BR><BR>I need to reduce this "unk=
nown" partition by 8 Mb, (to avoid writing the last 8 Mb, since is probably=
 that the PC vendor, has utilized this space to hide information, that wind=
ows use to recognizing that is "genuine", (don't bash me about windows, I h=
ave not purchased that machine, I are utilizing that machine to experiment =
and learn Linux, because I want latter to operate a cluster with that OS, a=
nd I can't do experiments on the cluster, like learning to resizing partiti=
ons) <BR><BR>I have not idea what file system is, and what tools allow to r=
esize that partition. I Have installed gparted (#yum install gparted), sinc=
e I was told that is the "Partition Magic" of Linux.<BR>but It looks like t=
his file system is rare, because is for cluster designed. <BR><BR>Looking o=
n Internet, I have found that probably this system utilizes clvm (no idea),=
 so I have found this mail list, and write for help.<BR><BR>can you help me=
?<BR><BR>PD:Please, excuse my bad grammar, I never studied English. <BR></B=
LOCKQUOTE><br /><hr />Explore the seven wonders of the world <a href=3D'htt=
p://search.msn.com/results.aspx?q=3D7+wonders+world&mkt=3Den-US&form=3DQBRE=
' target=3D'_new'>Learn more!</a></body>
</html>=

--_326b20e3-49ea-403b-aab0-6e3ee7d03a27_--
