Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3336CKr019057
	for <linux-lvm@redhat.com>; Thu, 2 Apr 2009 23:06:12 -0400
Received: from mailfilter1.une.edu.au (mailfilter1.une.edu.au [129.180.1.41])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3335ppB004628
	for <linux-lvm@redhat.com>; Thu, 2 Apr 2009 23:05:52 -0400
Received: from tirisfal.ad.une.edu.au (localhost [127.0.0.1])
	by mailfilter1.une.edu.au (Spam Firewall) with ESMTP id C797B1398D1F
	for <linux-lvm@redhat.com>; Fri,  3 Apr 2009 14:05:46 +1100 (EST)
Received: from tirisfal.ad.une.edu.au (tirisfal.une.edu.au [129.180.3.4]) by
	mailfilter1.une.edu.au with ESMTP id r55fldkZlsaUYGT5 for
	<linux-lvm@redhat.com>; Fri, 03 Apr 2009 14:05:46 +1100 (EST)
From: David Nillesen <dnillese@une.edu.au>
Date: Fri, 3 Apr 2009 14:05:44 +1100
Message-ID: <3FAFA1227D473347B886B2E5476C8395EC4AD25363@MAILSTORE.ad.une.edu.au>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3FAFA1227D473347B886B2E5476C8395EC4AD25363MAILSTOREadun_"
MIME-Version: 1.0
Subject: [linux-lvm] pvmove questions
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
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

--_000_3FAFA1227D473347B886B2E5476C8395EC4AD25363MAILSTOREadun_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Good morning,

                I've been trying to hunt down some answers to a few questio=
ns about pvmove to no avail. If I can get answers here I'll volunteer to up=
date the wiki with them.

                A little detail first.

                I'm trying to move a volume used for user email from one ba=
ckend system to another. The volume is 400GB in size. It is currently on a =
9 spindle nSeries/NetApp filer shared out as a lun over fibre channel. I am=
 trying to move the extents to our new SAN node, an EVA4400 with a 8 disk 3=
00GB 15k DP FC disk group also shared as an FC lun. Both disk systems have =
no contention for IO's at the moment.
                The server is accessing the system via a 2Gbit Qlogic FC HB=
A over a Qlogic SANBox 5602 switch stack.
                There is plenty of spare overhead in the infrastructure at =
the moment.

                Server is running RHEL 4 update 7, running dual 3.2Ghz Xeon=
s with 2GB of memory. No swap in use, plenty of free memory available. Iost=
at shows my disk system is idle a lot. I'll include a snippet down the bott=
om.

                The 400GB volume is broken into 3200 extents. It is taking =
23 minutes on average to move 5 extents. This means my completion date is ~=
10.22 days away if I let the process run untouched.

                I was originally going to let it run and then abort it duri=
ng business hours so that performance was not impacted for users. This woul=
d let me roll back to the previous checkpoint. From the man page:

       5.  A  daemon  repeatedly  checks progress at the specified time int=
erval.  When it detects that the first
       temporary mirror is in-sync, it breaks that mirror so that only the =
new location for that data  gets  used
       and writes a checkpoint into the volume group metadata on disk.  The=
n it activates the mirror for the next
       segment of the pvmove LV.

                Turns out that after 12 hours and some 10% progress, no che=
ckpoints had been issued. My pvmove abort rolled back the entire 10% progre=
ss so far.

                I now have progress underway via a script that calls pvmove=
 repeatedly moving 5 extents at a time. This has given me a pausable soluti=
on.

                So, things I am now thoroughly confused about:


1.       Checkpoint intervals. How often do they occur? Are they configurab=
le? Can I see when one is set?

2.       These "specified time intervals" that the daemon checks at appear =
to be different from the -i option to pvmove. Is there someway to specify t=
he interval? Or work out what it is?

3.       Is there anyway to make pvmove go faster?  It is using nowhere nea=
r the capability of the IO subsystem. I have no idea what is bottlenecking =
the process to be honest.

Any help would be deeply appreciated, I am happy to submit more information=
 upon request.

Thanks,
Dave

--
David Nillesen
UNIX Systems Administrator
University of New England
+61 2 6773 2112




