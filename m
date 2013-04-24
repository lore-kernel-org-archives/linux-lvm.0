Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3O0QReg000904
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2013 20:26:27 -0400
Received: from slim1.bitblock.com (ns1.bitblock.com [66.199.170.4])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3O0QO8v004402
	for <linux-lvm@redhat.com>; Tue, 23 Apr 2013 20:26:25 -0400
From: "mitch@bitblock.net" <mitch@bitblock.net>
Date: Wed, 24 Apr 2013 00:26:22 +0000
Message-ID: <F03A2314B1E91F49833DC41B8321052E097B64F6@ES3.hs.planbcorp.net>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_F03A2314B1E91F49833DC41B8321052E097B64F6ES3hsplanbcorpn_"
MIME-Version: 1.0
Subject: [linux-lvm] LVM recovery / Xen / Testdisk
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

--_000_F03A2314B1E91F49833DC41B8321052E097B64F6ES3hsplanbcorpn_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello - first post here - I was referred to this group from xen-users.

I started on xen-users, and then went to the testdisk forum. My issue is on=
e of my own causing but has lead to the discovery of a problem I'm trying t=
o understand / resolve in interpreting lvm structure...

The full history is here:

Xen-users http://www.gossamer-threads.com/lists/xen/users/278066
Testdisk http://forum.cgsecurity.org/phpBB3/trying-to-recover-windows-ntfs-=
disk-from-xen-hba-lvm-vol-t2252.html

In short, I allowed xen to reinitialize an HBA storage repository. I lost a=
n important VM / some data which I thought was backed up.

I have used photorec to recover VHD files, and some of them work / can be r=
ead by remounting them in xen or by using a tool like winimage.

But some of them are damaged. I want to hopefully recover a few files from =
these LVMs

In some cases I suspect the LVM may be fragmented and testdisk may have rec=
overed separate lvm files when there was really supposed to be a single fil=
e.

I'm wondering if there is any way to stitch them back together. Testdisk is=
 normally able to pull partition table data and then navigate through a dam=
aged hard drive / partition / disk image to allow recovery of files and fol=
ders.

In the case of my VHD files however it doesn't work. I expect it's got some=
thing to do with the way the VHD stores information like the partition tabl=
e etc. Testdisk doesn't see a normal partition table / is unable to recogni=
ze the partition and when I try to force it too my options for recovery are=
 limited.

I've been seeking help from the testdisk forum - but can anyone confirm tha=
t lvm2 is what xen is using?

Are there any other recovery tools I should be aware of for this scenario p=
articularly anything on recovering from damaged vhd's or relinking parts of=
 vhd's to their parents, etc.?

Any documentation / pointers would be appreciated! If there is an alternati=
ve to using testdisk / treating this like a "hardware failure" and more lik=
e a logical reconstruction that would be great, however my attempt at googl=
ing / readking lvm2 command man pages didn't show me anything obvious...

Thank you in advance!!

Thank you!

Mitch.

--_000_F03A2314B1E91F49833DC41B8321052E097B64F6ES3hsplanbcorpn_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Arial","sans-serif";
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-CA" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Hello &#8211; first post here &#8211; I wa=
s referred to this group from xen-users.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">I started on xen-users, and then went to t=
he testdisk forum. My issue is one of my own causing but has lead to the di=
scovery of a problem I&#8217;m trying to understand / resolve
 in interpreting lvm structure...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">The full history is here:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Xen-users
<a href=3D"http://www.gossamer-threads.com/lists/xen/users/278066">http://w=
ww.gossamer-threads.com/lists/xen/users/278066</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Testdisk
<a href=3D"http://forum.cgsecurity.org/phpBB3/trying-to-recover-windows-ntf=
s-disk-from-xen-hba-lvm-vol-t2252.html">
http://forum.cgsecurity.org/phpBB3/trying-to-recover-windows-ntfs-disk-from=
-xen-hba-lvm-vol-t2252.html</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">In short, I allowed xen to reinitialize an=
 HBA storage repository. I lost an important VM / some data which I thought=
 was backed up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">I have used photorec to recover VHD files,=
 and some of them work / can be read by remounting them in xen or by using =
a tool like winimage.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">But some of them are damaged. I want to ho=
pefully recover a few files from these LVMs<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">In some cases I suspect the LVM may be fra=
gmented and testdisk may have recovered separate lvm files when there was r=
eally supposed to be a single file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">I&#8217;m wondering if there is any way to=
 stitch them back together. Testdisk is normally able to pull partition tab=
le data and then navigate through a damaged hard drive / partition
 / disk image to allow recovery of files and folders.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">In the case of my VHD files however it doe=
sn&#8217;t work. I expect it&#8217;s got something to do with the way the V=
HD stores information like the partition table etc. Testdisk doesn&#8217;t
 see a normal partition table / is unable to recognize the partition and wh=
en I try to force it too my options for recovery are limited.<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">I&#8217;ve been seeking help from the test=
disk forum &#8211; but can anyone confirm that lvm2 is what xen is using?<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Are there any other recovery tools I shoul=
d be aware of for this scenario particularly anything on recovering from da=
maged vhd&#8217;s or relinking parts of vhd&#8217;s to their parents,
 etc.?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Any documentation / pointers would be appr=
eciated! If there is an alternative to using testdisk / treating this like =
a &#8220;hardware failure&#8221; and more like a logical reconstruction
 that would be great, however my attempt at googling / readking lvm2 comman=
d man pages didn&#8217;t show me anything obvious&#8230;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Thank you in advance!!<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Thank you!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:8.0pt;font-family:&quot;Ari=
al&quot;,&quot;sans-serif&quot;">Mitch.<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_F03A2314B1E91F49833DC41B8321052E097B64F6ES3hsplanbcorpn_--
