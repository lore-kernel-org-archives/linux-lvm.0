Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 349CE7C35C
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2017 20:19:02 +0000 (UTC)
Received: from smtp1.signet.nl (smtp1.signet.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E575FC058EAF
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2017 20:18:58 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp1.signet.nl (Postfix) with ESMTP id 7CDED8DE31
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2017 21:19:00 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 14 Dec 2017 21:18:56 +0100
From: Xen <list@xenhideout.nl>
Message-ID: <fd276735bdce36e4949afd90fca5ddb1@xenhideout.nl>
Subject: [linux-lvm] cache performance
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

Probably not much of interest (16.04 Ubuntu)




Doing readahead tests with cache connected:

- 3400 ms average

Disconnecting cache:

- 5200 ms average

Creating a new cache:

- 2000 ms average

That's a huge difference.

A fresh cache only primed with ureadahead sees its performance go up by 
70%?

Maybe more sequential data ended up in the cache.

Who knows.
