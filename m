Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3AINIj30476
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 14:23:18 -0400
Received: from smtp-relay.dca.net (smtp-relay.dca.net [216.158.48.66])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3AINGMC025977
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 14:23:16 -0400
Received: from earth.solarsys.private
	(adsl-216-158-52-153.cust.oldcity.dca.net [216.158.52.153])
	by smtp-relay.dca.net (Postfix) with ESMTP id A1CBD317EF0
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 14:22:53 -0400 (EDT)
Date: Sat, 10 Apr 2004 14:23:15 -0400
From: "Mark M. Hoffman" <mhoffman@lightlink.com>
Subject: Re: [linux-lvm] snapshots and reiserfs
Message-ID: <20040410182315.GC17335@earth.solarsys.private>
References: <20040408181835.GA11818@earth.solarsys.private>
	<1081585711.22388.7.camel@rasputin.localnet>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1081585711.22388.7.camel@rasputin.localnet>
Reply-To: Linux LVM <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM <linux-lvm@redhat.com>

* Craig Ringer <craig@postnewspapers.com.au> [2004-04-10 16:28:32 +0800]:
> On Fri, 2004-04-09 at 02:18, Mark M. Hoffman wrote:
> 
> > kernel: reiserfs: checking transaction log (device 3a:06) ...
> > kernel: clm-2076: device is readonly, unable to replay log
> > kernel: Replay Failure, unable to mount
> > kernel: reiserfs_read_super: unable to initialize journal space
> 
> I upgraded my kernel to one provided by the Fedora project ( fedora.us,
> not fedora.redhat.com ). This seemed to sort out the problem.

What version?  I just looked at that site, and I don't see any kernel
RPMs except the stock RedHat ones (base and updates) for RedHat 9.

Or are you using FC1?  I'll upgrade, but only if I'm *sure* it will
solve the problem.

> > I have not tried the combination of snapshots & reiserfs with
> > earlier RedHat packages so I don't know if this is a regression.
> 
> I used to get it on RH8, with both ext3 and reiserfs (though more
> commonly with reiserfs). Syncing before taking the snapshot can help,
> but the only real fix is a kernel patch that makes sure the disk buffers
> are flushed to disk before the snapshot is taken.

Yeah, I already added a 'sync ; sleep 2' in front of the 'lvcreate' in
my scripts...  I'm still seeing some failures, but fewer than before.

> > Also, is it necessary that the filesystem be quiescent in order to
> > create a snapshot?  I could temporarily remount readonly to create
> > the snapshot, but I would like not to have to do that.
> 
> That would probably work too, but the VFS lock patch /really/ should do
> the trick.

That's what I understood as well; maybe RedHat's VFS lock patch is bad.

Thanks and regards,

-- 
Mark M. Hoffman
mhoffman@lightlink.com
