Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3F7qCl5016356
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 03:52:12 -0400
Received: from positron.souja.net (ip-208-83-233-93.razorservers.com
	[208.83.233.93] (may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3F7puFT020645
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 03:51:56 -0400
Received: from [76.217.209.45] (helo=[192.168.1.160])
	by positron.souja.net with esmtpsa (TLS-1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.63) (envelope-from <jvantuyl@engineyard.com>)
	id 1JlfxL-0003Ch-Uf
	for linux-lvm@redhat.com; Tue, 15 Apr 2008 07:51:56 +0000
Message-Id: <F9227A17-73E1-4E1F-BED2-0844D295F3DE@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
In-Reply-To: <20080411161817.GA5028@percy.comedia.it>
Content-Type: multipart/alternative; boundary=Apple-Mail-2-157959751
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] LVM mirroring questions...
Date: Tue, 15 Apr 2008 00:51:49 -0700
References: <69649d440804080414qba1bb21waa98de61c11876f8@mail.gmail.com>
	<Pine.LNX.4.44.0804080716300.23698-100000@bmsred.bmsi.com>
	<20080411161817.GA5028@percy.comedia.it>
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


--Apple-Mail-2-157959751
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

On Apr 11, 2008, at 9:18 AM, Luca Berra wrote:
> this is not entirely correct.
> md has a bitmap feature that is used to track which blocks are out of
> sync.
For the record, this is called a "write-intent bitmap".  It's very  
handy, although to make it really perform you need to put it on a  
separate spindle from the data (which is supported).  Otherwise the  
extra seeks cause quite an impact on disk performance.



-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com
1 866 518 9275 ext 204


--Apple-Mail-2-157959751
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div><html>On Apr 11, 2008, at =
9:18 AM, Luca Berra wrote:</html><blockquote type=3D"cite">this is not =
entirely correct.<br>md has a bitmap feature that is used to track which =
blocks are out of<br>sync.</blockquote>For the record, this is called a =
"write-intent bitmap". &nbsp;It's very handy, although to make it really =
perform you need to put it on a separate spindle from the data (which is =
supported). &nbsp;Otherwise the extra seeks cause quite an impact on =
disk performance.</div><div><br></div><br><br><div =
apple-content-edited=3D"true"> <span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: auto; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; -webkit-text-decorations-in-effect: none; =
text-indent: 0px; -webkit-text-size-adjust: auto; text-transform: none; =
orphans: 2; white-space: normal; widows: 2; word-spacing: 0px; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; -webkit-text-decorations-in-effect: none; =
text-indent: 0px; -webkit-text-size-adjust: auto; text-transform: none; =
orphans: 2; white-space: normal; widows: 2; word-spacing: 0px; "><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; =
-webkit-text-decorations-in-effect: none; text-indent: 0px; =
-webkit-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; =
"><div>--&nbsp;</div><div>Jayson Vantuyl</div><div><font =
class=3D"Apple-style-span" size=3D"2"><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">Systems =
Architect</span></span></span></font></div><div><b style=3D"font-weight: =
bold; "><a href=3D"http://www.engineyard.com"><span =
class=3D"Apple-style-span" style=3D"font-weight: normal; color: rgb(0, =
0, 238); -webkit-text-decorations-in-effect: underline; "><span =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 238); =
-webkit-text-decorations-in-effect: underline; ">Engine =
Yard</span></span></a></b></div><div><font class=3D"Apple-style-span" =
size=3D"2"><span class=3D"Apple-style-span" style=3D"font-size: 10px; =
"><span class=3D"Apple-style-span" style=3D"font-size: 10px; "><span =
class=3D"Apple-style-span" style=3D"font-size: 10px; "><a =
href=3D"mailto:jvantuyl@engineyard.com">jvantuyl@engineyard.com</a></span>=
</span></span></font></div><div><font class=3D"Apple-style-span" =
size=3D"2"><span class=3D"Apple-style-span" style=3D"font-size: 10px; =
">1 866 518 9275 ext =
204</span></font></div></span></span></div></span></div></span></div></spa=
n> </div><br></body></html>=

--Apple-Mail-2-157959751--
