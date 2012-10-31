Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9V0VCG5019879
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:31:12 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9V0VB18020494
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:31:11 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q9V0VAgU026945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:31:10 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q9V0UabN030640
	for <linux-lvm@redhat.com>; Tue, 30 Oct 2012 20:30:36 -0400
Date: Tue, 30 Oct 2012 20:30:36 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
Message-ID: <alpine.LRH.2.02.1210302028400.30605@bmsred.bmsi.com>
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
MIME-Version: 1.0
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Oct 31, Andres Toomsalu transmitted in part:

> I'm a bit puzzled with some thin LV usage stats - hope that someone can shed a light on this.
> lvs shows that thin_backup LV is 94% used - but df  shows only 16% - where comes the difference?

df shows unused blocks in the filesystem.  lvs shows unused space in the
storage pool.  There is no relation between those whatsoever.  A
filesystem can be on any block device, whether a thin LV or an old
fashioned disk partition, or an iSCSI volume.