Moving extents from sda to sdd:

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             159.23       134.75       291.02 1943548784 4197564444
sdd               0.09         0.29         7.10    4136156  102479262

avg-cpu:  %user   %nice    %sys %iowait   %idle
          17.25    0.00    4.75   49.00   29.00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             206.93      4479.21         1.98       4524          2
sdd               0.00         0.00         0.00          0          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           3.24    0.00    2.49   75.31   18.95

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             138.38      3793.94         0.00       3756          0
sdd              11.11        18.18         0.00         18          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           2.25    0.00    1.75   58.75   37.25

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             200.00      3214.14         0.00       3182          0
sdd              17.17        50.51         0.00         50          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           8.98    0.00    6.23   64.09   20.70

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             281.00      6126.00         0.00       6126          0
sdd               0.00        76.00         0.00         76          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           3.50    0.00    4.00   66.75   25.75

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             363.00      3200.00         0.00       3200          0
sdd             336.00       892.00         0.00        892          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
          24.25    0.00   10.25   52.75   12.75

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             432.67      3027.72         0.00       3058          0
sdd               8.91        61.39         0.00         62          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           2.49    0.00    2.74   65.84   28.93

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             267.33      2948.51       221.78       2978        224
sdd              80.20       144.55         0.00        146          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
           5.50    0.00    7.25   49.25   38.00

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             249.49      8167.68         2.02       8086          2
sdd             115.15       282.83      5688.89        280       5632

avg-cpu:  %user   %nice    %sys %iowait   %idle
          12.69    0.00   17.41   44.78   25.12

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             492.08      3356.44      7287.13       3390       7360
sdd               0.00        15.84         0.00         16          0

avg-cpu:  %user   %nice    %sys %iowait   %idle
          11.00    0.00   12.00   64.25   12.75

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             342.00      7464.00      3206.00       7464       3206
sdd              62.00        84.00      5120.00         84       5120

avg-cpu:  %user   %nice    %sys %iowait   %idle
          11.75    0.00   11.50   73.25    3.50

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             458.00      4112.00      1888.00       4112       1888
sdd               7.00        34.00      2048.00         34       2048

avg-cpu:  %user   %nice    %sys %iowait   %idle
           7.25    0.00    6.00   66.50   20.25

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             317.00     11898.00      1364.00      11898       1364
sdd              92.00       162.00      1600.00        162       1600

avg-cpu:  %user   %nice    %sys %iowait   %idle
          13.72    0.00    7.48   72.32    6.48

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             307.07     13167.68       436.36      13036        432
sdd             290.91      1022.22     10860.61       1012      10752

avg-cpu:  %user   %nice    %sys %iowait   %idle
           4.25    0.00    5.50   79.00   11.25

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             453.47      2904.95      6429.70       2934       6494
sdd               0.00        71.29        27.72         72         28

avg-cpu:  %user   %nice    %sys %iowait   %idle
           5.47    0.00    3.48   90.80    0.25

Device:            tps   Blk_read/s   Blk_wrtn/s   Blk_read   Blk_wrtn
sda             253.54      2367.68      1892.93       2344       1874
sdd              83.84       119.19         0.00        118          0


