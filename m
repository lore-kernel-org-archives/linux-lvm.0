Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i3A8TIj04017
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 04:29:18 -0400
Received: from bucket.localnet (dsl-202-72-149-28.wa.westnet.com.au
	[202.72.149.28])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i3A8TFMC030157
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 04:29:17 -0400
Received: from [127.0.0.1] (6to4-localhost [127.0.0.1] (may be forged))
	by bucket.localnet (8.12.8/8.12.8) with ESMTP id i3A8Tqmn023361
	for <linux-lvm@redhat.com>; Sat, 10 Apr 2004 16:29:53 +0800
Subject: Re: [linux-lvm] snapshots and reiserfs
From: Craig Ringer <craig@postnewspapers.com.au>
In-Reply-To: <20040408181835.GA11818@earth.solarsys.private>
References: <20040408181835.GA11818@earth.solarsys.private>
Message-Id: <1081585711.22388.7.camel@rasputin.localnet>
Mime-Version: 1.0
Date: Sat, 10 Apr 2004 16:28:32 +0800
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-04-09 at 02:18, Mark M. Hoffman wrote:

> kernel: reiserfs: checking transaction log (device 3a:06) ...
> kernel: clm-2076: device is readonly, unable to replay log
> kernel: Replay Failure, unable to mount
> kernel: reiserfs_read_super: unable to initialize journal space

I upgraded my kernel to one provided by the Fedora project ( fedora.us,
not fedora.redhat.com ). This seemed to sort out the problem.

> I have not tried the combination of snapshots & reiserfs with
> earlier RedHat packages so I don't know if this is a regression.

I used to get it on RH8, with both ext3 and reiserfs (though more
commonly with reiserfs). Syncing before taking the snapshot can help,
but the only real fix is a kernel patch that makes sure the disk buffers
are flushed to disk before the snapshot is taken.

> Also, is it necessary that the filesystem be quiescent in order to
> create a snapshot?  I could temporarily remount readonly to create
> the snapshot, but I would like not to have to do that.

That would probably work too, but the VFS lock patch /really/ should do
the trick.

Craig Ringer
