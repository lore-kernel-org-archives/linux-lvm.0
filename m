Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8MMG8j9025662
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2014 18:16:08 -0400
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.97])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8MMFtFu026612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 22 Sep 2014 18:15:56 -0400
From: Robb Walker <rwalker@DRWHoldings.com>
Date: Mon, 22 Sep 2014 22:15:52 +0000
Message-ID: <1411424085397.51396@DRWHoldings.com>
References: <1410908945365.65274@DRWHoldings.com>
In-Reply-To: <1410908945365.65274@DRWHoldings.com>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm thin provisioning snapshots and btrfs
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
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Also see the same results on ubu 14.04.1 lvm thin provisioning + btrfs. haven't tried arch 3.16 kernel and tools yet

Robb Walker
Linux/Unix Services
Desk (312)542-2361 ~ Mobile (312)804-6034
Email: rwalker@drw.com
DRW Holdings, LLC ~ 540 West Madison St. Chicago, IL 60661


________________________________________
From: linux-lvm-bounces@redhat.com <linux-lvm-bounces@redhat.com> on behalf of Robb Walker <rwalker@DRWHoldings.com>
Sent: Tuesday, September 16, 2014 6:10 PM
To: linux-lvm@redhat.com
Subject: [linux-lvm] lvm thin provisioning snapshots and btrfs

Has anyone used lvm thin prov + btrfs on rhel/cent6u5?


The build I am using off base iso with updates thru end feb 2014 so I have not yet applied all updates. However from rhel alerts I see no specific fixes for lvm or btrfs from that date forward. Unless I missed something.


With lvm thin prov + ext4 I get expected results. When I take a snapshot. I see the snapshot is the state of the lvm volume at the point of time of snapshot creation.


For btrfs, I am using a root subvolume mounted as @foo_root with a thinly provisioned lvm underneath. Same setup just using btrfs.

I take a thin snapshot

lvcreate -n lv_root_thin -s vg_thin/lv_root

snapshot is created

activate with lvchange -Kay  /dev/vg_thin/lv_root_thin


I then mount the snap with mount -odefaults,subvol=@foo_root /dev/vg_thin/lv_root_thin /snaps

The contents match the origin lvm. Both lvms, origin and snap stay in sync with whatever changes I make.

At one point I thought that maybe it was snapping at the subv level so I decided a snapshot of the root vol. However the deletion also appeared in the thin snapshot


Also couple notes:

I never see in lvs that the thin snapshot goes -o- online as I do in ext4

chdir into the /snaps and running df -h . shows that I'm in the snapshot

chdir into /snaps/\@foo_root and running df -h . shows I'm in the origin vol. <this is where I thought it might be snapping at the "raw" brtfs subvolume level


Hopefully this is somewhat clear


Regards and TIA


Robb Walker
Linux/Unix Services
Desk (312)542-2361 ~ Mobile (312)804-6034
Email: rwalker@drw.com
DRW Holdings, LLC ~ 540 West Madison St. Chicago, IL 60661

This e-mail and any attachments may contain information that is confidential and proprietary and otherwise protected from disclosure. If you are not the intended recipient of this e-mail, do not read, duplicate or redistribute it by any means. Please immediately delete it and any attachments and notify the sender that you have received it in error. Unintended recipients are prohibited from taking action on the basis of information in this e-mail or any attachments. The DRW Companies make no representations that this e-mail or any attachments are free of computer viruses or other defects.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO@http://tldp.org/HOWTO/LVM-HOWTO/
This e-mail and any attachments may contain information that is confidential and proprietary and otherwise protected from disclosure. If you are not the intended recipient of this e-mail, do not read, duplicate or redistribute it by any means. Please immediately delete it and any attachments and notify the sender that you have received it in error. Unintended recipients are prohibited from taking action on the basis of information in this e-mail or any attachments. The DRW Companies make no representations that this e-mail or any attachments are free of computer viruses or other defects.
