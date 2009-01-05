Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n05Kd4WN014596
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:43:10 -0500
Received: from positron.souja.net (positron.souja.net [208.83.233.93])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n05KBWxH030480
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 15:11:32 -0500
Received: from [71.141.76.77] (helo=[192.168.3.115])
	by positron.souja.net with esmtpsa (TLS-1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.63) (envelope-from <jvantuyl@engineyard.com>)
	id 1LJvnP-0002lh-3S
	for linux-lvm@redhat.com; Mon, 05 Jan 2009 12:11:31 -0800
Message-Id: <965A87FA-13DE-4D61-998C-6E94C0743C44@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
In-Reply-To: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-64--523983556
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] LVM2 on-disk layout
Date: Mon, 5 Jan 2009 12:11:26 -0800
References: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
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


--Apple-Mail-64--523983556
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: 7bit

The reason the metadata wraps around is to decrease the likelihood of  
losing all your metadata if a failure happens during an update.

If you always write from the beginning of the area, then any partial  
write guarantees a complete loss.  If you always start part-way  
through, then you only lose data when your metadata approaches the  
full size of the MDA.  Since this is most likely an issue with small  
arrays (where there are few disks and you may only have 1 or 2 MDAs),  
this gives vastly greater chances of recovery.

Also, even in the event of a failure, you are likely to get the  
beginning of the new data + end the of the old data--which is more  
recoverable (by hand) than the alternatives.

It's all about increasing chances of recoverability in the event of a  
failure.

On Jan 5, 2009, at 2:22 AM, Tejas Sumant wrote:

> I have few questions on lvm2 layout.
>
> 1) Why array of MDA (metadata area) is required? Isnt single MDA  
> sufficient?
> 2) Which MDA is current?
> 3) Why the metadata inside MDA wraps around, instead of the offset
> pointing to the start of metadata?
>
> Can somebody kindly answers this?
> -- 
> Tejas Sumant
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
IRC (freenode): kagato


--Apple-Mail-64--523983556
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">The reason the metadata wraps =
around is to decrease the likelihood of losing all your metadata if a =
failure happens during an update.<div><br></div><div>If you always write =
from the beginning of the area, then any partial write guarantees a =
complete loss. &nbsp;If you always start part-way through, then you only =
lose data when your metadata approaches the full size of the MDA. =
&nbsp;Since this is most likely an issue with small arrays (where there =
are few disks and you may only have 1 or 2 MDAs), this gives vastly =
greater chances of recovery.</div><div><br></div><div>Also, even in the =
event of a failure, you are likely to get the beginning of the new data =
+ end the of the old data--which is more recoverable (by hand) than the =
alternatives.</div><div><br></div><div>It's all about increasing chances =
of recoverability in the event of a failure.</div><div><br><div><div>On =
Jan 5, 2009, at 2:22 AM, Tejas Sumant wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>I =
have few questions on lvm2 layout.<br><br>1) Why array of MDA (metadata =
area) is required? Isnt single MDA sufficient?<br>2) Which MDA is =
current?<br>3) Why the metadata inside MDA wraps around, instead of the =
offset<br>pointing to the start of metadata?<br><br>Can somebody kindly =
answers this?<br>-- <br>Tejas =
Sumant<br><br>_______________________________________________<br>linux-lvm=
 mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></div></blockquote></div></div><br><di=
v apple-content-edited=3D"true"> <span class=3D"Apple-style-span" =
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
">1 866 518 9275 ext 204</span></font></div><div><font =
class=3D"Apple-style-span" size=3D"2"><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">IRC (freenode): =
kagato</span></font></div></span></span></div></span></div></span></div></=
span></div></span> </div><br></body></html>=

--Apple-Mail-64--523983556--
