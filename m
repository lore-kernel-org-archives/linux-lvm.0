Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4CLWj306413
	for <linux-lvm@redhat.com>; Wed, 12 May 2004 17:32:45 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i4CLWiu08012
	for linux-lvm@redhat.com; Wed, 12 May 2004 16:32:44 -0500
Date: Wed, 12 May 2004 16:32:44 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] 2 TB limit
Message-ID: <20040512163244.C23665@homer.msp.redhat.com>
References: <005601c412af$748d71a0$1fa0a8c0@blec>
	<200403261813.50041.krustev@krustev.net>
	<20040326161644.GF12948@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040326161644.GF12948@null.msp.redhat.com>;
	from alewis@redhat.com on Fri, Mar 26, 2004 at 10:16:44AM -0600
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 26, 2004 at 10:16:44AM -0600, AJ Lewis wrote:
> The PE size limitation isn't present in lvm2 (The version of lvm that works
> in 2.6) if you use the native lvm2 format.  So you should be able to create
> larger than 2TB LVs with LVM2.  Just FYI.

As those of you monitoring the lvm-cvs mailing list may have noticed, 
I've added code to the LVM2 CVS tree to help people simulate large devices
for testing purposes on 2.6 kernels with the latest -udm patches.

  lvcreate --type zero -L16T vg  # Create 16TB 'zero' device
  lvcreate -s vg/lvol0 -L1G      # Create snapshot of it

Then use the snapshot as a 'sparse' device, in the example, supporting
upto 1GB of actual data.

[At some point I'll merge it into a one-line command with --type sparse]

NB There's been a lot of change in CVS recently (and more to come)
so I expect some new bugs to show up along with the new features:-(
 
Alasdair
-- 
agk@redhat.com
