Message-ID: <1B3885BC15C7024C845AAC78314766C55E4FDD@exch-01.noida.hcltech.com>
From: "Salil Taneja, Noida" <salilt@noida.hcltech.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C3BEED.03605F80"
Subject: [linux-lvm] lvm2 device mapper
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Dec 10 07:58:04 2003
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>
Cc: "Salil Taneja, Noida" <salilt@noida.hcltech.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C3BEED.03605F80
Content-Type: text/plain;
	charset="iso-8859-1"

hi,
 
I am using LVM2 , version -2.00.07 with device mapper library -1.00.07 on
2.6.0 test-9 kernel
 
i am facing these problems while doing so : -
 
1.) i get a warning message
    " /dev/mapper/control : open failed : No such file or directory .
       Is device mapper mapped to kernel ? "
 
To overcome this problem I started using LVM2 commands   with --driverloaded
n option .
 
now the commands execute but i face another problem :-
2.) when using lvcreate or vgcreate, the command executes but no node entry
is created  in the /dev/ directory
For eg :
 
I used the following command :
    lvcreate < options > -n lvm1 vg1 --driverloaded n
 
to verify this i used lvdisplay that gives the path of lvm1 as /dev/vg1/lvm1
; but when i check in /dev/ directory there is no entry corresponding to vg1
or lvm1 .
 
Why isnt there any node corresoponding to vg1 or lvm1 in /dev/ ?  any
clues...?????
 
 
Please suggest some nice solutions .
 
Thanks and Regards, 
Salil Taneja 
HCLT NetCentric Division, 
A11, Sector 16, 
Noida, India. 
* office: +91-120-2510701 Ext 3155 
* cell: +91-9810250247 

 

------_=_NextPart_001_01C3BEED.03605F80
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1276" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003>hi,</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>I am 
using LVM2 , version -2.00.07 with device mapper library -1.00.07 on 2.6.0 
test-9 kernel</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>i am 
facing these problems while doing so : -</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>1.) i 
get a warning message</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003>&nbsp;&nbsp;&nbsp;&nbsp;"&nbsp;/dev/mapper/control : 
open failed : No such file or directory .</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Is device 
mapper mapped to kernel ? "</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>To 
overcome this&nbsp;problem I started using LVM2 commands &nbsp; with 
--driverloaded n option .</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>now 
the commands execute but i face another problem :-</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>2.) 
when using lvcreate or vgcreate, the command executes but no node entry is 
created &nbsp;in the /dev/ directory</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT><FONT face=Arial color=#000080 
size=2><SPAN class=676585806-10122003>For eg :</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>I used 
the following command :</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003>&nbsp;&nbsp;&nbsp; lvcreate &lt; options &gt; -n lvm1 
vg1 --driverloaded n</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>to 
verify this i used lvdisplay that gives the path of lvm1 as /dev/vg1/lvm1 ; but 
when i check in /dev/ directory there is no entry corresponding to vg1 or lvm1 
.</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>Why 
isnt there any node corresoponding to vg1 or lvm1 in /dev/ ?&nbsp; any 
clues...?????</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT><FONT face=Arial color=#000080 
size=2><SPAN class=676585806-10122003></SPAN></FONT><FONT face=Arial 
color=#000080 size=2><SPAN class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN class=676585806-10122003>Please 
suggest some nice solutions .</SPAN></FONT></DIV>
<DIV><FONT face=Arial color=#000080 size=2><SPAN 
class=676585806-10122003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial><FONT size=2><SPAN class=676585806-10122003>Thanks and 
</SPAN>Regards,</FONT></FONT> <BR><FONT face=Arial size=2>Salil Taneja</FONT> 
<BR><FONT face=Arial size=2>HCLT NetCentric Division,</FONT> <BR><FONT 
face=Arial size=2>A11, Sector 16,</FONT> <BR><FONT face=Arial size=2>Noida, 
India.</FONT> <BR><FONT face=Wingdings color=#800080 size=2>(</FONT><FONT 
face="Trebuchet MS" color=#993300 size=2> office</FONT><FONT face="Trebuchet MS" 
color=#000000 size=2>: +91-120-2510701 Ext 3155</FONT> <BR><FONT face=Wingdings 
color=#800080 size=2>(</FONT><FONT face="Trebuchet MS" color=#993300 
size=2></FONT> <FONT face="Trebuchet MS" color=#000000 size=2>cell: 
+91-9810250247</FONT> </DIV><BR>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C3BEED.03605F80--
