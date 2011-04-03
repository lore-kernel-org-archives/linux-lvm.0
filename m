Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p339ABeb031188
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 05:10:11 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p339A6Ff031174
	for <linux-lvm@redhat.com>; Sun, 3 Apr 2011 05:10:07 -0400
Message-ID: <4D983971.6070006@abpni.co.uk>
Date: Sun, 03 Apr 2011 10:10:09 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------090900020804000807060305"
Subject: [linux-lvm] Server Crashes Sometimes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------090900020804000807060305
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Everyone,

I have seen this issue on 2 or 3 servers. Sometimes (very rarely), when 
I perform an lvm command, my server (which is a Xen Dom0) will crash 
(But still respond to ping), and dmseg is flooded with
/
Uhhuh. NMI received. Dazed and confused, but trying to continue
You probably have a hardware problem with your RAM chips/

For me, this has happened when doing lvremove, and lvcreate

My system details are as follows:

Linux server.mydomain 2.6.18-194.32.1.el5xen #1 SMP Wed Jan 5 18:44:24 
EST 2011 x86_64 x86_64 x86_64 GNU/Linux

Xen version is 3.4.3

This issue is very rare, and has only happened to me maybe 3 times over 
the past 7 months, each time being when I issued an LVM command

Has anybody experienced this before?

Thanks

--------------090900020804000807060305
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    Hi Everyone,<br>
    <br>
    I have seen this issue on 2 or 3 servers. Sometimes (very rarely),
    when I perform an lvm command, my server (which is a Xen Dom0) will
    crash (But still respond to ping), and dmseg is flooded with<br>
    <i><br>
      Uhhuh. NMI received. Dazed and confused, but trying to continue <br>
      You probably have a hardware problem with your RAM chips</i><br>
    <br>
    For me, this has happened when doing lvremove, and lvcreate<br>
    <br>
    My system details are as follows:<br>
    <br>
    Linux server.mydomain 2.6.18-194.32.1.el5xen #1 SMP Wed Jan 5
    18:44:24 EST 2011 x86_64 x86_64 x86_64 GNU/Linux<br>
    <br>
    Xen version is 3.4.3<br>
    <br>
    This issue is very rare, and has only happened to me maybe 3 times
    over the past 7 months, each time being when I issued an LVM command<br>
    <br>
    Has anybody experienced this before?<br>
    <br>
    Thanks<br>
  </body>
</html>

--------------090900020804000807060305--
