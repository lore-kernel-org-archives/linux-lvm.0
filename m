Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5F97D694
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 21:07:12 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABCD68823
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 21:07:09 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.signet.nl (Postfix) with ESMTP id F08D840B74BB
	for <linux-lvm@redhat.com>; Mon, 17 Apr 2017 23:07:07 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 17 Apr 2017 23:07:07 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <c896c680a406c4b3b788b244c3d05948@xenhideout.nl>
References: <c896c680a406c4b3b788b244c3d05948@xenhideout.nl>
Message-ID: <6e90467478b769eb749b9050409f0cb3@xenhideout.nl>
Subject: Re: [linux-lvm] thin volume usage report
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
To: Linux lvm <linux-lvm@redhat.com>

New format:

     name               pct       size
     ---------------------------------
     data            38.66%     15.43g
     home             3.32%      1.32g
     sites           14.47%      5.77g
     --------------------------------- +
     volumes         56.45%     22.53g
     snapshots        5.07%      2.10g
     --------------------------------- +
     used            61.52%     24.55g
     available       38.48%     15.36g
     --------------------------------- +
     pool size      100.00%     39.91g


Old format:

     name             pct      size
     ------------------------------
     data          38.66%    15.43g
     home           8.22%     3.28g
     sites         33.55%    13.39g
     ------------------------------ +
     total         80.43%    32.11g

     reported      80.50%    32.13g
     available     19.50%     7.78g
     ------------------------------ +
     full size    100.00%    39.91g
