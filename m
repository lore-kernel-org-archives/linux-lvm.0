Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i314mUj22938
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 23:48:30 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net
	[68.14.253.125])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i314mSjj010926
	for <linux-lvm@redhat.com>; Wed, 31 Mar 2004 23:48:29 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1B8u7r-0007q5-BH
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 21:48:23 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
	by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29685-10 for <linux-lvm@redhat.com>;
	Wed, 31 Mar 2004 21:48:22 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24) id 1B8u7q-0007pz-Mt
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 21:48:22 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05) id 1B8u7p-0002mU-00
	for linux-lvm@redhat.com; Wed, 31 Mar 2004 21:48:21 -0700
Message-ID: <406B9F1A.50902@backtobasicsmgmt.com>
Date: Wed, 31 Mar 2004 21:48:26 -0700
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] DESTDIR is broken in 1.00.09
References: <200404010207.38892.arekm@pld-linux.org>
In-Reply-To: <200404010207.38892.arekm@pld-linux.org>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Arkadiusz Miskiewicz wrote:

> bindir, libdir and friends are substituted to ${prefix}/bin only when --bindir 
> is not specified.

Hmmm, I submitted a patch to fix this problem before this last release, 
and it was accepted (with modifications) but didn't appear in the release.
