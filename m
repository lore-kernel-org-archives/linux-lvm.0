Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9CL3mr03816
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 17:03:48 -0400
Received: from ti41.telemetry-investments.com (209-166-240-202.cust.walrus.com
	[209.166.240.202])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9CL3aoF003232
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 17:03:41 -0400
Received: from ti64.telemetry-investments.com (ti64 [192.168.8.64])
	by ti41.telemetry-investments.com (Postfix) with ESMTP id 5641A100E6
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 17:03:31 -0400 (EDT)
Date: Tue, 12 Oct 2004 17:03:31 -0400
From: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>
Subject: Re: [linux-lvm] LVM2 lockup while snapshotting root
Message-ID: <20041012210331.GA4288@ti64.telemetry-investments.com>
References: <20041012195853.GA6352@omnifarious.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041012195853.GA6352@omnifarious.org>
Reply-To: "Bill Rugolsky Jr." <brugolsky@telemetry-investments.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Oct 12, 2004 at 12:58:53PM -0700, Eric Hopper wrote:
> First, it could be updates to /etc/lvm while the filesystem is
> suspended.  This shouldn't be done at all.  First, a journal of what the
> planned change is should be written to /etc/lvm, the filesystem
> suspended, the change made, the filesystem unsuspended, then a marker
> indicating that the change succeeded to /etc/lvm.

Sounds like a good starting point.  Other interesting cases are swap on
LVM, and rolling back the root fs to a snapshot.

> Second, it could be the fact that the LVM executable is demand paged.
> It could be that a page of the executable is read in while the
> filesystem is suspended.  This is trickier to solve, and having the
> problem is much more excusable than the first.

mlockall(2)?

Regards,

	Bill Rugolsky
