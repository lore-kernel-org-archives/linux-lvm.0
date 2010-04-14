Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3ECmDSl031062
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 08:48:13 -0400
Received: from bay0-omc3-s9.bay0.hotmail.com (bay0-omc3-s9.bay0.hotmail.com
	[65.54.190.147])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3ECm3GA027533
	for <linux-lvm@redhat.com>; Wed, 14 Apr 2010 08:48:03 -0400
Message-ID: <BAY110-W399C2C532647FCEB880794BE100@phx.gbl>
Content-Type: multipart/alternative;
	boundary="_7fab9317-358d-43e2-9f2d-f3a5dd900a6f_"
From: Vickie Troy-McKoy <vtmckoy@hotmail.com>
Date: Wed, 14 Apr 2010 08:34:52 -0400
In-Reply-To: <636CBC54-E5F0-458A-84BF-D70836AC19B3@gmail.com>
References: <BAY110-W326FE139691A6ED05B4D3DBE100@phx.gbl>,
	<20100413222802.0bc5e1ee@faldara>,
	<636CBC54-E5F0-458A-84BF-D70836AC19B3@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on
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

--_7fab9317-358d-43e2-9f2d-f3a5dd900a6f_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi=2C

=20

For the device in question=2C I did: "fdisk -l /dev/md10".  I received the =
following output:

=20

Disk /dev/md10: 73.2 GB=2C 73270689792 bytes
2 heads=2C 4 sectors/track=2C 17888352 cylinders
Units =3D cylinders of 8 * 512 =3D 4096 bytes

Disk /dev/md10 doesn't contain a valid partition table


=20

However=2C when I list out /dev/mpath=2C I get the following:

=20

 ls -lrt
total 0
lrwxrwxrwx  1 root root 7 Mar 26 07:28 mpath3 -> ../dm-8
lrwxrwxrwx  1 root root 8 Mar 26 07:28 mpath3p1 -> ../dm-10
lrwxrwxrwx  1 root root 7 Mar 26 07:28 mpath2p1 -> ../dm-9
lrwxrwxrwx  1 root root 7 Mar 26 07:28 mpath2 -> ../dm-7

=20

How do I interpret this output?  Does it mean the absence of "md10" means t=
hat it resides on the internal drive.  I know that /dev/dm-9 and /dev/dm-10=
 reside on the SAN.  But=2C I guess I was looking for a more concrete way t=
o tie /dev/md10 to the attached devices in /proc/scsi/scsi so that I can de=
finitely say it's on the FUJITSU drive or on the SUN StorEdge 3510.

=20

Thank you=2C


=20



From: linuxmails.lists@gmail.com
To: linux-lvm@redhat.com
Date: Wed=2C 14 Apr 2010 00:36:37 -0500
Subject: Re: [linux-lvm] How do I tell what disk a volume group reside on


Hi


Assuming that you are using MPIO =2C have you compared the output of fdisk =
-l to the dm device names in /dev/mpath?=20


AT


On Tue=2C 13 Apr 2010 20:59:40 -0400
Vickie Troy-McKoy <vtmckoy@hotmail.com> wrote:



Hi All=2C




I have a RedHat4 server connected to a SAN 3510 Array.  On the host

server=2C there are two volume groups set up--root_vg and san_vg.  I'm

assuming that root_vg resides on the internal disks and san_vg on the

SAN.  But=2C how can I check to make sure this is the case?




Thank you=2C











 		 	   		 =20
_________________________________________________________________
The New Busy is not the old busy. Search=2C chat and e-mail from your inbox=
.
http://www.windowslive.com/campaign/thenewbusy?ocid=3DPID28326::T:WLMTAGL:O=
N:WL:en-US:WM_HMP:042010_3=

