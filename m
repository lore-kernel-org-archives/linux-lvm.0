Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6J7mZkj007629
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 03:48:35 -0400
Received: from post.berlin.i-dmedia.com (post.berlin.i-dmedia.com
	[62.159.214.250])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6J7mWEs031700
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 03:48:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id A56D816D
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 09:48:24 +0200 (CEST)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 12454-08 for <linux-lvm@redhat.com>;
	Thu, 19 Jul 2007 09:48:16 +0200 (CEST)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 9E11A152
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 09:48:16 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <200707181337.58651.joachimbanzhaf@compuserve.de>
References: <469CD32D.6040104@idmedia.com>
	<200707181337.58651.joachimbanzhaf@compuserve.de>
Content-Type: multipart/alternative; boundary=Apple-Mail-10-365651133
Message-Id: <4E946635-5DAA-467E-A447-17245837A9D3@idmedia.com>
From: Falko Zurell <falko.zurell@idmedia.com>
Subject: Re: [linux-lvm] snapshots can't be deactivated
Date: Thu, 19 Jul 2007 09:48:01 +0200
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


--Apple-Mail-10-365651133
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=UTF-8;
	delsp=yes;
	format=flowed

Thanks for the advices. I will look for some hotplug stuff around.

I tried the "lvchange -an" as well as I sounded pragmatic to me. But =20
this doesn't seems to work at all on the snapshots.

thanks and kind regards

---

Falko Zurell
Head of Application Management
Mobil +49 (0)160 - 3 62 52 77

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


Am 18.07.2007 um 13:37 schrieb Joachim Banzhaf:

> Hi Falko,
>
> Am Dienstag, 17. Juli 2007 16:33 schrieb Falko Zurell:
>
> > I don't know why this happens. The script will work perfectly 3 =20
> out of 5
> > times. But sometimes it comes up with the error above.
>
> Maybe some hotplug script trying to find out what kind of new =20
> device that is?
>
> > Are my steps right in principle? Did I forget to do something =20
> before or
> > after removing?
>
> I am by no means an expert on lvm, so dont take this too seriously: =20=

> shouldn't
> there be an lvchange -an yourlv before lvremove? Maybe this active =20
> status is
> still hanging around somewhere although you can force the remove?
>
> HTH
>
> Joachim Banzhaf
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>


--Apple-Mail-10-365651133
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=UTF-8

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Thanks for the advices. I will =
look for some hotplug stuff around.<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I tried the "lvchange -an" =
as well as I sounded pragmatic to me. But this doesn't seems to work at =
all on the snapshots.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>thanks and kind =
regards</DIV><DIV><BR><DIV> <SPAN class=3D"Apple-style-span" =
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
class=3D"Apple-style-span" style=3D"font-size: 9px;; font-family: Arial; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Arial; =
font-size: 9px; "><SPAN class=3D"Apple-style-span" style=3D"font-family: =
Arial; font-size: 9px; ">Mobil +49 (0)160 - 3 62 52 =
77</SPAN></SPAN></SPAN></FONT></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: normal =
normal normal 9px/normal Arial; min-height: 10px; ; font-family: Arial; =
font-size: 9px; "><BR style=3D"font-family: Arial; font-size: 9px; =
"></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; "><FONT class=3D"Apple-style-span" face=3D"Arial" =
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
</DIV><BR><DIV><DIV>Am 18.07.2007 um 13:37 schrieb Joachim =
Banzhaf:</DIV><BR class=3D"Apple-interchange-newline"><BLOCKQUOTE =
type=3D"cite">  <P><FONT size=3D"2">Hi Falko,<BR> <BR> Am Dienstag, 17. =
Juli 2007 16:33 schrieb Falko Zurell:<BR> <BR> &gt; I don't know why =
this happens. The script will work perfectly 3 out of 5<BR> &gt; times. =
But sometimes it comes up with the error above.<BR> <BR> Maybe some =
hotplug script trying to find out what kind of new device that is?<BR> =
<BR> &gt; Are my steps right in principle? Did I forget to do something =
before or<BR> &gt; after removing?<BR> <BR> I am by no means an expert =
on lvm, so dont take this too seriously: shouldn't<BR> there be an =
lvchange -an yourlv before lvremove? Maybe this active status is<BR> =
still hanging around somewhere although you can force the remove?<BR> =
<BR> HTH<BR> <BR> Joachim Banzhaf<BR> <BR> =
_______________________________________________<BR> linux-lvm mailing =
list<BR> <A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A><BR> <A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A><BR> read the LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A><BR> </FONT> </P>  </BLOCKQUOTE></DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-10-365651133--
