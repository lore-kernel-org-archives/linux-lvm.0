Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6Q8E21R009868
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 04:14:02 -0400
Received: from post.berlin.i-dmedia.com (post.berlin.i-dmedia.com
	[62.159.214.250])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6Q8DtgZ027916
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 04:13:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id DDE50E3
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 10:13:50 +0200 (CEST)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 08132-02 for <linux-lvm@redhat.com>;
	Thu, 26 Jul 2007 10:13:43 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 84914A7
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 10:13:43 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <51002118-0DA8-4101-A078-33A60A91813E@idmedia.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-7-971988625
From: Falko Zurell <falko.zurell@idmedia.com>
Date: Thu, 26 Jul 2007 10:13:38 +0200
Subject: [linux-lvm] LVM snapshot unreliable?
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


--Apple-Mail-7-971988625
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=UTF-8;
	delsp=yes;
	format=flowed

Hello,

I still got this major issue that automatic nightly snapshoting is =20
absolutly not reliable. In 4 out of 5 times the snapshoting will fail.

My Setup:
	HP DL320s box with 6 harddisks
	Ubuntu server 7.04 (feisty)
	kernel: 2.6.20-16-server
	device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: dm-=20=

devel@redhat.com
	LVM version:     2.02.06 (2006-05-12)
   		Library version: 1.02.08 (2006-07-17)
   		Driver version:  4.11.0

All my disks form a big hardware RAID5. LVM is serving one volume =20
group with 4 logical volumes. To of the volumes have the XFS =20
filesystem and should be snapshot every night.

Therefor I unmount the last snapshot, remove the snapshot and the re-=20
create it with the same name. But it looks like lvm isn't removing =20
the snapshot most of the time. The lvremove returns that it has =20
successfully removed the snapshot. But when I try to re create the =20
snaphost it fails. Then with "lvs" I can see that the snapshot is =20
still there.

I tried to deactivate the snapshot prior to removing with "lvchange -=20
an" but that wont help or even work most of the times.

Has someone a working konfiguration? Home often do you snapshots? =20
Could this be a XFS issue?

thanks and kind regards

---

Falko Zurell
Head of Application Management

Mobil +49 (0)160 - 3 62 52 77
icq: 327004879
skype: zero_data

/i-d media AG
Ohlauer Stra=C3=9Fe 43
D-10999 Berlin

Tel +49 (0)30 - 2 59 47 - 357
Fax +49 (0)30 - 2 59 47 - 471
www.idmedia.com

_______________________________________________

Board: Regine Haschka-Helmer (CEO), Franz Klose (CFO)
Chairman of the Supervisory Board: Christian A. Hufnagl
Headquarters: Berlin, Place of Jurisdiction: Berlin HRB 76342
UST-Id. DE812698340
_______________________________________________


This message may contain confidential information and must not be =20
copied, disclosed or used by anybody other than the intended =20
recipient. If you have received this message in error, please notify =20
us immediately by reply e-mail and delete all records of the message =20
from your computer. The views represented in this message are solely =20
those of the author. Neither the author nor I-D Media AG accepts any =20
liability for the contents of this message.



--Apple-Mail-7-971988625
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=UTF-8

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Hello,=C2=A0<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I still got this major =
issue that automatic nightly snapshoting is absolutly not reliable. In 4 =
out of 5 times the snapshoting will fail.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>My Setup:</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>HP DL320s =
box with 6 harddisks</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>Ubuntu server 7.04 =
(feisty)</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	=
</SPAN>kernel:=C2=A02.6.20-16-server</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>device-mapper: ioctl: 4.11.0-ioctl (2006-10-12) initialised: <A =
href=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</A></DIV><DIV><SPA=
N class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>LVM =
version:=C2=A0 =C2=A0=C2=A0 2.02.06 (2006-05-12)</DIV><DIV>=C2=A0 <SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>Library version: 1.02.08 (2006-07-17)</DIV><DIV>=C2=A0 <SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</SPAN>Driver version:=C2=A0 4.11.0</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>All my disks form a big =
hardware RAID5. LVM is serving one volume group with 4 logical volumes. =
To of the volumes have the XFS filesystem and should be snapshot every =
night.</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>Therefor=
 I unmount the last snapshot, remove the snapshot and the re-create it =
