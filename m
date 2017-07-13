Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C96760614
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 13:25:17 +0000 (UTC)
Received: from smtpi.meduniwien.ac.at (mailsip.srv.meduniwien.ac.at
	[149.148.51.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5501FA78E0
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 13:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTP id 0B391600C3
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 15:25:13 +0200 (CEST)
Received: from smtpi.meduniwien.ac.at ([127.0.0.1])
	by localhost (mailsip.meduniwien.ac.at [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id E1kKG1YoKdzh for <linux-lvm@redhat.com>;
	Thu, 13 Jul 2017 15:25:12 +0200 (CEST)
Received: from [149.148.52.63] (itsc063.cc.meduniwien.ac.at [149.148.52.63])
	by smtpi.meduniwien.ac.at (Postfix) with ESMTPS id 2D720600CC
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2017 15:25:12 +0200 (CEST)
From: Matthias Leopold <matthias.leopold@meduniwien.ac.at>
Message-ID: <55f9c8eb-41df-8b3b-c790-e81fbcef0a73@meduniwien.ac.at>
Date: Thu, 13 Jul 2017 15:25:10 +0200
MIME-Version: 1.0
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] convert LV to physical device _in_place_?
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
To: linux-lvm@redhat.com

hi,

i'm fiddling around with LVM backed KVM raw disks, that i want to use 
_directly_ in oVirt virtualization (as "Direct LUN"). i would like to 
avoid "importing", dd, etc. if possible. in the KVM origin system exists 
a mapping of one iSCSI whole device (no partitions) to one PV to one VG 
to one LV per KVM disk. i can now present these iSCSI devices to the 
oVirt hosts, where i can only use them as "Direct LUN" without the LVM 
layer (i guess). so all i would need is to remove the LVM metadata from 
the iSCSI device preserving the "content" of the LV. pvremove seems to 
be too "intrusive" for this... i know this sounds rather naive and i 
didn't find any recipes for it. everybody talks about dd to a new 
device, which of course works (i tried it), but is exactly what i want 
to avoid when migrating very large disks (TB). i hope someone 
understands my concern and maybe has a solution

thx a lot
matthias
