Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBCGwXMU028648
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 11:58:33 -0500
Received: from mail.wrs.com (mail.windriver.com [147.11.1.11])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBCGwUDZ024302
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 11:58:30 -0500
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.3) with ESMTP id kBCGwPNp021626
	for <linux-lvm@redhat.com>; Tue, 12 Dec 2006 08:58:25 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C71E0E.BC9509E0"
Date: Tue, 12 Dec 2006 08:58:23 -0800
Message-ID: <37B62E0F71C9E14B9859FADB1FC3E3E10FFDC0@ala-mail02.corp.ad.wrs.com>
From: "Kottaridis, Chris" <chris.kottaridis@windriver.com>
Subject: [linux-lvm] Lvremove crashes in kcopyd line 145
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C71E0E.BC9509E0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am running into a problem where I get an error when doing an lvremove
after creating a snapshot. I am running 2.6.10:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
kernel BUG at drivers/md/kcopyd.c:145!
invalid operand: 0000 [#1]=20
SMP=20
Modules linked in: ipmi_watchdog vmc vMCstub ipmibus ipmi_serial
ipmi_devintf
ipmi_msghandler pmemfs
CPU:    2
EIP:    0060:[<c038af34>]    Not tainted VLI
EFLAGS: 00010283   (2.6.10-pne)
EIP is at client_free_pages+0x38/0x42
eax: 00000100   ebx: f6afcd00   ecx: 00000000   edx: 00000000
esi: f88b2080   edi: 0000002c   ebp: f6829ee8   esp: f6829ee0
ds: 007b   es: 007b   ss: 0068
Process lvremove (pid: 8622, threadinfo=3Df6828000 task=3Df70e4c70)
Stack: f6afcd00 f6afcd00 f6829ef8 c038b979 f6afcd00 f7014180 f6829f10
c038c339
       f6afcd00 f6f42ca0 f88b2080 f6f7ab80 f6829f2c c0386099 f88b2080
00000000
       f6a4a480 f8866000 00000004 f6829f40 c0387f3b f6f7ab80 00000000
c052b620
       f6829f54 c038874f f6a4a480 f6828000 00000000 f6829f7c c0389cc7
f8866000
       00004000 f6829fa0 c03886ec f8866000 c134fd04 f6d7ea80 c0389bee
f6829fbc
       c017cf94 f75f2c6c f6d7ea80 c134fd04 080de8d0 ffffffe7 f70e4c70
f70e4de8
Call Trace:
 [<c01034fb>] show_stack+0x80/0x96
 [<c010368e>] show_registers+0x15d/0x1d6
 [<c01039ec>] die+0x106/0x194
 [<c010400f>] do_trap+0xdc/0x13e
 [<c01042ed>] do_invalid_op+0xb5/0xbf
 [<c01031a3>] error_code+0x2b/0x30
 [<c038b979>] kcopyd_client_destroy+0x1d/0x37
 [<c038c339>] snapshot_dtr+0x70/0x7e
 [<c0386099>] table_destroy+0x62/0xcc
 [<c0387f3b>] __hash_remove+0x5b/0x84
 [<c038874f>] dev_remove+0x63/0xc5
 [<c0389cc7>] ctl_ioctl+0xd9/0x137
 [<c017cf94>] sys_ioctl+0x207/0x267
 [<c010263c>] no_dpa_vsyscall_enter+0x8/0x1b
Code: 39 43 14 75 26 8b 43 0c 89 04 24 e8 61 ff ff ff c7 43 0c 00 00 00
00 c7
43 10 00 00 00 00 c7 43 14 00 00 00 00 83 c4 04 5b 5d c3 <0f> 0b 91 00
2f f1
49 c0 eb d0 55 89 e5 83 ec 18 c7 44 24 14 00
 <6>Kcore timestamp : 1165881319.900042
Kcore HighResolution timestamp : B43B8A9DA6
Oops: 0000 [#2]
SMP
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
It seems to be running into the BUG_ON in this code:
=20
static void client_free_pages(struct kcopyd_client *mc)
{
      BUG_ON(kc->nr_free_pages !=3D kc->nr_pages);
      drop_pages(kc->pages);
      kc->pages =3D NULL;
      kc->nr_free_pages =3D kc->nr_pages =3D 0;
}
=20
=20
Interestingly enough if I put like a 10 second sleep after the original
snapshot creation then it seems OK, but if I sleep 5 seconds or less
then it breaks as above.
=20
Any ideas on what is going on would be appreciated.
=20
Thanks
=20
Chris Kottaridis
Senior Engineer
Wind River Systems
719-522-9786
=20

------_=_NextPart_001_01C71E0E.BC9509E0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2995" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D742015116-12122006>I am =
running into a=20
problem where I get an error when doing an lvremove after creating a =
snapshot. I=20
am running 2.6.10:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D742015116-12122006>kernel =
BUG at=20
drivers/md/kcopyd.c:145!<BR>invalid operand: 0000 [#1] <BR>SMP =
<BR>Modules=20
linked in: ipmi_watchdog vmc vMCstub ipmibus ipmi_serial=20
ipmi_devintf<BR>ipmi_msghandler pmemfs<BR>CPU:&nbsp;&nbsp;&nbsp;=20
2<BR>EIP:&nbsp;&nbsp;&nbsp; 0060:[&lt;c038af34&gt;]&nbsp;&nbsp;&nbsp; =
Not=20
tainted VLI<BR>EFLAGS: 00010283&nbsp;&nbsp; (2.6.10-pne)<BR>EIP is at=20
client_free_pages+0x38/0x42<BR>eax: 00000100&nbsp;&nbsp; ebx:=20
f6afcd00&nbsp;&nbsp; ecx: 00000000&nbsp;&nbsp; edx: 00000000<BR>esi:=20
f88b2080&nbsp;&nbsp; edi: 0000002c&nbsp;&nbsp; ebp: f6829ee8&nbsp;&nbsp; =
esp:=20
f6829ee0<BR>ds: 007b&nbsp;&nbsp; es: 007b&nbsp;&nbsp; ss: =
0068<BR>Process=20
lvremove (pid: 8622, threadinfo=3Df6828000 task=3Df70e4c70)<BR>Stack: =
f6afcd00=20
f6afcd00 f6829ef8 c038b979 f6afcd00 f7014180 f6829f10=20
c038c339<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f6afcd00 f6f42ca0 =
f88b2080=20
f6f7ab80 f6829f2c c0386099 f88b2080=20
00000000<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f6a4a480 f8866000 =
00000004=20
f6829f40 c0387f3b f6f7ab80 00000000=20
c052b620<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f6829f54 c038874f =
f6a4a480=20
f6828000 00000000 f6829f7c c0389cc7=20
f8866000<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 00004000 f6829fa0 =
c03886ec=20
f8866000 c134fd04 f6d7ea80 c0389bee=20
f6829fbc<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c017cf94 f75f2c6c =
f6d7ea80=20
c134fd04 080de8d0 ffffffe7 f70e4c70 f70e4de8<BR>Call=20
Trace:<BR>&nbsp;[&lt;c01034fb&gt;]=20
show_stack+0x80/0x96<BR>&nbsp;[&lt;c010368e&gt;]=20
show_registers+0x15d/0x1d6<BR>&nbsp;[&lt;c01039ec&gt;]=20
die+0x106/0x194<BR>&nbsp;[&lt;c010400f&gt;]=20
do_trap+0xdc/0x13e<BR>&nbsp;[&lt;c01042ed&gt;]=20
do_invalid_op+0xb5/0xbf<BR>&nbsp;[&lt;c01031a3&gt;]=20
error_code+0x2b/0x30<BR>&nbsp;[&lt;c038b979&gt;]=20
kcopyd_client_destroy+0x1d/0x37<BR>&nbsp;[&lt;c038c339&gt;]=20
snapshot_dtr+0x70/0x7e<BR>&nbsp;[&lt;c0386099&gt;]=20
table_destroy+0x62/0xcc<BR>&nbsp;[&lt;c0387f3b&gt;]=20
__hash_remove+0x5b/0x84<BR>&nbsp;[&lt;c038874f&gt;]=20
dev_remove+0x63/0xc5<BR>&nbsp;[&lt;c0389cc7&gt;]=20
ctl_ioctl+0xd9/0x137<BR>&nbsp;[&lt;c017cf94&gt;]=20
sys_ioctl+0x207/0x267<BR>&nbsp;[&lt;c010263c&gt;]=20
no_dpa_vsyscall_enter+0x8/0x1b<BR>Code: 39 43 14 75 26 8b 43 0c 89 04 24 =
e8 61=20
ff ff ff c7 43 0c 00 00 00 00 c7<BR>43 10 00 00 00 00 c7 43 14 00 00 00 =
00 83 c4=20
04 5b 5d c3 &lt;0f&gt; 0b 91 00 2f f1<BR>49 c0 eb d0 55 89 e5 83 ec 18 =
c7 44 24=20
14 00<BR>&nbsp;&lt;6&gt;Kcore timestamp : 1165881319.900042<BR>Kcore=20
HighResolution timestamp : B43B8A9DA6<BR>Oops: 0000=20
[#2]<BR>SMP<BR>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</SPAN></F=
ONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D742015116-12122006>It =
seems to be=20
running into the BUG_ON in this code:</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D742015116-12122006>static =
void=20
client_free_pages(struct kcopyd_client *mc)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>{</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
BUG_ON(kc-&gt;nr_free_pages !=3D kc-&gt;nr_pages);</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
drop_pages(kc-&gt;pages);</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kc-&gt;pages =
=3D=20
NULL;</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
kc-&gt;nr_free_pages =3D=20
kc-&gt;nr_pages =3D 0;</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D742015116-12122006>}</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D742015116-12122006><FONT face=3DArial =
size=3D2>Interestingly enough=20
if I put like a 10 second sleep after the original snapshot creation =
then it=20
seems OK, but if I sleep 5 seconds or less then it breaks as=20
above.</FONT></SPAN></DIV>
<DIV><SPAN class=3D742015116-12122006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D742015116-12122006><FONT face=3DArial size=3D2>Any =
ideas on what is=20
going on would be appreciated.</FONT></SPAN></DIV>
<DIV><SPAN class=3D742015116-12122006><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D742015116-12122006><FONT face=3DArial=20
size=3D2>Thanks</FONT></SPAN></DIV>
<DIV><SPAN class=3D742015116-12122006></SPAN>&nbsp;</DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Chris =
Kottaridis</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial =
size=3D2>Senior&nbsp;Engineer</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>Wind River =
Systems</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2>719-522-9786</FONT></DIV>
<DIV align=3Dleft><FONT face=3DArial size=3D2><SPAN =
class=3D971590420-14032006><FONT=20
face=3DArial size=3D2></FONT></SPAN></FONT></DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C71E0E.BC9509E0--
