Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3OAO856007449
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 06:24:08 -0400
Received: from vs1011.euddene.net (vs1011.euddene.net [84.20.3.36])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l3OAO6Dw018916
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 06:24:07 -0400
Received: from [192.168.1.33] (28.Red-83-55-207.dynamicIP.rima-tde.net
	[83.55.207.28])
	by vs1011.euddene.net (8.12.3/8.12.3/Debian-7.1) with ESMTP id
	l3O9vgkm011250
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 11:57:43 +0200
Message-ID: <462DDAC5.20100@euddene.com>
Date: Tue, 24 Apr 2007 12:24:05 +0200
From: Mariano Gonzalvo <mgm@euddene.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------070604040708080207090604"
Subject: [linux-lvm] Configure lvm2 with drbd
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

This is a multi-part message in MIME format.
--------------070604040708080207090604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

    I'm trying to configure lvm2 on top of drbd. I've configured drbd 
(/dev/drbd0 and /dev/drbd1) and put them as primary node, but when I try 
to create a physical volume this is what it does happens

       pvcreate /dev/drbd0
          Physical volume "/dev/drbd0" successfully created
       pvdisplay
            --- NEW Physical volume ---
          PV Name               /dev/md4
          VG Name
          PV Size               129,45 GB
          Allocatable           NO
          PE Size (KByte)       0
          Total PE              0
          Free PE               0
          Allocated PE          0
          PV UUID               MtxjHy-8zfW-i9nq-TJA4-b6F9-jtcW-FkanLB

    /dev/md4 is the raid device over was configured drbd0.

    Why /dev/md4 it's taken as PV Name?

Thanks in advance

Best regards

Mariano


--------------070604040708080207090604
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
<font size="-1"><font face="Helvetica, Arial, sans-serif">Hi,<br>
<br>
&nbsp;&nbsp;&nbsp; I'm trying to configure lvm2 on top of drbd. I've configured drbd
(/dev/drbd0 and /dev/drbd1) and put them as primary node, but when I
try to create a physical volume this is what it does happens<br>
<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; pvcreate /dev/drbd0<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; Physical volume "/dev/drbd0" successfully created<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; pvdisplay <br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; --- NEW Physical volume ---<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/md4<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; VG Name<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; PV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 129,45 GB<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NO<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; Free PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; PV UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MtxjHy-8zfW-i9nq-TJA4-b6F9-jtcW-FkanLB<br>
<br>
&nbsp;&nbsp;&nbsp; /dev/md4 is the raid device over was configured drbd0.<br>
<br>
&nbsp;&nbsp;&nbsp; Why /dev/md4 it's taken as PV Name?<br>
<br>
Thanks in advance<br>
<br>
Best regards<br>
<br>
Mariano<br>
<br>
</font></font>
</body>
</html>

--------------070604040708080207090604--
