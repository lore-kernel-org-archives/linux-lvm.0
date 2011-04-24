Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3OHLBwi029981
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2011 13:21:11 -0400
Received: from abpni.co.uk (host-92-27-106-173.static.as13285.net
	[92.27.106.173] (may be forged))
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3OHL7HZ027355
	for <linux-lvm@redhat.com>; Sun, 24 Apr 2011 13:21:08 -0400
Message-ID: <4DB45C02.2020101@abpni.co.uk>
Date: Sun, 24 Apr 2011 18:21:06 +0100
From: Jonathan Tripathy <jonnyt@abpni.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM over iSCSI considerations
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Everyone,

I am consider such a setup where I export an iSCSI target to a Xen node. 
This Xen node will then use the iSSCSI block device as an LVM PV, and 
create lots of LVs for DomU (Xen VM) use.

I was wondering if anyone could make me aware of any special 
consideration I would need to take.

- What happens if the iSCSI target vanishes during use? How graceful is 
recovery and what would I need to do
- If the above were to happen, would any data be lost? By "data being 
lost", I'm takingwith regards to theLVM over iSCSI setup. Of course 
there is the possibility of data corruption occuring due to a system's 
disk going away. But I guess I'm asking would this setup increase the 
chance of data being lost.
- Does this work after system reboot correctly (i.e. does network and 
iSCSI start before LVM normally?)
- Is there a large performance hit?
- Is this setup just not recommended?
- If I wanted the VG to be visible to multiple Xen nodes, is it just a 
matter of running CLVM on each Xen node?

Any help or tips would be appreciated

Thanks
