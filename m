Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7K8Iea23739
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 04:18:40 -0400
Received: from yoda.hubxpress.net (gw-oleane.hubxpress.net [81.80.52.129] (may
	be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7K8Ide1027387
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 04:18:39 -0400
Received: from illicom.com (unknown [192.168.1.128])
	by yoda.hubxpress.net (Postfix) with ESMTP id 19F992172
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 10:18:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by illicom.com (Mail Server) with ESMTP id F31152FC62
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 10:18:37 +0200 (CEST)
Received: from illicom.com ([127.0.0.1])
	by localhost (bilbo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 15851-02 for <linux-lvm@redhat.com>;
	Fri, 20 Aug 2004 10:18:37 +0200 (CEST)
Received: from [192.168.31.100] (unknown [192.168.31.100])
	by illicom.com (Mail Server) with ESMTP id D15132FC2C
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 10:18:37 +0200 (CEST)
From: duverger <duverger@illicom.com>
Content-Type: multipart/alternative; boundary="=-ynqNBxOGmA3Q90KUMY6i"
Message-Id: <1092989918.1340.9.camel@sushi>
Mime-Version: 1.0
Date: Fri, 20 Aug 2004 10:18:38 +0200
Subject: [linux-lvm] lvm2 + kernel 2.4.26
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
To: linux-lvm@redhat.com


--=-ynqNBxOGmA3Q90KUMY6i
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

LVM version:     2.00.16 (2004-05-24)
Library version: 1.00.19-ioctl (2004-07-03)
Driver version:  4.1.0

Lords,

I'm currently testing lvm2. It works well with a 2.6.6 kernel using an
"initrd" created by the "lvm2create_initrd" script.

Problems appear when i use a 2.4.26 kernel (the initrd is created the
same way that for 2.6 kernel). I think it's more related with initrd
kernel code and not lvm code, but maybe with your experience you already
have encoutered that kind of situation.

First strange thing is that even if i create a "linuxrc" executable file
on the root of my initrd, it is never processed. But the "/sbin/init" is
searched and found first instead. It's not the case when i create the
initrd with debian mkinitrd.

"/sbin/init" is a shell script, the problem appears when bash needs to
be launched.

/bin/bash: libdl.so.2 ... no such file or directory ....

"ldd bash" gives me entries to /lib/tls/libc.so.6 and
/lib/tls/libdl.so.2. These two libs are in the right place on the initrd
filesystem.

So, it seems that kernel is able to find the "init" binary on the initrd
file system but not the libs. I thought about lib path problems.

I have created a fake "/sbin/init" staticaly linked that only does a
printf() and an execve(/sbin/init_real) passing LD_LIBRARY_PATH in new
environment (but normally ld.so also checks default directories such as
/lib as it is said in the manpage). My "init" is correctly executed so
this justifies that kernel is able to read the initrd filesystem, enter
in sbin directory and launch a binary.

I've also tried to put library files wherever i could (/, /bin/, ...)
but no effect.

Why it couldn't find files in /lib directory ?
Is there any special patch to apply on 2.4.26 kernel ?


Best regards,

stephane

--=-ynqNBxOGmA3Q90KUMY6i
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.10">
</HEAD>
<BODY>
LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.00.16 (2004-05-24)<BR>
Library version: 1.00.19-ioctl (2004-07-03)<BR>
Driver version:&nbsp; 4.1.0<BR>
<BR>
Lords,<BR>
<BR>
I'm currently testing lvm2. It works well with a 2.6.6 kernel using an &quot;initrd&quot; created by the &quot;lvm2create_initrd&quot; script.<BR>
<BR>
Problems appear when i use a 2.4.26 kernel (the initrd is created the same way that for 2.6 kernel). I think it's more related with initrd kernel code and not lvm code, but maybe with your experience you already have encoutered that kind of situation.<BR>
<BR>
First strange thing is that even if i create a &quot;linuxrc&quot; executable file on the root of my initrd, it is never processed. But the &quot;/sbin/init&quot; is searched and found first instead. It's not the case when i create the initrd with debian mkinitrd.<BR>
<BR>
&quot;/sbin/init&quot; is a shell script, the problem appears when bash needs to be launched.<BR>
<BR>
/bin/bash: libdl.so.2 ... no such file or directory ....<BR>
<BR>
&quot;ldd bash&quot; gives me entries to /lib/tls/libc.so.6 and /lib/tls/libdl.so.2. These two libs are in the right place on the initrd filesystem.<BR>
<BR>
So, it seems that kernel is able to find the &quot;init&quot; binary on the initrd file system but not the libs. I thought about lib path problems.<BR>
<BR>
I have created a fake &quot;/sbin/init&quot; staticaly linked that only does a printf() and an execve(/sbin/init_real) passing LD_LIBRARY_PATH in new environment (but normally ld.so also checks default directories such as /lib as it is said in the manpage). My &quot;init&quot; is correctly executed so this justifies that kernel is able to read the initrd filesystem, enter in sbin directory and launch a binary.<BR>
<BR>
I've also tried to put library files wherever i could (/, /bin/, ...) but no effect.<BR>
<BR>
Why it couldn't find files in /lib directory ?<BR>
Is there any special patch to apply on 2.4.26 kernel ?<BR>
<BR>
<BR>
Best regards,<BR>
<BR>
stephane
</BODY>
</HTML>

--=-ynqNBxOGmA3Q90KUMY6i--
