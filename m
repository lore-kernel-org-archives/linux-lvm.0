Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1860sa20723
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 01:00:54 -0500
Received: from yakka.services.adelaide.edu.au (yakka.services.adelaide.edu.au [129.127.41.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1860qb03848
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 01:00:53 -0500
Message-ID: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au>
From: Chris Doherty <chris.doherty@adelaide.edu.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm]corrupt /dev/lvm - bizzare properties
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
Date: Sun Feb  8 01:00:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I've been using LVM happily for several months without any complaints or 
problems.  This morning that all changed.  The boot process stopped cold when 
lvm-mod (w|c)ouldn't load.  My first impulse was to fsck, which I did as a 
matter of course.  Eventually, I stumbled across what appears to be the source 
of my problem:

root@connect4:~# ls -la /dev/lvm
?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm

The box is a fairly vanilla RedHat 9 install.  Here's a bit more info which 
might be relevant:

root@connect4:~# uname -a
Linux connect4 2.4.21 #1 Fri Aug 1 00:32:29 CST 2003 i586 i586 i386 GNU/Linux
root@connect4:~# dmesg |grep LVM
LVM version 1.0.5+(22/07/2002) module loaded
root@connect4:~# lsmod |grep lvm
lvm-mod                60000   0
root@connect4:~# /sbin/pvdisplay /dev/hdc1
pvdisplay -- LVM driver/module not loaded?

normally, the output would like this:

pvdisplay -- "/dev/hdc1" is a new physical volume of 23.29 GB

Googling hasn't been much help.  The closest thing I could find to my problem 
was a post to the LVM mailing list (Date: Thu Jun 13 2002 - 08:59:07 CEST) which

really just confirmed that, yes, what's happened is indeed a bad thing.

> Check that /dev/lvm has the right major/minor numbers: "ls -l /dev/lvm" 
> should give you something like this:
> 
> # ls -l /dev/lvm
> crw-r-----    1 root     root     109,   0 Mar 13  2001 /dev/lvm

I've thought about using lvmchange, but I can't discern from the manpage whether

or not this is the right thing to do.  I'm at a loss as to what to do next, 
since one false move could very easily hose my data.
