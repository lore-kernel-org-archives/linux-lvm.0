Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2FEZL122548
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 09:35:22 -0500
Received: from ms-smtp-05-eri0.texas.rr.com (ms-smtp-05.texas.rr.com
	[24.93.47.44])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2FEZLUe002408
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 09:35:21 -0500
Received: from hammett.be (cpe-66-68-93-62.austin.res.rr.com [66.68.93.62])
	by ms-smtp-05-eri0.texas.rr.com (8.13.4/8.13.4) with ESMTP id
	k2FEZJRQ017507
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 08:35:20 -0600 (CST)
Received: from [128.83.162.209] (unknown [192.168.127.42])
	by hammett.be (Postfix) with ESMTP id 5A453274B38
	for <linux-lvm@redhat.com>; Wed, 15 Mar 2006 08:35:19 -0600 (CST)
Mime-Version: 1.0
Message-Id: <p06230906c03dd5b8e2e6@[128.83.162.209]>
In-Reply-To: <200603151527.30115.problems@gmx.net>
References: <200603151527.30115.problems@gmx.net>
Date: Wed, 15 Mar 2006 08:35:16 -0600
From: James Hammett <james@hammett.be>
Subject: [linux-lvm] XFS Decreasing Size
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't actually want to do this, but after expanding the XFS 
partition size  (using xfs_growfs )  of a Logical Volume and looking 
for the "BACKDOWN" information, I couldn't find a simple explanation 
for shrink the partition back down.

Is this possible with XFS, or does one need to use XFS Dump to 
migrate the data to another partition?

thanks,
James
-- 
----------------------------------------------------------------------------
"The proper function of man is to live, not to exist. I shall not 
waste my days in trying to prolong them. I shall use my time." (Jack 
London)
