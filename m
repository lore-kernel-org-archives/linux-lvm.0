Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4NArWi5012018
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 06:53:32 -0400
Received: from mailgw11.wm.net (mailgw10.wm.net [85.119.129.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4NAr131029275
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 06:53:02 -0400
Received: from WMSI001555.corp.wmdata.net (wmbridgehead.wmdata.se
	[164.9.238.11]) by mailgw11.wm.net  with ESMTP id m4NAr1Nh011253
	for <linux-lvm@redhat.com>; Fri, 23 May 2008 12:53:01 +0200
From: "Henry, Andrew" <andrew.henry@logica.com>
Date: Fri, 23 May 2008 12:52:58 +0200
Message-ID: <3ECBDC05781B3D48ABD520A01ABF2F9B12C56CC13B@SE-EX008.groupinfra.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can I implement RAID1 through LVM2 instead of using
	mdadm?
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Subject says it all.

I want to avoid triple layers (softRAID,dmcrypt,LVM).  If LVM2 can do mirroring and if it is as stable as software RAID, then I would prefer this method.

Which is easier to manager? Software RAID or LVM mirroring?

--andrew
