Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAR8sbSu010509
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 03:54:37 -0500
Received: from post.berlin.i-dmedia.com (post.i-dmedia.com [62.159.214.250])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAR8sQ3x016578
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 03:54:26 -0500
Received: from localhost (localhost [127.0.0.1])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 8C3FDFAB4
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 09:56:07 +0100 (CET)
Received: from post.berlin.i-dmedia.com ([127.0.0.1])
	by localhost (post.berlin.i-dmedia.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id blUYO5rj0ULG for <linux-lvm@redhat.com>;
	Thu, 27 Nov 2008 09:55:57 +0100 (CET)
Received: from x1.ads.i-dmedia.com (x1.berlin.i-dmedia.com [10.1.69.45])
	by post.berlin.i-dmedia.com (Postfix) with ESMTP id 780D8FAB0
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 09:55:57 +0100 (CET)
Message-Id: <E3E8DACD-916F-4A20-AE40-535AE1373326@idmedia.com>
From: Falko Zurell <falko.zurell@idmedia.com>
In-Reply-To: <OFEEAC56CA.4D4B448B-ONC125750E.00300773-C125750E.00305B8E@lippi.fr>
Content-Type: multipart/alternative; boundary=Apple-Mail-4-360751138
Mime-Version: 1.0 (Apple Message framework v929.2)
Subject: Re: [linux-lvm] XFS_freeze and LVM
Date: Thu, 27 Nov 2008 09:54:14 +0100
References: <OFEEAC56CA.4D4B448B-ONC125750E.00300773-C125750E.00305B8E@lippi.fr>
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


--Apple-Mail-4-360751138
Content-Type: text/plain;
	charset=UTF-8;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Hi,

are your LVM tools on the freezed file system? Is this the / partition =20=

you are freezing? Bad idea ;-)

kind regards



Am 27.11.2008 um 09:48 schrieb Antony MARTINEAU:

>
> Hello,
> I want using LVM 2 and Mysql
> So i have mounted /var/lib/mysql on /dev/vg0/mysql.
>
> For doing a backup i want do
> xfs_freeze -f /var/lib/mysql
> and after : lvcreate --snapshot -n snap -L1G /dev/vg0/mysql.
>
> But the problem is when i freeze xfs filesystem i can't use lvm =20
> commands...
> When i unfreeze xfs lvm commands are available...
>
> Do you know the problem?? is it a bug.??
> Cordialement,
>
> <ATT54517403.gif>
> MARTINEAU
> Antony
> Service informatique
> Assistant informatique
> LIPPI Management	La Fouillouse
> 16440 Mouthiers sur Boheme
> Tel.: 05.45.67.34.35
> Courriel: antony.martineau@lippi.fr
> http://www.lippi.fr
>
>
>
>
>
>
>
>
>
> Ce message et toutes les pieces jointes sont etablis a l'attention =20
> exclusive de ses destinataires et sont strictement confidentiels. =20
> Pour en savoir plus cliquer ici
>
> This message and any attachments are confidential to the ordinary =20
> user of the e-mail address to which it was addressed and may also be =20=

> privileged. More information
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Falko Zurell =EF=A3=BF

Head of Application Management


/i-d media AG
Ohlauer Stra=C3=9Fe 43
D-10999 Berlin





--Apple-Mail-4-360751138
Content-Type: text/html;
	charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">Hi,<div><br></div><div>are your =
