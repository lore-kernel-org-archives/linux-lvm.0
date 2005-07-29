Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6TKlvRm021386
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 21:47:57 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dyblt-0003VM-DO
	for linux-lvm@redhat.com; Fri, 29 Jul 2005 21:47:57 +0100
Date: Fri, 29 Jul 2005 21:47:57 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Progress on LVM2 snapshots
Message-ID: <20050729204757.GP23710@agk.surrey.redhat.com>
References: <1119267914.21477.3.camel@dilbert>
	<1122572640.9888.27.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1122572640.9888.27.camel@localhost.localdomain>
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

On Thu, Jul 28, 2005 at 01:44:00PM -0400, Ming Zhang wrote:
> 1) very hard to solve technically. or
> 2) not so easy but doable, just no time and human resource?
 
The hardest part of the fix involves changing the sequence of 
device-mapper ioctls that LVM2 uses, and that's a couple of weeks' 
development work, now pencilled into the RHEL4 Update 3 timescale.

In the meantime, you can apply the snapshot patches in the -udm
tree and use 'dmsetup' manually to activate and deactivate snapshots
when lvm2 fails.

Patches 8 and 9 at:
  ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/
(Further patches are needed, but those two plus correct dmsetup use
should avoid machine lockups.)

Alasdair
-- 
agk@redhat.com
