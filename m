Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m547ccew016956
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 03:38:38 -0400
Received: from smtp.lippi.fr (smtp.lippi.fr [213.223.112.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m547cPMt010106
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2008 03:38:25 -0400
Received: from inetgw (inetgw [127.0.0.1])
	by smtp.lippi.fr (smtp) with ESMTP id C0B9BC408A62
	for <linux-lvm@redhat.com>; Wed,  4 Jun 2008 09:38:18 +0200 (CEST)
MIME-Version: 1.0
Message-ID: <OF7B312B80.8E5D67C6-ONC125745E.0029E521-C125745E.0029F5B6@lippi.fr>
From: Antony MARTINEAU <Antony.MARTINEAU@lippi.fr>
Date: Wed, 4 Jun 2008 09:38:34 +0200
Content-Type: multipart/related; boundary="=_related 0029F5B4C125745E_="
Subject: [linux-lvm] Restoring method Snapshot to Orginal Volume
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
To: linux-lvm@redhat.com

Message en plusieurs parties au format MIME
--=_related 0029F5B4C125745E_=
Content-Type: multipart/alternative;
	boundary="=_alternative 0029F5B4C125745E_="


--=_alternative 0029F5B4C125745E_=
Content-Type: text/plain; charset="US-ASCII"

Hello, 
I am using LVM2 whith XEN 
All of my DomU disks are one or more logical volume 
For exemple /dev/vg0/lv1 

For the moment when i want do a domU backup, i take a snapshot, do an 
image (dd gzip) of the snapshot, delete the snapshot and restor the dd 
image on the original logical volume. 
so 

Backuping 
lvcreate -s -L500M -nlv1.snap /dev/vg0/lv1 
dd if=/dev/vg0/lv1.snap bs=16M | gzip | dd of=/lv1.gz bs=16M 
lvremove /dev/vg0/lv1.snap 

Restoring 
gzip -dc /lv1.gz | dd of=/dev/vg0/lv1 

This method is very weight and not useful 

ideally 
dd if=/dev/vg0/lv1.snap of=/dev/vg0/lv1 should be perfect but it is 
impossible because when restoring snapshot on the original volume, the 
snapshot continue to increase until to become fully and inactive 

Is there a solution to deactive the cow (copy and write)for during the 
restoration about snapshot to original volume ? 




MARTINEAU
Antony 
Service informatique 
Assistant informatique 
LIPPI Management 
La Fouillouse
16440 Mouthiers sur Boheme 
Tel.: 05.45.67.34.35
Courriel: antony.martineau@lippi.fr
http://www.lippi.fr 








Ce message et toutes les pieces jointes sont etablis a l'attention 
exclusive de ses destinataires et sont strictement confidentiels. Pour en 
savoir plus cliquer ici

This message and any attachments are confidential to the ordinary user of 
the e-mail address to which it was addressed and may also be privileged. 
More information


--=_alternative 0029F5B4C125745E_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif"><br>
Hello,</font><font size=3> </font><font size=2 face="sans-serif"><br>
I am using LVM2 whith XEN</font><font size=3> </font><font size=2 face="sans-serif"><br>
All of my DomU disks are one or more logical volume</font><font size=3>
</font><font size=2 face="sans-serif"><br>
For exemple /dev/vg0/lv1</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
For the moment when i want do a domU backup, i take a snapshot, do an image
(dd gzip) of the snapshot, delete the snapshot and restor the dd image
on the original logical volume.</font><font size=3> </font><font size=2 face="sans-serif"><br>
so</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
Backuping</font><font size=3> </font><font size=2 face="sans-serif"><br>
lvcreate -s -L500M -nlv1.snap /dev/vg0/lv1</font><font size=3> </font><font size=2 face="sans-serif"><br>
dd if=/dev/vg0/lv1.snap bs=16M | gzip | dd of=/lv1.gz bs=16M</font><font size=3>
</font><font size=2 face="sans-serif"><br>
lvremove /dev/vg0/lv1.snap</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
Restoring</font><font size=3> </font><font size=2 face="sans-serif"><br>
gzip -dc /lv1.gz | dd of=/dev/vg0/lv1</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
This method is very weight and not useful</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
ideally <br>
dd if=/dev/vg0/lv1.snap of=/dev/vg0/lv1 should be perfect but it is impossible
because when restoring snapshot on the original volume, the snapshot continue
to increase until to become fully and inactive</font><font size=3> <br>
</font><font size=2 face="sans-serif"><br>
Is there a solution to deactive the cow (copy and write)for during the
restoration about snapshot to original volume ?</font><font size=3> </font><font size=2 face="sans-serif"><br>
</font>
<table>
<tr>
<td></table>
<br>
<table>
<tr>
<td colspan=2>
<div align=center><img src=cid:_1_09F20E5409F20A800029F5B4C125745E></div>
<tr>
<td><font size=3 face="Arial"><b>MARTINEAU<br>
Antony</b> </font><font size=2 color=#808080 face="Arial"><br>
Service informatique </font><font size=1 color=#808080 face="Arial"><br>
Assistant informatique <br>
LIPPI Management </font>
<td><font size=1 color=#004080 face="Arial">La Fouillouse<br>
16440 Mouthiers sur Boheme <br>
Tel.: 05.45.67.34.35<br>
Courriel: </font><a href=mailto:antony.martineau@lippi.fr><font size=1 color=blue face="Arial"><u>antony.martineau@lippi.fr</u></font></a><font size=1 color=blue face="Arial"><u><br>
</u></font><a href=http://www.lippi.fr/><font size=1 color=blue face="Arial"><u>http://www.lippi.fr</u></font></a><font size=1 color=#004080 face="Arial">
</font></table>
<br><font size=3 face="sans-serif"><br>
<br>
<br>
</font>
<br><font size=3 face="Lucida Sans"><br>
</font><img src=http://www.lippi.fr/img/eco.jpg><font size=3 face="Lucida Sans"><br>
</font><font size=2 face="Lucida Sans"><br>
<br>
Ce message et toutes les pieces jointes sont etablis a l'attention exclusive
de ses destinataires et sont strictement confidentiels. </font><a href=http://www.lippi.fr/disclaimer.php><font size=2 color=blue face="Lucida Sans"><u>Pour
en savoir plus cliquer ici</u></font></a><font size=2 face="Lucida Sans"><br>
<br>
This message and any attachments are confidential to the ordinary user
of the e-mail address to which it was addressed and may also be privileged.
</font><a href=http://www.lippi.fr/disclaimer.php><font size=2 color=blue face="Lucida Sans"><u>More
information</u></font></a><font size=3 face="Lucida Sans"><br>
</font>
<br>
--=_alternative 0029F5B4C125745E_=--

--=_related 0029F5B4C125745E_=
Content-Type: image/gif
Content-ID: <_1_09F20E5409F20A800029F5B4C125745E>
Content-Transfer-Encoding: base64

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
CVEEq5EJ8v3iOVFtPiEHKqLjKxEQADs=
--=_related 0029F5B4C125745E_=--
