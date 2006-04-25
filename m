Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3PJ947P022817
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 15:09:05 -0400
Received: from mail.cnr.colostate.edu (clavin1.cnr.colostate.edu
	[129.82.112.67])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3PJ93bH000408
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 15:09:04 -0400
Received: from newman.nrel.colostate.edu (newman [129.82.112.30])
	by mail.cnr.colostate.edu (8.12.11/8.12.11) with ESMTP id
	k3PJ8qrY025221
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 13:08:53 -0600 (MDT)
Received: from [129.82.104.126] (donbot [129.82.104.126])
	by newman.nrel.colostate.edu (8.12.11/8.12.11) with ESMTP id
	k3PJ8qPX025209
	for <linux-lvm@redhat.com>; Tue, 25 Apr 2006 13:08:52 -0600 (MDT)
Message-ID: <444E73C3.7040305@nrel.colostate.edu>
Date: Tue, 25 Apr 2006 13:08:51 -0600
From: "Ty! Boyack" <ty@nrel.colostate.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 *TEMPORARY* PV failure - what happens?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

I've been intrigued by the discussion of what happens when a PV fails, 
and have begun to wonder what would happen in the case of a transient 
failure of a PV.

The design I'm thinking of is a SAN environment with several 
multi-terabyte iSCSI arrays as PVs, being grouped together into a single 
VG, and then carving LVs out of that.  We plan on using the CLVM tools 
to fit into a clustered environment. 

The arrays themselves are robust (RAID 5/6, redundant power supplies, 
etc.) and I grant that if we lose the actual array (for example, if 
multiple disks fail), then we are in the situation of a true and 
possibly total failure of the PV and loss of it's data blocks.

But there is always the possiblity that we could lose the CPU, memory, 
bus, etc. in the iSCSI controller portion of the array, which will cause 
downtime, but no true loss of data.  Or someone may hit the wrong power 
switch and just reboot the thing, taking it offline for a short time.  
Yes, that someone would probably be me.  Shame on me.

The key point is that the iSCSI disk will come back in a few 
minutes/hours/days depending on the failure type, and all blocks will be 
intact when it comes back up.  I suppose the analagous situation would 
be using LVM on a group of hot swap drives and pulling one of the disks, 
waiting a while, and then re-inserting it.

Can someone please walk me through the resulting steps that would happen 
within LVM2 (or a GFS filesystem on top of that LV) in this situation?

Thanks,

-Ty!

-- 
-===========================-
  Ty! Boyack
  NREL Unix Network Manager
  ty@nrel.colostate.edu
  (970) 491-1186
-===========================-
