Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GLMdtt028722
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:22:39 -0400
Received: from campbell-lange.net (no.rdns-yet.ukservers.com [78.110.169.69]
	(may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GLLe3w009743
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 17:22:02 -0400
Date: Mon, 16 Jun 2008 22:21:34 +0100
From: Veselin Kantsev <veselin@campbell-lange.net>
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
Message-ID: <20080616212134.GM3765@campbell-lange.net>
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org>
	<20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org>
	<20080616151014.GJ3765@campbell-lange.net>
	<4856BC88.4060602@wpkg.org>
	<a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thank you Dan,
I'll certainly have a look at the zumastor project.

Regards,
Veselin
On Mon, Jun 16, 2008 at 12:38:23PM -0700, Dan Kegel wrote:
> On Mon, Jun 16, 2008 at 12:18 PM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> > LVM-2 doesn't scale very well.
> >
> > If you have I/O intensive workloads, I'd discourage using (multiple)
> > snapshots.
> >
> > A single write to the origin mean additional writes to each and every
> > snapshot of that origin.
> 
> Right.  This is one of the things zumastor.org snapshots do better;
> all snapshots for a volume share a common snapshot store,
> so performance doesn't fall as you add more snapshots.
> You might want to have a look at it... join the zumastor
> mailing list or drop in on our irc if you have questions.
> - Dan
> 
> p.s.
> > Tomasz Chmielewski
> > http://wpkg.org
> 
> wpkg.org looks very cool.  I haven't used it much yet,
> but I hope to use it as a kind of automated real world test of
> wine sometime.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
