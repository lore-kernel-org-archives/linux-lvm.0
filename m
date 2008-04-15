Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3F7md0v014308
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 03:48:39 -0400
Received: from positron.souja.net (ip-208-83-233-93.razorservers.com
	[208.83.233.93] (may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3F7mLwn018363
	for <linux-lvm@redhat.com>; Tue, 15 Apr 2008 03:48:22 -0400
Received: from [76.217.209.45] (helo=[192.168.1.160])
	by positron.souja.net with esmtpsa (TLS-1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.63) (envelope-from <jvantuyl@engineyard.com>)
	id 1Jlfts-0003C6-Uz
	for linux-lvm@redhat.com; Tue, 15 Apr 2008 07:48:21 +0000
Message-Id: <234BF196-FE40-4B32-AC84-FB336EC830DA@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
In-Reply-To: <20080415025610.GB8011@pretender.frop.net>
Content-Type: multipart/alternative; boundary=Apple-Mail-1-157745467
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] Increase LV size of snapshot (not COW table size)
Date: Tue, 15 Apr 2008 00:48:15 -0700
References: <20080415025610.GB8011@pretender.frop.net>
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


--Apple-Mail-1-157745467
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

You'll probably have better luck with unionfs.  LVM doesn't really do  
what you're asking for.

On Apr 14, 2008, at 7:56 PM, dave@frop.net wrote:

> I want to use LVM snapshots as CoW filesystems for virtual machines.
>
> Is it possible to increase the apparent size of the snapshot LV  
> without increasing the COW table size?
>
> Basically I want to have a minimally sized filesystem on a lv which  
> I snapshot for each virtual machine.  I don't want to be restricted  
> to having all the snapshots only be the size of the source lv.  I  
> want to increase the LV size of the snapshots at will and then  
> resize the underlying filesystems to fill it out (sparsely within  
> the COW table of course).
>
> It seems that lvresize only increases the cow table size for  
> snapshots, am I correct that LVM can't do what I want?
>
> thanks alot!
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com
1 866 518 9275 ext 204


--Apple-Mail-1-157745467
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">You'll probably have better =
luck with unionfs. &nbsp;LVM doesn't really do what you're asking =
for.<div><br><div><html>On Apr 14, 2008, at 7:56 PM, <a =
href=3D"mailto:dave@frop.net">dave@frop.net</a> wrote:</html><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite">I want to =
use LVM snapshots as CoW filesystems for virtual machines.<br><br>Is it =
possible to increase the apparent size of the snapshot LV without =
increasing the COW table size?<br><br>Basically I want to have a =
minimally sized filesystem on a lv which I snapshot for each virtual =
machine. &nbsp;I don't want to be restricted to having all the snapshots =
only be the size of the source lv. &nbsp;I want to increase the LV size =
of the snapshots at will and then resize the underlying filesystems to =
fill it out (sparsely within the COW table of course).<br><br>It seems =
that lvresize only increases the cow table size for snapshots, am I =
correct that LVM can't do what I want? <br><br>thanks =
alot!<br><br>_______________________________________________<br>linux-lvm =
mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></blockquote></div></div><br><div =
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

--Apple-Mail-1-157745467--