--_7fab9317-358d-43e2-9f2d-f3a5dd900a6f_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Verdana
}
--></style>
</head>
<body class=3D'hmmessage'>
Hi=2C<BR>
&nbsp=3B<BR>
For the device in question=2C I did: "fdisk -l /dev/md10".&nbsp=3B I receiv=
ed the following output:<BR>
&nbsp=3B<BR>
Disk /dev/md10: 73.2 GB=2C 73270689792 bytes<BR>2 heads=2C 4 sectors/track=
=2C 17888352 cylinders<BR>Units =3D cylinders of 8 * 512 =3D 4096 bytes<BR>
Disk /dev/md10 doesn't contain a valid partition table<BR><BR>
&nbsp=3B<BR>
However=2C when I list out /dev/mpath=2C I get the following:<BR>
&nbsp=3B<BR>
&nbsp=3Bls -lrt<BR>total 0<BR>lrwxrwxrwx&nbsp=3B 1 root root 7 Mar 26 07:28=
 mpath3 -&gt=3B ../dm-8<BR>lrwxrwxrwx&nbsp=3B 1 root root 8 Mar 26 07:28 mp=
ath3p1 -&gt=3B ../dm-10<BR>lrwxrwxrwx&nbsp=3B 1 root root 7 Mar 26 07:28 mp=
ath2p1 -&gt=3B ../dm-9<BR>lrwxrwxrwx&nbsp=3B 1 root root 7 Mar 26 07:28 mpa=
th2 -&gt=3B ../dm-7<BR>
&nbsp=3B<BR>
How do I interpret this output?&nbsp=3B Does it mean the absence of "md10" =
means that it resides on the internal drive.&nbsp=3B I know that /dev/dm-9 =
and /dev/dm-10 reside on the SAN.&nbsp=3B But=2C I guess I was looking for =
a more concrete way to tie /dev/md10 to the attached devices in /proc/scsi/=
scsi so that I can definitely say it's on the FUJITSU drive or on the SUN S=
torEdge 3510.<BR>
&nbsp=3B<BR>
Thank you=2C<BR><BR><BR>&nbsp=3B
<BR>
<HR id=3DstopSpelling>
From: linuxmails.lists@gmail.com<BR>To: linux-lvm@redhat.com<BR>Date: Wed=
=2C 14 Apr 2010 00:36:37 -0500<BR>Subject: Re: [linux-lvm] How do I tell wh=
at disk a volume group reside on<BR><BR>
<DIV>Hi</DIV>
<DIV><BR></DIV>
<DIV>Assuming that you are using MPIO =2C have you compared the output of f=
disk -l to the dm device names in /dev/mpath?&nbsp=3B</DIV>
<DIV><BR></DIV>
<DIV>AT</DIV>
<DIV><BR></DIV>
<DIV><SPAN>On Tue=2C 13 Apr 2010 20:59:40 -0400</SPAN><BR><SPAN>Vickie Troy=
-McKoy &lt=3B<A href=3D"mailto:vtmckoy@hotmail.com"><A href=3D"mailto:vtmck=
oy@hotmail.com">vtmckoy@hotmail.com</A></A>&gt=3B wrote:</SPAN><BR><SPAN></=
SPAN><BR>
<BLOCKQUOTE><SPAN></SPAN></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>Hi All=2C</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><BR><SPAN></SPAN></BLOCKQUOTE>
<BLOCKQUOTE><SPAN></SPAN></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>I have a RedHat4 server connected to a SAN 3510 Array. &n=
bsp=3BOn the host</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>server=2C there are two volume groups set up--root_vg and=
 san_vg. &nbsp=3BI'm</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>assuming that root_vg resides on the internal disks and s=
an_vg on the</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>SAN. &nbsp=3BBut=2C how can I check to make sure this is =
the case?</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><BR><SPAN></SPAN></BLOCKQUOTE>
<BLOCKQUOTE><SPAN></SPAN></BLOCKQUOTE>
<BLOCKQUOTE><SPAN>Thank you=2C</SPAN><BR></BLOCKQUOTE>
<BLOCKQUOTE><SPAN></SPAN><BR></BLOCKQUOTE><BR>
<DIV><BR></DIV>
<DIV>
<DIV><BR></DIV></DIV></DIV>
<BLOCKQUOTE>
<BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE>
<DIV></DIV> 		 	   		  <br /><hr />The New Busy is not the old busy. Search=
=2C chat and e-mail from your inbox. <a href=3D'http://www.windowslive.com/=
campaign/thenewbusy?ocid=3DPID28326::T:WLMTAGL:ON:WL:en-US:WM_HMP:042010_3'=
 target=3D'_new'>Get started.</a></body>
</html>=

--_7fab9317-358d-43e2-9f2d-f3a5dd900a6f_--