with the same name. But it looks like lvm isn't removing the snapshot =
most of the time. The lvremove returns that it has successfully removed =
the snapshot. But when I try to re create the snaphost it fails. Then =
with "lvs" I can see that the snapshot is still there.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I tried to deactivate the =
snapshot prior to removing with "lvchange -an" but that wont help or =
even work most of the times.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Has someone a working =
konfiguration? Home often do you snapshots? Could this be a XFS =
issue?</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>thanks =
and kind regards</DIV><DIV><BR><DIV> <SPAN class=3D"Apple-style-span" =
style=3D"border-collapse: separate; border-spacing: 0px 0px; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><P style=3D"margin: =
0.0px 0.0px 12.0px 0.0px">---</P><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 12px/normal Helvetica; min-height: 14px; ">Falko =
Zurell<BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; "><FONT class=3D"Apple-style-span" =
face=3D"Arial" size=3D"1"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 9px;; font-family: Arial; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; ">Head of Application =
Management</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;"><BR =
class=3D"khtml-block-placeholder"></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Mobil +49 (0)160 - 3 62 52 77</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">icq: 327004879<FONT class=3D"Apple-style-span" =
face=3D"Arial" size=3D"1"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 9px;"></SPAN></FONT></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">skype: =
zero_data</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
9px/normal Arial; min-height: 10px; ; font-family: Arial; font-size: =
9px; "><BR style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><B style=3D"font-family: Arial; font-size: 9px; =
font-weight: bold; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; font-weight: bold; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
font-weight: bold; ">/i-d media =
AG</SPAN></SPAN></B></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Ohlauer Stra=C3=9Fe =
43</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">D-10999 =
Berlin</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 9px/normal Arial; min-height: 10px; ; font-family: Arial; =
font-size: 9px; "><BR style=3D"font-family: Arial; font-size: 9px; =
"></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Tel +49 (0)30 - 2 59 47 - 357</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Fax +49 (0)30 - 2 59 47 - 471</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">www.idmedia.com</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 9px/normal Arial; =
min-height: 10px; ; font-family: Arial; font-size: 9px; "><BR =
style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">_______________________________________________</SPAN></SPAN></SPAN></FO=
NT></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
9px/normal Arial; min-height: 10px; ; font-family: Arial; font-size: =
9px; "><BR style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">Board: Regine Haschka-Helmer (CEO), Franz Klose =
(CFO)</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Chairman of the Supervisory Board: Christian A. =
Hufnagl</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><FONT =
class=3D"Apple-style-span" face=3D"Arial" size=3D"1"><SPAN =
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Headquarters: Berlin, Place of Jurisdiction: =
Berlin HRB 76342</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">UST-Id. DE812698340</SPAN></SPAN></SPAN></FONT></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">_______________________________________________</SPAN></SPAN></SPAN></FO=
NT></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
9px/normal Arial; min-height: 10px; ; font-family: Arial; font-size: =
9px; "><BR style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 9px/normal Arial; =
min-height: 10px; ; font-family: Arial; font-size: 9px; "><BR =
style=3D"font-family: Arial; font-size: 9px; "></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
size=3D"1"><SPAN class=3D"Apple-style-span" style=3D"font-size: 9px;; =
font-family: Arial; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Arial; font-size: 9px; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Arial; font-size: 9px; =
">This message may contain confidential information and must not be =
copied, disclosed or used by anybody other than the intended recipient. =
If you have received this message in error, please notify us immediately =
by reply e-mail and delete all records of the message from your =
computer. The views represented in this message are solely those of the =
author. Neither the author nor I-D Media AG accepts any liability for =
the contents of this message.</SPAN></SPAN></SPAN></FONT></DIV><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN></SPAN></SPAN> =
</DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-7-971988625--
