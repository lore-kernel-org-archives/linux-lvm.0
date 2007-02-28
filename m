Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1SIUbjj014079
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:30:37 -0500
Received: from vpn-14-202.rdu.redhat.com (vpn-14-202.rdu.redhat.com
	[10.11.14.202])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l1SIUaZt001130
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 13:30:36 -0500
Subject: Re: [linux-lvm] Re: Re: LVM + Multipathing
From: Dave Wysochanski <dwysocha@redhat.com>
In-Reply-To: <mdera4-bvp.ln1@www.researchut.com>
References: <3nmja4-jtv.ln1@www.researchut.com>
	<20070220061150.GA3215@percy.comedia.it>
	<186ra4-8hp.ln1@www.researchut.com>
	<20070220131909.GA26642@percy.comedia.it>
	<mdera4-bvp.ln1@www.researchut.com>
Date: Wed, 28 Feb 2007 13:30:37 -0500
Message-Id: <1172687437.4270.17.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Tue, 2007-02-20 at 20:19 +0530, Ritesh Raj Sarraf wrote:
> Luca Berra wrote:
> 
> > i meant that LVM (actually device-mapper) does not do anything special.
> > it just passes the IO requests from the fs layer to the
> > underlying block device and if the underlyng block device returns an IO
> > error then it is passed back to the fs. which will cause ext2 to remount
> > the filesystem readonly.
> 
> Hi,
> 
> Thanks for clarifying.
> 
> In my case, the block device is hidden by the multipathing layer. 
> It is something like:
> (Block Device(Multipathing(LVM(Filesystem) ) ) )
> 
> Now during takeover/giveback, the multipathing layer is intelligent enough to
> wait till <120 seconds before declaring that the path has really gone offline
> and no more paths are available.
> If within the 120 seconds time span, the takeover succeeds, the path is back
> online and everything works fine in a non-LVM setup.
> 
> It is only in an LVM setup that a takeover/giveback ends up with the host OS
> having a filesystem read-only problem.

Interesting.

> Now if I go with your explanation, I shouldn't have had the filesystem read-only
> problem since the I/O is being passed on to the multipathing layer which is
> intelligent enough to wait for N seconds before really sending an I/O Error.
> 
> Are there any timeout options in LVM to allow it to wait for N seconds before
> sending out an error ?
> (I understand that LVM might not be involved, but just wondering).
> 

There are no LVM timeouts like you are suggesting.  LVM just does I/O to
devices like any other application.  The timeout settings you're looking
for should be in the layers below LVM.

What does your /etc/multipath.conf file look like?  Do you have
"no_path_retry" set and/or "queue_if_no_path"?  Both of these settings
will affect how multipath deals with a "no paths available" situation.

There are also settings below multipath, in the low-level driver(s).
Since you are using iscsi, I assume you've got open-iscsi?
You can set node.session.timeo.replacement_timeout to a lower value (it
is 120 by default in /etc/iscsi/iscsid.conf) if you want faster path
failure detection and faster failover.

In a lot of cases, people set the low level driver timeouts smaller (<
30 sec) to allow for quicker failure detection and failover, but a
higher or infinite value for the "no paths available" situation.

You might try open-iscsi.org and/or dm-devel lists.


> 
> Thanks,
> Ritesh
