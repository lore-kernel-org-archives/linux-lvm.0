Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j09JDHr27728
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 14:13:17 -0500
Received: from web52701.mail.yahoo.com (web52701.mail.yahoo.com
	[206.190.39.152])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j09JD7Ir020044
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 14:13:12 -0500
Message-ID: <20050109191257.6887.qmail@web52701.mail.yahoo.com>
Date: Sun, 9 Jan 2005 11:12:57 -0800 (PST)
From: Patrick Bartkus <patrckb22@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] she-bang doesn't work - bad interpreter: Permission
	denied
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I've searched the mailing list archives and can't find
any relevant threads.

Here's my environment:
Fedora Core 3

[root@aslan bin]# rpm -q lvm2
lvm2-2.00.25-1.01
[root@aslan bin]# lvm version
  LVM version:     2.00.25 (2004-09-29)
  Library version: 1.00.19-ioctl (2004-07-03)
  Driver version:  4.1.0

When I try to excute a simple perl program on my
/home/.../bin (which is on a logical volume partition)
I get:

[root@aslan bin]# cat hello-world
#!/usr/bin/perl -wT
print "hello, world!\n" ;
[root@aslan bin]# ./hello-world
bash: ./hello-world: /usr/bin/perl: bad interpreter:
Permission denied
[root@aslan bin]#

But I try the same exact program on the same partition
as the interperter
[root@aslan bin]# /tmp/hello-world
hello, world!

Am I not holding my mouth right? What could be
preventing the execution of my scripts from my logical
volume?

Patrick

=====
Patrick Bartkus, RHCE, CCNP, SCM 	Sr. Network Support Analyst
         Atlanta, GA
If truth was not absolute, how could there be justice?

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
