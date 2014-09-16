Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8GHn3QS005445
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2014 13:49:03 -0400
Received: from mail5.mckesson.com (mail5.mckesson.com [143.112.68.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8GHmxWX021744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 16 Sep 2014 13:49:00 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Date: Tue, 16 Sep 2014 17:46:41 +0000
Message-ID: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6@NDHEP50004.na.corp.mckesson.com>
References: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
In-Reply-To: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6NDHEP50004nacor_"
MIME-Version: 1.0
Subject: Re: [linux-lvm] LE to PE mapping
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6NDHEP50004nacor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello:
                I have only received 1 direct reply about this. Nobody else=
 has anything to add?

                Another question: Where is the mapping stored if I wanted t=
o write a program to display it the way I want?

-------------------------
Jackson C. Allen
McKesson Provider Technologies
5995 Windward Parkway
Alpharetta, GA 30005
(404) 338-2023
Jack.Allen@McKesson.com<mailto:Jack.Allen@McKesson.com>
Confidentiality Notice: This e-mail message, including any attachments, is =
for the sole use of the intended recipient(s) and may contain confidential =
and privileged information.  Any unauthorized review, use, disclosure or di=
stribution is prohibited.  If you are not the intended recipient, please co=
ntact the sender by reply e-mail and destroy all copies of the original mes=
sage.




From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On=
 Behalf Of Allen, Jack
Sent: Friday, September 12, 2014 6:02 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] LE to PE mapping

Hello:
        I need to find a command on RHEL 5.8 that will show each LE to PE m=
apping for a LV. All the command I have looked at so far (lvs, pvs, lvdispl=
ay and pvdisplay) using various option only show the start PE and how many.

        I am dealing with an SAN read performance problem and some think it=
 is the way the LE are mapped to the PE that is causing more I/O to take pl=
ace on specific disk. The database application does reads and writes direct=
ly to the LV, there is no file system with files. The database block size i=
s 8k and for the most part is very random across many LVs.

        The configuration is a lot bigger than I am going to provide inform=
ation here to make it a little simpler as to what I am trying to find out.

Let's assume 4 LUNs (PV) at 10G each.
The PVs are put in vg01 and 4 LVs are created using the following commands:

lvcreate -L2g -i4 -n lv00 vg01
lvcreate -L2g -i4 -n lv01 vg01
lvcreate -L2g -i4 -n lv02 vg01
lvcreate -L2g -i4 -n lv03 vg01

        The strip size defaulted to 16K per the lvdisplay command. When doi=
ng the commands to list the LE and PE information it will show that lv00 st=
arts at PE 0 on each PV and then what ever number of PEs it takes to make 2=
g across the PVs. Let's say 4 to make it simple, so that would be 16 in all=
. Now were the PE allocated like:

LE0     ->      PV0 PE0
LE1     ->      PV1 PE0
LE2     ->      PV2 PE0
LE3     ->      PV3 PE0
LE4     ->      PV0 PE1
LE5     ->      PV1 PE1
~~~     ~~      ~~~ ~~~
LE15    ->      PV3 PE3

Or were they allocated like:

LE0     ->      PV0 PE0
LE1     ->      PV0 PE1
LE2     ->      PV0 PE2
LE3     ->      PV0 PE3
LE4     ->      PV1 PE0
LE5     ->      PV1 PE1
~~~     ~~      ~~~ ~~~
LE15    ->      PV3 PE3

        In this simple example it does not make a lot of difference, but sa=
y there were 512 PEs then it does as far as to which PV reads are done from=
 with random reads. This is a database application with many users access d=
ifferent parts of the data is what makes it random and there could be many =
doing reads at the same time. During backups the blocks (PE) will be read s=
equential and if the allocation is done the second way then many reads will=
 be done on the first PV and none on the other than the then second PV and =
non on the others and so on.

        Something else I need some clarification on is the PE size of 4MB a=
nd the strip size of 16K. Are the PEs not allocated as shown above in eithe=
r example?

        Are the PE allocated in 4MB chunks?

        Then what does the 16K do?

-------------------------
Jackson C. Allen
McKesson Provider Technologies
5995 Windward Parkway
Alpharetta, GA 30005
(404) 338-2023
Jack.Allen@McKesson.com<mailto:Jack.Allen@McKesson.com>
Confidentiality Notice: This e-mail message, including any attachments, is =
for the sole use of the intended recipient(s) and may contain confidential =
and privileged information.  Any unauthorized review, use, disclosure or di=
stribution is prohibited.  If you are not the intended recipient, please co=
ntact the sender by reply e-mail and destroy all copies of the original mes=
sage.





--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6NDHEP50004nacor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello:<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have on=
ly received 1 direct reply about this. Nobody else has anything to add?<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Another q=
uestion: Where is the mapping stored if I wanted to write a program to disp=
lay it the way I want?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quo=
t;sans-serif&quot;;color:blue">-------------------------</span><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">Jackson C. Allen</span><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:blue"=
>
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">McKesson Provider Technologies</span><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quo=
t;;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">5995 Windward Parkway</span><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:=
blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">Alpharetta, GA 30005</span><span style=3D"font=
-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:b=
lue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">(404) 338-2023</span><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue"><a href=3D"mailto:Jack.Allen@McKesson.com">Jac=
k.Allen@McKesson.com</a>
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;;color:blue"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:red">Confidentiality Notice: This e-=
mail message, including any attachments, is for the sole use of the intende=
d recipient(s) and may contain confidential and privileged
 information.&nbsp; Any unauthorized review, use, disclosure or distributio=
n is prohibited.&nbsp; If you are not the intended recipient, please contac=
t the sender by reply e-mail and destroy all copies of the original message=
.</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot=
;sans-serif&quot;;color:blue"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> linux-lv=
m-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
<b>On Behalf Of </b>Allen, Jack<br>
<b>Sent:</b> Friday, September 12, 2014 6:02 PM<br>
<b>To:</b> linux-lvm@redhat.com<br>
<b>Subject:</b> [linux-lvm] LE to PE mapping<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">Hello:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; I need to find a command on RHEL 5.8 that will show each LE to PE mappi=
ng for a LV. All the command I have looked at so far (lvs, pvs, lvdisplay a=
nd pvdisplay) using
 various option only show the start PE and how many.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; I am dealing with an SAN read performance problem and some think it is =
the way the LE are mapped to the PE that is causing more I/O to take place =
on specific disk.
 The database application does reads and writes directly to the LV, there i=
s no file system with files. The database block size is 8k and for the most=
 part is very random across many LVs.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; The configuration is a lot bigger than I am going to provide informatio=
n here to make it a little simpler as to what I am trying to find out.<o:p>=
</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">Let's assume 4 LUNs (PV) at 10G each.<o=
:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">The PVs are put in vg01 and 4 LVs are c=
reated using the following commands:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">lvcreate -L2g -i4 -n lv00 vg01<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">lvcreate -L2g -i4 -n lv01 vg01<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">lvcreate -L2g -i4 -n lv02 vg01<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">lvcreate -L2g -i4 -n lv03 vg01<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; The strip size defaulted to 16K per the lvdisplay command. When doing t=
he commands to list the LE and PE information it will show that lv00 starts=
 at PE 0 on each
 PV and then what ever number of PEs it takes to make 2g across the PVs. Le=
t's say 4 to make it simple, so that would be 16 in all. Now were the PE al=
located like:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE0&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE1&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE2&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV2 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE3&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV3 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE4&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE5&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">~~~&nbsp;&nbsp;&nbsp;&nbsp; ~~&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ~~~ ~~~<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE15&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; PV3 PE3<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">Or were they allocated like:<o:p></o:p>=
</span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE0&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE1&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE2&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE2<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE3&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE3<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE4&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE0<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE5&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE1<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">~~~&nbsp;&nbsp;&nbsp;&nbsp; ~~&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; ~~~ ~~~<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">LE15&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; PV3 PE3<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; In this simple example it does not make a lot of difference, but say th=
ere were 512 PEs then it does as far as to which PV reads are done from wit=
h random reads.
 This is a database application with many users access different parts of t=
he data is what makes it random and there could be many doing reads at the =
same time. During backups the blocks (PE) will be read sequential and if th=
e allocation is done the second
 way then many reads will be done on the first PV and none on the other tha=
n the then second PV and non on the others and so on.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Something else I need some clarification on is the PE size of 4MB and t=
he strip size of 16K. Are the PEs not allocated as shown above in either ex=
ample?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Are the PE allocated in 4MB chunks?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Then what does the 16K do?<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:blue">-------------------------</s=
pan><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;s=
ans-serif&quot;;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">Jackson C. Allen</span><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:blue"=
>
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">McKesson Provider Technologies</span><span sty=
le=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quo=
t;;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">5995 Windward Parkway</span><span style=3D"fon=
t-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:=
blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">Alpharetta, GA 30005</span><span style=3D"font=
-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:b=
lue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,&quot;=
sans-serif&quot;;color:blue">(404) 338-2023</span><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:blue">
<br>
</span><span style=3D"font-size:10.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;;color:blue"><a href=3D"mailto:Jack.Allen@McKesson.com"><=
span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Jack.Al=
len@McKesson.com</span></a></span><span style=3D"font-size:10.0pt;font-fami=
ly:&quot;Arial&quot;,&quot;sans-serif&quot;;color:blue">
</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quo=
t;sans-serif&quot;"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:red">Confidentiality Notice: This e-=
mail message, including any attachments, is for the sole use of the intende=
d recipient(s) and may contain confidential and privileged
 information.&nbsp; Any unauthorized review, use, disclosure or distributio=
n is prohibited.&nbsp; If you are not the intended recipient, please contac=
t the sender by reply e-mail and destroy all copies of the original message=
.</span><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&qu=
ot;sans-serif&quot;"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">&nbsp;</span><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;=
"><o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;">&nbsp;<o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815085E6NDHEP50004nacor_--
