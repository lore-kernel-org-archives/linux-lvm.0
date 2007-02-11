Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1B6lC7k020401
	for <linux-lvm@redhat.com>; Sun, 11 Feb 2007 01:47:12 -0500
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1B6lB5U003683
	for <linux-lvm@redhat.com>; Sun, 11 Feb 2007 01:47:11 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <53BC8DA1-9E2E-47C4-95C3-FF54870B403D@engineyard.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-4--404305241
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Date: Sun, 11 Feb 2007 00:47:02 -0600
Subject: [linux-lvm] Metadata Too Large For Circular Buffer
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
To: and development general discussion LVM <linux-lvm@redhat.com>


--Apple-Mail-4--404305241
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

Hello LVM List,

I recently encountered this error doing an lvcreate with CLVM:

   VG ey00-data metadata too large for circular buffer

I've Googled and found it elsewhere.  It appears my metadata is too  
large for the space allocated by default on the PVs.  It also appears  
that everybody else has encountered this with throw-away data.  I  
have a very large, very live system on this.  What can I do to get  
more metadata space?

It's CLVM, so I can't pvmove (even if I had the metadata space to  
make new PVs and move this 3TB).

I can pvcreate a new PV with enough space and presumably add it to  
the system, but will this work?  Can it handle having one PV with  
enough space and others without enough space?

I absolutely have to find a solution to this, so any help would be  
appreciated.

-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-4--404305241
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Hello LVM List,<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I recently encountered this =
error doing an lvcreate with CLVM:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>=A0 VG ey00-data metadata =
too large for circular buffer</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I've Googled and found it =
elsewhere.=A0 It appears my metadata is too large for the space =
allocated by default on the PVs.=A0 It also appears that everybody else =
has encountered this with throw-away data.=A0 I have a very large, very =
live system on this.=A0 What can I do to get more metadata =
space?</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>It's =
CLVM, so I can't pvmove (even if I had the metadata space to make new =
PVs and move this 3TB).</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I can pvcreate a new PV =
with enough space and presumably add it to the system, but will this =
work?=A0 Can it handle having one PV with enough space and others =
without enough space?</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I absolutely have to find a =
solution to this, so any help would be appreciated.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><DIV> <SPAN =
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
</DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-4--404305241--
