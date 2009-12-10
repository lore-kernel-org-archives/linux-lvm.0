Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBAF8EO8003860
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:08:14 -0500
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBAF83Mh028262
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:08:03 -0500
Received: from backoffice.bplinux.com ([98.118.141.73])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KUF00C14ZCYUOBO@vms173007.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 10 Dec 2009 09:07:50 -0600 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id BE7603E8002	for
	<linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:04:45 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0Ov3XWeB3jk7 for <linux-lvm@redhat.com>; Thu,
	10 Dec 2009 10:04:41 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id 251923E8001	for
	<linux-lvm@redhat.com>; Thu, 10 Dec 2009 10:04:41 -0500 (EST)
Date: Thu, 10 Dec 2009 10:04:40 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-id: <8023092.631260457480892.JavaMail.javamailuser@localhost>
In-reply-to: <Pine.LNX.4.64.0912100949260.8205@bmsred.bmsi.com>
Subject: Re: [linux-lvm] kernel panic on lvcreate
MIME-version: 1.0
Content-transfer-encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

It is reported here:

https://bugzilla.redhat.com/show_bug.cgi?id=539328

That is definitely the one. And it sounds like they have a potential fix... I have already emailed the developers there asking if I can help test their patch, so hopefully soon I can post back and report status. 

Christopher Hawkins

----- "Stuart D. Gathman" <stuart@bmsi.com> wrote:

> On Wed, 9 Dec 2009, Christopher Hawkins wrote:
> 
> > After some time I revisited this issue on a freshly installed Centos
> 5.4 box,
> > latest kernel (2.6.18-164.6.1.el5 ) and the panic is still
> reproducible. Any
> > time I create a snapshot of the root filesystem, kernel panics. The
> LVM HOWTO
> > says to post bug reports to this list. Is this the proper place?
> 
> Bummer.  I would post the bug on Centos bugzilla also.  Please post
> the
> bug number here if you do it (cause I'll get to it eventually).
> 
> Thanks for testing this.  I have the same problem, and have a new
> client
> to install by next year - so not much time to work on it.
> 
> Now that we know it is not yet fixed, we can form theories as to what
> is going wrong.  My guess is that the problem is caused by the fact
> that
> lvm is updating files in /etc/lvm on the root filesystem while taking
> the snapshot.  These updates are done by user space programs, so I
> would
> further speculate that *any* snapshot would crash if an update
> happened exactly
> when creating the snapshot - i.e. the atomic nature of snapshot
> creation has
> been broken.  The lvm user space probably does fsync() on files
> in /etc/lvm, which might be involved in triggering the crash.
> 
> We could test the first theory by moving /etc/lvm to another volume
> (I
> sometimes put it on /boot - a non LVM filesystem - for easier
> disaster
> recovery.) Naturally, I wouldn't go moving /etc/lvm on a production
> server.
> 
> Testing the second hypothesis is less certain, and would basically
> involve
> trying snapshots of LVs undergoing heavy updating.
> 
> -- 
> 	      Stuart D. Gathman <stuart@bmsi.com>
>     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song
> for
> a Microsoft sponsored "Where do you want to go from here?"
> commercial.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