LVM tools on the freezed file system? Is this the / partition you are =
freezing? Bad idea ;-)</div><div><br></div><div>kind =
regards</div><div><br></div><div><br></div><div><br><div><div>Am =
27.11.2008 um 09:48 schrieb Antony MARTINEAU:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><br><font =
size=3D"2" face=3D"sans-serif">Hello, </font> <br><font size=3D"2" =
face=3D"sans-serif">I want using LVM 2 and Mysql</font> <br><font =
size=3D"2" face=3D"sans-serif">So i have mounted /var/lib/mysql on =
/dev/vg0/mysql.</font> <br> <br><font size=3D"2" face=3D"sans-serif">For =
doing a backup i want do</font> <br><font size=3D"2" =
face=3D"sans-serif">xfs_freeze -f /var/lib/mysql</font> <br><font =
size=3D"2" face=3D"sans-serif">and after : lvcreate --snapshot -n snap =
-L1G /dev/vg0/mysql.</font> <br> <br><font size=3D"2" =
face=3D"sans-serif">But the problem is when i freeze xfs filesystem i =
can't use lvm commands... </font> <br><font size=3D"2" =
face=3D"sans-serif">When i unfreeze xfs lvm commands are =
available...</font> <br> <br><font size=3D"2" face=3D"sans-serif">Do you =
know the problem?? is it a bug.?? <br> </font> <table> <tbody><tr> =
<td><font size=3D"2" face=3D"Arial">Cordialement,<br> =
</font></td></tr></tbody></table> <br> <table> <tbody><tr> <td =
colspan=3D"2"> <div =
align=3D"center"><span>&lt;ATT54517403.gif></span></div> </td></tr><tr> =
<td><font size=3D"3" face=3D"Arial"><b>MARTINEAU<br> Antony</b> =
</font><font size=3D"2" color=3D"#808080" face=3D"Arial"><br> Service =
informatique </font><font size=3D"1" color=3D"#808080" face=3D"Arial"><br>=
 Assistant informatique <br> LIPPI Management </font> </td><td><font =
size=3D"1" color=3D"#004080" face=3D"Arial">La Fouillouse<br> 16440 =
Mouthiers sur Boheme <br> Tel.: 05.45.67.34.35<br> Courriel: </font><a =
href=3D"mailto:antony.martineau@lippi.fr"><font size=3D"1" color=3D"blue" =
face=3D"Arial"><u>antony.martineau@lippi.fr</u></font></a><font size=3D"1"=
 color=3D"blue" face=3D"Arial"><u><br> </u></font><a =
href=3D"http://www.lippi.fr/"><font size=3D"1" color=3D"blue" =
face=3D"Arial"><u>http://www.lippi.fr</u></font></a><font size=3D"1" =
color=3D"#004080" face=3D"Arial"> </font></td></tr></tbody></table> =
<br><font size=3D"2" face=3D"sans-serif"><br> <br> <br> </font> =
<br><font size=3D"2" face=3D"Lucida Sans"><br> </font><img =
src=3D"http://www.lippi.fr/img/eco.jpg"><font size=3D"2" face=3D"Lucida =
Sans"><br> <br> <br> Ce message et toutes les pieces jointes sont =
etablis a l'attention exclusive de ses destinataires et sont strictement =
confidentiels. </font><a href=3D"http://www.lippi.fr/disclaimer.php"><font=
 size=3D"2" color=3D"blue" face=3D"Lucida Sans"><u>Pour en savoir plus =
cliquer ici</u></font></a><font size=3D"2" face=3D"Lucida Sans"><br> =
<br> This message and any attachments are confidential to the ordinary =
user of the e-mail address to which it was addressed and may also be =
privileged. </font><a href=3D"http://www.lippi.fr/disclaimer.php"><font =
size=3D"2" color=3D"blue" face=3D"Lucida Sans"><u>More =
information</u></font></a><font size=3D"2" face=3D"Lucida Sans"><br> =
</font> <br>_______________________________________________<br>linux-lvm =
mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</blockquote></div><br><div =
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
after-white-space; "><div><p align=3D"">Falko Zurell&nbsp;=EF=A3=BF</p><p =
align=3D"">Head of Application Management<br><br></p><p align=3D"">/i-d =
media&nbsp;AG<br>Ohlauer Stra=C3=9Fe 43<br>D-10999 Berlin</p><p =
align=3D""><br></p></div></div></span></div></span> =
</div><br></div></body></html>=

--Apple-Mail-4-360751138--
