Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5SLqQ5f008652
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 17:52:27 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5SLqOYE003556
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 17:52:24 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 252CD1823E
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 23:52:22 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id GzWhN9qBFxs7 for <linux-lvm@redhat.com>;
	Thu, 28 Jun 2007 23:52:07 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 1E0141823B
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 23:52:06 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id B059A14C1CD
	for <linux-lvm@redhat.com>; Thu, 28 Jun 2007 23:52:05 +0200 (CEST)
Message-ID: <46842D81.8090501@vdberg.org>
Date: Thu, 28 Jun 2007 23:52:01 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Serious problem and I don't know where to turn.
References: <001201c7b9a3$4f0da2d0$ed28e870$@net>
In-Reply-To: <001201c7b9a3$4f0da2d0$ed28e870$@net>
Content-Type: multipart/alternative;
	boundary="------------030306060400020200010109"
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

This is a multi-part message in MIME format.
--------------030306060400020200010109
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

WarlockD wrote:
> [root@server archive]# vgscan
>
>   Reading all physical volumes.  This may take a while...
>
>   Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1
> not /dev/sda1
>

How did this happen? Why is the PV magic number on /dev/sdb1 exactly the
same as on /dev/sda1?

> [root@server archive]# lvscan
>
>   Found duplicate PV 5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb: using /dev/sdb1
> not /dev/sda1
>
>   ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit
>
>   ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
>
> [root@server archive]#
>

I looks like your lvs are up. Can't you just mount them?

Sincerely,

Richard van den Berg


--------------030306060400020200010109
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
WarlockD wrote:
<blockquote cite="mid:001201c7b9a3$4f0da2d0$ed28e870$@net" type="cite">
  <meta http-equiv="Content-Type" content="text/html; ">
  <meta name="Generator" content="Microsoft Word 12 (filtered medium)">
  <style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:"Cambria Math";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
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
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.Section1
	{page:Section1;}
-->
  </style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1" />
 </o:shapelayout></xml><![endif]-->
  <div class="Section1">[root@server archive]# vgscan<o:p></o:p>
  <p class="MsoNormal">&nbsp; Reading all physical volumes.&nbsp; This may take a
while...<o:p></o:p></p>
  <p class="MsoNormal">&nbsp; Found duplicate PV
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1</p>
  </div>
</blockquote>
<br>
How did this happen? Why is the PV magic number on /dev/sdb1 exactly
the same as on /dev/sda1?<br>
<br>
<blockquote cite="mid:001201c7b9a3$4f0da2d0$ed28e870$@net" type="cite">
  <div class="Section1">
  <p class="MsoNormal">[root@server archive]# lvscan<o:p></o:p></p>
  <p class="MsoNormal">&nbsp; Found duplicate PV
5Up3QCLOFKXTDA1OHoWUfMrYne4SdXmb:
using /dev/sdb1 not /dev/sda1<o:p></o:p></p>
  <p class="MsoNormal">&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol00' [147.00 GB] inherit<o:p></o:p></p>
  <p class="MsoNormal">&nbsp;
ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit<o:p></o:p></p>
  <p class="MsoNormal">[root@server archive]#</p>
  </div>
</blockquote>
<br>
I looks like your lvs are up. Can't you just mount them?<br>
<br>
Sincerely,<br>
<pre class="moz-signature" cols="9999">Richard van den Berg</pre>
</body>
</html>

--------------030306060400020200010109--
