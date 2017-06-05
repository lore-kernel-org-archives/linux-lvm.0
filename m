Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07EDF86D21
	for <linux-lvm@redhat.com>; Mon,  5 Jun 2017 08:11:15 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id BFF1BC0587C1
	for <linux-lvm@redhat.com>; Mon,  5 Jun 2017 08:11:11 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.05) id 5934D22000023CC0 for linux-lvm@redhat.com;
	Mon, 5 Jun 2017 10:11:10 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 00A952CC499
	for <linux-lvm@redhat.com>; Mon,  5 Jun 2017 10:11:09 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <45cd0f1b-b86a-b0dd-e8c8-d743ea4bd3ab@assyoma.it>
Date: Mon, 5 Jun 2017 10:11:06 +0200
MIME-Version: 1.0
Content-Language: it-IT
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM send/receive support?
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

Hi all,
I wonder if using LVM snapshots (even better: lvmthin snapshots, which 
are way faster) we can wire something like zfs or btrfs send/receive 
support.

In short: take a snapshot, do a full sync, take another snapshot and 
sync only the changed blocks.

I know that exists an utility called lvmsync[1], but it seem not 
maintained anymore. Any suggestion on how to do something similar?

Thanks.

[1] https://github.com/mpalmer/lvmsync

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
