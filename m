Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4T80WfK029445
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 04:00:32 -0400
Received: from smtp.lippi.fr (smtp.lippi.fr [213.223.112.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4T80Isu003285
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 04:00:19 -0400
Received: from inetgw (inetgw [127.0.0.1])
	by smtp.lippi.fr (smtp) with ESMTP id 21686C3B5DA7
	for <linux-lvm@redhat.com>; Thu, 29 May 2008 10:00:11 +0200 (CEST)
MIME-Version: 1.0
Message-ID: <OF80E61A5B.6D9ACC9F-ONC1257458.002BE356-C1257458.002BF64C@lippi.fr>
From: Antony MARTINEAU <Antony.MARTINEAU@lippi.fr>
Date: Thu, 29 May 2008 10:00:21 +0200
Content-Type: multipart/alternative;
	boundary="=_alternative 002BF649C1257458_="
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
--=_alternative 002BF649C1257458_=
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










Ce message et toutes les pieces jointes sont etablis a l'attention 
exclusive de ses destinataires et sont strictement confidentiels. Pour en 
savoir plus cliquer ici

This message and any attachments are confidential to the ordinary user of 
the e-mail address to which it was addressed and may also be privileged. 
More information


--=_alternative 002BF649C1257458_=
Content-Type: text/html; charset="US-ASCII"


<br><font size=2 face="sans-serif">Hello,</font>
<br><font size=2 face="sans-serif">I am using LVM2 whith XEN</font>
<br><font size=2 face="sans-serif">All of my DomU disks are one or more
logical volume</font>
<br><font size=2 face="sans-serif">For exemple /dev/vg0/lv1</font>
<br>
<br><font size=2 face="sans-serif">For the moment when i want do a domU
backup, i take a snapshot, do an image (dd gzip) of the snapshot, delete
the snapshot and restor the dd image on the original logical volume.</font>
<br><font size=2 face="sans-serif">so</font>
<br>
<br><font size=2 face="sans-serif">Backuping</font>
<br><font size=2 face="sans-serif">lvcreate -s -L500M -nlv1.snap /dev/vg0/lv1</font>
<br><font size=2 face="sans-serif">dd if=/dev/vg0/lv1.snap bs=16M | gzip
| dd of=/lv1.gz bs=16M</font>
<br><font size=2 face="sans-serif">lvremove /dev/vg0/lv1.snap</font>
<br>
<br><font size=2 face="sans-serif">Restoring</font>
<br><font size=2 face="sans-serif">gzip -dc /lv1.gz | dd of=/dev/vg0/lv1</font>
<br>
<br><font size=2 face="sans-serif">This method is very weight and not useful</font>
<br>
<br><font size=2 face="sans-serif">ideally </font>
<br><font size=2 face="sans-serif">dd if=/dev/vg0/lv1.snap of=/dev/vg0/lv1
should be perfect but it is impossible because when restoring snapshot
on the original volume, the snapshot continue to increase until to become
fully and inactive</font>
<br>
<br><font size=2 face="sans-serif">Is there a solution to deactive the
cow (copy and write)for during the restoration about snapshot to original
volume ?<br>
</font>
<table>
<tr>
<td></table>
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
--=_alternative 002BF649C1257458_=--
