Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2PE97j23663
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 09:09:07 -0500
Received: from gw-nl5.philips.com (postfix@gw-nl5.philips.com [161.85.127.51])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2PE96WA000765
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 09:09:06 -0500
Received: from smtpscan-nl1.philips.com (smtpscan-nl1.philips.com
	[130.139.36.21])
	by gw-nl5.philips.com (Postfix) with ESMTP id A1E7F6B3DE
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 15:09:05 +0100 (MET)
Received: from smtpscan-nl1.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 3A01719C49
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 15:09:05 +0100 (MET)
Received: from smtprelay-nl2.philips.com (smtprelay-eur2.philips.com
	[130.139.36.35])
	by smtpscan-nl1.philips.com (Postfix) with ESMTP id C271D19C48
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 15:09:04 +0100 (MET)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-nl2.philips.com (8.9.3p3/8.8.5-1.2.2m-19990317) with ESMTP
	id PAA02022
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 15:09:04 +0100 (MET)
From: darren.miller@philips.com
Subject: Re: [linux-lvm] snapshots and 2.6 kernel
MIME-Version: 1.0
Message-ID: <OFDA4623E8.BF7156E4-ON80256E62.004D4E4D-80256E62.004DBAD7@philips.com>
Date: Thu, 25 Mar 2004 14:07:05 +0000
Content-Type: multipart/alternative;
	boundary="=_alternative 004DBAD480256E62_="
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multipart message in MIME format.
--=_alternative 004DBAD480256E62_=
Content-Type: text/plain; charset="us-ascii"

Getting the volume active is a pain I found that you have to reboot the 
system and when it comes back you need to create a link your volume group 
directory for the snapshot you create, atleast after the reboot the 
snapshot device showup in /dev/mapper which is a start right.

link it into your VG device home directory and then you can remove the 
snapshot, once you got the snapshot out of the way you can run lvchange -a 
y <lvname> to bring your original LV back online.

Hope this makes sense.

Daz
==============================================================================
Darren Miller 
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer 
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 
0DJ,England
Direct Dial In: +44 (0) 2380 312681









Rich Turner <rich@storix.com>
Sent by: 
linux-lvm-bounces@redhat.com
23/03/2004 23:33
Please respond to LVM general discussion and development

 
        To:     LVM general discussion and development <linux-lvm@redhat.com>
        cc:     (bcc: Darren Miller/SOU/SC/PHILIPS)
        Subject:        [linux-lvm] snapshots and 2.6 kernel
        Classification: 



i understand from numerous posts on this list and many others that
snapshots in the 2.6 kernel is not yet supported.

the lvm commands allow you to create the snapshot but do nothing with
it. even worse, i am unable to remove the snapshot or get the original
logical volume active.

is there any progress in the 2.6 kernel supporting snapshots?

is there any way to know if the snapshot will be valid before creating
the snapshot (other than 'uname -r')?

which is the culprit: device-mapper, lvm?

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



--=_alternative 004DBAD480256E62_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">Getting the volume active is a pain I found that you have to reboot the system and when it comes back you need to create a link your volume group directory for the snapshot you create, atleast after the reboot the snapshot device showup in /dev/mapper which is a start right.</font>
<br>
<br><font size=2 face="sans-serif">link it into your VG device home directory and then you can remove the snapshot, once you got the snapshot out of the way you can run lvchange -a y &lt;lvname&gt; to bring your original LV back online.</font>
<br>
<br><font size=2 face="sans-serif">Hope this makes sense.</font>
<br>
<br><font size=2 face="sans-serif">Daz<br>
==============================================================================<br>
Darren Miller &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
Senior Systems Support Engineer<br>
Microsoft Certified Professional<br>
SCO Advanced Certified Engineer &nbsp; &nbsp; &nbsp; &nbsp;<br>
Infomation Systems Department (Core Server Support)<br>
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 0DJ,England<br>
Direct Dial In: +44 (0) 2380 312681</font>
<br>
<br>
<br>
<table width=100%>
<tr valign=top>
<td>
<td>
<br>
<br>
<br>
<br>
<br><font size=1 face="sans-serif"><b>Rich Turner &lt;rich@storix.com&gt;</b></font>
<p><font size=1 face="sans-serif">Sent by: </font>
<br><font size=1 face="sans-serif">linux-lvm-bounces@redhat.com</font>
<p><font size=1 face="sans-serif">23/03/2004 23:33</font>
<br><font size=1 face="sans-serif">Please respond to LVM general discussion and development</font>
<br>
<td><font size=1 face="Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To: &nbsp; &nbsp; &nbsp; &nbsp;LVM general discussion and development &lt;linux-lvm@redhat.com&gt;</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc: &nbsp; &nbsp; &nbsp; &nbsp;(bcc: Darren Miller/SOU/SC/PHILIPS)</font>
<br><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject: &nbsp; &nbsp; &nbsp; &nbsp;[linux-lvm] snapshots and 2.6 kernel</font>
<p><font size=1 face="sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Classification: &nbsp; &nbsp; &nbsp; &nbsp;</font>
<br></table>
<br>
<br>
<br><font size=2 face="Courier New">i understand from numerous posts on this list and many others that<br>
snapshots in the 2.6 kernel is not yet supported.<br>
<br>
the lvm commands allow you to create the snapshot but do nothing with<br>
it. even worse, i am unable to remove the snapshot or get the original<br>
logical volume active.<br>
<br>
is there any progress in the 2.6 kernel supporting snapshots?<br>
<br>
is there any way to know if the snapshot will be valid before creating<br>
the snapshot (other than 'uname -r')?<br>
<br>
which is the culprit: device-mapper, lvm?<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm<br>
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/<br>
</font>
<br>
<br>
--=_alternative 004DBAD480256E62_=--
