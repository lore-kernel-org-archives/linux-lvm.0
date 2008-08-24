Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7OIZctc013455
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2008 14:35:39 -0400
Received: from ucsc.edu (massmail.ucsc.edu [128.114.129.84])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m7OIZNUH007442
	for <linux-lvm@redhat.com>; Sun, 24 Aug 2008 14:35:24 -0400
Received: from [128.114.125.112] (HELO ucsc.edu)
	by massmail.ucsc.edu (CommuniGate Pro SMTP 5.1.7)
	with ESMTPS id 38405096 for linux-lvm@redhat.com;
	Sun, 24 Aug 2008 11:35:23 -0700
Received: from [24.5.124.163] (account ermorris@ucsc.edu HELO [10.0.1.200])
	by email-prod-fe-1.ucsc.edu (CommuniGate Pro SMTP 5.1.11)
	with ESMTPSA id 146764987 for linux-lvm@redhat.com;
	Sun, 24 Aug 2008 11:35:18 -0700
Message-Id: <CB36DF13-6A74-4487-8B6D-01B2F5B276DD@pmc.ucsc.edu>
From: Eli Morris <emorris@pmc.ucsc.edu>
In-Reply-To: <BAY107-W8ADCAC071D0CAF22B6B488F640@phx.gbl>
Content-Type: multipart/alternative; boundary=Apple-Mail-32-777549589
Mime-Version: 1.0 (Apple Message framework v926)
Subject: Re: [linux-lvm] VG won't activate upon reboot
Date: Sun, 24 Aug 2008 11:35:18 -0700
References: <BAY107-W8ADCAC071D0CAF22B6B488F640@phx.gbl>
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


--Apple-Mail-32-777549589
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

What OS are you running? I don't know how to fix it, but I have the  
same problem. I'm running Centos 4 Revision 5.

Eli



On Aug 24, 2008, at 5:07 AM, Mark Reardon wrote:

> Upon reboot, my VG will not activate, therefore I'm unable to mount  
> the filesystem.
>
> I have to run a vgchange -ay , then mount the filesystem manually.
>
> I need the VG to activate on reboot, how do I do this?
>
> Thanks.
>
> Get Hotmail on your mobile from Vodafone Try it Now!  
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-32-777549589
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">What OS are you running? I =
don't know how to fix it, but I have the same problem. I'm running =
Centos 4 Revision =
5.&nbsp;<div><br></div><div>Eli<br><div><br></div><div><br></div><div><br>=
<div><div>On Aug 24, 2008, at 5:07 AM, Mark Reardon wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div class=3D"hmmessage" =
style=3D"font-size: 10pt; font-family: Tahoma; ">Upon reboot, my VG will =
not activate, therefore I'm unable to mount the filesystem.<br><br>I =
have to run a vgchange -ay , then mount the filesystem =
manually.<br><br>I need the VG to activate on reboot, how do I do =
this?<br><br>Thanks.<br><br><hr>Get Hotmail on your mobile from =
Vodafone<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://clk.atdmt.com/UKM/go/107571435/direct/01/" =
target=3D"_new">Try it Now!</a><span =
class=3D"Apple-converted-space">&nbsp;</span>_____________________________=
__________________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</a></div></span></blockquote></div><br></div></div></body></html>=

--Apple-Mail-32-777549589--
