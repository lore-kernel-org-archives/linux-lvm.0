Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5IIYwZ2019670
	for <linux-lvm@redhat.com>; Tue, 18 Jun 2013 14:34:58 -0400
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0188.outbound.messaging.microsoft.com [213.199.154.188])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5IIYtg3023978
	for <linux-lvm@redhat.com>; Tue, 18 Jun 2013 14:34:56 -0400
Received: from mail210-db8 (localhost [127.0.0.1])	by
	mail210-db8-R.bigfish.com (Postfix) with ESMTP id B86B6380301	for
	<linux-lvm@redhat.com>; Tue, 18 Jun 2013 18:34:54 +0000 (UTC)
Received: from DB8EHSMHS002.bigfish.com (unknown [10.174.8.229])	by
	mail210-db8.bigfish.com (Postfix) with ESMTP id 37259300047	for
	<linux-lvm@redhat.com>; Tue, 18 Jun 2013 18:34:53 +0000 (UTC)
From: Abhilash Nag <Abhilash.Nag@sandisk.com>
Date: Tue, 18 Jun 2013 18:34:42 +0000
Message-ID: <33AB1F690A60294389CCA50E2EFEE6C22571C934@MILMBXIP02.sdcorp.global.sandisk.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_33AB1F690A60294389CCA50E2EFEE6C22571C934MILMBXIP02sdcor_"
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate ignores volumes with error code:253
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_33AB1F690A60294389CCA50E2EFEE6C22571C934MILMBXIP02sdcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I am trying to create LVM on my drives, but pvcreate -vvv throws up an erro=
r message saying: fails with an error message:/dev/hd*: Skipping: Unrecogni=
sed LVM device type 253.
I am trying to debug if this is a device driver problem or if LVM does not =
recognize the entry of a previously unknown device.
Can you please help.
Thanks in advance.

Regards
Abhilash


________________________________

PLEASE NOTE: The information contained in this electronic mail message is i=
ntended only for the use of the designated recipient(s) named above. If the=
 reader of this message is not the intended recipient, you are hereby notif=
ied that you have received this message in error and that any review, disse=
mination, distribution, or copying of this message is strictly prohibited. =
If you have received this communication in error, please notify the sender =
by telephone or e-mail (as shown above) immediately and destroy any and all=
 copies of this message in your possession (whether hard copies or electron=
ically stored copies).


--_000_33AB1F690A60294389CCA50E2EFEE6C22571C934MILMBXIP02sdcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style>
<!--
@font-face
	{font-family:"MS Mincho"}
@font-face
	{font-family:SimSun}
@font-face
	{font-family:SimSun}
@font-face
	{font-family:Calibri}
@font-face
	{}
@font-face
	{}
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif"}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline}
span.EmailStyle17
	{font-family:"Calibri","sans-serif";
	color:windowtext}
.MsoChpDefault
	{font-family:"Calibri","sans-serif"}
@page WordSection1
	{margin:1.0in 1.0in 1.0in 1.0in}
div.WordSection1
	{}
-->
</style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"">Hi,</span></p>
<p class=3D"MsoNormal"><span style=3D"">&nbsp;</span></p>
<p class=3D"MsoNormal"><span style=3D"">I am trying to create LVM on my dri=
ves, but pvcreate &#8211;vvv throws up an error message saying:</span>
<span style=3D"">fails with an error message:/dev/hd*: Skipping: Unrecognis=
ed LVM device type 253.</span></p>
<p class=3D"MsoNormal"><span style=3D"">I am trying to debug if this is a d=
evice driver problem or if LVM does not recognize the entry of a previously=
 unknown device.</span></p>
<p class=3D"MsoNormal"><span style=3D"">Can you please help.</span></p>
<p class=3D"MsoNormal"><span style=3D"">Thanks in advance.</span></p>
<p class=3D"MsoNormal">&nbsp;</p>
<p class=3D"MsoNormal"><span style=3D"">Regards</span></p>
<p class=3D"MsoNormal"><span style=3D"">Abhilash</span></p>
<p class=3D"MsoNormal">&nbsp;</p>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"2"><br>
PLEASE NOTE: The information contained in this electronic mail message is i=
ntended only for the use of the designated recipient(s) named above. If the=
 reader of this message is not the intended recipient, you are hereby notif=
ied that you have received this
 message in error and that any review, dissemination, distribution, or copy=
ing of this message is strictly prohibited. If you have received this commu=
nication in error, please notify the sender by telephone or e-mail (as show=
n above) immediately and destroy
 any and all copies of this message in your possession (whether hard copies=
 or electronically stored copies).<br>
<br>
</font>
<br clear=3Dall> =

</body>
</html>


--_000_33AB1F690A60294389CCA50E2EFEE6C22571C934MILMBXIP02sdcor_--
