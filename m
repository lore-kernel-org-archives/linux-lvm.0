Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3PJw5X8004102
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 15:58:05 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3PJw2xV020994
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 15:58:02 -0400
Subject: Re: [linux-lvm] lvm2 *TEMPORARY* PV failure - what happens?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <444E73C3.7040305@nrel.colostate.edu>
References: <444E73C3.7040305@nrel.colostate.edu>
Date: Tue, 25 Apr 2006 15:57:29 -0400
Message-Id: <1145995049.26842.103.camel@localhost.localdomain>
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

my 2c. fix me if i am wrong

either activate the VG partially, and then all LVs on other PVs are
still accessible. I remember these LVs will only have RO access. Though
I have no idea why.

use dm-zero to generate a fake PVs and add to VG, then allow VG to
activate and access those LV. But i do not know if you access a LV that
is partially or fully on this PV, what will happen.

Ming


On Tue, 2006-04-25 at 13:08 -0600, Ty! Boyack wrote:
> I've been intrigued by the discussion of what happens when a PV fails, 
> and have begun to wonder what would happen in the case of a transient 
> failure of a PV.
> 
> The design I'm thinking of is a SAN environment with several 
> multi-terabyte iSCSI arrays as PVs, being grouped together into a single 
> VG, and then carving LVs out of that.  We plan on using the CLVM tools 
> to fit into a clustered environment. 
> 
> The arrays themselves are robust (RAID 5/6, redundant power supplies, 
> etc.) and I grant that if we lose the actual array (for example, if 
> multiple disks fail), then we are in the situation of a true and 
> possibly total failure of the PV and loss of it's data blocks.
> 
> But there is always the possiblity that we could lose the CPU, memory, 
> bus, etc. in the iSCSI controller portion of the array, which will cause 
> downtime, but no true loss of data.  Or someone may hit the wrong power 
> switch and just reboot the thing, taking it offline for a short time.  
> Yes, that someone would probably be me.  Shame on me.
> 
> The key point is that the iSCSI disk will come back in a few 
> minutes/hours/days depending on the failure type, and all blocks will be 
> intact when it comes back up.  I suppose the analagous situation would 
> be using LVM on a group of hot swap drives and pulling one of the disks, 
> waiting a while, and then re-inserting it.
> 
> Can someone please walk me through the resulting steps that would happen 
> within LVM2 (or a GFS filesystem on top of that LV) in this situation?
> 
> Thanks,
> 
> -Ty!
> 
