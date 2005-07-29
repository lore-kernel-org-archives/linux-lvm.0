Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6TLE2V27684
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:14:02 -0400
Received: from leviathan.ele.uri.edu (leviathan.ele.uri.edu [131.128.51.64])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6TLDtIN004137
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 17:13:55 -0400
Subject: Re: [linux-lvm] Progress on LVM2 snapshots
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <20050729204757.GP23710@agk.surrey.redhat.com>
References: <1119267914.21477.3.camel@dilbert>
	<1122572640.9888.27.camel@localhost.localdomain>
	<20050729204757.GP23710@agk.surrey.redhat.com>
Date: Fri, 29 Jul 2005 17:13:49 -0400
Message-Id: <1122671629.5558.66.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

thanks!

so when is the RHEL4 Update 3 timescale? :)


will try the patches u mentioned.


ming


On Fri, 2005-07-29 at 21:47 +0100, Alasdair G Kergon wrote:
> On Thu, Jul 28, 2005 at 01:44:00PM -0400, Ming Zhang wrote:
> > 1) very hard to solve technically. or
> > 2) not so easy but doable, just no time and human resource?
>  
> The hardest part of the fix involves changing the sequence of 
> device-mapper ioctls that LVM2 uses, and that's a couple of weeks' 
> development work, now pencilled into the RHEL4 Update 3 timescale.
> 
> In the meantime, you can apply the snapshot patches in the -udm
> tree and use 'dmsetup' manually to activate and deactivate snapshots
> when lvm2 fails.
> 
> Patches 8 and 9 at:
>   ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/
> (Further patches are needed, but those two plus correct dmsetup use
> should avoid machine lockups.)
> 
> Alasdair
