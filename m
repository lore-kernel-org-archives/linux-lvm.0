Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5T6OenJ007987
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 02:24:40 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5T6OcAs018084
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 02:24:38 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id 79CF21823E
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 08:24:36 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id Uhg29VY9Ydep for <linux-lvm@redhat.com>;
	Fri, 29 Jun 2007 08:23:06 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 9B9711823B
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 08:23:05 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id 8124214C2C1
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 08:23:04 +0200 (CEST)
Message-ID: <4684A547.8080302@vdberg.org>
Date: Fri, 29 Jun 2007 08:23:03 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Serious problem and I don't know where to turn.
References: <001201c7b9a3$4f0da2d0$ed28e870$@net> <46842D81.8090501@vdberg.org>
	<001601c7b9f6$8ff21990$afd64cb0$@net>
In-Reply-To: <001601c7b9f6$8ff21990$afd64cb0$@net>
Content-Type: multipart/alternative;
	boundary="------------000209070906030809080604"
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
--------------000209070906030809080604
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

WarlockD wrote:
>
> [root@server ~]# lvscan -a
>
>   ACTIVE            '/dev/VolGroup00/LogVol00' [147.00 GB] inherit
>
>   ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
>
> [root@server ~]# vgscan
>
>   Reading all physical volumes.  This may take a while...
>
>   Found volume group "VolGroup00" using metadata type lvm2
>
>   Found volume group "ANIME" using metadata type lvm2

So the vg "ANIME" is found, but is not activated? That kind of makes
sense because it is missing the pv on the deleted /dev/sdb2 partition.
According to the vgreduce man pages you can:

vgreduce --removemissing ANIME

to remove all  missing physical volumes from the volume group and make
the volume group consistent again. It's a good idea to run this option
with --test  first to find out what it would remove before running it
for real. There is also "--partial" option you can use to activate vgs
and lvs even if they are missing data. Read the man pages and be very
careful before you proceed.

> Basicly, I have a volume called “ANIME-logical” I am trying to
> restore, but I don’t have the metadata.  Is there a way I can get to it?
>

Without the metadata that's going to be tough. If the filesystem is all
continuous on your RAID5 partition, technically you should be able to
mount it if you can create a device pointing at the right start, and
with the right size. Good luck figuring that out.

Another approach could be to recreate the /dev/sdb2 partition in exactly
the same way you did before. The metadata might still be there, and the
vg might come up.

Sincerely,

Richard van den Berg

--------------000209070906030809080604
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=UTF-8" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
WarlockD wrote:<br>
<blockquote type="cite">
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);">[root@server
~]# lvscan -a<o:p></o:p></span></p>
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);"> 
ACTIVE           
'/dev/VolGroup00/LogVol00' [147.00 GB] inherit<o:p></o:p></span></p>
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);"> 
ACTIVE           
'/dev/VolGroup00/LogVol01' [1.94 GB] inherit<o:p></o:p></span></p>
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);">[root@server
~]# vgscan<o:p></o:p></span></p>
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);">  Reading
all physical
volumes.  This may take a while...<o:p></o:p></span></p>
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);">  Found
volume group
"VolGroup00" using metadata type lvm2<o:p></o:p></span></p>
  <span style="color: rgb(31, 73, 125);">  Found volume group
"ANIME" using metadata type lvm2</span></blockquote>
<br>
So the vg "ANIME" is found, but is not activated? That kind of makes
sense because it is missing the pv on the deleted /dev/sdb2 partition.
According to the vgreduce man pages you can:<br>
<br>
vgreduce --removemissing ANIME<br>
<br>
to remove all  missing physical volumes from the volume group and make
the volume group consistent again. It's a good idea to run this option
with --test  first to find out what it would remove before running it
for real. There is also "--partial" option you can use to activate vgs
and lvs even if they are missing data. Read the man pages and be very
careful before you proceed.<br>
<br>
<blockquote cite="mid:001601c7b9f6$8ff21990$afd64cb0$@net" type="cite">
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
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	color:black;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";
	color:black;}
span.EmailStyle17
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:Consolas;
	color:black;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
  <div class="Section1">
  <p class="MsoNormal"><span style="color: rgb(31, 73, 125);"><o:p></o:p>Basicly,
I have a volume called “ANIME-logical”
I am trying to restore, but I don’t have the metadata.  Is there a
way I can get to it?</span></p>
  </div>
</blockquote>
<br>
Without the metadata that's going to be tough. If the filesystem is all
continuous on your RAID5 partition, technically you should be able to
mount it if you can create a device pointing at the right start, and
with the right size. Good luck figuring that out.<br>
<br>
Another approach could be to recreate the /dev/sdb2 partition in
exactly the same way you did before. The metadata might still be there,
and the vg might come up.<br>
<br>
Sincerely,<br>
<br>
Richard van den Berg<br>
</body>
</html>

--------------000209070906030809080604--