--_000_3FAFA1227D473347B886B2E5476C8395EC4AD25363MAILSTOREadun_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:p=3D"urn:schemas-m=
icrosoft-com:office:powerpoint" xmlns:a=3D"urn:schemas-microsoft-com:office=
:access" xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:s=3D"=
uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882" xmlns:rs=3D"urn:schemas-microsof=
t-com:rowset" xmlns:z=3D"#RowsetSchema" xmlns:b=3D"urn:schemas-microsoft-co=
m:office:publisher" xmlns:ss=3D"urn:schemas-microsoft-com:office:spreadshee=
t" xmlns:c=3D"urn:schemas-microsoft-com:office:component:spreadsheet" xmlns=
:odc=3D"urn:schemas-microsoft-com:office:odc" xmlns:oa=3D"urn:schemas-micro=
soft-com:office:activation" xmlns:html=3D"http://www.w3.org/TR/REC-html40" =
xmlns:q=3D"http://schemas.xmlsoap.org/soap/envelope/" xmlns:D=3D"DAV:" xmln=
s:mt=3D"http://schemas.microsoft.com/sharepoint/soap/meetings/" xmlns:x2=3D=
"http://schemas.microsoft.com/office/excel/2003/xml" xmlns:ois=3D"http://sc=
hemas.microsoft.com/sharepoint/soap/ois/" xmlns:dir=3D"http://schemas.micro=
soft.com/sharepoint/soap/directory/" xmlns:ds=3D"http://www.w3.org/2000/09/=
xmldsig#" xmlns:dsp=3D"http://schemas.microsoft.com/sharepoint/dsp" xmlns:u=
dc=3D"http://schemas.microsoft.com/data/udc" xmlns:xsd=3D"http://www.w3.org=
/2001/XMLSchema" xmlns:sub=3D"http://schemas.microsoft.com/sharepoint/soap/=
2002/1/alerts/" xmlns:ec=3D"http://www.w3.org/2001/04/xmlenc#" xmlns:sp=3D"=
http://schemas.microsoft.com/sharepoint/" xmlns:sps=3D"http://schemas.micro=
soft.com/sharepoint/soap/" xmlns:xsi=3D"http://www.w3.org/2001/XMLSchema-in=
stance" xmlns:udcs=3D"http://schemas.microsoft.com/data/udc/soap" xmlns:udc=
xf=3D"http://schemas.microsoft.com/data/udc/xmlfile" xmlns:udcp2p=3D"http:/=
/schemas.microsoft.com/data/udc/parttopart" xmlns:wf=3D"http://schemas.micr=
osoft.com/sharepoint/soap/workflow/" xmlns:dsss=3D"http://schemas.microsoft=
.com/office/2006/digsig-setup" xmlns:dssi=3D"http://schemas.microsoft.com/o=
ffice/2006/digsig" xmlns:mdssi=3D"http://schemas.openxmlformats.org/package=
/2006/digital-signature" xmlns:mver=3D"http://schemas.openxmlformats.org/ma=
rkup-compatibility/2006" xmlns:m=3D"http://schemas.microsoft.com/office/200=
4/12/omml" xmlns:mrels=3D"http://schemas.openxmlformats.org/package/2006/re=
lationships" xmlns:spwp=3D"http://microsoft.com/sharepoint/webpartpages" xm=
lns:ex12t=3D"http://schemas.microsoft.com/exchange/services/2006/types" xml=
ns:ex12m=3D"http://schemas.microsoft.com/exchange/services/2006/messages" x=
mlns:pptsl=3D"http://schemas.microsoft.com/sharepoint/soap/SlideLibrary/" x=
mlns:spsl=3D"http://microsoft.com/webservices/SharePointPortalServer/Publis=
hedLinksService" xmlns:Z=3D"urn:schemas-microsoft-com:" xmlns:st=3D"&#1;" x=
mlns=3D"http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<meta name=3DGenerator content=3D"Microsoft Word 12 (filtered medium)">
<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.Section1
	{page:Section1;}
 /* List Definitions */
 @list l0
	{mso-list-id:430780288;
	mso-list-type:hybrid;
	mso-list-template-ids:-719954678 666681714 201916441 201916443 201916431 2=
01916441 201916443 201916431 201916441 201916443;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
-->
</style>
<!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext=3D"edit">
  <o:idmap v:ext=3D"edit" data=3D"1" />
 </o:shapelayout></xml><![endif]-->
</head>

<body lang=3DEN-AU link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal>Good morning,<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I&#8217;ve
been trying to hunt down some answers to a few questions about pvmove to no
avail. If I can get answers here I&#8217;ll volunteer to update the wiki wi=
th
them.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A
little detail first.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I&#8217;m
trying to move a volume used for user email from one backend system to anot=
her.
The volume is 400GB in size. It is currently on a 9 spindle nSeries/NetApp
filer shared out as a lun over fibre channel. I am trying to move the exten=
ts
to our new SAN node, an EVA4400 with a 8 disk 300GB 15k DP FC disk group al=
so
shared as an FC lun. Both disk systems have no contention for IO&#8217;s at=
 the
moment.<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The
server is accessing the system via a 2Gbit Qlogic FC HBA over a Qlogic SANB=
ox
5602 switch stack.<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; There
is plenty of spare overhead in the infrastructure at the moment.<o:p></o:p>=
</p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Server
is running RHEL 4 update 7, running dual 3.2Ghz Xeons with 2GB of memory. N=
o
swap in use, plenty of free memory available. Iostat shows my disk system i=
s
idle a lot. I&#8217;ll include a snippet down the bottom.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The
400GB volume is broken into 3200 extents. It is taking 23 minutes on averag=
e to
move 5 extents. This means my completion date is ~10.22 days away if I let =
the
process run untouched.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I
was originally going to let it run and then abort it during business hours =
so
that performance was not impacted for users. This would let me roll back to=
 the
previous checkpoint. From the man page:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5.&nbsp; A&nbs=
p;
daemon&nbsp; repeatedly&nbsp; checks progress at the specified time
interval.&nbsp; When it detects that the first<o:p></o:p></i></p>

<p class=3DMsoNormal><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; temporary mirr=
or is
in-sync, it breaks that mirror so that only the new location for that
data&nbsp; gets&nbsp; used<o:p></o:p></i></p>

<p class=3DMsoNormal><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; and writes a
checkpoint into the volume group metadata on disk.&nbsp; Then it activates =
the
mirror for the next<o:p></o:p></i></p>

<p class=3DMsoNormal><i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; segment of the
pvmove LV.<o:p></o:p></i></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Turns
out that after 12 hours and some 10% progress, no checkpoints had been issu=
ed.
My pvmove abort rolled back the entire 10% progress so far.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I
now have progress underway via a script that calls pvmove repeatedly moving=
 5
extents at a time. This has given me a pausable solution.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,
things I am now thoroughly confused about:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoListParagraph style=3D'margin-left:54.0pt;text-indent:-18.0pt=
;
mso-list:l0 level1 lfo1'><![if !supportLists]><span style=3D'mso-list:Ignor=
e'>1.<span
style=3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 </span></span><![endif]>Checkpoint
intervals. How often do they occur? Are they configurable? Can I see when o=
ne
is set?<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'margin-left:54.0pt;text-indent:-18.0pt=
;
mso-list:l0 level1 lfo1'><![if !supportLists]><span style=3D'mso-list:Ignor=
e'>2.<span
style=3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 </span></span><![endif]>These
&#8220;specified time intervals&#8221; that the daemon checks at appear to =
be
different from the &#8211;i option to pvmove. Is there someway to specify t=
he
interval? Or work out what it is?<o:p></o:p></p>

<p class=3DMsoListParagraph style=3D'margin-left:54.0pt;text-indent:-18.0pt=
;
mso-list:l0 level1 lfo1'><![if !supportLists]><span style=3D'mso-list:Ignor=
e'>3.<span
style=3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 </span></span><![endif]>Is
there anyway to make pvmove go faster? &nbsp;It is using nowhere near the c=
apability
of the IO subsystem. I have no idea what is bottlenecking the process to be
honest.<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'>Any help would be deeply
appreciated, I am happy to submit more information upon request.<o:p></o:p>=
</p>

<p class=3DMsoNormal style=3D'margin-left:36.0pt'><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Thanks,<o:p></o:p></p>

<p class=3DMsoNormal>Dave<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>--<o:p></o:p></p>

<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:Consolas'>=
David
Nillesen<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:Consolas'>=
UNIX
Systems Administrator<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:Consolas'>=
University
of New England<o:p></o:p></span></p>

<p class=3DMsoNormal><span style=3D'font-size:10.5pt;font-family:Consolas'>=
+61 2
6773 2112<o:p></o:p></span></p>

<p class=3DMsoNormal><br>
<br>
<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Moving extents from sda to sdd:<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
159.23&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
134.75&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 291.02 1943548784 4197564444<o:p=
></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.09&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.29&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7.10&nbsp;&nbsp;&nbsp;
4136156&nbsp; 102479262<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
17.25&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 4.75&nbsp;&nbsp;
49.00&nbsp;&nbsp; 29.00<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
206.93&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4479.21&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1.98&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4524&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
3.24&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 2.49&nbsp;&nbsp;
75.31&nbsp;&nbsp; 18.95<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
138.38&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3793.94&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3756&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
11.11&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
18.18&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
2.25&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 1.75&nbsp;&nbsp;
58.75&nbsp;&nbsp; 37.25<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s &nbsp;&nbsp;Blk_read&nbsp=
;&nbsp;
Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
200.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3214.14&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3182&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
17.17&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
50.51&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 50&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
8.98&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 6.23&nbsp;&nbsp;
64.09&nbsp;&nbsp; 20.70<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
281.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
6126.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
6126&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
76.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 76&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
3.50&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 4.00&nbsp;&nbsp;
66.75&nbsp;&nbsp; 25.75<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
363.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3200.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3200&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
336.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
892.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
892&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
24.25&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 10.25&nbsp;&nbsp; 52.75&nbsp;&nbsp=
;
12.75<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
432.67&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3027.72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3058&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
8.91&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
61.39&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 62&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
2.49&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 2.74&nbsp;&nbsp;
65.84&nbsp;&nbsp; 28.93<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s &nbsp;&nbsp;Blk_read&nbsp=
;&nbsp;
Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
267.33&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2948.51&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
221.78&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2978&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 224<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
80.20&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
144.55&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 146&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
5.50&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 7.25&nbsp;&nbsp;
49.25&nbsp;&nbsp; 38.00<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
249.49&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
8167.68&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2.02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
8086&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
115.15&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 282.83&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
5688.89&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
280&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5632<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
12.69&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 17.41&nbsp;&nbsp; 44.78&nbsp;&nbsp=
;
25.12<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
492.08&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3356.44&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
7287.13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3390&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7360<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
15.84&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 16&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
11.00&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 12.00&nbsp;&nbsp; 64.25&nbsp;&nbsp=
;
12.75<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
342.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 7464.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
3206.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
7464&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3206<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
62.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
84.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
5120.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
84&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5120<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
11.75&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; 11.50&nbsp;&nbsp;
73.25&nbsp;&nbsp;&nbsp; 3.50<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
458.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4112.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1888.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
4112&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1888<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
7.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
34.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2048.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
34&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2048<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
7.25&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp; &nbsp;6.00&nbsp;&nbsp;
66.50&nbsp;&nbsp; 20.25<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
317.00&nbsp;&nbsp;&nbsp;&nbsp; 11898.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1364.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11898&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
1364<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
92.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 162.00&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;
1600.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
162&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1600<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
13.72&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 7.48&nbsp;&nbsp;
72.32&nbsp;&nbsp;&nbsp; 6.48<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
307.07&nbsp;&nbsp;&nbsp;&nbsp; 13167.68&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
436.36&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
13036&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 432<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
290.91&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1022.22&nbsp;&nbsp;&nbsp;&nbsp;
10860.61&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1012&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
10752<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
4.25&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 5.50&nbsp;&nbsp;
79.00&nbsp;&nbsp; 11.25<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
453.47&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2904.95&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
6429.70&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2934&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6494<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
71.29&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
27.72&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 72&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
28<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>avg-cpu:&nbsp; %user&nbsp;&nbsp; %nice&nbsp;&nbsp;&nbs=
p;
%sys %iowait&nbsp;&nbsp; %idle<o:p></o:p></p>

<p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;
5.47&nbsp;&nbsp;&nbsp; 0.00&nbsp;&nbsp;&nbsp; 3.48&nbsp;&nbsp;
90.80&nbsp;&nbsp;&nbsp; 0.25<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

<p class=3DMsoNormal>Device:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
tps&nbsp;&nbsp; Blk_read/s&nbsp;&nbsp; Blk_wrtn/s&nbsp;&nbsp;
Blk_read&nbsp;&nbsp; Blk_wrtn<o:p></o:p></p>

<p class=3DMsoNormal>sda&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;
253.54&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2367.68&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
1892.93&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
2344&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1874<o:p></o:p></p>

<p class=3DMsoNormal>sdd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;
83.84&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
119.19&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0.00&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 118&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
0<o:p></o:p></p>

<p class=3DMsoNormal><o:p>&nbsp;</o:p></p>

</div>

</body>

</html>

--_000_3FAFA1227D473347B886B2E5476C8395EC4AD25363MAILSTOREadun_--
