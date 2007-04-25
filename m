Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3P8GMVx017668
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 04:16:22 -0400
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3P8GJ1D020422
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2007 04:16:19 -0400
Received: from [166.165.135.114] by souja.net with esmtpa (Exim 4.66)
	(envelope-from <jvantuyl@engineyard.com>) id 1HgciF-0006UL-VR
	for linux-lvm@redhat.com; Wed, 25 Apr 2007 03:18:57 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <462F07B8.9060205@cargo-partner.com>
References: <462332EF.5090505@cargo-partner.com>
	<462E65D2.5070008@cargo-partner.com>
	<462F07B8.9060205@cargo-partner.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-2--534219097
Message-Id: <47D4EAB4-1EA1-42DB-A8F9-C412B07E0005@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Subject: Re: [linux-lvm] clusteredVG+mirroredLV
Date: Wed, 25 Apr 2007 03:16:00 -0500
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


--Apple-Mail-2--534219097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1;
	delsp=yes;
	format=flowed

Mirroring (and snapshotting) does not currently work with clustered =20
VGs.  This is because cmirror (and csnap) is not released yet.

On Apr 25, 2007, at 2:48 AM, Michael Eisenk=F6lbl wrote:

> Hi all,
>
> i want to create a two node cluster with three iSCSI devices.
> the iSCSI devices should be mirrored (2mirror+1log) to be more secure.
> I am going to configure 3 PVs and after a clustered volume group, =20
> so this is no problem.
> but when I am trying to create the mirrored logical volume (on this =20=

> clusteredVG), I got the following error message:
>
> lvcreate command failed.
> Command attempted: "/usr/sbin/lvcreate -n mirrorLV -l 6 -m1 =20
> mirrorVG /dev/sde1 /dev/sdb1 /dev/sdc1" - System Error Message:   =20
> Error locking on node server4: Internal lvm error, check syslog
> Aborting. Failed to activate mirror log. Remove new LVs and retry.
> Failed to create mirror log.
>
> I deleted everything and retried it, but everytime the same error.
> cluster is working good. clvmd is also started with locking mode 2.
> if I try to create a normal VG with a mirrored LV everythings fine.
> if I try to create a clustered VG with a normal LV everythings fine.
> but not a clustered VG with a mirrored LV...... why?
>
> maybe somebody can help me with this situation.
>
> kind regards
> Michael
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=20
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-2--534219097
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; ">Mirroring (and snapshotting) =
does not currently work with clustered VGs.=A0 This is because cmirror =
(and csnap) is not released yet.<DIV><BR><DIV><DIV>On Apr 25, 2007, at =
2:48 AM, Michael Eisenk=F6lbl wrote:</DIV><BR =
class=3D"Apple-interchange-newline"><BLOCKQUOTE type=3D"cite"><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Hi all,</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">i want to create a two node =
cluster with three iSCSI devices.</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">the iSCSI =
devices should be mirrored (2mirror+1log) to be more secure.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">I am going to configure 3 PVs and after a clustered =
volume group, so this is no problem.</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">but when I am =
trying to create the mirrored logical volume (on this clusteredVG), I =
got the following error message:</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">lvcreate command =
failed.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Command attempted: =
"/usr/sbin/lvcreate -n mirrorLV -l 6 -m1 mirrorVG /dev/sde1 /dev/sdb1 =
/dev/sdc1" - System Error Message: <SPAN class=3D"Apple-converted-space">=A0=
 </SPAN>Error locking on node server4: Internal lvm error, check =
syslog</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Aborting. Failed to activate =
mirror log. Remove new LVs and retry.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Failed =
to create mirror log.</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">I deleted everything and retried =
it, but everytime the same error.</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">cluster is =
working good. clvmd is also started with locking mode 2.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">if I try to create a normal VG with a mirrored LV =
everythings fine.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">if I try to create a clustered =
VG with a normal LV everythings fine.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">but not =
a clustered VG with a mirrored LV...... why?</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">maybe =
somebody can help me with this situation.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">kind =
regards</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Michael</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">_______________________________________________</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">linux-lvm mailing list</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">read the =
LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A></DIV> </BLOCKQUOTE></DIV><BR></DIV><BR><BR><DIV> <SPAN =
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
</DIV><BR></BODY></HTML>=

--Apple-Mail-2--534219097--
