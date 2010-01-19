Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0J4X8pL003540
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 23:33:08 -0500
Received: from mail5.sea5.speakeasy.net (mail5.sea5.speakeasy.net
	[69.17.117.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0J4WqfB031974
	for <linux-lvm@redhat.com>; Mon, 18 Jan 2010 23:32:53 -0500
Received: from ns1.lingpgmr.com (HELO deafeng29.signtype.info)
	(cochranb@[66.92.147.154]) (envelope-sender <cochranb@speakeasy.net>)
	by mail5.sea5.speakeasy.net (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 19 Jan 2010 04:32:52 -0000
Message-ID: <4B5535ED.3090406@speakeasy.net>
Date: Mon, 18 Jan 2010 23:32:45 -0500
From: Robert L Cochran <cochranb@speakeasy.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="------------070706040006060908030006"
Subject: [linux-lvm] How To Clone and Resize Luks-Encrypted Fedora System
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------070706040006060908030006
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I am looking for a way to clone and resize a Fedora 12 x86_64 system to 
a new hard drive which provides a lot more capacity. The system I wish 
to clone is encrypted with luks. I basically need to move the whole 
system to a larger drive, then resize the partitions larger. These are 
ext4 partitions. Here is what my grub.conf kernel line says:

kernel /vmlinuz-2.6.31.9-174.fc12.x86_64 ro 
root=/dev/mapper/vg_deafeng298-lv_root_deafeng298  LANG=en_US.UTF-8 
SYSFONT=latarcyrheb-sun16 KEYBOARDTYPE=pc KEYTABLE=us

Is there a procedure available for doing this?

What if I just cloned the existing drive to the new drive using RIPLinux 
and ddrescue, then attempted to resize the clone's partitions? I'm fuzzy 
about how to do this. Or perhaps use a Fedora Live DVD and ddrescue?

Thanks!

Bob Cochran
Greenbelt, Maryland, USA

--------------070706040006060908030006
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
</head>
<body bgcolor="#ffffff" text="#000000">
<font size="+2"><font face="Nimbus Roman No9 L">I am looking for a way
to clone and resize a Fedora 12 x86_64 system to a new hard drive which
provides a lot more capacity. The system I wish to clone is encrypted
with luks. I basically need to move the whole system to a larger drive,
then resize the partitions larger. These are ext4 partitions. Here is
what my grub.conf kernel line says:<br>
<br>
kernel /vmlinuz-2.6.31.9-174.fc12.x86_64 ro
root=/dev/mapper/vg_deafeng298-lv_root_deafeng298&nbsp; LANG=en_US.UTF-8
SYSFONT=latarcyrheb-sun16 KEYBOARDTYPE=pc KEYTABLE=us<br>
<br>
Is there a procedure available for doing this? <br>
<br>
What if I just cloned the existing drive to the new drive using
RIPLinux and ddrescue, then attempted to resize the clone's partitions?
I'm fuzzy about how to do this. Or perhaps use a Fedora Live DVD and
ddrescue?<br>
<br>
Thanks!<br>
<br>
Bob Cochran<br>
Greenbelt, Maryland, USA<br>
</font></font>
</body>
</html>

--------------070706040006060908030006--
