Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8GLnpUX000483
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:49:51 -0400
Received: from jhuapl.edu (piper.jhuapl.edu [128.244.26.33])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8GLnbUT010203
	for <linux-lvm@redhat.com>; Wed, 16 Sep 2009 17:49:38 -0400
From: Stephen Hamer <Stephen.Hamer@jhuapl.edu>
Content-Type: multipart/alternative; boundary="=-QDLw+Q/AL3EJWItLajo5"
Date: Wed, 16 Sep 2009 21:49:33 +0000
Message-Id: <1253137773.5136.357.camel@hamerst1-ll1>
Mime-Version: 1.0
Subject: [linux-lvm] LVM Read/Write speed <10% drive's normal speed
Reply-To: Stephen.Hamer@jhuapl.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: xen-users@lists.xensource.com, linux-lvm@redhat.com


--=-QDLw+Q/AL3EJWItLajo5
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello all,

I've been searching through the archives and the internet for a while
now, and can't seem to find anything that helps me out. I hope you don't
my posting this to both xen-users and linux-lvm simultaneously, but i
figured it'd help keep the solution in one place... even though it'll be
the same across two places... Anyways:

My setup is this:
        Xen 3.3 hypervisor (from the ubuntu repositories)
        Ubuntu 9.04 server
        Kernel and module listed here:
http://www.infohit.net/blog/post/running-xen-on-ubuntu-intrepid-and-jaunty.html

The dom0 and domUs in my Xen setup are all Ubuntu 9.04, using that
kernel. (I'm not sure if the kernel has something to do with it, so i
included it just in case.) All the domUs are set up to use LVM. The dom0
uses a straight ext3 fs on /dev/sda1. The domUs use ext3 fs's within
LVMs (using LVM2) set up on /dev/sda5.

I have noticed a massive file I/O problem on all of my domUs. While I
can peak file operations around 100 MB/s within the dom0, I can't get
anything more than 3 MB/s read OR write out of a file operation on the
domUs. I am using values reported by "iotop" to make this distinction.
I'm using both the deployment of a Jboss server and the "dd" command to
benchmark this. The Jboss slowdown is how I found this. On the dom0, the
server takes 56s to come up. On a domU, the same operation takes 15
minutes.

It should also be noted that I attempted to change the filesystems to
ext2, because I noticed that 'kjournald' was chugging away taking up
most of the i/o percentage, but only writing at KB/s! Actually, when I
removed the journaling is when the process slowed from 7 minutes to 15.
Even without the kjournald there, the java process took forever to load
and never wrote more than 3 MB/s.

I have messed around with the 'blockdev' and 'hdparm' commands (the
second of which doesn't even interact with any partition on my computer,
lvm or no, instead simply failing with an "input/output error" message),
but have had no performance increases after messing around with the read
ahead speed of the devices. I also tried the "lvchange -r" command to
set the readahead higher. I think there's something else missing here,
though.

I'm fairly fresh to xen, this being only my second installation, and I'm
extremely fresh to lvm. I've played with what seems like every option
within "xm" and the 'lv*' commands. The LVMs themselves I haven't played
with all too much yet, as I don't want to nuke a certain domU before it
needs to be used heavily tomorrow. I've already killed a test domU that
I brought up just for this.

-Stephen

--=-QDLw+Q/AL3EJWItLajo5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.26.0">
</HEAD>
<BODY>
Hello all,<BR>
<BR>
I've been searching through the archives and the internet for a while now, and can't seem to find anything that helps me out. I hope you don't my posting this to both xen-users and linux-lvm simultaneously, but i figured it'd help keep the solution in one place... even though it'll be the same across two places... Anyways:<BR>
<BR>
My setup is this:<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Xen 3.3 hypervisor (from the ubuntu repositories)<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Ubuntu 9.04 server<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kernel and module listed here: <A HREF="http://www.infohit.net/blog/post/running-xen-on-ubuntu-intrepid-and-jaunty.html">http://www.infohit.net/blog/post/running-xen-on-ubuntu-intrepid-and-jaunty.html</A><BR>
<BR>
The dom0 and domUs in my Xen setup are all Ubuntu 9.04, using that kernel. (I'm not sure if the kernel has something to do with it, so i included it just in case.) All the domUs are set up to use LVM. The dom0 uses a straight ext3 fs on /dev/sda1. The domUs use ext3 fs's within LVMs (using LVM2) set up on /dev/sda5.<BR>
<BR>
I have noticed a massive file I/O problem on all of my domUs. While I can peak file operations around 100 MB/s within the dom0, I can't get anything more than 3 MB/s read OR write out of a file operation on the domUs. I am using values reported by &quot;iotop&quot; to make this distinction. I'm using both the deployment of a Jboss server and the &quot;dd&quot; command to benchmark this. The Jboss slowdown is how I found this. On the dom0, the server takes 56s to come up. On a domU, the same operation takes 15 minutes.<BR>
<BR>
It should also be noted that I attempted to change the filesystems to ext2, because I noticed that 'kjournald' was chugging away taking up most of the i/o percentage, but only writing at KB/s! Actually, when I removed the journaling is when the process slowed from 7 minutes to 15. Even without the kjournald there, the java process took forever to load and never wrote more than 3 MB/s.<BR>
<BR>
I have messed around with the 'blockdev' and 'hdparm' commands (the second of which doesn't even interact with any partition on my computer, lvm or no, instead simply failing with an &quot;input/output error&quot; message), but have had no performance increases after messing around with the read ahead speed of the devices. I also tried the &quot;lvchange -r&quot; command to set the readahead higher. I think there's something else missing here, though.<BR>
<BR>
I'm fairly fresh to xen, this being only my second installation, and I'm extremely fresh to lvm. I've played with what seems like every option within &quot;xm&quot; and the 'lv*' commands. The LVMs themselves I haven't played with all too much yet, as I don't want to nuke a certain domU before it needs to be used heavily tomorrow. I've already killed a test domU that I brought up just for this.<BR>
<BR>
-Stephen
</BODY>
</HTML>

--=-QDLw+Q/AL3EJWItLajo5--


--=-QDLw+Q/AL3EJWItLajo5--
