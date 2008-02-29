Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1TJU5AL022504
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:30:05 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1TJTZu8011153
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:29:35 -0500
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e32.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id m1TJSr5W002568
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 14:28:53 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.7) with ESMTP id
	m1TJTSlx216820
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:29:28 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	m1TJTRt3031903
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:29:27 -0700
Received: from malahal.beaverton.ibm.com (malahal.beaverton.ibm.com
	[9.47.17.130])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	m1TJTRUs031498
	for <linux-lvm@redhat.com>; Fri, 29 Feb 2008 12:29:27 -0700
Date: Fri, 29 Feb 2008 11:29:20 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Page cache corruption when creating a snapshot
Message-ID: <20080229192920.GB18264@us.ibm.com>
References: <200802291732.m1THWfD7013248@outgoing.mit.edu>
	<20080229183148.GI1788@agk.fab.redhat.com>
	<1204312265.5850.7.camel@error-messages.mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1204312265.5850.7.camel@error-messages.mit.edu>
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

Greg Hudson [ghudson@MIT.EDU] wrote:
> On Fri, 2008-02-29 at 18:31 +0000, Alasdair G Kergon wrote:
> > On Fri, Feb 29, 2008 at 12:32:41PM -0500, ghudson@MIT.EDU wrote:
> > > The reproduction recipe looks like:
> > >   rm -rf /tmp/test
> > >   mkdir /tmp/test
> > >   # Put around 60MB of files into /tmp/test
> > >   find /tmp/test -type f | xargs md5sum > /tmp/sum.pre
> > >   lvcreate --size 2G --snapshot /dev/dink/gutsy-i386-sbuild --name testsnapshot
> > >   find /tmp/test -type f | xargs md5sum > /tmp/sum.post
> > 
> > Can you do that twice?
> >     find /tmp/test -type f | xargs md5sum > /tmp/sum.post2
> > and check the two post files are the same?
> 
> In three reproductions of the page cache corruption, sum.post2 was
> always the same as sum.post.
> 
> In my experiences with this problem in general, the page cache
> corruption is not particularly transient; once it happens, the file
> continues to appear modified (with the same incorrect contents) for the
> indefinite future, until the machine is rebooted.
> 
> > And add some syncs/blockdev --flushbufs at different places
> > in the script to see if you can make it go away.
> 
> Nope, that never made it go away.  I'm not sure in what situations
> flushing write buffers would have any effect.  If I had a way to throw
> away the read-only page cache and force a file reload from disk, I would
> expect that to eliminate the visible effect of the corruption; at the
> moment the only reliable way I know how to do that is to reboot.

Not an expert on O_DIRECT, but it is supposed to read from the disk
without creating page cache. I don't really know what it does if page
cache exists! The "dd" command has O_DIRECT support and see if you
notice any change with the corrupted file when you do "dd" with and
without O_DIRECT.

--Malahal.
