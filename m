Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l17MNx6u022017
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 17:23:59 -0500
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l17MNvbJ024405
	for <linux-lvm@redhat.com>; Wed, 7 Feb 2007 17:23:57 -0500
In-Reply-To: <45C9E5B0.5010703@redhat.com>
References: <A2E4EC06-9B8D-4C63-8567-4DF6475D4543@engineyard.com>
	<45C9E5B0.5010703@redhat.com>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Type: multipart/alternative; boundary=Apple-Mail-2--693735259
Message-Id: <976BA119-1058-434F-82AC-3525EB3AC698@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Subject: Re: [linux-lvm] Strange LVM Error With AoE Disks
Date: Wed, 7 Feb 2007 16:23:12 -0600
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
Cc: Coraid Support <support@coraid.com>


--Apple-Mail-2--693735259
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

No, I didn't, actually.  That worked.  Thanks a MILLION!

On Feb 7, 2007, at 8:44 AM, Patrick Caulfield wrote:

> Did you restart clvmd after adding the new disks? There is a bug  
> where it
> doesn't always recognise new hardware.



-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-2--693735259
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">No, I didn't, actually.=A0 That =
worked.=A0 Thanks a MILLION!<DIV><DIV><BR><DIV><DIV>On Feb 7, 2007, at =
8:44 AM, Patrick Caulfield wrote:</DIV><BR =
class=3D"Apple-interchange-newline"><BLOCKQUOTE type=3D"cite"><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Did you restart clvmd after adding the new disks? =
There is a bug where it</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">doesn't =
always recognise new =
hardware.</DIV></BLOCKQUOTE></DIV><BR></DIV><BR><BR><DIV> <SPAN =
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

--Apple-Mail-2--693735259--
