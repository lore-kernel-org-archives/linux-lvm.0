Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9C7DPIS010311
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 03:13:25 -0400
Received: from mx1.suse.de (ns.suse.de [195.135.220.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9C7DOkO001704
	for <linux-lvm@redhat.com>; Thu, 12 Oct 2006 03:13:24 -0400
Date: Thu, 12 Oct 2006 09:13:18 +0200
From: Jan Blunck <jblunck@suse.de>
Subject: Re: [linux-lvm] [RFC] Let udev play with snapshots
Message-ID: <20061012071317.GH4636@hasse.suse.de>
References: <20061011173421.GC4636@hasse.suse.de>
	<20061011174604.GQ17654@agk.surrey.redhat.com>
	<20061011180857.GE4636@hasse.suse.de>
	<20061011181746.GR17654@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061011181746.GR17654@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, kay.sievers@vrfy.org

On Wed, Oct 11, Alasdair G Kergon wrote:

> The cow begins life as a real LV.
> There is no way to distinguish it from other LVs.
> 
> Changing that means changing the "create a snapshot" process into a single
> LVM2 metadata transaction (or a pair of related transactions).  Currently it's
> two independent transactions - creating a new, empty LV; creating a snapshot
> using that LV.  Doing that would allow us to back out the change properly if
> it's aborted too.

Yes, that is probably the right thing to do.

But I still need a solution for todays code. When we are clearing the
exception store we know that the LV is going to be removed soon (and that udev
will never find a valid filesystem in it). So why don't we tell udev that it
shouldn't look at it in the first place.

The easiest thing that we came up with is to mark the thing somehow. So we
either use a different naming scheme for that LV (I don't like that idea) or
we use a tag if possible.
