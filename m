Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m04FjwxV004031
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 10:45:58 -0500
Received: from edge.omniti.com (smtp.omniti.com [8.8.38.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m04Fjbsa027914
	for <linux-lvm@redhat.com>; Fri, 4 Jan 2008 10:45:37 -0500
Message-Id: <C52F339D-8ECB-48F3-94A6-4345E7CE3764@omniti.com>
From: Troy Hanson <troy@omniti.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v915)
Date: Fri, 4 Jan 2008 10:45:30 -0500
Subject: [linux-lvm] duplicating a snapshot volume
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

I see that lvcreate cannot create a snapshot volume from another  
snapshot volume. It gives an error message about  snapshots of  
snapshots being "not supported yet".

As an alternative, is there any way to duplicate (not snapshot) a  
snapshot volume, i.e. so the new snapshot shares the same source and  
accumulated differences as the original snapshot?

I assume copying the snapshot with dd would produce a flat, non- 
snapshot volume, but I want my copy to still be a snapshot.

Context: I'm running a bunch of Xen VM's. I have a base logical volume  
from which snapshots are made, one for each Xen VM. But I want to go  
one step further, with multiple snapshots per VM.

Troy
