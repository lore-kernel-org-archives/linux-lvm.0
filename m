Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l19B55Td012591
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 06:05:05 -0500
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l19B52Ce004413
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 06:05:02 -0500
Received: from [64.22.234.43] (helo=[192.168.2.3])
	by souja.net with esmtpa (Exim 4.60)
	(envelope-from <jvantuyl@engineyard.com>) id 1HFTZD-00033V-BI
	for linux-lvm@redhat.com; Fri, 09 Feb 2007 05:05:23 -0600
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <45CAE514.7020200@redhat.com>
References: <DDC513CA-32D7-466C-A34E-1F5EFDFDD265@engineyard.com>
	<45CAE514.7020200@redhat.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2--561666268
Message-Id: <00503406-DE29-4057-AC21-D466819CAA5A@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Subject: Re: [linux-lvm] CLVM Questions
Date: Fri, 9 Feb 2007 05:04:21 -0600
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


--Apple-Mail-2--561666268
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

On Feb 8, 2007, at 2:53 AM, Patrick Caulfield wrote:
> I'm not sure what you mean here. You either have a cluster or you  
> don't.
Yes.

> If you have clvm on one node on a cluster then it needs to be on  
> ALL nodes of
> the cluster - you can't have an isolated node that is also part of  
> the CMAN
> cluster.
I had kind of figured this out.

> If what you mean is "can I have a non-clustered Volume Group  
> alongside cluster
> volume groups", then the answer is "yes". There is a flag on the VG  
> that
> indicates whether it is clustered or not. activated with vgchange -cy,
> deactivated with vgchange -cn. You can't mark individual LVs within  
> a VG as
> clustered/non-clustered though. That wouldn't make sense.
Well, I think I have a bug to report.  When I create a vg and mark it  
as not clustered, I get locking errors when working with its LVs.

-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-2--561666268
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; "><DIV><DIV>On Feb 8, 2007, at =
2:53 AM, Patrick Caulfield wrote:</DIV><BLOCKQUOTE type=3D"cite"><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">I'm not sure what you mean here. You either have a =
cluster or you don't.</DIV></BLOCKQUOTE>Yes.</DIV><DIV><BR><BLOCKQUOTE =
type=3D"cite"><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">If you have clvm on one node on =
a cluster then it needs to be on ALL nodes of</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">the cluster - you can't have an isolated node that =
is also part of the CMAN</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">cluster.</DIV></BLOCKQUOTE>I had kind of figured this =
out.</DIV><DIV><BR><BLOCKQUOTE type=3D"cite"><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">If what =
you mean is "can I have a non-clustered Volume Group alongside =
cluster</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">volume groups", then the answer =
is "yes". There is a flag on the VG that</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">indicates whether it is clustered or not. activated with vgchange =
-cy,</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">deactivated with vgchange -cn. =
You can't mark individual LVs within a VG as</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">clustered/non-clustered though. That wouldn't make =
sense.</DIV></BLOCKQUOTE>Well, I think I have a bug to report.=A0 When I =
create a vg and mark it as not clustered, I get locking errors when =
working with its LVs.</DIV><BR><DIV> <SPAN class=3D"Apple-style-span" =
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
white-space: normal; widows: 2; word-spacing: 0px; =
"><DIV>--=A0</DIV><DIV>Jayson Vantuyl</DIV><DIV><FONT =
class=3D"Apple-style-span" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">Systems =
Architect</SPAN></SPAN></SPAN></FONT></DIV><DIV><B style=3D"font-weight: =
bold; "><A href=3D"http://www.engineyard.com"><SPAN =
class=3D"Apple-style-span" style=3D"font-weight: normal;; color: rgb(0, =
0, 238); -khtml-text-decorations-in-effect: underline; "><SPAN =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 238); =
-khtml-text-decorations-in-effect: underline; ">Engine =
Yard</SPAN></SPAN></A></B></DIV><DIV><FONT class=3D"Apple-style-span" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; "><A =
href=3D"mailto:jvantuyl@engineyard.com">jvantuyl@engineyard.com</A></SPAN>=
</SPAN></SPAN></FONT></DIV></SPAN><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN> =
</DIV><BR></BODY></HTML>=

--Apple-Mail-2--561666268--
