Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8CM3X4P022403
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 18:03:33 -0400
Received: from mail5.mckesson.com (mail5.mckesson.com [143.112.68.14])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8CM3TkN020334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2014 18:03:30 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Date: Fri, 12 Sep 2014 22:02:03 +0000
Message-ID: <4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BF@NDHEP50004.na.corp.mckesson.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BFNDHEP50004nacor_"
MIME-Version: 1.0
Subject: [linux-lvm] LE to PE mapping
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

--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BFNDHEP50004nacor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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





--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BFNDHEP50004nacor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hello:</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I need to find a command on=
 RHEL 5.8 that will show each LE to PE mapping for a LV. All the command I =
have looked at so far (lvs, pvs, lvdisplay and pvdisplay) using various opt=
ion only show the start PE and how many.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am dealing with an SAN re=
ad performance problem and some think it is the way the LE are mapped to th=
e PE that is causing more I/O to take place on specific disk. The database =
application does reads and writes directly to the LV, there is no file
system with files. The database block size is 8k and for the most part is v=
ery random across many LVs.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The configuration is a lot =
bigger than I am going to provide information here to make it a little simp=
ler as to what I am trying to find out.</div>
<div>&nbsp;</div>
<div>Let's assume 4 LUNs (PV) at 10G each.</div>
<div>The PVs are put in vg01 and 4 LVs are created using the following comm=
ands:</div>
<div>&nbsp;</div>
<div>lvcreate -L2g -i4 -n lv00 vg01</div>
<div>lvcreate -L2g -i4 -n lv01 vg01</div>
<div>lvcreate -L2g -i4 -n lv02 vg01</div>
<div>lvcreate -L2g -i4 -n lv03 vg01</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The strip size defaulted to=
 16K per the lvdisplay command. When doing the commands to list the LE and =
PE information it will show that lv00 starts at PE 0 on each PV and then wh=
at ever number of PEs it takes to make 2g across the PVs. Let's say
4 to make it simple, so that would be 16 in all. Now were the PE allocated =
like:</div>
<div>&nbsp;</div>
<div>LE0&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
0</div>
<div>LE1&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE=
0</div>
<div>LE2&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV2 PE=
0</div>
<div>LE3&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV3 PE=
0</div>
<div>LE4&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
1</div>
<div>LE5&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE=
1</div>
<div>~~~&nbsp;&nbsp;&nbsp;&nbsp; ~~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~ ~~~</=
div>
<div>LE15&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV3 PE3</di=
v>
<div>&nbsp;</div>
<div>Or were they allocated like:</div>
<div>&nbsp;</div>
<div>LE0&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
0</div>
<div>LE1&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
1</div>
<div>LE2&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
2</div>
<div>LE3&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV0 PE=
3</div>
<div>LE4&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE=
0</div>
<div>LE5&nbsp;&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV1 PE=
1</div>
<div>~~~&nbsp;&nbsp;&nbsp;&nbsp; ~~&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~~~ ~~~</=
div>
<div>LE15&nbsp;&nbsp;&nbsp; -&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PV3 PE3</di=
v>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; In this simple example it d=
oes not make a lot of difference, but say there were 512 PEs then it does a=
s far as to which PV reads are done from with random reads. This is a datab=
ase application with many users access different parts of the data
is what makes it random and there could be many doing reads at the same tim=
e. During backups the blocks (PE) will be read sequential and if the alloca=
tion is done the second way then many reads will be done on the first PV an=
d none on the other than the then
second PV and non on the others and so on.</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Something else I need some =
clarification on is the PE size of 4MB and the strip size of 16K. Are the P=
Es not allocated as shown above in either example?</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Are the PE allocated in 4MB=
 chunks?</div>
<div>&nbsp;</div>
<div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Then what does the 16K do?<=
/div>
<div>&nbsp;</div>
<div style=3D"margin-top:5pt;margin-bottom:5pt;"><font size=3D"2" color=3D"=
blue"><span style=3D"font-size:10pt;">-------------------------<font size=
=3D"2"><span style=3D"font-size:11pt;">
<br>

</span></font><font face=3D"Arial">Jackson C. Allen</font><font size=3D"2">=
<span style=3D"font-size:11pt;">
<br>

</span></font><font face=3D"Arial">McKesson Provider Technologies</font><fo=
nt size=3D"2"><span style=3D"font-size:11pt;">
<br>

</span></font><font face=3D"Arial">5995 Windward Parkway</font><font size=
=3D"2"><span style=3D"font-size:11pt;">
<br>

</span></font><font face=3D"Arial">Alpharetta, GA 30005</font><font size=3D=
"2"><span style=3D"font-size:11pt;">
<br>

</span></font><font face=3D"Arial">(404) 338-2023</font><font size=3D"2"><s=
pan style=3D"font-size:11pt;">
<br>

</span></font><a href=3D"mailto:Jack.Allen@McKesson.com"><font face=3D"Aria=
l"><u>Jack.Allen@McKesson.com</u></font></a><font face=3D"Arial"> </font></=
span></font></div>
<div><font face=3D"Arial" size=3D"2" color=3D"red"><span style=3D"font-size=
:10pt;">Confidentiality Notice: This e-mail message, including any attachme=
nts, is for the sole use of the intended recipient(s) and may contain confi=
dential and privileged information.&nbsp; Any
unauthorized review, use, disclosure or distribution is prohibited.&nbsp; I=
f you are not the intended recipient, please contact the sender by reply e-=
mail and destroy all copies of the original message.</span></font></div>
<div><font color=3D"#1F497D">&nbsp;</font></div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_4A8A2A3D96DD154BAD2EE08C0FFFBE5A815067BFNDHEP50004nacor_--
