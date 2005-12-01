Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB11bTV08598
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 20:37:29 -0500
Received: from mta07-winn.ispmail.ntl.com (mta07-winn.ispmail.ntl.com
	[81.103.221.47])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB11bNip029639
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 20:37:27 -0500
Received: from aamta10-winn.ispmail.ntl.com ([81.103.221.35])
	by mta07-winn.ispmail.ntl.com with ESMTP id
	<20051201013717.INGD21883.mta07-winn.ispmail.ntl.com@aamta10-winn.ispmail.ntl.com>
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 01:37:17 +0000
Received: from remain.afraid.org ([80.1.204.245])
	by aamta10-winn.ispmail.ntl.com with ESMTP id
	<20051201013717.WEQY11396.aamta10-winn.ispmail.ntl.com@remain.afraid.org>
	for <linux-lvm@redhat.com>; Thu, 1 Dec 2005 01:37:17 +0000
Received: from pandora.local ([192.168.178.3])
	by remain.afraid.org with esmtps (TLSv1:AES256-SHA:256) (Exim 4.54)
	id 1EhdNi-0004DJ-Vi
	for linux-lvm@redhat.com; Thu, 01 Dec 2005 01:37:07 +0000
Message-ID: <438E53BC.5040403@cantab.net>
Date: Thu, 01 Dec 2005 01:37:00 +0000
From: Zak Kipling <zak.kipling@cantab.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re-sizing a PV
References: <479b70ed0511301243v1138c05drda62bb29cbf0f89e@mail.gmail.com>
In-Reply-To: <479b70ed0511301243v1138c05drda62bb29cbf0f89e@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Ben Beuchler wrote:
> I found in the archives a reference to using this series of commands
> to grow a PV to fill a disk that has grown (in this case, a hardware
> RAID volume that has had disks added to it):

Current CVS has a pvresize command for this -- it's worked successfully 
for me on a live system, although I understand there are still potential 
issues with it not keeping the PV label and VG metadata in sync.

Zak.
