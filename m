Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C7AA98698
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2017 09:21:17 +0000 (UTC)
Received: from nm19-vm3.bullet.mail.ir2.yahoo.com
	(nm19-vm3.bullet.mail.ir2.yahoo.com [212.82.96.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23A7019D074
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2017 09:21:15 +0000 (UTC)
From: lejeczek <peljasz@yahoo.co.uk>
Message-ID: <931ba7f5-4a6d-c026-87c9-6bb0807ef59a@yahoo.co.uk>
Date: Fri, 11 Aug 2017 10:14:05 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Subject: [linux-lvm] possibly off-topic - multipath
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

.. but I thought I'd ask here for many profs are on this 
list here.

I'm just trying to use multipath - off topic - is it 
possible to configure group of devices/wwid in #multipaths { 
multipath ..# or each multipath can only be for a single wwid?

And will it be safe to have now VGs/LVs to migrate to 
multipath if they were created without it? Is such a 
"migration" even allowed, approved?

many thanks, L.
