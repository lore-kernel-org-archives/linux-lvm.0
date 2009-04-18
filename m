Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3IMPkpl016613
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2009 18:25:46 -0400
Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de
	[141.2.22.233])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3IMPTev001801
	for <linux-lvm@redhat.com>; Sat, 18 Apr 2009 18:25:32 -0400
Received: from smtpauth.cluster.uni-frankfurt.de ([10.2.22.4]
	helo=smtpauth2.rz.uni-frankfurt.de)
	by mailout.rz.uni-frankfurt.de with esmtp (Exim 4.69)
	(envelope-from <sven@whgl.uni-frankfurt.de>) id 1LvIyW-0001bL-U5
	for linux-lvm@redhat.com; Sun, 19 Apr 2009 00:25:28 +0200
Received: from ada-03.ghl40.whgl.uni-frankfurt.de ([141.2.119.133])
	by smtpauth2.rz.uni-frankfurt.de with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <sven@whgl.uni-frankfurt.de>)
	id 1LvIyP-0007J3-Q9
	for linux-lvm@redhat.com; Sun, 19 Apr 2009 00:25:21 +0200
Message-ID: <49EA534C.7090003@whgl.uni-frankfurt.de>
Date: Sun, 19 Apr 2009 00:25:16 +0200
From: Sven Eschenberg <sven@whgl.uni-frankfurt.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Wierd lvm2 performance problems
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

Dear list,

I tried to create a PE+VG+LV ontop of a mdraid. For no obvious reason 
the lvm volume show extremely poor performance - The transferrates are 
as little as 30% of the rates on the md device itself.
In contrast creating a partition table ontop of the array gives nearly 
no performance impact.

Does anybody have the slightest idea, wht might be going wrong here?

Regards

-Sven

P.S.: I tried aligning the first PE in the VG with the mdraid chunk 
size, no difference whatsoever.
