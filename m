Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7G4k9NA004650
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 00:46:09 -0400
Received: from smtp-server.rit.edu (sc3app27.rit.edu [129.21.35.56])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7G4jxrS025754
	for <linux-lvm@redhat.com>; Mon, 16 Aug 2010 00:45:59 -0400
Received: from conversion-daemon.smtp-server.rit.edu by smtp-server.rit.edu
	(PMDF V6.3-x14 #31420) id <0L7800K01AKN56@smtp-server.rit.edu> for
	linux-lvm@redhat.com; Mon, 16 Aug 2010 00:45:59 -0400 (EDT)
Received: from mail-qy0-f179.google.com
	(mail-qy0-f179.google.com [209.85.216.179])
	by smtp-server.rit.edu (PMDF V6.3-x14 #31420)
	with ESMTP id <0L78003N1AKMYF@smtp-server.rit.edu> for
	linux-lvm@redhat.com; Mon, 16 Aug 2010 00:45:59 -0400 (EDT)
Received: by qyk9 with SMTP id 9so2045679qyk.17 for <linux-lvm@redhat.com>;
	Sun, 15 Aug 2010 21:45:58 -0700 (PDT)
Date: Mon, 16 Aug 2010 00:45:49 -0400
From: Andrew Ragone <ajr9166@rit.edu>
Sender: Andrew Ragone <ajr9166@rit.edu>
Message-id: <0b2501cb3cfd$e7c263e0$b7472ba0$@rit.edu>
MIME-version: 1.0
Content-type: multipart/alternative;
	boundary="Boundary_(ID_Id14YGoQFc9RF1o9QxlFcQ)"
Content-language: en-us
Subject: [linux-lvm] Partition Recovery in LVM
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

This is a multipart message in MIME format.

--Boundary_(ID_Id14YGoQFc9RF1o9QxlFcQ)
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT

I've been searching like crazy to find an answer to this question to no
avail: when you restore a backup of LVM does the backup contain partition
table information as well? 

 

I recently recovered an LVM that had a partition inside of it, but it has
since been unable to mount. Most recovery utilities such as TestDisk will
only find the LVM so I'm unsure of how to proceed and "recover" the
partition. 

 

-Andrew


--Boundary_(ID_Id14YGoQFc9RF1o9QxlFcQ)
Content-type: text/html; charset=us-ascii
Content-transfer-encoding: 7BIT

<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><head><meta http-equiv=Content-Type content="text/html; charset=us-ascii"><meta name=Generator content="Microsoft Word 14 (filtered medium)"><style><!--
/* Font Definitions */
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext="edit">
<o:idmap v:ext="edit" data="1" />
</o:shapelayout></xml><![endif]--></head><body lang=EN-US link=blue vlink=purple><div class=WordSection1><p class=MsoNormal>I&#8217;ve been searching like crazy to find an answer to this question to no avail: when you restore a backup of LVM does the backup contain partition table information as well? <o:p></o:p></p><p class=MsoNormal><o:p>&nbsp;</o:p></p><p class=MsoNormal>I recently recovered an LVM that had a partition inside of it, but it has since been unable to mount. Most recovery utilities such as TestDisk will only find the LVM so I&#8217;m unsure of how to proceed and &#8220;recover&#8221; the partition. <o:p></o:p></p><p class=MsoNormal><o:p>&nbsp;</o:p></p><p class=MsoNormal>-Andrew<o:p></o:p></p></div></body></html>

--Boundary_(ID_Id14YGoQFc9RF1o9QxlFcQ)--
