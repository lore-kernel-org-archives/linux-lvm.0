Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 001BB1054FD2
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 08:50:26 +0000 (UTC)
Received: from prv1-mh.provo.novell.com (prv1-mh.provo.novell.com
	[137.65.248.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AFC7307CDCD
	for <linux-lvm@redhat.com>; Wed, 31 Oct 2018 08:50:25 +0000 (UTC)
Message-Id: <5BD95751020000F90003DE16@prv1-mh.provo.novell.com>
Date: Wed, 31 Oct 2018 01:18:41 -0600
From: "Gang He" <ghe@suse.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] About --mirrorlog mirrored option in the latest lvm2
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
To: linux-lvm@redhat.com

Hello List,

As you know, in the past versions(e.g. v2.02.120), lvcreate supports creating a mirror type LV with "--mirrorlog mirrored" option, 
But in the latest versions(e.g. v2.02.180), lvm2 says "mirrored is a persistent log that is itself mirrored, but should be avoided. Instead, use the raid1 type for log redundancy."
Then,  my questions are as below,
1)The latest lvm2 does not allow creating this kind of LV, or just not recommended?
In my test environment, it looks that LVM2 can not create this kind of LV.
tb0307-nd1:/ # lvcreate --type mirror -m1 --mirrorlog mirrored -L 2G -n mirr-lv cluster-vg2
  Log type, "mirrored", is unavailable to cluster mirrors.

2)If we can not create this kind of LV, how can we migrate these existing LVs after we upgrade LVM2 to the latest version (e.g. v2.02.180)?
e.g. we need to convert this kind of LV to "RAID1 type LV, I want to know if there is a suggested guide for this scenario.

Thanks
Gang

 
