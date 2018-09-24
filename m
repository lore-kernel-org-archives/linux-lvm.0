Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B0A18343
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2018 12:24:06 +0000 (UTC)
Received: from fortress.henkis.net (mail.henkis.net [91.194.38.139])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 268523082E71
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2018 12:24:05 +0000 (UTC)
Received: from [192.168.0.101] (h-24-143-66.A213.priv.bahnhof.se
	[85.24.143.66])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by fortress.henkis.net (Postfix) with ESMTPSA id 28B8A8251
	for <linux-lvm@redhat.com>; Mon, 24 Sep 2018 14:14:53 +0200 (CEST)
From: Henrik Johansson <henrikj@henkis.net>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <758508B7-CC22-4D43-B83F-A2005D88686A@henkis.net>
Date: Mon, 24 Sep 2018 14:14:51 +0200
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] VG metadata and snapshots
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hello,

I have experienced something unexpected with one of our virtualised hosts. The VG containing root had been expanded to a secondary disk which contained /opt but no extents of the root filsystem. This host had some problems and was restored/cloned from an older snapshot, but only the first disk was overwritten leaving data on the expanded disk intact. Now it seems like LVM have started using the metadata configuration from the old disk, making both disks part of the VG without my intervention. Is this even possible, or is something at play here which I do not understand?

All disks are the same, same UUID and everything, but can a system boot and begin to this leftover metadata without any recovery? Should I not get something like “inconsistent metadata” and a failed boot?

Regards
Henrik
