Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3EFO70M025004
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 16:24:07 +0100
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1Hck6h-0006VW-7E
	for linux-lvm@redhat.com; Sat, 14 Apr 2007 16:24:07 +0100
Date: Sat, 14 Apr 2007 16:24:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Limitation: Snapshots does not work in
	cluster	enviroment ?
Message-ID: <20070414152407.GK26983@agk.fab.redhat.com>
References: <4620D7E3.9090609@dtnet.de>
	<20070414145250.GI26983@agk.fab.redhat.com>
	<4620E73F.50100@dtnet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4620E73F.50100@dtnet.de>
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

On Sat, Apr 14, 2007 at 04:37:51PM +0200, Daniel Schwager wrote:
> So, i want to use snapshot1 on server1, snapshot2 on server2. The 
> original LV
> (where the snapshot is created from) is not in use (not mounted on any 
> server).
> 
> Is this possible ?

Well the reason you can't use snapshots in a cluster is because writes
cannot be handled correctly when there's more than one machine involved.
If all your writes are local with no impact on LVs in use on other
machines then the current kernel implementation ought to work.
I think the userspace LVM code could be tweaked to support this
configuration.  Until then, you'll need to activate the snapshots
manually using dmsetup directly.


Userspace changes we'd need for the tools to support this:
  Permit a snapshot to be activated without its corresponding origin.
  - requires a snapshot exclusive lock (already supported)
  - requires an origin lock that prevents any node having origin active
(implementation needs more thought but it should be possible)

Alasdair
-- 
agk@redhat.com
