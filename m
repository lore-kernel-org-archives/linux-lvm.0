Received: from [192.168.1.101] (vpn-248-146.boston.redhat.com [10.13.248.146])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FFjCVa025828
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 10:45:13 -0500
Message-Id: <C3E4CC38-3764-4EC3-910E-9FBD91667701@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1@an-ex.ActiveNetwerx.int>
Content-Type: multipart/alternative; boundary=Apple-Mail-14--702670944
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] pvmove safety
Date: Fri, 15 Feb 2008 09:45:11 -0600
References: <1C8CF1EA1A5B5940B81B0710B2A4C93850BB382BA1@an-ex.ActiveNetwerx.int>
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


--Apple-Mail-14--702670944
Content-Type: text/plain;
	charset=WINDOWS-1252;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

pvmove is pretty reliable.  However, I would probably make a backup =20
before doing any sort of operation that would grow/shrink/move a file =20=

system.

  brassow

On Feb 12, 2008, at 3:25 PM, Joseph L. Casale wrote:

> How safe is pvmove in LVM2 when being operated on live volumes? I =20
> understand a backup is always a good policy as nothing can be 100% =20
> safe, but is the command known to produce unreliable results when =20
> used on a live filesystem? I am =
readinghttp://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html=20
>  and the warning up top is hard to miss, but I wonder if it=92s a bit =20=

> outdated?
>
> Thanks!
> jlc
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-14--702670944
Content-Type: text/html;
	charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">pvmove is pretty reliable. =
&nbsp;However, I would probably make a backup before doing any sort of =
operation that would grow/shrink/move a file system.<div><br =
class=3D"webkit-block-placeholder"></div><div>&nbsp;brassow<br><div><br><d=
iv><div>On Feb 12, 2008, at 3:25 PM, Joseph L. Casale wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div lang=3D"EN-US" link=3D"blue" =
vlink=3D"purple"><div class=3D"Section1"><div style=3D"margin-top: 0in; =
margin-right: 0in; margin-left: 0in; margin-bottom: 0.0001pt; font-size: =
11pt; font-family: Calibri, sans-serif; ">How safe is pvmove in LVM2 =
when being operated on live volumes? I understand a backup is always a =
good policy as nothing can be 100% safe, but is the command known to =
produce unreliable results when used on a live filesystem? I am =
reading<a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html" =
style=3D"color: blue; text-decoration: underline; =
">http://tldp.org/HOWTO/LVM-HOWTO/removeadisk.html</a><span =
class=3D"Apple-converted-space">&nbsp;</span>and the warning up top is =
hard to miss, but I wonder if it=92s a bit =
outdated?<o:p></o:p></div><div style=3D"margin-top: 0in; margin-right: =
0in; margin-left: 0in; margin-bottom: 0.0001pt; font-size: 11pt; =
font-family: Calibri, sans-serif; "><o:p>&nbsp;</o:p></div><div =
style=3D"margin-top: 0in; margin-right: 0in; margin-left: 0in; =
margin-bottom: 0.0001pt; font-size: 11pt; font-family: Calibri, =
sans-serif; =
">Thanks!<br>jlc<o:p></o:p></div></div>___________________________________=
____________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com" style=3D"color: blue; =
text-decoration: underline; ">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" style=3D"color:=
 blue; text-decoration: underline; =
">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM =
HOW-TO at<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" style=3D"color: blue; =
text-decoration: underline; =
">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></span></blockquote></div><br>=
</div></div></body></html>=

--Apple-Mail-14--702670944--
