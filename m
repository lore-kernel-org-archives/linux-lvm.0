Received: from [192.168.1.101] (vpn-248-90.boston.redhat.com [10.13.248.90])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m17GL7Jo029065
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2008 11:21:08 -0500
Message-Id: <C8BC17D3-C468-4D0B-90D6-D0AB57918AF0@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-93-755767145
Mime-Version: 1.0 (Apple Message framework v915)
Subject: Re: [linux-lvm] Docs on clustererd option of vgcreate
Date: Thu, 7 Feb 2008 10:21:06 -0600
References: <A78DB34D00374344A0AB65B6523C05DC02AFC226@marsden.win.datacash.com>
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


--Apple-Mail-93-755767145
Content-Type: text/plain;
	charset=WINDOWS-1252;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

The reason the results are likely so sparse is because the two modes =20
of operation (single machine and cluster) are so similar.

Once you've setup a cluster and installed the lvm2-cluster rpm*, new =20
volume groups that are created automatically receive the "clustered" =20
attribute.  [Toggle the cluster attribute by doing vgchange -c[ny] =20
<vg>]  The lvm commands stay the same as if you were running them on a =20=

single machine.**

  brassow

* Of course you could compile the sources or use another install method.
** Some targets (like snapshots) are not available when using LVM in a =20=

clustered mode.

On Feb 7, 2008, at 8:38 AM, Gerrard Geldenhuis wrote:

> Hi
> I am after a bit more documentation about the usage of the
> --clustered option in vgcreate.
>
> At the moment I don=92t have a spare san drive with which I can =20
> experiment. My understanding is that you would set this flag when =20
> different hosts(nodes) connect to the same storage area typically a =20=

> san with lvm configured.
>
> I am after a bit more information describing this =93clusterering=94 =20=

> functionality in lvm and how/where it is used. The man pages on lvm =20=

> and commands is a bit sparse and I am trawling through google =20
> results but not with great success at the moment.
>
> Regards
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-93-755767145
Content-Type: text/html;
	charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">The reason the results are =
likely so sparse is because the two modes of operation (single machine =
and cluster) are so similar.<div><br =
class=3D"webkit-block-placeholder"></div><div>Once you've setup a =
cluster and installed the lvm2-cluster rpm*, new volume groups that are =
created automatically receive the "clustered" attribute. &nbsp;[Toggle =
the cluster attribute by doing vgchange -c[ny] &lt;vg&gt;] &nbsp;The lvm =
commands stay the same as if you were running them on a single =
machine.**</div><div><br =
class=3D"webkit-block-placeholder"></div><div>&nbsp;brassow</div><div><br =
class=3D"webkit-block-placeholder"></div><div>* Of course you could =
compile the sources or use another install method.</div><div>** Some =
targets (like snapshots) are not available when using LVM in a clustered =
mode.</div><div><br><div><div>On Feb 7, 2008, at 8:38 AM, Gerrard =
Geldenhuis wrote:</div><br class=3D"Apple-interchange-newline"><blockquote=
 type=3D"cite"><span class=3D"Apple-style-span" style=3D"border-collapse: =
separate; color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: 2; text-align: =
auto; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div lang=3D"EN-US" link=3D"blue" =
vlink=3D"purple"><div class=3D"Section1"><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: 10pt; =
font-family: Arial; ">Hi<o:p></o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" face=3D"Arial"><span lang=3D"EN-GB" =
style=3D"font-size: 10pt; font-family: Arial; ">I am after a bit more =
documentation about the usage of the<o:p></o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" face=3D"Arial"><span lang=3D"EN-GB" =
style=3D"font-size: 10pt; font-family: Arial; ">--clustered option in =
vgcreate.<o:p></o:p></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: 10pt; =
font-family: Arial; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" face=3D"Arial"><span lang=3D"EN-GB" =
style=3D"font-size: 10pt; font-family: Arial; ">At the moment I don=92t =
have a spare san drive with which I can experiment. My understanding is =
that you would set this flag when different hosts(nodes) connect to the =
same storage area typically a san with lvm =
configured.<o:p></o:p></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: 10pt; =
font-family: Arial; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" face=3D"Arial"><span lang=3D"EN-GB" =
style=3D"font-size: 10pt; font-family: Arial; ">I am after a bit more =
information describing this =93clusterering=94 functionality in lvm and =
how/where it is used. The man pages on lvm and commands is a bit sparse =
and I am trawling through google results but not with great success at =
the moment.<o:p></o:p></span></font></div><div style=3D"margin-top: 0cm; =
margin-right: 0cm; margin-left: 0cm; margin-bottom: 0.0001pt; font-size: =
12pt; font-family: 'Times New Roman'; "><font size=3D"2" =
face=3D"Arial"><span lang=3D"EN-GB" style=3D"font-size: 10pt; =
font-family: Arial; "><o:p>&nbsp;</o:p></span></font></div><div =
style=3D"margin-top: 0cm; margin-right: 0cm; margin-left: 0cm; =
margin-bottom: 0.0001pt; font-size: 12pt; font-family: 'Times New =
Roman'; "><font size=3D"2" face=3D"Arial"><span lang=3D"EN-GB" =
style=3D"font-size: 10pt; font-family: Arial; =
">Regards<o:p></o:p></span></font></div></div>____________________________=
___________________<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com" style=3D"color: blue; =
text-decoration: underline; ">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" style=3D"color:=
 blue; text-decoration: underline; =
">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>read the LVM =
HOW-TO at<span class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" style=3D"color: blue; =
text-decoration: underline; =
">http://tldp.org/HOWTO/LVM-HOWTO/</a></div></span></blockquote></div><br>=
</div></body></html>=

--Apple-Mail-93-755767145--
