Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i29GQT831323
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 11:26:29 -0500
Received: from gw-nl3.philips.com (gw-nl3.philips.com [161.85.127.49])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i29GQSST024592
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 11:26:28 -0500
Received: from smtpscan-nl2.philips.com (smtpscan-nl2.philips.com [130.139.36.22])
	by gw-nl3.philips.com (Postfix) with ESMTP id E2B422B4C7
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 17:26:27 +0100 (MET)
Received: from smtpscan-nl2.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id BC54919C48
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 17:26:25 +0100 (MET)
Received: from smtprelay-nl2.philips.com (smtprelay-eur2.philips.com [130.139.36.35])
	by smtpscan-nl2.philips.com (Postfix) with ESMTP id 3A49B19C4F
	for <linux-lvm@redhat.com>; Tue,  9 Mar 2004 17:26:23 +0100 (MET)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com [130.139.27.125]) 
	by smtprelay-nl2.philips.com (8.9.3p3/8.8.5-1.2.2m-19990317) with ESMTP id RAA05132
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 17:26:22 +0100 (MET)
From: darren.miller@philips.com
MIME-Version: 1.0
Message-ID: <OF346D886A.0C3E6B12-ON80256E52.005A0594-80256E52.005A3FAF@philips.com>
Content-Type: multipart/alternative; boundary="=_alternative 005A3FAE80256E52_="
Subject: [linux-lvm] LVM2 and Linux 2.6.2
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Mar  9 16:49:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multipart message in MIME format.
--=_alternative 005A3FAE80256E52_=
Content-Type: text/plain; charset="us-ascii"

I am using Slackware 9.0 with Linux Kernel 2.6.2, LVM 2.2.00.08 and 
device-mapper 1.00.07 create a vg and an lv not a problem all works great. 
 As soon as I use lvcreate -s etc etc it goes nuts.

Using command: lvcreate -L 28G -s -n snapTue /dev/vault/vol1

gives: 

device-mapper ioctl cmd 9 failed: Invalid argument
Couldn't load device 'vault-snapTue'.
Problem reactivating origin vol1

where it fails to create /dev/mapper/vault-snapTue and link it to 
/dev/vault/snapTue so I can't do anything with it until I reboot the 
machine whereby it appears in /dev/mapper but still requires me to 
manually link it to be removed as once the snapshot create command is run 
the original volume goes inactive and will not reactivate using lvchange 
-a -y
I have tried various filesystems for the original to no see difference in 
behaviour.

So now I am at a loss, do you guys have any clue why this doesn't work 
where it was working fine with LVM1?

please help..

Darren
==============================================================================
Darren Miller 
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer 
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 
0DJ,England
Direct Dial In: +44 (0) 2380 312681
--=_alternative 005A3FAE80256E52_=
Content-Type: text/html; charset="us-ascii"


<br><font size=2 face="sans-serif">I am using Slackware 9.0 with Linux Kernel 2.6.2, LVM 2.2.00.08 and device-mapper 1.00.07 create a vg and an lv not a problem all works great. &nbsp;As soon as I use lvcreate -s etc etc it goes nuts.</font>
<br>
<br><font size=2 face="sans-serif">Using command: lvcreate -L 28G -s -n snapTue /dev/vault/vol1</font>
<br>
<br><font size=2 face="sans-serif">gives: &nbsp; </font>
<br>
<br><font size=2 face="sans-serif">device-mapper ioctl cmd 9 failed: Invalid argument</font>
<br><font size=2 face="sans-serif">Couldn't load device 'vault-snapTue'.</font>
<br><font size=2 face="sans-serif">Problem reactivating origin vol1</font>
<br>
<br><font size=2 face="sans-serif">where it fails to create /dev/mapper/vault-snapTue and link it to /dev/vault/snapTue so I can't do anything with it until I reboot the machine whereby it appears in /dev/mapper but still requires me to manually link it to be removed as once the snapshot create command is run the original volume goes inactive and will not reactivate using lvchange -a -y</font>
<br><font size=2 face="sans-serif">I have tried various filesystems for the original to no see difference in behaviour.</font>
<br>
<br><font size=2 face="sans-serif">So now I am at a loss, do you guys have any clue why this doesn't work where it was working fine with LVM1?</font>
<br>
<br><font size=2 face="sans-serif">please help..</font>
<br>
<br><font size=2 face="sans-serif">Darren<br>
==============================================================================<br>
Darren Miller &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br>
Senior Systems Support Engineer<br>
Microsoft Certified Professional<br>
SCO Advanced Certified Engineer &nbsp; &nbsp; &nbsp; &nbsp;<br>
Infomation Systems Department (Core Server Support)<br>
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15 0DJ,England<br>
Direct Dial In: +44 (0) 2380 312681</font>
--=_alternative 005A3FAE80256E52_=--
