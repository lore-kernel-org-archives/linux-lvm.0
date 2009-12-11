Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBBEQZHG001266
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 09:26:35 -0500
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBBEQOPO007880
	for <linux-lvm@redhat.com>; Fri, 11 Dec 2009 09:26:25 -0500
Received: from backoffice.bplinux.com ([98.118.141.73])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KUH00IINS3QAK3L@vms173005.mailsrvcs.net> for
	linux-lvm@redhat.com; Fri, 11 Dec 2009 08:26:18 -0600 (CST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by backoffice.bplinux.com (Postfix) with ESMTP id 462F43E8002	for
	<linux-lvm@redhat.com>; Fri, 11 Dec 2009 09:23:11 -0500 (EST)
Received: from backoffice.bplinux.com ([127.0.0.1])
	by localhost (backoffice.bplinux.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id pARaOo-Ref8G for <linux-lvm@redhat.com>; Fri,
	11 Dec 2009 09:23:08 -0500 (EST)
Received: from backoffice.bplinux.com (backoffice.bplinux.com [192.168.1.4])
	by backoffice.bplinux.com (Postfix) with ESMTP id 613183E8001	for
	<linux-lvm@redhat.com>; Fri, 11 Dec 2009 09:23:08 -0500 (EST)
Date: Fri, 11 Dec 2009 09:23:08 -0500 (EST)
From: Christopher Hawkins <chawkins@bplinux.com>
Message-id: <32036046.971260541388070.JavaMail.javamailuser@localhost>
In-reply-to: <8023092.631260457480892.JavaMail.javamailuser@localhost>
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

There is a working patch for this issue in kernel-2.6.18-178.el5. If anyone needs it sooner, they do have a test kernel available for download. 

Christopher Hawkins

----- "Christopher Hawkins" <chawkins@bplinux.com> wrote:

> It is reported here:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=539328
> 
> That is definitely the one. And it sounds like they have a potential
> fix... I have already emailed the developers there asking if I can
> help test their patch, so hopefully soon I can post back and report
> status. 
> 
> Christopher Hawkins
> 
> ----- "Stuart D. Gathman" <stuart@bmsi.com> wrote:
> 
> > On Wed, 9 Dec 2009, Christopher Hawkins wrote:
> > 
> > > After some time I revisited this issue on a freshly installed
> Centos
> > 5.4 box,
> > > latest kernel (2.6.18-164.6.1.el5 ) and the panic is still
> > reproducible. Any
> > > time I create a snapshot of the root filesystem, kernel panics.
> The
> > LVM HOWTO
> > > says to post bug reports to this list. Is this the proper place?
> > 
> > Bummer.  I would post the bug on Centos bugzilla also.  Please post
> > the
> > bug number here if you do it (cause I'll get to it eventually).
> > 
> > Thanks for testing this.  I have the same problem, and have a new
> > client
> > to install by next year - so not much time to work on it.
> > 
> > Now that we know it is not yet fixed, we can form theories as to
> what
> > is going wrong.  My guess is that the problem is caused by the fact
> > that
> > lvm is updating files in /etc/lvm on the root filesystem while
> taking
> > the snapshot.  These updates are done by user space programs, so I
> > would
> > further speculate that *any* snapshot would crash if an update
> > happened exactly
> > when creating the snapshot - i.e. the atomic nature of snapshot
> > creation has
> > been broken.  The lvm user space probably does fsync() on files
> > in /etc/lvm, which might be involved in triggering the crash.
> > 
> > We could test the first theory by moving /etc/lvm to another volume
> > (I
> > sometimes put it on /boot - a non LVM filesystem - for easier
> > disaster
> > recovery.) Naturally, I wouldn't go moving /etc/lvm on a production
> > server.
> > 
> > Testing the second hypothesis is less certain, and would basically
> > involve
> > trying snapshots of LVs undergoing heavy updating.
> > 
> > -- 
> > 	      Stuart D. Gathman <stuart@bmsi.com>
> >     Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703
> > 591-6154
> > "Confutatis maledictis, flammis acribus addictis" - background song
> > for
> > a Microsoft sponsored "Where do you want to go from here?"
> > commercial.
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
