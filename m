Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9OILwv9021476
	for <linux-lvm@redhat.com>; Tue, 24 Oct 2006 19:21:58 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GcQuU-0007uN-NX
	for linux-lvm@redhat.com; Tue, 24 Oct 2006 19:21:58 +0100
Date: Tue, 24 Oct 2006 19:21:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC, 2nd try] Let udev play with snapshots
Message-ID: <20061024182158.GC29513@agk.surrey.redhat.com>
References: <20061011173421.GC4636@hasse.suse.de>
	<20061023134100.GB4729@hasse.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061023134100.GB4729@hasse.suse.de>
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

On Mon, Oct 23, 2006 at 03:41:00PM +0200, Jan Blunck wrote:
> On Wed, Oct 11, Jan Blunck wrote:
> > - removing "vg-snapshot"                                                  (1)
> Actually this must be deactivation of vg-snapshot. This is where the
> deactivation code complains about the usage count of the LV.
 
The step will fail if it's still open by the time the kernel tries
to remove it.

As discussed on irc, let's try to optimise out the deactivate/activate.
 (a) activate cow excl local invisible (overriding 'visible' in metadata) ?
 (b) initialise zeros
 (c) ensure dev_flush() ran
 (d) skip the deactivate step
 ...

Alasdair
-- 
agk@redhat.com
